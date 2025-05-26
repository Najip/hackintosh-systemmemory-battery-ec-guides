/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./SSDT10.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000021F (543)
 *     Revision         0x01
 *     Checksum         0x75
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    /*
     * iASL Warning: There were 3 external control methods found during
     * disassembly, but only 0 were resolved (3 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * To specify the tables needed to resolve external control method
     * references, the -e option can be used to specify the filenames.
     * Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_SB_.PCI0.GP17.XHC1.RHUB.GHBX.PRT4, DeviceObj)
    External (_SB_.PCI0.GP17.XHC1.RHUB.PRT4, DeviceObj)
    External (_SB_.PCI0.GPP4.WLAN, DeviceObj)
    External (M000, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (M010, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (M049, IntObj)
    External (M04B, IntObj)
    External (M112, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (M290, UnknownObj)

    If (CondRefOf (\_SB.PCI0.GPP4.WLAN))
    {
        Scope (\_SB.PCI0.GPP4.WLAN)
        {
            Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
            {
                \_SB.PRWL
            })
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.GP17.XHC1.RHUB.PRT4))
    {
        Scope (\_SB.PCI0.GP17.XHC1.RHUB.PRT4)
        {
            Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
            {
                \_SB.PRWB
            })
        }
    }

    If (CondRefOf (\_SB.PCI0.GP17.XHC1.RHUB.GHBX.PRT4))
    {
        Scope (\_SB.PCI0.GP17.XHC1.RHUB.GHBX.PRT4)
        {
            Name (YPRR, Package (0x01)
            {
                \_SB.PRWB
            })
        }
    }

    Scope (\_SB)
    {
        Name (WLPS, One)
        PowerResource (PRWL, 0x00, 0x0000)
        {
            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
                M000 (0xC2)
                M290 = M04B /* External reference */
                0x28
                Local2
                If ((Local2 != 0x02))
                {
                    M290 = M04B /* External reference */
                    0x12
                    Local1
                    M010 (0x0246, Zero)
                    Sleep (Local1)
                    M010 (0x0246, One)
                }

                M000 (0xC3)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (WLPS) /* \_SB_.WLPS */
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                WLPS = One
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                WLPS = Zero
            }
        }

        Name (BLPS, One)
        PowerResource (PRWB, 0x00, 0x0000)
        {
            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
                M000 (0xD5)
                M290 = M04B /* External reference */
                0x45
                Local2
                If ((Local2 != 0x02))
                {
                    M290 = M049 /* External reference */
                    0x40
                    Local0
                    M290 = M04B /* External reference */
                    0x41
                    Local1
                    M112 (Local0, Zero)
                    Sleep (Local1)
                    M112 (Local0, One)
                }

                M000 (0xD6)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (BLPS) /* \_SB_.BLPS */
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                BLPS = One
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                BLPS = Zero
            }
        }
    }
}

