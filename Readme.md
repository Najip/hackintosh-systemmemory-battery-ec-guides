# Hackintosh Guide for Non‑Standard ACPI Battery Devices Stored in "SystemMemory" OperationRegions for Working Battery Status

## Overview
This guide documents how to achieve correct battery readings on non‑standard battery ACPI region. For example, my **Lenovo Ideapad Gaming 3‑15ACH6** stores its battery data in `SystemMemory` rather than in `EmbeddedControl`. (See [DSDT.dsl #L4394-L4525](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L4394-L4525))



### dGPU overlapping `SystemMemory` data
If BIOS settings have devices enabled that operate inside any reserved memory, but has no working kext or driver under macOS (in our cases`RTX 3050`), macOS will fail to read stored Battery data in `SystemMemory`.  
A dGPU with a properly operating kext or driver should work.  
(See memmap dump when Nvidia [disabled](/memmap-dump/rtx3050-off.txt) compared to when [enabled](/memmap-dump/rtx3050-on.txt#L13-L15))

### Disabling dGPU from BIOS and its caveat
The easiest and simplest way is just to **disable** dGPU in the BIOS options, so proper battery readings should be working again.   
But, it is not recommended since we need to re-enable dGPU every time if we want to access it under other Operating Systems.   
We also need to re-disable it again before accessing macOS.  (See Highlighted Rehabman's statement at second paragraph [here](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/#:~:text=Although%20the%20device%20can%20usually%20be%20disabled%20in%20BIOS%2C%20it%20is%20better%20to%20disable%20it%20with%20a%20custom%20ACPI%20setup%20so%20the%20device%20can%20still%20be%20used%20when%20booting%20Windows.)).   

### Resetting NVRAM after changing dGPU BIOS/UEFI settings
In my test, other than switching dGPU states (and Graphics related settings) inside UEF/BIOS, I always need to Reset `NVRAM` entry to be able to boot into macOS successfully. (using built-in `ResetNvramEntry.efi` from opencore should work).  
Otherwise, booting process will **fail**.  
This is because, **AppleNVRAM** enumerates every GUID-scoped variable, including GPU related variable like `gpu-policy`, `gpu-active` and `gpu-power-prefs`.  
(Confirmation [here](https://github.com/erikberglund/AppleNVRAM/blob/31c1bf951a198ed8beb06a47768cff3d437b0f76/Apple/7C436110-AB2A-4BBB-A880-FE41995C9F82.md?plain=1#L52) and [here](https://forums.macrumors.com/threads/force-2011-macbook-pro-8-2-with-failed-amd-gpu-to-always-use-intel-integrated-gpu-efi-variable-fix.2037591/page-35?utm_source=chatgpt.com#:~:text=Well%2C%20then%20I%20did)).

### SystemMemory Field Unit Objects Size ≥`32` 
`SystemMemory` is handled different than `EmbeddedControl` I/O on macOS.
From my discovery, `SystemMemory`-based EC layouts are not limited by AppleACPIEC (not even handled by it), but the `VirtualSMC`'s `SMCBatteryManager` keeps all EC payloads in `32`-bit (word) variables. Wider integers must be sliced in AML (or with an SSDT), or `VirtualSMC` will clip them.  
(`SMCBatteryManager`'s `uint32_t` code: [Link](https://github.com/acidanthera/VirtualSMC/blob/7a84cdd2e3172fcc9bf38c2a8b754358d539607a/Sensors/SMCBatteryManager/BatteryManager.cpp#L317-L361)).  

There are confirmed cases where some laptop configurations have `SystemMemory`'s Field Unit Object sizes ≥`32`. In such cases, proper ACPI-patching to split them is required.
(See example [below](#14-approach-for-systemmemory-battery-data-with-size-32-bit))

### ACPI hot-patching
This guide will **not** give you details or step by step for ACPI hot-patching and assumes you already understand how to do that. (See [[Guide] Using Clover to "hotpatch" ACPI](https://www.tonymacx86.com/threads/guide-using-clover-to-hotpatch-acpi.200137/) by Rehabman. Applicable and very similar approach for Opencore as well).

## 1. Non‑standard Battery ACPI Region

### 1.1 Battery Data Storage Case for the Lenovo Ideapad Gaming 3‑15ACH6
**Lenovo Ideapad Gaming 3‑15ACH6** stores its battery device (`_HID = "PNP0C0A"`) data in a `SystemMemory` OperationRegion, rather than the commonly used `EmbeddedControl` OperationRegion.   

See [_BST (PBST) [0x03]](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L5403) from `DSDT.dsl` for obtaining Battery Present Voltage:
```asl
PPBST [0x03] = ^^EC0.BPV0 /* \_SB_.PCI0.LPC0.EC0_.BPV0 */
```
True location of [`EC0_.BPV0`](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L4508):

```asl
            OperationRegion (ECMM, SystemMemory, 0xFE0B0800, 0x1000)
            Field (ECMM, AnyAcc, Lock, Preserve)
            {
                // other field unit objects under ECMM before BPV0
                Offset (0xC6), 
                BPV0,   16,
                // the rest of Field Unit Object under ECMM
            }
```

As you can see above, and on the linked `DSDT.dsl`, it is clearly not `EmbeddedControl` but `SystemMemory`.
(See the rest of objects in the DSDT here: [DSDT.dsl#L4503](Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L4503))

For devices without a macOS driver (e.g. `RTX 3050`), `VirtualSMC.kext`, and its plugins, including `SMCBatteryManager.kext`, fails to read any data.   
Other alternative Battery kexts and other kexts that need access to EC-based data (`ACPIBatteryManager.kext`, `VoodooBattery.kext`, `YogaSMC`, etc), will also fail.  

### 1.2 Using `ECEnabler.kext` attempt
At first, I thought that the absence of battery readings is because of this non-standard Field Unit Object sizes, larger than `8` bits (data accessed by `_BST`, `_BIF`, and `_BIX`). Their object sizes vary between `8`-`16` bits.   

```asl
                Offset (0xC0), 
                BTY0,   1, 
                BAM0,   1,  // Battery Power Unit
                Offset (0xC1), 
                BST0,   8,  // Battery State
                BRC0,   16, // Battery Remaining Capacity
                Offset (0xC6), 
                BPV0,   16, // Battery Present Voltage
                BDV0,   16, // Battery Design Voltage
                BDC0,   16, // Battery Design Capacity
                BFC0,   16, // Battery Full Charge Capacity
                GAU0,   8, 
                BAT0,   8, 
                BPC0,   16, // Battery Percentage Capacity
                BAC0,   16, // Battery Present Rate
                BCG0,   16, 
                BFCB,   16, // Last Full Charge Capacity
                BTPB,   16, // Battery Tripping Point
```
(See [DSDT.dsl's battery Field Unit Objects](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L4508))   
I have tried adding `ECEnabler.kext`, but the battery readings are still not available.

### 1.3 Battery Readings Work After Disabling dGPU from BIOS and resetting NVRAM from Opencore
When booting macOS using Opencore with the dGPU disabled in the BIOS and after resetting `NVRAM` using Opencore, `SMCBatteryManager.kext` begins working and the battery gauge appears in the menu bar.   
I don't even have **ECEnabler.kext** installed, nor do I split the Field Unit Objects. all field unit object sizes remain vanilla (`8`-`16` bits) and still return working and valid battery data.

### 1.4 Approach for `SystemMemory` Battery data with size ≥`32` bit
For other devices with Field Size ≥`32` bit, patching to split it into ≤`32` bit is required to make battery kext to align with `SMCBatteryManager`'s `32`-bit limitation.  
On some devices like `Clevo NL40CU`, battery field unit objects sizes are vary between `16`-`64` bits and battery readings were confirmed to work after patched by Reddit user `eric_kwok` using his own `Python3` script called `SSDT-BATT_Auto_Gen` (see link below).
- Snippet of DSDT.dsl of `Clevo NL40CU`  for Battery related objects and their sizes (See [here](/Clevo-NL40CU-ACPI-Table/DSDT.dsl#L18824)):
```asl
                BPU0,   32, 
                BDC0,   32, 
                BFC0,   32, 
                BTC0,   32, 
                BDV0,   32, 
                BST0,   32, 
                BPR0,   32, 
                BRC0,   32, 
                BPV0,   32, 
                BTP0,   16, 
                BRS0,   16, 
                BCW0,   32, 
                BCL0,   32, 
                BCG0,   32, 
                BG20,   32, 
                BMO0,   64, 
                BIF0,   64, 
                BSN0,   32, 
                BTY0,   64, 
```
- [SSDT-BATT.dsl](/Clevo-NL40CU-SSDT-BATT/SSDT-BATT.dsl) generated by Reddit user `eric_kwok` example where Battery fields under `SystemMemory` split into `8` bits of data.
- [SSDT-BATT_Auto_Gen](https://github.com/the-eric-kwok/SSDT-BATT_Auto_Gen) Script by [@eric_kwok](https://github.com/the-eric-kwok) for automated `SSDT-BATT.dsl` generation from `DSDT.dsl` which unfortunately abandoned with the rise of `ECEnabler.kext` 😔.
- Working confirmation using  `SSDT-BATT.dsl` generated with [@eric_kwok](https://github.com/the-eric-kwok)'s `SSDT-BATT_Auto_Gen` script by reddit user `Guddler` **Clevo NL40CU** [here](https://www.reddit.com/r/hackintosh/comments/k6xfb8/comment/gepcglb/#:~:text=Update%3A%20Battery%20appears%20to%20be%20working%20just%20fine%20aside%20from%20that%20plug%20%2F%20unplug%20quirk%20which%20I%20can%20live%20with.).
![](/images/reddit-user-guddler-of-confirmed-working-battery-status.png)
- Above script are using method objects similar to those used by Rehabman's like `B1B2`,`B1B4`,`WECB`, and `RECB` (but with unique generated names).   
If you prefer manual patching, see Rehabman's guide [here](https://www.tonymacx86.com/threads/guide-how-to-patch-dsdt-for-working-battery-status.116102/).
- In my test, using [@eric_kwok](https://github.com/the-eric-kwok)'s script or splitting already `16` bits of data, or using `Rehabman`'s Utility methods, causing Boot hang if `YogaSMC.kext` is instealld. So vanilla objects sized `8`-`16` bits works fine.

### 1.5 About `SSDT-BATT_Auto_Gen` by [@eric_kwok](https://github.com/the-eric-kwok)
[SSDT-BATT_Auto_Gen](https://github.com/the-eric-kwok/SSDT-BATT_Auto_Gen) by [@eric_kwok](https://github.com/the-eric-kwok) is a very useful `Python3` script that generates a proper `SSDT-BATT.dsl` by splitting large EC objects into `8`‑bit segments.   
It does work for both `SystemMemory` and `EmbeddedControl` based EC. The most neat feature it has that other script don't have, is the ability to also generate `SSDT-BATT.dsl` that also support combining dual‑battery laptops into single battery device, without the need to create separate `SSDT-BATC.dsl` commonly used for fixing dual battery support in macOS.   
However, with the rise of `ECEnabler.kext`, the script is abandoned even though it still useful for `SystemMemory` based EC data.  
I'm forking the repo in case any programmer out there is interested to improve it.

- Eric's explainations about dual battery combination feature [here](https://github.com/the-eric-kwok/SSDT-BATT_Auto_Gen/issues/1#issuecomment-843071201)
- `SSDT-BATT_Auto_Gen`'s `dev_rewrite_search_method` branch variant with additional ability to combine dual batteries [here](https://github.com/the-eric-kwok/SSDT-BATT_Auto_Gen/tree/dev_rewrite_search_method).
- My fork of `SSDT-BATT_Auto_Gen` so anyone can improve it further. See it [here](https://github.com/Najip/SSDT-BATT_Auto_Gen).
- There is also a similar script which was created by [@1Revenger1](https://github.com/1Revenger1), The author of `ECEnabler` called [BatteryPatcher](https://github.com/1Revenger1/BatteryPatcher) that currently archived and possibly abandoned as well. But I'm never test it.

### 1.6 About `ECEnabler.kext`
[`ECEnabler`](https://github.com/1Revenger1/ECEnabler) by [@1Revenger1](https://github.com/1Revenger1) is a very useful kext whose functionality is to extend macOS to read `EmbeddedControl`'s `OperationRegion` Field Unit Objects ≥`8` bits (1 bytes) of sizes, and **not** to magically fixes Battery Readings for non-standard ACPI Battery Devices.   
It's functionality is also **not** to interact with `SystemMemory`'s OperationRegion and their Objects at all.   
(see my submitted, but closed as not planned issues at here: [ECEnabler issue #34](https://github.com/1Revenger1/ECEnabler/issues/34)).   

#### 1.6.1 Submitting issues
If your Battery data stored in `SystemMemory`, submitting issues to ECEnabler's github repo is irrelevant and probably **offensive** 
(like what I was did. Sorry [@1Revenger1](https://github.com/1Revenger1). 😔).   

#### 1.6.2 Check OperationRegion type
Before submitting any issues, ensure you have verified in your decompiled ACPI dump (commonly in `DSDT.dsl`) whether your firmware uses the `EmbeddedControl` or `SystemMemory` OperationRegion. The latter is irrelevant to `ECEnabler.kext`.

### 1.7 Existence of `EmbeddedControl` OperationRegion
This laptop's firmware also has four `EmbeddedControl` OperationRegion.   
Those EC's Regions on this laptop also do not contain field unit objects of sizes ≥ `8` bits—in most cases, they range between `4` and `8` bits. So `ECEnabler` or splitting Field Unit Objects is not required in our cases.   
On other laptops with bigger `EmbeddedControl` object sizes ≥`8`-bits, `ECEnabler` may still required.   
Example of `EmbeddedControl` Region existence on this Laptop with their Field's name:
- [ERAM](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L4541)
- [ECRM](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L4562)
- [ECF2](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L8246)
- [ECAM](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/DSDT.dsl#L9268)

ERAM EC Regions:
```asl
            OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
            Field (ERAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5F), 
                ERBD,   8, 
                SMPR,   8, 
                Offset (0x62)
            }
```

## 2. Disabling non-functioning dGPU for proper `SystemMemory` operations that affect Battery readings, through ACPI hot-patching
### 2.1 Not widely-known dGPU `_OFF` method location
On this model, the ACPI `_OFF` for the RTX 3050 resides under the `PG00` PowerResource Object.   
(See `SSDT3.dsl` dGPU `_OFF` method location [here](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/SSDT3%20.dsl#L393)):
```asl
        PowerResource (PG00, 0x00, 0x0000)
        {
            //other PG00 objects
            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
              // code for _OFF method
            }
        }
```
PEGP/RTX 3050 has no `_OFF` method at all. (See SSDT3.dsl dGPU `PEGP` location [here](/Decompiled-Lenovo-Ideapad-Gaming-3-15ACH6-H3CN47WW-V3.05/SSDT3%20.dsl#L87)):
```asl
    Scope (\_SB.PCI0.GPP0)
    {
        Device (PEGP)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }
        }
    }
```
### 2.2 `_OFF` method provided by Dortania's Opencore guide
The standard SSDT provided by Dortania’s Opencore Guides (as of May 26, 2025) for both desktops and laptops assumes that `_OFF` is located under the GPU device itself. Therefore, **additional adjustments are required to make them work properly**.   
(See Dortania's Desktop's [Guide](https://dortania.github.io/Getting-Started-With-ACPI/Desktops/desktop-disable.html) and  [SSDT-GPU-DISABLE.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-GPU-DISABLE.dsl#L6), and Laptop's [Guide](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html) and [SSDT-dGPU-Off.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-dGPU-Off.dsl#L6))   


### 2.3 Finding true dGPU `_OFF` method location
To find the true `_OFF` method location on other Laptop, method location on other laptops, consult Rehabman’s detailed guide [here](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/#:~:text=Patching%20for%20discrete%20disable) which eventually, are still relevant to this day.   

Once identified, **rename** the original `_OFF` (e.g. `\_SB.PCI0.GPP0.PG00._OFF`→`\_SB.PCI0.GPP0.PG00.XOFF`) using your bootloader’s ACPI patching feature, and **inject** a new SSDT (e.g `SSDT-DGPU-OFF.aml`) that provides a proper new `_OFF` method still under `PG00` (important!).  
Optionally guard it by `_OSI("Darwin")` for proper power-off logic only under macOS and return original `_OFF` renamed to `XOFF` to other OS if you boot other OS with Opencore/Clover.

## 3. `_PS3` and NoHybGfx Quirk Inadequacy
Applying the `_PS3` method from the Bumblebee-style's SSDT (See [here](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html#bumblebee-method) and [SSDT-NoHybGfx.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-NoHybGfx.dsl)), which places dGPU into its lowest power state does work for lowering power usages.   
But unfortunately, it does **not** resolve the battery reading issue, because the dGPU is still powered and has no working driver/kext, and its MMIO BAR remains mapped into `SystemMemory`—continuing to overlap all `SystemMemory` including region used by Battery and returning invalid data.  

## 4. Why Battery Readings Fail with dGPU Enabled
Even when no driver exists (which make it worst and cause improper `SystemMemory` operations), the firmware still powers on the NVIDIA GPU and maps its BAR into `SystemMemory`. This BAR overlaps all MMIO BAR beyond other devices that needs access to `SystemMemory` to functions, including our battery’s non-standard OperationRegion, and render other kexts or driver (e.g. `VirtualSMC`, `SMCBatteryManager`, `ACPIBatteryManager`, `VoodooBattery`, `YogaSMC`, etc.) reads invalid data. In the cases of Battery related kexts, it will reports only **“AC Power”**.

## 5. ACPI Patch Workflow
### 5.1 Identify the Battery Region
Locate the SystemMemory OperationRegion consumed by `PNP0C0A` by tracing where `_BST`, `_BIF`, or `_BIX` reference it in your decompiled DSDT/SSDT.

### 5.2 Confirm Missing Battery Reads
With any Battery reading kexts loaded (e.g. `SMCBatteryManager`), use `ioreg -l`, `IORegistryExplorer` or `pmset -g batt` to verify your battery kext reports only **“AC Power”** when the dGPU is enabled on BIOS.

### 5.3 Locate where original dGPU `_OFF` method located
See [here](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/#:~:text=Patching%20for%20discrete%20disable).

### 5.4 Rename Original `_OFF` in Bootloader
Add an ACPI Patch renames with your favorite bootloader that target exactly where original `_OFF` method located. If multiple `_OFF` method exist, defining `TableLength` and `Base` may be required. (Opencore has this feature).   

Example:
```
_OFF > XOFF
```

### 5.3 `_OFF` method interacts with any EC Field 
If `_OFF` method interacts with any EC's Field Objects either `SystemMemory` or `EmbeddedControl`, a **_REG→XREG** patch rename and inserting new `_REG` with **removed** EC may be needed, so no delayed EC access for `_OFF` method.   
However, on this laptop, dGPU's `_OFF` method, **never** touches EC, so `_REG` patching was unnecessary. 
- `ASUS UX303LN`'s `_OFF` method interact with EC's example [here](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/#:~:text=_OFF%20is%20defined%20as%20follows)
- Proper `_REG` method with EC access patching guide [here](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/#:~:text=Now%20we%20need%20to%20turn%20our%20attention%20to%20DSDT%20_REG.%20The%20_REG%20method%20needs%20to%20do%20the%20EC%20work%20that%20_OFF%20used%20to%20do%20before%20we%20patched%20it.)   

### 5.4 Inject New `_OFF` via SSDT (e.g SSDT-DGPU-OFF.aml)
The injected `_OFF` method must still located under original `_OFF` method location.   
For example :
```asl
External (_SB_.PCI0.GPP0.PG00, PowerResObj) // Not PEGP or dGPU

Scope (\_SB.PCI0.GPP0.PG00)
{
  Method (_OFF, 0, NotSerialized)
  {
    If (_OSI ("Darwin"))
    {
      // proper GPU power-off sequence
    }
  } //_OFF
} //PG00
```
Compile and place the `.aml` to where bootloader will load it (e.g. `EFI/OC/ACPI` for Opencore) and add it to your Bootloader's .plist (e.g. Opencore ACPI-Add inside config.plist).

### 5.5 Test Under macOS
Reboot, confirm the NVIDIA dGPU is hidden in `IOReg`, `IORegistryExplorer` or `Hackintool`, and `pmset -g batt` shows live battery data.

### 5.6 Common Pitfalls & Previous Attempts
#### 5.6.1 `ReservedMemory` Opencore quirk
I’ve tried using Opencore’s `ReservedMemory` Quirk but the firmware still maps the dGPU’s BAR elsewhere.  
#### 5.6.2. `DevirtualiseMmio` Opencore quirk
`DevirtualiseMmio` only removes runtime MMIO flags and  `MmioWhitelist` only re-adding additional MMIO operation into usable slides used for KASLR and macOS kernel to operate; so dGPU firmware BARs still map. 
#### 5.6.3 different dGPU disable approach for different integrated graphics 
- Using Opencore's `DeviceProperties` method : [Link](https://dortania.github.io/OpenCore-Install-Guide/extras/spoof.html#deviceproperties-method)
- Laptop with Intel iGPU users with `Whatevergreen.kext` can use `-wegnoegpu` boot-argument so it can hide the dGPU from macOS.
- AMD Vega with `NootedRed` still requires manual ACPI patching for proper dGPU `_OFF` operation.
#### 5.6.4 Sleep-Wake issues
For fixing **Sleep-Wake** issues, both still requires manual ACPI patching.   
(See [[Guide] Disabling discrete graphics in dual-GPU laptops: Sleep/Wake Problems](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/#:~:text=Sleep%2FWake%20Problems))


## 6. Lessons Learned
6.1 `SystemMemory`-based EC battery regions require a different approach compared to traditional `EmbeddedControl`-based EC regions.

6.2 For disabling dGPU, proper ACPI patching `_OFF` logic is the most reliable fix.

6.3 Other Laptop examples where the `_OFF` method is not located directly under the dGPU but Under a `PowerResObj`, are more common than expected:
- [Lenovo Legion 5](https://gist.github.com/x1unix/bdd9228f58084248ca6ac22e3e45a6a8#acpi)
  
- [HP Omen 15-en1xxx](https://olarila.com/topic/38984-bumblebee-disable-nvidia-gpu-method-doesnt-work-hp-omen-15-en1xxx/#:~:text=My%20dGPU%20_OFF%20method%20is%20%5C_SB.PCI0.GPP0.PG00._OFF%20()%20%20Tested%20on%20Ubuntu%20with%20acpi_call)
  
- [Asus FX553VE](https://www.insanelymac.com/forum/topic/331139-resolved-help-asus-fx553ve-disable-nvidia-card/#comment-2559193)

6.4 `SystemMemory`-based battery regions are also more common than expected. They also exist on some laptops. Some examples I have found include:
-  [Clevo NL40CU](https://www.tonymacx86.com/threads/opencore-battery-patch.295289/page-89#post-2187364#:~:text=I%20checked%20your%20dsdt%20and%20it%20seems%20that%20you%20don%E2%80%99t%20need%20a%20battery%20patch%20(No%20registers%20above%208%20bits%20in%20EmbeddedController)%2C%20but%20I%20found%20some%20in%20SystemMemory%20which%20may%20be%20the%20cause%20of%20your%20problem%20(%20I%20have%20not%20patched%20registers%20in%20SystemMemory%20before%20and%20I%20don't%20know%20if%20it's%20the%20right%20thing%20to%20do)%2C%20I%20may%20create%20a%20patch%20for%20you%20when%20I%20have%20some%20free%20time)
- [Clevo N141CU](https://www.reddit.com/r/hackintosh/comments/k6xfb8/comment/gesqqq2/#:~:text=Actually%20not%20all%20firmware%20stores%20EC%20data%20in%20EmbeddedControll%2C%20some%20store%20them%20inside%20SystemMemory.)

- [Apollo Entroware](https://www.reddit.com/r/hackintosh/comments/kpktpw/need_some_help_with_battery_patching/#:~:text=Battery%20patches%20should%20be%20done%20on%20EmbeddedController%20operation%20region%20(in%20your%20case%20no%20field%20units%20needs%20to%20be%20patched%20in%20EC)%20but%20when%20I%20checked%20battery%20methods%20I%20found%20some%20field%20units%20needs%20to%20be%20patched%20but%20they%20are%20in%20SystemMemory%20and%20NOT%20embedded%20controller)
- [Dell N4050](https://www.insanelymac.com/forum/topic/297199-solucionado-indicador-de-bateria-no-funciona-dell-n4050/#comment-2012186#:~:text=SystemMemory)

6.5 There are likely many more laptops with non-standard or emerging ACPI `SystemMemory`-based battery implementations. If you discover others, feel free to submit them as issues in this repository, along with their Decompiled DSDT/SSDT files.

---

## Closing Thoughts
By following this tailored ACPI patch sequence, you ensure accurate battery reporting in macOS **while** preserving dGPU functionality for Windows, Linux, and other OS. This guide covers non-standard  `SystemMemory`-based battery regions, `PG00`-based `_OFF` placement, proper patching methods, and the precise steps to resolve BAR overlap—saving future users hours of debugging..

---

## Sources
- [Tonymacx86, Rehabman: Using Clover to "hotpatch" ACPI](https://www.tonymacx86.com/threads/guide-using-clover-to-hotpatch-acpi.200137/)
- [Tonymacx86, Rehabman: “Guide: Disabling Discrete Graphics in Dual-GPU Laptops”](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/)  
- [erikberglund /
AppleNVRAM: macOS NVRAM gpu-policy](https://github.com/erikberglund/AppleNVRAM/blob/31c1bf951a198ed8beb06a47768cff3d437b0f76/Apple/7C436110-AB2A-4BBB-A880-FE41995C9F82.md?plain=1#L52) 
- [MacRumors: Force 2011 MacBook Pro 8,2 with failed AMD GPU to ALWAYS use Intel integrated GPU (EFI variable fix)](https://forums.macrumors.com/threads/force-2011-macbook-pro-8-2-with-failed-amd-gpu-to-always-use-intel-integrated-gpu-efi-variable-fix.2037591/page-35?utm_source=chatgpt.com#:~:text=Well%2C%20then%20I%20did)
- [SMCBatteryManager
/ BatteryManager.cpp: uint32_t](https://github.com/acidanthera/VirtualSMC/blob/7a84cdd2e3172fcc9bf38c2a8b754358d539607a/Sensors/SMCBatteryManager/BatteryManager.cpp#L317-L361)  
- [dorania's Desktop SSDT-GPU-DISABLE.dsl](https://dortania.github.io/Getting-Started-With-ACPI/Desktops/desktop-disable.html)
- [dorania's Laptop SSDT-dGPU-Off.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-dGPU-Off.dsl)
- [1Revenger1, “ECEnabler Issue #34,” GitHub](https://github.com/1Revenger1/ECEnabler/issues/34)  
- [SSDT-BATT_Auto_Gen](https://github.com/the-eric-kwok/SSDT-BATT_Auto_Gen) [by @eric_kwok](https://github.com/the-eric-kwok) (Archived)
- [SSDT-BATT_Auto_Gen](https://github.com/Najip/SSDT-BATT_Auto_Gen) (My fork)
- [Reddit discussion: “How do I create SSDT-dGPU-Off.aml?” r/hackintosh](https://www.reddit.com/r/hackintosh/comments/1bdhoaj/how_do_i_create_ssdtdgpuoffaml/) 
- [Tonymacx86, Rehabman: How to patch DSDT for working battery status](https://www.tonymacx86.com/threads/guide-how-to-patch-dsdt-for-working-battery-status.116102/) 
- [UEFI/ACPI Specification](https://uefi.org/specifications)  
