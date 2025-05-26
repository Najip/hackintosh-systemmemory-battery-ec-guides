/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./DSDT.aml
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0001005E (65630)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x12
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "    "
 *     Compiler Version 0x01000013 (16777235)
 */
DefinitionBlock ("", "DSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    /*
     * iASL Warning: There were 10 external control methods found during
     * disassembly, but only 0 were resolved (10 unresolved). Additional
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
    External (_PR_.C000, UnknownObj)
    External (_PR_.C000._PPC, IntObj)
    External (_PR_.C000.PPCV, UnknownObj)
    External (_SB_.APTS, MethodObj)    // Warning: Unknown method, guessing 3 arguments
    External (_SB_.AWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.PCI0.GPP0.PEGP, UnknownObj)
    External (_SB_.TPM2.PTS_, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (ADBG, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN4, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN7, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (ALIB, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (M009, IntObj)
    External (M010, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (MPTS, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (MWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (NPCF, UnknownObj)

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ACMX,   8, 
        ACMA,   8
    }

    OperationRegion (XMOS, SystemIO, 0x72, 0x02)
    Field (XMOS, ByteAcc, Lock, Preserve)
    {
        IO72,   8, 
        IO73,   8
    }

    Method (WXMS, 2, NotSerialized)
    {
        IO72 = Arg0
        IO73 = Arg1
    }

    Method (RXMS, 1, NotSerialized)
    {
        IO72 = Arg0
        Return (IO73) /* \IO73 */
    }

    IndexField (ACMX, ACMA, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB9), 
        IMEN,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
            ,   6, 
        HPEN,   1, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (GSMG, SystemMemory, 0xFED81500, 0x03FF)
    Field (GSMG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x5C), 
        Offset (0x5E), 
        GS23,   1, 
            ,   5, 
        GV23,   1, 
        GE23,   1, 
        Offset (0xA0), 
        Offset (0xA2), 
        GS40,   1, 
            ,   5, 
        GV40,   1, 
        GE40,   1
    }

    OperationRegion (GSMM, SystemMemory, 0xFED80000, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x288), 
            ,   1, 
        CLPS,   1, 
        Offset (0x2B0), 
            ,   2, 
        SLPS,   2
    }

    OperationRegion (PMI2, SystemIO, 0x0CD6, 0x02)
    Field (PMI2, AnyAcc, NoLock, Preserve)
    {
        PM2I,   8, 
        PM2D,   8
    }

    IndexField (PM2I, PM2D, ByteAcc, NoLock, Preserve)
    {
        Offset (0xBB), 
            ,   6, 
        PWDE,   1, 
        Offset (0xBC)
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        PRWP [One] = Arg1
        If ((DAS3 == Zero))
        {
            If ((Arg1 <= 0x03))
            {
                PRWP [One] = Zero
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Method (SPTS, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = Zero
        }

        CLPS = One
        SLPS = One
        PEWS = PEWS /* \PEWS */
    }

    Method (SWAK, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = One
        }

        PEWS = PEWS /* \PEWS */
        PEWD = Zero
    }

    Method (TPST, 1, Serialized)
    {
        Local0 = (Arg0 + 0xB0000000)
        OperationRegion (VARM, SystemIO, 0x80, 0x04)
        Field (VARM, DWordAcc, NoLock, Preserve)
        {
            VARR,   32
        }

        VARR = Local0
    }

    OperationRegion (GNVS, SystemMemory, 0xCDF79998, 0x0000018B)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CNSB,   8, 
        RDHW,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        GV0E,   8, 
        WLSH,   8, 
        TSSS,   8, 
        AOZP,   8, 
        TZFG,   8, 
        BPS0,   8, 
        NAPC,   8, 
        PCBA,   32, 
        PCBL,   32, 
        WLAN,   8, 
        BLTH,   8, 
        GPSS,   8, 
        NFCS,   8, 
        SBTY,   8, 
        BDID,   16, 
        MWTT,   8, 
        ACPM,   8, 
        KBCS,   8, 
        ACEC,   8, 
        DPTC,   8, 
        ECTL,   8, 
        MM64,   8, 
        HMB1,   64, 
        HMB2,   64, 
        HMM1,   64, 
        HMM2,   64, 
        HML1,   64, 
        HML2,   64, 
        WOVS,   8, 
        TCNT,   8, 
        NPWD,   8
    }

    OperationRegion (OGNS, SystemMemory, 0xCDF3CE98, 0x0000001A)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        TPID,   8, 
        OG01,   8, 
        M2WL,   8, 
        THPN,   8, 
        PBAR,   8, 
        THPD,   8, 
        DTEN,   8, 
        SDMO,   8, 
        TBEN,   8, 
        TBNH,   8, 
        RV2I,   8, 
        ISDS,   8, 
        PLOD,   8, 
        CCHP,   8, 
        CCNP,   8, 
        DDCP,   32, 
        TP11,   8, 
        PGID,   8, 
        OR21,   8, 
        OR22,   8, 
        OR23,   8, 
        OR24,   8, 
        OR25,   8
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50){})
        Name (STG2, Buffer (0x50){})
        STG1 = Arg0
        STG2 = Arg1
        If ((SizeOf (Arg0) != SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = Zero
        While ((Local0 < SizeOf (Arg0)))
        {
            If ((DerefOf (STG1 [Local0]) != DerefOf (STG2 [Local0]
                )))
            {
                Return (Zero)
            }

            Local0++
        }

        Return (One)
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (SEQL, 2, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Local1 = SizeOf (Arg1)
        If ((Local0 != Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0){})
        BUF0 = Arg0
        Name (BUF1, Buffer (Local0){})
        BUF1 = Arg1
        Local2 = Zero
        While ((Local2 < Local0))
        {
            Local3 = DerefOf (BUF0 [Local2])
            Local4 = DerefOf (BUF1 [Local2])
            If ((Local3 != Local4))
            {
                Return (Zero)
            }

            Local2++
        }

        Return (One)
    }

    Method (OSTP, 0, NotSerialized)
    {
        If ((OSTB == Ones))
        {
            If (CondRefOf (\_OSI, Local0))
            {
                OSTB = Zero
                TPOS = Zero
                If (_OSI ("Windows 2001"))
                {
                    OSTB = 0x08
                    TPOS = 0x08
                }

                If (_OSI ("Windows 2001.1"))
                {
                    OSTB = 0x20
                    TPOS = 0x20
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    OSTB = 0x10
                    TPOS = 0x10
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    OSTB = 0x11
                    TPOS = 0x11
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    OSTB = 0x12
                    TPOS = 0x12
                }

                If (_OSI ("Windows 2006"))
                {
                    OSTB = 0x40
                    TPOS = 0x40
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    OSTB = 0x41
                    TPOS = 0x41
                    OSSP = One
                }

                If (_OSI ("Windows 2009"))
                {
                    OSSP = One
                    OSTB = 0x50
                    TPOS = 0x50
                }

                If (_OSI ("Windows 2012"))
                {
                    OSSP = One
                    OSTB = 0x60
                    TPOS = 0x60
                }

                If (_OSI ("Windows 2013"))
                {
                    OSSP = One
                    OSTB = 0x61
                    TPOS = 0x61
                }

                If (_OSI ("Windows 2015"))
                {
                    OSSP = One
                    OSTB = 0x70
                    TPOS = 0x70
                }

                If (_OSI ("Linux"))
                {
                    LINX = One
                    OSTB = 0x80
                    TPOS = 0x80
                }
            }
            ElseIf (CondRefOf (\_OS, Local0))
            {
                If (SEQL (_OS, "Microsoft Windows"))
                {
                    OSTB = One
                    TPOS = One
                }
                ElseIf (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    OSTB = 0x02
                    TPOS = 0x02
                }
                ElseIf (SEQL (_OS, "Microsoft Windows NT"))
                {
                    OSTB = 0x04
                    TPOS = 0x04
                }
                Else
                {
                    OSTB = Zero
                    TPOS = Zero
                }
            }
            Else
            {
                OSTB = Zero
                TPOS = Zero
            }
        }

        Return (OSTB) /* \OSTB */
    }

    Name (BUFN, Zero)
    Name (MBUF, Buffer (0x1000){})
    OperationRegion (MDBG, SystemMemory, 0xCDED5018, 0x00001004)
    Field (MDBG, AnyAcc, Lock, Preserve)
    {
        MDG0,   32768
    }

    Method (DB2H, 1, Serialized)
    {
        SHOW (Arg0)
        MDGC (0x20)
        MDG0 = MBUF /* \MBUF */
    }

    Method (DW2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x08)
        Local0 &= 0xFF
        Local1 &= 0xFF
        DB2H (Local1)
        BUFN--
        DB2H (Local0)
    }

    Method (DD2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x10)
        Local0 &= 0xFFFF
        Local1 &= 0xFFFF
        DW2H (Local1)
        BUFN--
        DW2H (Local0)
    }

    Method (MBGS, 1, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Name (BUFS, Buffer (Local0){})
        BUFS = Arg0
        MDGC (0x20)
        While (Local0)
        {
            MDGC (DerefOf (BUFS [(SizeOf (Arg0) - Local0)]))
            Local0--
        }

        MDG0 = MBUF /* \MBUF */
    }

    Method (SHOW, 1, Serialized)
    {
        MDGC (NTOC ((Arg0 >> 0x04)))
        MDGC (NTOC (Arg0))
    }

    Method (LINE, 0, Serialized)
    {
        Local0 = BUFN /* \BUFN */
        Local0 &= 0x0F
        While (Local0)
        {
            MDGC (Zero)
            Local0++
            Local0 &= 0x0F
        }
    }

    Method (MDGC, 1, Serialized)
    {
        MBUF [BUFN] = Arg0
        BUFN += One
        If ((BUFN > 0x0FFF))
        {
            BUFN &= 0x0FFF
            UP_L (One)
        }
    }

    Method (UP_L, 1, Serialized)
    {
        Local2 = Arg0
        Local2 <<= 0x04
        MOVE (Local2)
        Local3 = (0x1000 - Local2)
        While (Local2)
        {
            MBUF [Local3] = Zero
            Local3++
            Local2--
        }
    }

    Method (MOVE, 1, Serialized)
    {
        Local4 = Arg0
        BUFN = Zero
        Local5 = (0x1000 - Local4)
        While (Local5)
        {
            Local5--
            MBUF [BUFN] = DerefOf (MBUF [Local4])
            BUFN++
            Local4++
        }
    }

    Method (NTOC, 1, Serialized)
    {
        Local0 = (Arg0 & 0x0F)
        If ((Local0 < 0x0A))
        {
            Local0 += 0x30
        }
        Else
        {
            Local0 += 0x37
        }

        Return (Local0)
    }

    Scope (_SB)
    {
        Device (PLTF)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A05") /* Generic Container Device */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Device (C000)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
            }

            Device (C001)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
            }

            Device (C002)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
            }

            Device (C003)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
            }

            Device (C004)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
            }

            Device (C005)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
            }

            Device (C006)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
            }

            Device (C007)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
            }

            Device (C008)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
            }

            Device (C009)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
            }

            Device (C00A)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
            }

            Device (C00B)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
            }

            Device (C00C)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
            }

            Device (C00D)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
            }

            Device (C00E)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
            }

            Device (C00F)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
            }
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If ((DAS3 == One))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            0x03, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (XL08, 0, NotSerialized)
        {
            TPST (0x3908)
        }

        Method (XL0D, 0, NotSerialized)
        {
            TPST (0x390D)
        }

        Method (XL0E, 0, NotSerialized)
        {
            TPST (0x390E)
        }

        Method (XL0F, 0, NotSerialized)
        {
            TPST (0x390F)
        }

        Method (XL19, 0, NotSerialized)
        {
            TPST (0x3919)
            Notify (\_SB.PCI0.GP17.XHC0, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17.XHC1, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICM = Arg0
        GPIC = Arg0
        If (PICM)
        {
            \_SB.DSPI ()
            If (NAPC)
            {
                \_SB.PCI0.NAPE ()
            }
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        SPTS (Arg0)
        If ((Arg0 == One))
        {
            \_SB.S80H (0x51)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x53)
            If ((\_SB.PCI0.GP17.XHC0.UWK0 || \_SB.PCI0.GP17.XHC1.UWK1))
            {
                \_SB.PCI0.LPC0.EC0.UWAK = One
            }
            Else
            {
                \_SB.PCI0.LPC0.EC0.UWAK = Zero
            }

            SLPS = One
            \_SB.PCI0.LPC0.EC0.S3ST = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x54)
            APMC = 0xCC
            Sleep (0x02)
            SLPS = One
            RSTU = One
            \_SB.PCI0.LPC0.EC0.S4ST = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.S80H (0x55)
            APMC = 0xCC
            Sleep (0x02)
            \_SB.PCI0.LPC0.EC0.S5ST = One
            If ((WKPM == One))
            {
                PWDE = One
            }

            BCMD = 0x90
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
        }

        If (CondRefOf (\_SB.TPM2.PTS))
        {
            \_SB.TPM2.PTS (Arg0)
        }

        \_SB.APTS (Arg0, MPTS (Arg0))
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        SWAK (Arg0)
        \_SB.AWAK (Arg0)
        NVRF = Zero
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            If ((GPIC != Zero))
            {
                \_SB.DSPI ()
                If (NAPC)
                {
                    \_SB.PCI0.NAPE ()
                }
            }
        }

        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.LPC0.EC0.S3RM = One
            \_SB.S80H (0xE3)
        }

        If ((Arg0 == 0x04))
        {
            \_SB.PCI0.LPC0.EC0.S4RM = One
            \_SB.PCI0.LPC0.EC0.RWAK = Zero
            \_SB.S80H (0xE4)
        }

        If ((Arg0 == 0x05))
        {
            \_SB.PCI0.LPC0.EC0.S5RM = One
            \_SB.PCI0.LPC0.EC0.RWAK = Zero
            \_SB.S80H (0xE5)
        }

        \_SB.PCI0.LPC0.EC0.ECFG (One)
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            If ((\_SB.PCI0.LPC0.EC0.WWOL == One)){}
            Else
            {
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }

        MWAK (Arg0)
        Return (Zero)
    }

    Scope (_SB)
    {
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_ADR, Zero)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((GPIC != Zero))
                {
                    DSPI ()
                    If (NAPC)
                    {
                        NAPE ()
                    }
                }

                OSTP ()
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If ((TBEN == One))
                    {
                        If ((TBNH != Zero))
                        {
                            CTRL &= 0xFFFFFFF5
                        }
                        Else
                        {
                            CTRL &= 0xFFFFFFF4
                        }
                    }

                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x1D
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)){}
                        If ((CTRL & 0x04)){}
                        If ((CTRL & 0x10)){}
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (TOM, 0, NotSerialized)
            {
                Local0 = (TOML * 0x00010000)
                Local1 = (TOMH * 0x01000000)
                Local0 += Local1
                Return (Local0)
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xF7FFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x78000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFC000000,         // Range Minimum
                    0xFEAFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x02B00000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED45000,         // Range Minimum
                    0xFED811FF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0003C200,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED81900,         // Range Minimum
                    0xFED81FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000700,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFEDC0000,         // Range Minimum
                    0xFEDC0FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFEDC6000,         // Range Minimum
                    0xFEDC6FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, BTMN)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, BTMX)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, BTLN)  // _LEN: Length
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, BTN1)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, BTX1)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, BTL1)  // _LEN: Length
                BTMN = TOM ()
                BTMX = (PCBA - One)
                BTLN = (PCBA - BTMN) /* \_SB_.PCI0._CRS.BTMN */
                BTN1 = (PCBL + One)
                BTL1 = (BTX1 - BTN1) /* \_SB_.PCI0._CRS.BTN1 */
                BTL1 += One
                If ((MM64 == One))
                {
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MIN, M1MN)  // _MIN: Minimum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MAX, M1MX)  // _MAX: Maximum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y02._LEN, M1LN)  // _LEN: Length
                    M1MN = HMB1 /* \HMB1 */
                    M1MX = HMM1 /* \HMM1 */
                    M1LN = HML1 /* \HML1 */
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MIN, M2MN)  // _MIN: Minimum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MAX, M2MX)  // _MAX: Maximum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y03._LEN, M2LN)  // _LEN: Length
                    M2MN = HMB2 /* \HMB2 */
                    M2MX = HMM2 /* \HMM2 */
                    M2LN = HML2 /* \HML2 */
                }

                Return (CRES) /* \_SB_.PCI0.CRES */
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (BAR3, 0xFDE00000)
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y04)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y05)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y06)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y04._BAS, MB01)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y04._LEN, ML01)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y05._BAS, MB02)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y05._LEN, ML02)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y06._BAS, MB03)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y06._LEN, ML03)  // _LEN: Length
                    If (GPIC)
                    {
                        MB01 = 0xFEC00000
                        MB02 = 0xFEE00000
                        ML01 = 0x1000
                        If (NAPC)
                        {
                            ML01 += 0x1000
                        }

                        ML02 = 0x1000
                    }

                    If ((BAR3 != 0xFFF00000))
                    {
                        MB03 = BAR3 /* \_SB_.PCI0.MEMR.BAR3 */
                        ML03 = 0x00100000
                    }

                    Return (MEM1) /* \_SB_.PCI0.MEMR.MEM1 */
                }
            }

            Mutex (NAPM, 0x00)
            Method (NAPE, 0, NotSerialized)
            {
                Acquire (NAPM, 0xFFFF)
                Local0 = (PCBA + 0xB8)
                OperationRegion (VARM, SystemMemory, Local0, 0x08)
                Field (VARM, DWordAcc, NoLock, Preserve)
                {
                    NAPX,   32, 
                    NAPD,   32
                }

                Local1 = NAPX /* \_SB_.PCI0.NAPE.NAPX */
                NAPX = 0x14300000
                Local0 = NAPD /* \_SB_.PCI0.NAPE.NAPD */
                Local0 &= 0xFFFFFFEF
                NAPD = Local0
                NAPX = Local1
                Release (NAPM)
            }

            Name (PR00, Package (0x0E)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKE, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKF, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKG, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKH, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }
            })
            Name (AR00, Package (0x0E)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Name (NR00, Package (0x0E)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x28
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x29
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x2A
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x24
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x25
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x26
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x27
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    If (NAPC)
                    {
                        Return (NR00) /* \_SB_.PCI0.NR00 */
                    }
                    Else
                    {
                        Return (AR00) /* \_SB_.PCI0.AR00 */
                    }
                }
                Else
                {
                    Return (PR00) /* \_SB_.PCI0.PR00 */
                }
            }

            Device (GPP0)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (MPRW, 0, NotSerialized)
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x18
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x19
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR01) /* \_SB_.PCI0.GPP0.NR01 */
                        }
                        Else
                        {
                            Return (AR01) /* \_SB_.PCI0.GPP0.AR01 */
                        }
                    }
                    Else
                    {
                        Return (PR01) /* \_SB_.PCI0.GPP0.PR01 */
                    }
                }
            }

            Device (GPP1)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Device (LAN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (LANS, Zero)
                    Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
                    {
                        LANS = Arg0
                    }
                }

                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR02) /* \_SB_.PCI0.GPP1.NR02 */
                        }
                        Else
                        {
                            Return (AR02) /* \_SB_.PCI0.GPP1.AR02 */
                        }
                    }
                    Else
                    {
                        Return (PR02) /* \_SB_.PCI0.GPP1.PR02 */
                    }
                }
            }

            Device (GPP2)
            {
                Name (_ADR, 0x00010003)  // _ADR: Address
                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x21
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x23
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR03) /* \_SB_.PCI0.GPP2.NR03 */
                        }
                        Else
                        {
                            Return (AR03) /* \_SB_.PCI0.GPP2.AR03 */
                        }
                    }
                    Else
                    {
                        Return (PR03) /* \_SB_.PCI0.GPP2.PR03 */
                    }
                }

                Device (WLAN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                }
            }

            Device (GPP3)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x25
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x27
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR04) /* \_SB_.PCI0.GPP3.NR04 */
                        }
                        Else
                        {
                            Return (AR04) /* \_SB_.PCI0.GPP3.AR04 */
                        }
                    }
                    Else
                    {
                        Return (PR04) /* \_SB_.PCI0.GPP3.PR04 */
                    }
                }
            }

            Device (GPP4)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Name (PR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x29
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR05) /* \_SB_.PCI0.GPP4.NR05 */
                        }
                        Else
                        {
                            Return (AR05) /* \_SB_.PCI0.GPP4.AR05 */
                        }
                    }
                    Else
                    {
                        Return (PR05) /* \_SB_.PCI0.GPP4.PR05 */
                    }
                }
            }

            Device (GP17)
            {
                Name (_ADR, 0x00080001)  // _ADR: Address
                Name (PR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x27
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x25
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR17) /* \_SB_.PCI0.GP17.NR17 */
                        }
                        Else
                        {
                            Return (AR17) /* \_SB_.PCI0.GP17.AR17 */
                        }
                    }
                    Else
                    {
                        Return (PR17) /* \_SB_.PCI0.GP17.PR17 */
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        DOSA = Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x07)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240, 
                            0x00031000, 
                            0x00032000
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (BCLB) /* \_SB_.PCI0.GP17.VGA_.LCD_.BCLB */
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            BRTL = Arg0
                        }

                        OperationRegion (DDC0, SystemMemory, DDCP, 0x80)
                        Field (DDC0, AnyAcc, Lock, Preserve)
                        {
                            DDCD,   1024
                        }

                        Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
                        {
                            Local1 = Buffer (0x80){}
                            Local1 = DDCD /* \_SB_.PCI0.GP17.VGA_.LCD_.DDCD */
                            If ((DDCP == Zero))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (Local1)
                            }
                        }
                    }
                }

                Device (PSP)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ACP)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Method (_WOV, 0, NotSerialized)
                    {
                        Return (WOVS) /* \WOVS */
                    }
                }

                Device (AZAL)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }

                Device (XHC0)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x19, 0x03))
                    }

                    Name (UWK0, Zero)
                    Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
                    {
                        If (Arg1)
                        {
                            UWK0 = One
                        }
                        Else
                        {
                            UWK0 = Zero
                        }
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                                    /* 0008 */  0x71, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // q.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT2.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                                    /* 0008 */  0x69, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00,  // i.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT2.PLD1 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x20, 0x01, 0x80, 0x04, 0x00, 0x00, 0x00, 0x00,  //  .......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.PLD1 */
                            }

                            Device (WCAM)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Name (UPC1, Package (0x04)
                                    {
                                        0xFF, 
                                        0xFF, 
                                        Zero, 
                                        Zero
                                    })
                                    Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.WCAM._UPC.UPC1 */
                                }

                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Name (PLD1, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0008 */  0x25, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // %.......
                                            /* 0010 */  0xC8, 0x00, 0xA0, 0x00                           // ....
                                        }
                                    })
                                    Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.WCAM._PLD.PLD1 */
                                }
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT4.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x68, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,  // h.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT4.PLD1 */
                            }

                            Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                            {
                                BRWL
                            })
                            Name (BLPS, One)
                            PowerResource (BRWL, 0x00, 0x0000)
                            {
                                Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                                {
                                    M010 (0x07, Zero)
                                    Sleep (0xC8)
                                    M010 (0x07, One)
                                    Sleep (0xC8)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (BLPS) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT4.BLPS */
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

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT5.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                                    /* 0008 */  0x71, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // q.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT5.PLD1 */
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT6.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                                    /* 0008 */  0x69, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00,  // i.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT6.PLD1 */
                            }
                        }
                    }
                }

                Method (TPLD, 2, Serialized)
                {
                    Name (PCKG, Package (0x01)
                    {
                        Buffer (0x14){}
                    })
                    CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
                    REV = One
                    CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
                    VISI = Arg0
                    CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
                    GPOS = Arg1
                    CreateField (DerefOf (PCKG [Zero]), 0x4A, 0x04, SHAP)
                    SHAP = One
                    CreateField (DerefOf (PCKG [Zero]), 0x20, 0x10, WID)
                    WID = 0x08
                    CreateField (DerefOf (PCKG [Zero]), 0x30, 0x10, HGT)
                    HGT = 0x03
                    Return (PCKG) /* \_SB_.PCI0.GP17.TPLD.PCKG */
                }

                Method (TUPC, 2, Serialized)
                {
                    Name (PCKG, Package (0x04)
                    {
                        One, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                    PCKG [Zero] = Arg0
                    PCKG [One] = Arg1
                    Return (PCKG) /* \_SB_.PCI0.GP17.TUPC.PCKG */
                }

                Device (XHC1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x19, 0x03))
                    }

                    Name (UWK1, Zero)
                    Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
                    {
                        If (Arg1)
                        {
                            UWK1 = One
                        }
                        Else
                        {
                            UWK1 = Zero
                        }
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                                    /* 0008 */  0x69, 0x0C, 0x80, 0x02, 0x00, 0x00, 0x00, 0x00,  // i.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PLD1 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT3.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT3.PLD1 */
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision           = 0x0,
                                    PLD_IgnoreColor        = 0x0,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x0,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x0,
                                    PLD_Panel              = "TOP",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape              = "ROUND",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0xFFFF,
                                    PLD_HorizontalOffset   = 0xFFFF)

                            })
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT5.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT5.PLD1 */
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT6.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                                    /* 0008 */  0x69, 0x0C, 0x80, 0x02, 0x00, 0x00, 0x00, 0x00,  // i.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT6.PLD1 */
                            }
                        }
                    }
                }

                Device (MP2C)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }
            }

            Device (GP18)
            {
                Name (_ADR, 0x00080002)  // _ADR: Address
                Name (PR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x23
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x21
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR18) /* \_SB_.PCI0.GP18.NR18 */
                        }
                        Else
                        {
                            Return (AR18) /* \_SB_.PCI0.GP18.AR18 */
                        }
                    }
                    Else
                    {
                        Return (PR18) /* \_SB_.PCI0.GP18.PR18 */
                    }
                }

                Device (SATA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }

                Device (SAT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (GP19)
            {
                Name (_ADR, 0x00080003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR19) /* \_SB_.PCI0.GP19.NR19 */
                        }
                        Else
                        {
                            Return (AR19) /* \_SB_.PCI0.GP19.AR19 */
                        }
                    }
                    Else
                    {
                        Return (PR19) /* \_SB_.PCI0.GP19.PR19 */
                    }
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HPEN == One))
                    {
                        If ((OSTB >= 0x40))
                        {
                            Return (0x0F)
                        }

                        HPEN = Zero
                        Return (One)
                    }

                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y07)
                    })
                    CreateDWordField (BUF0, \_SB.PCI0.HPET._CRS._Y07._BAS, HPEB)  // _BAS: Base Address
                    Local0 = 0xFED00000
                    HPEB = (Local0 & 0xFFFFFC00)
                    Return (BUF0) /* \_SB_.PCI0.HPET._CRS.BUF0 */
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.RTC_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.RTC_.BUF1 */
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.TMR_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.TMR_.BUF1 */
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("FUJ7401"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x025C,             // Range Minimum
                            0x025C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0xD0,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            _Y08)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y08._LEN, PSIZ)  // _LEN: Length
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y08._BAS, PBAS)  // _BAS: Base Address
                        PSIZ = ROMS /* \ROMS */
                        Local0 = (ROMS - One)
                        PBAS = (Ones - Local0)
                        Return (MSRC) /* \_SB_.PCI0.LPC0.MEM_.MSRC */
                    }
                }

                Mutex (PSMX, 0x00)
            }
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x0C), 
            SIRA,   8, 
            SIRB,   8, 
            SIRC,   8, 
            SIRD,   8, 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x17), 
            SDCL,   8, 
            Offset (0x1A), 
            SDIO,   8, 
            Offset (0x30), 
            USB1,   8, 
            Offset (0x34), 
            USB3,   8, 
            Offset (0x41), 
            SATA,   8, 
            Offset (0x62), 
            GIOC,   8, 
            Offset (0x70), 
            I2C0,   8, 
            I2C1,   8, 
            I2C2,   8, 
            I2C3,   8, 
            URT0,   8, 
            URT1,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            PIRA = Arg0
            If (PICM)
            {
                HDAD = Arg0
                SDCL = Arg0
            }
        }

        Method (INTB, 1, NotSerialized)
        {
            PIRB = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            PIRC = Arg0
            If (PICM)
            {
                USB1 = Arg0
                USB3 = Arg0
            }
        }

        Method (INTD, 1, NotSerialized)
        {
            PIRD = Arg0
            If (PICM)
            {
                SATA = Arg0
            }
        }

        Name (PRS1, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,5,6,10,11}
        })
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRA && (PIRA != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRB && (PIRB != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRC && (PIRC != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRD && (PIRD != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRE && (PIRE != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRF && (PIRF != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRG && (PIRG != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRH && (PIRH != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xE4
            Sleep (0x02)
        }

        Method (S80H, 1, NotSerialized)
        {
            P80H = Arg0
        }

        Method (BSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xBE
            Sleep (One)
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (^^PCI0.LPC0.EC0.LIDF)
                {
                    Return (Zero)
                }

                Return (One)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (\)
    {
        OperationRegion (COMP, SystemMemory, 0xCDF79D18, 0x0200)
        Field (COMP, AnyAcc, Lock, Preserve)
        {
            DGPX,   8, 
            RSR0,   24, 
            BDDD,   8, 
            CPFB,   8, 
            PBTI,   8, 
            BRLV,   8, 
            CAVR,   8, 
            TJMA,   16, 
            CORE,   8, 
            TPDF,   8, 
            TPLF,   8, 
            TPDD,   8, 
            TMUD,   8, 
            CTUR,   8, 
            CUCB,   32, 
            OSYS,   16, 
            CG23,   8, 
            CG24,   8, 
            CG25,   8, 
            CG26,   8, 
            CG27,   8, 
            CG28,   8, 
            CG29,   8, 
            CG30,   8, 
            CG31,   8, 
            SFNO,   16, 
            STDT,   16, 
            BFDT,   1024, 
            ESMS,   8, 
            ESMB,   256, 
            RSR1,   472, 
            IDFD,   1024, 
            RSR2,   1024
        }

        Mutex (CFMX, 0x00)
        Scope (_SB)
        {
            OperationRegion (SMIO, SystemIO, 0xB0, 0x02)
            Field (SMIO, ByteAcc, NoLock, Preserve)
            {
                SMIM,   8, 
                SMID,   8
            }

            Method (CSMI, 2, NotSerialized)
            {
                Acquire (CFMX, 0xFFFF)
                SMID = Arg1
                SMIM = Arg0
                Release (CFMX)
            }
        }

        Scope (_SB)
        {
            Device (PWRB)
            {
                Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
                Method (PKG2, 2, Serialized)
                {
                    Name (PKG, Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                    PKG [Zero] = Arg0
                    PKG [One] = Arg1
                    Return (PKG) /* \_SB_.PWRB.PKG2.PKG_ */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Name (GPEB, Zero)
                    GPEB = 0x1E
                    Return (PKG2 (GPEB, 0x04))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }
        }
    }

    Scope (_SB.PCI0.LPC0)
    {
        Method (ECOK, 0, NotSerialized)
        {
            If ((^EC0.OKEC == One))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Name (_GPE, 0x03)  // _GPE: General Purpose Events
            Name (OKEC, One)
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
            })
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x03))
                {
                    OKEC = Arg1
                    ECFG (One)
                }
            }

            Method (ECFG, 1, NotSerialized)
            {
                If ((Arg0 == One))
                {
                    ECRD = One
                }
                Else
                {
                    ECRD = Zero
                }
            }

            Mutex (Z009, 0x00)
            Mutex (QEVT, 0x00)
            OperationRegion (ECMM, SystemMemory, 0xFE0B0800, 0x1000)
            Field (ECMM, AnyAcc, Lock, Preserve)
            {
                Offset (0x5D), 
                ERIB,   16, 
                Offset (0x61), 
                SMST,   8, 
                SMAD,   8, 
                SMCM,   8, 
                SMD0,   256, 
                BCNT,   8, 
                SMAA,   24, 
                SMBN,   8, 
                Offset (0x90), 
                BMFN,   72, 
                BATD,   56, 
                Offset (0xA1), 
                    ,   1, 
                VIDO,   1, 
                TOUP,   1, 
                Offset (0xA2), 
                ODTS,   8, 
                OSTY,   4, 
                    ,   1, 
                PBOV,   1, 
                ECRD,   1, 
                ADPT,   1, 
                PWAK,   1, 
                MWAK,   1, 
                LWAK,   1, 
                RWAK,   1, 
                WWAK,   1, 
                UWAK,   1, 
                KWAK,   1, 
                TWAK,   1, 
                CCAC,   1, 
                AOAC,   1, 
                BLAC,   1, 
                PSRC,   1, 
                BOAC,   1, 
                LCAC,   1, 
                AAAC,   1, 
                ACAC,   1, 
                S3ST,   1, 
                S3RM,   1, 
                S4ST,   1, 
                S4RM,   1, 
                S5ST,   1, 
                S5RM,   1, 
                CSST,   1, 
                CSRM,   1, 
                OSTT,   8, 
                OSST,   8, 
                THLT,   8, 
                TCNL,   8, 
                MODE,   1, 
                    ,   2, 
                INIT,   1, 
                FAN1,   1, 
                FAN2,   1, 
                FANT,   1, 
                SKNM,   1, 
                SDTM,   8, 
                FSSN,   4, 
                FANU,   4, 
                PCVL,   6, 
                SWTO,   1, 
                TTHR,   1, 
                TTHM,   1, 
                THTL,   1, 
                TFCT,   1, 
                NPST,   5, 
                CTMP,   8, 
                CTML,   8, 
                EST3,   8, 
                SKTB,   8, 
                SKTC,   8, 
                DPOT,   8, 
                EST1,   8, 
                EST2,   8, 
                    ,   1, 
                LIDF,   1, 
                PMEE,   1, 
                PWBE,   1, 
                RNGE,   1, 
                BTWE,   1, 
                Offset (0xB9), 
                BRTS,   8, 
                S35M,   1, 
                S35S,   1, 
                    ,   1, 
                MSFG,   1, 
                FFEN,   1, 
                FFST,   1, 
                Offset (0xBB), 
                WLAT,   1, 
                BTAT,   1, 
                WLEX,   1, 
                BTEX,   1, 
                KLSW,   1, 
                WLOK,   1, 
                AT3G,   1, 
                EX3G,   1, 
                PJID,   8, 
                CPUJ,   3, 
                CPNM,   3, 
                GATY,   2, 
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
                BOL0,   1, 
                BFS0,   1, 
                Offset (0xDB), 
                ORRF,   1, 
                Offset (0xDC), 
                Offset (0xDD)
            }

            OperationRegion (PECM, SystemMemory, 0xFE0B0800, 0x1000)
            Field (PECM, AnyAcc, Lock, Preserve)
            {
                Offset (0x05), 
                WWOL,   1, 
                Offset (0x08), 
                NVD1,   3, 
                Offset (0x1C), 
                    ,   3, 
                BLLV,   1, 
                Offset (0x1E), 
                NVDS,   8
            }

            OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
            Field (ERAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5F), 
                ERBD,   8, 
                SMPR,   8, 
                Offset (0x62)
            }

            OperationRegion (CCLK, SystemIO, 0x0410, 0x04)
            Field (CCLK, DWordAcc, NoLock, Preserve)
            {
                    ,   1, 
                DUTY,   3, 
                THEN,   1, 
                Offset (0x01), 
                FTT,    1, 
                    ,   8, 
                TSTS,   1
            }

            OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF)
            Field (ECRM, ByteAcc, Lock, Preserve)
            {
                Offset (0xAA), 
                Offset (0xAB), 
                Offset (0xAD), 
                    ,   4, 
                Offset (0xAE), 
                PTVL,   4, 
                Offset (0xB0), 
                Offset (0xB1), 
                Offset (0xB2), 
                Offset (0xB3), 
                Offset (0xB4), 
                Offset (0xB5), 
                Offset (0xBC), 
                Offset (0xBD)
            }

            Mutex (FAMX, 0x00)
            Method (FANG, 1, NotSerialized)
            {
                Acquire (FAMX, 0xFFFF)
                ERIB = Arg0
                Local0 = ERBD /* \_SB_.PCI0.LPC0.EC0_.ERBD */
                Release (FAMX)
                Return (Local0)
            }

            Method (FANW, 2, NotSerialized)
            {
                Acquire (FAMX, 0xFFFF)
                ERIB = Arg0
                ERBD = Arg1
                Release (FAMX)
                Return (Arg1)
            }

            Method (TUVR, 1, NotSerialized)
            {
                Return (0x04)
            }

            Method (THRO, 1, NotSerialized)
            {
                ATHR (Arg0)
            }

            Method (CLCK, 1, NotSerialized)
            {
                Return (Zero)
            }

            Method (PCLK, 0, NotSerialized)
            {
                APCL ()
            }

            Method (ATHR, 1, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    Return (0xFF)
                }
                ElseIf ((Arg0 == One))
                {
                    Return (\_PR.C000._PPC) /* External reference */
                }
                ElseIf ((Arg0 == 0x02))
                {
                    Return (TTHR) /* \_SB_.PCI0.LPC0.EC0_.TTHR */
                }
                Else
                {
                    Return (0xFF)
                }
            }

            Method (APCL, 0, NotSerialized)
            {
                Local0 = PTVL /* \_SB_.PCI0.LPC0.EC0_.PTVL */
                \_PR.C000.PPCV = Local0
                Notify (\_PR.C000, 0x80) // Status Change
            }

            Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Notify (^^^GP17.VGA.LCD, 0x87) // Device-Specific
            }

            Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Notify (^^^GP17.VGA.LCD, 0x86) // Device-Specific
            }

            Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x15
                Notify (LID, 0x80) // Status Change
            }

            Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Notify (GZFD, 0xD7) // Hardware-Specific
                If (((ADPT == One) && (ADPS == Zero)))
                {
                    GZ44 = RXMS (0x76)
                    SSFM (Zero, GZ44)
                }
                Else
                {
                    Local2 = RXMS (0x76)
                    If (((Local2 == Zero) || (Local2 == One)))
                    {
                        WXMS (0x77, Zero)
                        GZ44 = Zero
                        SSFM (Zero, Zero)
                    }
                    Else
                    {
                        WXMS (0x77, 0x02)
                        GZ44 = 0x02
                        SSFM (Zero, 0x02)
                    }
                }

                Notify (GZFD, 0xD9) // Hardware-Specific
                SSFM (One, Zero)
                If ((NVRF == One))
                {
                    If ((NVD1 == 0x02))
                    {
                        Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                    }
                    ElseIf ((NVD1 == 0x03))
                    {
                        Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                    }
                    ElseIf ((NVD1 == 0x04))
                    {
                        Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                    }
                    ElseIf ((NVD1 == 0x05))
                    {
                        Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                    }
                    Else
                    {
                        Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                    }
                }
            }

            Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Sleep (0x03E8)
                Notify (BAT1, 0x80) // Status Change
            }

            Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Sleep (0x03E8)
                Notify (BAT1, 0x81) // Information Change
                Sleep (0x03E8)
                Notify (BAT1, 0x80) // Status Change
            }

            Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Notify (ACAD, 0x80) // Status Change
                Sleep (0x03E8)
                Notify (BAT1, 0x80) // Status Change
                PWRS = One
                Notify (GZFD, 0xD7) // Hardware-Specific
                If (((ADPT == One) && (ADPS == Zero)))
                {
                    GZ44 = RXMS (0x76)
                    SSFM (Zero, GZ44)
                }
                Else
                {
                    Local2 = RXMS (0x76)
                    If (((Local2 == Zero) || (Local2 == One)))
                    {
                        WXMS (0x77, Zero)
                        GZ44 = Zero
                        SSFM (Zero, Zero)
                    }
                    Else
                    {
                        WXMS (0x77, 0x02)
                        GZ44 = 0x02
                        SSFM (Zero, 0x02)
                    }
                }

                Notify (GZFD, 0xD9) // Hardware-Specific
                SSFM (One, Zero)
            }

            Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
            }

            Method (_Q3E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                PSD1 = 0x04
                Notify (WMIU, 0xD0) // Hardware-Specific
            }

            Method (_Q3F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                PSD1 = One
                Notify (WMIU, 0xD0) // Hardware-Specific
            }

            Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                HOTM = ~HOTM /* \_SB_.PCI0.LPC0.EC0_.HOTM */
                If (HOTM)
                {
                    PSD1 = 0x02
                }
                Else
                {
                    PSD1 = 0x03
                }

                WXMS (0x70, 0x55)
                Notify (WMIU, 0xD0) // Hardware-Specific
            }

            Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If (((ADPT == One) && (ADPS == Zero)))
                {
                    Local1 = RXMS (0x76)
                    If ((Local1 < 0x02))
                    {
                        Local1 += One
                    }
                    ElseIf ((Local1 == 0x02))
                    {
                        Local1 = Zero
                    }

                    WXMS (0x76, Local1)
                    GZ44 = Local1
                    SSFM (Zero, Local1)
                }
                Else
                {
                    Local1 = RXMS (0x77)
                    If ((Local1 == 0x02))
                    {
                        Local1 = Zero
                    }
                    Else
                    {
                        Local1 = 0x02
                    }

                    If ((Local1 == Zero))
                    {
                        WXMS (0x77, Zero)
                        WXMS (0x76, Zero)
                        SSFM (Zero, Zero)
                        GZ44 = Zero
                    }
                    Else
                    {
                        WXMS (0x77, 0x02)
                        WXMS (0x76, 0x02)
                        SSFM (Zero, 0x02)
                        GZ44 = 0x02
                    }
                }

                Notify (GZFD, 0xD5) // Hardware-Specific
                Notify (GZFD, 0xD9) // Hardware-Specific
                SSFM (One, Zero)
            }

            Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((NVRF == One))
                {
                    Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                }
            }

            Method (_Q09, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((NVRF == One))
                {
                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                }
            }

            Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((NVRF == One))
                {
                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                }
            }

            Method (_Q02, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((NVRF == One))
                {
                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                }
            }

            Method (_Q03, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((NVRF == One))
                {
                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                }
            }

            Method (_Q20, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "Q20 trigger"
                Notify (GZFD, 0xD7) // Hardware-Specific
                If (((ADPT == One) && (ADPS == Zero)))
                {
                    GZ44 = RXMS (0x76)
                    SSFM (Zero, GZ44)
                }
                Else
                {
                    Local2 = RXMS (0x76)
                    If (((Local2 == Zero) || (Local2 == One)))
                    {
                        WXMS (0x77, Zero)
                        GZ44 = Zero
                        SSFM (Zero, Zero)
                    }
                    Else
                    {
                        WXMS (0x77, 0x02)
                        GZ44 = 0x02
                        SSFM (Zero, 0x02)
                    }
                }

                Notify (GZFD, 0xD9) // Hardware-Specific
                SSFM (One, Zero)
            }

            Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "Q16 trigger"
                Notify (GZFD, 0xD8) // Hardware-Specific
            }

            Method (_Q0D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "Q0D trigger"
                Notify (GZFD, 0xD4) // Hardware-Specific
            }

            OperationRegion (ECCD, SystemMemory, 0xFE0B0800, 0x1000)
            Field (ECCD, AnyAcc, Lock, Preserve)
            {
                Offset (0x580), 
                Offset (0x582), 
                ECTB,   1, 
                ECTE,   1, 
                Offset (0x583), 
                ERN1,   8, 
                ERN2,   8, 
                ERN3,   8, 
                ERN4,   8, 
                ERN5,   8, 
                ERN6,   8, 
                ERN7,   8, 
                ERN8,   8, 
                ECMD,   8, 
                EDT1,   8, 
                EDT2,   8, 
                EDT3,   8, 
                EDT4,   8, 
                EDT5,   8, 
                    ,   1
            }

            Mutex (CSMX, 0x00)
            Method (ERCD, 1, Serialized)
            {
                Acquire (CSMX, 0xFFFF)
                Name (ESRC, 0x64)
                ECTB = One
                ECMD = DerefOf (Arg0 [Zero])
                EDT1 = DerefOf (Arg0 [One])
                EDT2 = DerefOf (Arg0 [0x02])
                ECTE = One
                While (((ESRC != Zero) && (ECTE != Zero)))
                {
                    Sleep (0x0A)
                    ESRC -= One
                }

                Local0 = ERN1 /* \_SB_.PCI0.LPC0.EC0_.ERN1 */
                ECTB = Zero
                Release (CSMX)
                Return (Local0)
            }

            Method (SBAT, 2, NotSerialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = Arg0
                Local0 [One] = 0x16
                Local0 [0x02] = Arg1
                Local0 [0x03] = Zero
                Local0 [0x04] = Zero
                ESMC (Local0)
            }

            Method (SBA2, 2, NotSerialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = Arg0
                Local0 [One] = 0x36
                Local0 [0x02] = Arg1
                Local0 [0x03] = Zero
                Local0 [0x04] = Zero
                ESMC (Local0)
            }

            Mutex (ESCX, 0x00)
            Method (ESMC, 1, NotSerialized)
            {
                Acquire (ESCX, 0xFFFF)
                Name (ESRC, 0x05)
                If ((DerefOf (Arg0 [0x04]) & One))
                {
                    SMD0 = Zero
                }

                SMAD = DerefOf (Arg0 [One])
                SMCM = DerefOf (Arg0 [0x02])
                SMBN = DerefOf (Arg0 [0x03])
                Local4 = DerefOf (Arg0 [0x04])
                Local5 = Zero
                BCNT = Local4
                If ((Local4 != Zero))
                {
                    Local1 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    While (~(Local4 == Local5))
                    {
                        Local1 [Local5] = DerefOf (Arg0 [(0x05 + Local5)]
                            )
                        Local5 += One
                    }

                    SMD0 = Local1
                }

                SMPR = DerefOf (Arg0 [Zero])
                While ((~(ToInteger (ESRC) == Zero) && ~(ToInteger (
                    (SMST & 0x80)) == 0x80)))
                {
                    Sleep (0x14)
                    ESRC -= One
                }

                If ((ToInteger (SMST) == 0x80))
                {
                    ESMB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    ESMS = BCNT /* \_SB_.PCI0.LPC0.EC0_.BCNT */
                }
                Else
                {
                    ESMS = 0xFF
                }

                Release (ESCX)
            }
        }

        Scope (EC0)
        {
            Mutex (BAMT, 0x00)
            Name (SMDW, Zero)
            Method (ECSM, 3, NotSerialized)
            {
                Local0 = Acquire (BAMT, 0x0064)
                SMAD = Arg1
                SMCM = Arg2
                SMST = Zero
                SMPR = Arg0
                Local0 = One
                Local1 = Zero
                While ((0x64 > Local1))
                {
                    Sleep (One)
                    Local1++
                    If ((SMST && 0x80))
                    {
                        Break
                    }
                }

                If ((Local1 >= 0x64))
                {
                    Local0 = Zero
                }

                Release (BAMT)
                Return (Local0)
            }

            Method (GBWD, 2, NotSerialized)
            {
                Name (BFWB, Buffer (0x20){})
                CreateWordField (BFWB, Zero, FB10)
                Local0 = 0x14
                While ((Local0 > Zero))
                {
                    Local1 = ECSM (0x09, Arg0, Arg1)
                    If (Local1)
                    {
                        Break
                    }

                    Local0--
                    Sleep (0x0A)
                }

                If ((Local0 > Zero))
                {
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                }
                Else
                {
                    FB10 = Zero
                }

                SMDW = FB10 /* \_SB_.PCI0.LPC0.EC0_.GBWD.FB10 */
            }

            Method (BSHK, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    If (_OSI ("Windows 2006"))
                    {
                        OSTY = One
                    }

                    If (_OSI ("Windows 2006 SP1"))
                    {
                        OSTY = One
                    }

                    If (_OSI ("Windows 2009"))
                    {
                        OSTY = 0x03
                    }

                    If (_OSI ("Windows 2012"))
                    {
                        OSTY = 0x04
                        WLAT = One
                    }

                    If (_OSI ("Windows 2013"))
                    {
                        OSTY = 0x05
                    }

                    If (_OSI ("Windows 2015"))
                    {
                        OSTY = 0x06
                    }

                    If (_OSI ("Linux"))
                    {
                        OSTY = 0x02
                    }
                }
            }

            Method (GBMN, 1, NotSerialized)
            {
                Name (CMMA, "         ")
                Name (BFWB, Buffer (0x20){})
                CreateField (BFWB, Zero, 0x40, FB70)
                If (ECOK ())
                {
                    Local0 = ECSM (0x0B, Arg0, 0x21)
                    If (Local0)
                    {
                        BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                        CMMA = FB70 /* \_SB_.PCI0.LPC0.EC0_.GBMN.FB70 */
                    }
                    Else
                    {
                        CMMA = "PABAS0241231"
                    }
                }
                Else
                {
                    CMMA = "PABAS0241231"
                }

                Return (CMMA) /* \_SB_.PCI0.LPC0.EC0_.GBMN.CMMA */
            }

            Method (GUBS, 1, NotSerialized)
            {
                Name (BRSN, "      ")
                If (ECOK ())
                {
                    BRSN = ToDecimalString (BDC0)
                }
                Else
                {
                    BRSN = "41167"
                }

                Return (BRSN) /* \_SB_.PCI0.LPC0.EC0_.GUBS.BRSN */
            }

            Method (GUBT, 1, NotSerialized)
            {
                Local0 = "Li-Ion"
                Return (Local0)
            }

            Method (GUBI, 1, NotSerialized)
            {
                Name (BRMN, "UNKNOWN ")
                Name (BFWB, Buffer (0x20){})
                CreateField (BFWB, Zero, 0x60, FBB0)
                If (ECOK ())
                {
                    Local0 = ECSM (0x0B, Arg0, 0x20)
                    If (Local0)
                    {
                        BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                        BRMN = FBB0 /* \_SB_.PCI0.LPC0.EC0_.GUBI.FBB0 */
                    }
                }

                Return (BRMN) /* \_SB_.PCI0.LPC0.EC0_.GUBI.BRMN */
            }

            Method (GUBC, 1, NotSerialized)
            {
                GBWD (Arg0, 0x17)
                Local0 = SMDW /* \_SB_.PCI0.LPC0.EC0_.SMDW */
                Return (Local0)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (BMDL, Zero)
            Name (BASC, One)
            Name (BFFW, Zero)
            Name (BMLT, "11111111")
            Name (BML0, "11111111")
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                ^^EC0.BSHK ()
                If (ECOK ())
                {
                    If (^^EC0.BOL0)
                    {
                        Sleep (0x14)
                        Return (0x1F)
                    }
                    Else
                    {
                        Sleep (0x14)
                        Return (0x0F)
                    }
                }
                Else
                {
                    Sleep (0x14)
                    Return (0x1F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BIFX (Zero))
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                Return (BIFX (One))
            }

            Method (BIFX, 1, NotSerialized)
            {
                Name (STAX, Package (0x14)
                {
                    Zero, 
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    0x08, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "Li-Ion", 
                    "LENOVO "
                })
                Name (STAF, Package (0x0D)
                {
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "Li-Ion", 
                    "LENOVO "
                })
                STAX [0x10] = ^^EC0.GBMN (0x16)
                STAX [0x11] = ^^EC0.GUBS (0x16)
                STAX [0x12] = ^^EC0.GUBT (0x16)
                STAX [0x13] = ^^EC0.GUBI (0x16)
                STAX [0x08] = ^^EC0.GUBC (0x16)
                If (ECOK ())
                {
                    BFFW = ^^EC0.ORRF /* \_SB_.PCI0.LPC0.EC0_.ORRF */
                    If ((^^EC0.BAM0 == Zero))
                    {
                        BASC = 0x0A
                    }

                    STAX [One] = ^^EC0.BAM0 /* \_SB_.PCI0.LPC0.EC0_.BAM0 */
                    Local0 = ^^EC0.BDC0 /* \_SB_.PCI0.LPC0.EC0_.BDC0 */
                    BMDL = Local0
                    STAX [0x02] = (^^EC0.BDC0 * BASC)
                    Sleep (0x14)
                    STAX [0x05] = ^^EC0.BDV0 /* \_SB_.PCI0.LPC0.EC0_.BDV0 */
                    Sleep (0x14)
                    If ((BFFW == One))
                    {
                        Local2 = ^^EC0.BFCB /* \_SB_.PCI0.LPC0.EC0_.BFCB */
                    }
                    Else
                    {
                        Local2 = ^^EC0.BFC0 /* \_SB_.PCI0.LPC0.EC0_.BFC0 */
                    }

                    Local2 = (Local2 * BASC)
                    Sleep (0x14)
                    STAX [0x03] = Local2
                    Divide (Local2, 0x64, Local0, Local1)
                    Local1 *= 0x0A
                    STAX [0x06] = Local1
                    Divide (Local2, 0x64, Local0, Local1)
                    Local1 *= 0x03
                    STAX [0x07] = Local1
                    STAF [Zero] = DerefOf (STAX [One])
                    STAF [One] = DerefOf (STAX [0x02])
                    STAF [0x02] = DerefOf (STAX [0x03])
                    STAF [0x03] = DerefOf (STAX [0x04])
                    STAF [0x04] = DerefOf (STAX [0x05])
                    STAF [0x05] = DerefOf (STAX [0x06])
                    STAF [0x06] = DerefOf (STAX [0x07])
                    STAF [0x07] = DerefOf (STAX [0x0E])
                    STAF [0x08] = DerefOf (STAX [0x0F])
                    STAF [0x09] = DerefOf (STAX [0x10])
                    STAF [0x0A] = DerefOf (STAX [0x11])
                    STAF [0x0B] = DerefOf (STAX [0x12])
                    STAF [0x0C] = DerefOf (STAX [0x13])
                    If ((Arg0 == One))
                    {
                        Return (STAX) /* \_SB_.PCI0.LPC0.BAT1.BIFX.STAX */
                    }
                    Else
                    {
                        Return (STAF) /* \_SB_.PCI0.LPC0.BAT1.BIFX.STAF */
                    }
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Name (PBST, Package (0x04)
                {
                    Zero, 
                    Ones, 
                    Ones, 
                    0x1770
                })
                If (ECOK ())
                {
                    PBST [Zero] = ^^EC0.BST0 /* \_SB_.PCI0.LPC0.EC0_.BST0 */
                    Sleep (0x14)
                    If ((^^EC0.BAC0 >> 0x0F))
                    {
                        Local4 = ((~^^EC0.BAC0 & 0xFFFF) + One)
                    }
                    Else
                    {
                        Local4 = ^^EC0.BAC0 /* \_SB_.PCI0.LPC0.EC0_.BAC0 */
                    }

                    If ((^^EC0.BAM0 == Zero))
                    {
                        Local4 = ((Local4 * ^^EC0.BPV0) / 0x03E8)
                    }

                    PBST [One] = Local4
                    Sleep (0x14)
                    PBST [0x02] = (^^EC0.BRC0 * BASC)
                    Sleep (0x14)
                    PBST [0x03] = ^^EC0.BPV0 /* \_SB_.PCI0.LPC0.EC0_.BPV0 */
                    Sleep (0x14)
                    If ((^^EC0.BDC0 != BMDL))
                    {
                        Notify (BAT1, 0x81) // Information Change
                    }
                }

                Return (PBST) /* \_SB_.PCI0.LPC0.BAT1._BST.PBST */
            }

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                Local0 = (Arg0 / BASC)
                ^^EC0.BTPB = Local0
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (XX00, Buffer (0x03){})
            Name (ACDC, 0xFF)
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Local0 = ^^EC0.ADPT /* \_SB_.PCI0.LPC0.EC0_.ADPT */
                If (((Local0 != ACDC) || (ACDC == 0xFF)))
                {
                    CreateWordField (XX00, Zero, SSZE)
                    CreateByteField (XX00, 0x02, ACST)
                    SSZE = 0x03
                    If (Local0)
                    {
                        AFN4 (One)
                        ACST = Zero
                    }
                    Else
                    {
                        AFN4 (0x02)
                        ACST = One
                    }

                    ALIB (One, XX00)
                    ACDC = Local0
                }

                Return (Local0)
            }
        }

        Method (ECFG, 1, NotSerialized)
        {
            If ((Arg0 == One))
            {
                ^EC0.ECRD = One
            }
            Else
            {
                ^EC0.ECRD = Zero
            }
        }
    }

    Name (TSOS, 0x75)
    If (CondRefOf (\_OSI))
    {
        If (_OSI ("Windows 2009"))
        {
            TSOS = 0x50
        }

        If (_OSI ("Windows 2015"))
        {
            TSOS = 0x70
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMIC, SystemMemory, 0xFED80000, 0x00800000)
        Field (SMIC, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36A), 
            SMIB,   8
        }

        OperationRegion (SSMI, SystemIO, SMIB, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SMIW,   16
        }

        OperationRegion (ECMC, SystemIO, 0x72, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
        {
            ECMI,   8, 
            ECMD,   8
        }

        IndexField (ECMI, ECMD, ByteAcc, NoLock, Preserve)
        {
            Offset (0x08), 
            FRTB,   32
        }

        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
                ,   5, 
            IC0E,   1, 
            IC1E,   1, 
            IC2E,   1, 
            IC3E,   1, 
            IC4E,   1, 
            IC5E,   1, 
            UT0E,   1, 
            UT1E,   1, 
                ,   1, 
                ,   1, 
            ST_E,   1, 
            UT2E,   1, 
                ,   1, 
            EMMD,   2, 
                ,   3, 
            XHCE,   1, 
                ,   1, 
                ,   1, 
            UT3E,   1, 
            ESPI,   1, 
            EMME,   1, 
            HFPE,   1, 
            Offset (0x08), 
            PCEF,   1, 
                ,   4, 
            IC0D,   1, 
            IC1D,   1, 
            IC2D,   1, 
            IC3D,   1, 
            IC4D,   1, 
            IC5D,   1, 
            UT0D,   1, 
            UT1D,   1, 
                ,   1, 
                ,   1, 
            ST_D,   1, 
            UT2D,   1, 
                ,   1, 
            EHCD,   1, 
                ,   4, 
            XHCD,   1, 
            SD_D,   1, 
                ,   1, 
            UT3D,   1, 
                ,   1, 
            EMD3,   1, 
                ,   2, 
            S03D,   1, 
            FW00,   16, 
            FW01,   32, 
            FW02,   16, 
            FW03,   32, 
            SDS0,   8, 
            SDS1,   8, 
            CZFG,   1, 
            Offset (0x20), 
            SD10,   32, 
            EH10,   32, 
            XH10,   32, 
            STBA,   32
        }

        OperationRegion (FCFG, SystemMemory, PEBA, 0x01000000)
        Field (FCFG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA3044), 
            IPDE,   32, 
            IMPE,   32, 
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1
        }

        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
            Offset (0x1F), 
            IM1F,   8, 
            IM20,   8, 
            Offset (0x44), 
            IM44,   8, 
            Offset (0x46), 
            IM46,   8, 
            Offset (0x4A), 
            IM4A,   8, 
            IM4B,   8, 
            Offset (0x57), 
            IM57,   8, 
            IM58,   8, 
            Offset (0x68), 
            IM68,   8, 
            IM69,   8, 
            IM6A,   8, 
            IM6B,   8, 
            Offset (0x6D), 
            IM6D,   8
        }

        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
            Offset (0x80), 
                ,   28, 
            RD28,   1, 
                ,   1, 
            RQTY,   1, 
            Offset (0x84), 
                ,   28, 
            SD28,   1, 
                ,   1, 
            Offset (0xA0), 
            PG1A,   1
        }

        OperationRegion (EMMX, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0xD0), 
                ,   17, 
            FC18,   1, 
            FC33,   1, 
                ,   7, 
            CD_T,   1, 
            WP_T,   1
        }

        OperationRegion (EMMB, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMB, AnyAcc, NoLock, Preserve)
        {
            Offset (0xA4), 
            E0A4,   32, 
            E0A8,   32, 
            Offset (0xB0), 
            E0B0,   32, 
            Offset (0xD0), 
            E0D0,   32, 
            Offset (0x116), 
            E116,   32
        }

        Name (SVBF, Buffer (0x0100)
        {
             0x00                                             // .
        })
        CreateDWordField (SVBF, Zero, S0A4)
        CreateDWordField (SVBF, 0x04, S0A8)
        CreateDWordField (SVBF, 0x08, S0B0)
        CreateDWordField (SVBF, 0x0C, S0D0)
        CreateDWordField (SVBF, 0x10, S116)
        Method (SECR, 0, Serialized)
        {
            S116 = E116 /* \_SB_.E116 */
            RQTY = Zero
            RD28 = One
            Local0 = SD28 /* \_SB_.SD28 */
            While (Local0)
            {
                Local0 = SD28 /* \_SB_.SD28 */
            }
        }

        Method (RECR, 0, Serialized)
        {
            E116 = S116 /* \_SB_.S116 */
        }

        OperationRegion (LUIE, SystemMemory, 0xFEDC0020, 0x04)
        Field (LUIE, AnyAcc, NoLock, Preserve)
        {
            IER0,   1, 
            IER1,   1, 
            IER2,   1, 
            IER3,   1, 
            UOL0,   1, 
            UOL1,   1, 
            UOL2,   1, 
            UOL3,   1, 
            WUR0,   2, 
            WUR1,   2, 
            WUR2,   2, 
            WUR3,   2
        }

        Method (FRUI, 2, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Arg1 = IUA0 /* \_SB_.IUA0 */
            }

            If ((Arg0 == One))
            {
                Arg1 = IUA1 /* \_SB_.IUA1 */
            }

            If ((Arg0 == 0x02))
            {
                Arg1 = IUA2 /* \_SB_.IUA2 */
            }

            If ((Arg0 == 0x03))
            {
                Arg1 = IUA3 /* \_SB_.IUA3 */
            }
        }

        Method (FUIO, 1, Serialized)
        {
            If ((IER0 == One))
            {
                If ((WUR0 == Arg0))
                {
                    Return (Zero)
                }
            }

            If ((IER1 == One))
            {
                If ((WUR1 == Arg0))
                {
                    Return (One)
                }
            }

            If ((IER2 == One))
            {
                If ((WUR2 == Arg0))
                {
                    Return (0x02)
                }
            }

            If ((IER3 == One))
            {
                If ((WUR3 == Arg0))
                {
                    Return (0x03)
                }
            }

            Return (0x0F)
        }

        Method (SRAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            ADIS = One
            ADSR = Zero
            Stall (Arg1)
            ADSR = One
            ADIS = Zero
            Stall (Arg1)
        }

        Method (DSAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg0 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }

                    ADTD = 0x03
                }
            }
        }

        Method (HSAD, 2, Serialized)
        {
            Local3 = (One << Arg0)
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    PG1A = One
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    RQTY = One
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (!Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    RQTY = Zero
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }

                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    ADTD = 0x03
                    PG1A = Zero
                }
            }
        }

        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (FPIC, AnyAcc, NoLock, Preserve)
        {
            FPII,   8, 
            FPID,   8
        }

        IndexField (FPII, FPID, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF4), 
            IUA0,   8, 
            IUA1,   8, 
            Offset (0xF8), 
            IUA2,   8, 
            IUA3,   8
        }

        Device (HFP1)
        {
            Name (_HID, "AMDI0060")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HFPE)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFEC11000,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.HFP1._CRS.RBUF */
            }
        }

        Device (GPIO)
        {
            Name (_HID, "AMDI0030")  // _HID: Hardware ID
            Name (_CID, "AMDI0030")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000007,
                    }
                    Memory32Fixed (ReadWrite,
                        0xFED81500,         // Address Base
                        0x00000400,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED81200,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR0)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {3}
                Memory32Fixed (ReadWrite,
                    0xFEDC9000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDC7000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT0E == One))
                    {
                        If ((FUIO (Zero) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR1)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {4}
                Memory32Fixed (ReadWrite,
                    0xFEDCA000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDC8000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT1E == One))
                    {
                        If ((FUIO (One) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR2)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {3}
                Memory32Fixed (ReadWrite,
                    0xFEDCE000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDCC000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT2E == One))
                    {
                        If ((FUIO (0x02) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR3)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {4}
                Memory32Fixed (ReadWrite,
                    0xFEDCF000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDCD000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT3E == One))
                    {
                        If ((FUIO (0x03) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (I2CA)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {10}
                Memory32Fixed (ReadWrite,
                    0xFEDC2000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC0E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x05, 0xC8)
            }
        }

        Device (I2CB)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {11}
                Memory32Fixed (ReadWrite,
                    0xFEDC3000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC1E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x06, 0xC8)
            }
        }

        Device (I2CC)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {4}
                Memory32Fixed (ReadWrite,
                    0xFEDC4000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC2E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x07, 0xC8)
            }
        }

        Device (I2CD)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {6}
                Memory32Fixed (ReadWrite,
                    0xFEDC5000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC3E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x08, 0xC8)
            }
        }

        Device (I2CE)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {14}
                Memory32Fixed (ReadWrite,
                    0xFEDC6000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC4E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x09, 0xC8)
            }
        }

        Device (I2CF)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {15}
                Memory32Fixed (ReadWrite,
                    0xFEDCB000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC5E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0A, 0xC8)
            }
        }

        Method (EPIN, 0, NotSerialized)
        {
            IPDE = Zero
            IMPE = Zero
            IM15 = One
            IM16 = One
            IM20 = One
            IM44 = One
            IM46 = One
            IM68 = One
            IM69 = One
            IM6A = One
            IM6B = One
            IM4A = One
            IM58 = One
            IM4B = One
            IM57 = One
            IM6D = One
            IM1F = One
            SECR ()
        }

        Name (NCRS, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000005,
            }
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
        })
        Name (DCRS, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000005,
            }
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
            GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x0BB8,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0044
                }
            GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0044
                }
        })
        Name (AHID, "AMDI0040")
        Name (ACID, "AMDI0040")
        Name (SHID, 0x400DD041)
        Name (SCID, "PCICC_080501")
        Device (EMM0)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If (EMMD)
                {
                    Return (SHID) /* \_SB_.SHID */
                }
                Else
                {
                    Return (AHID) /* \_SB_.AHID */
                }
            }

            Method (_CID, 0, Serialized)  // _CID: Compatible ID
            {
                If (EMMD)
                {
                    Return (SCID) /* \_SB_.SCID */
                }
                Else
                {
                    Return (ACID) /* \_SB_.ACID */
                }
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (EMD3)
                {
                    Return (DCRS) /* \_SB_.DCRS */
                }
                Else
                {
                    Return (NCRS) /* \_SB_.NCRS */
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If (EMME)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (EMME)
                {
                    EPIN ()
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((EMD3 && EMME))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((EMD3 && EMME))
                {
                    HSAD (0x1C, Zero)
                    RECR ()
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((EMD3 && EMME))
                {
                    HSAD (0x1C, 0x03)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (Zero) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y09)
                    IRQNoFlags (_Y0A)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y09._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y09._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR1._CRS._Y0A._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (Zero)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA0 /* \_SB_.IUA0 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR1._CRS.BUF0 */
            }
        }

        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (One) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02F8,             // Range Minimum
                        0x02F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0B)
                    IRQNoFlags (_Y0C)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0B._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0B._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR2._CRS._Y0C._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (One)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA1 /* \_SB_.IUA1 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR2._CRS.BUF0 */
            }
        }

        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (0x02) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03E8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0D)
                    IRQNoFlags (_Y0E)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0D._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0D._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR3._CRS._Y0E._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (0x02)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA2 /* \_SB_.IUA2 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR3._CRS.BUF0 */
            }
        }

        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (0x03) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03F8,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0F)
                    IRQNoFlags (_Y10)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0F._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0F._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR4._CRS._Y10._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (0x03)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA3 /* \_SB_.IUA3 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR4._CRS.BUF0 */
            }
        }
    }

    Scope (_SB.FUR0)
    {
        Device (UART)
        {
            Name (_HID, "UTK0001")  // _HID: Hardware ID
            Name (_CID, "UARTTest")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    UartSerialBusV2 (0x0001C200, DataBitsEight, StopBitsOne,
                        0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                        0x0020, 0x0020, "\\_SB.FUR0",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.FUR0.UART._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.FUR1)
    {
        Device (UART)
        {
            Name (_HID, "UTK0001")  // _HID: Hardware ID
            Name (_CID, "UARTTest")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    UartSerialBusV2 (0x0001C200, DataBitsEight, StopBitsOne,
                        0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                        0x0020, 0x0020, "\\_SB.FUR1",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.FUR1.UART._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.I2CA)
    {
        Device (WTP1)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK0001")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.WTP1._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MTP1)
        {
            Name (_HID, "STK0001")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.MTP1._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WTP2)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK0002")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.WTP2._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MTP2)
        {
            Name (_HID, "STK0002")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.MTP2._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WTP3)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK0003")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.WTP3._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MTP3)
        {
            Name (_HID, "STK0003")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.MTP3._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WTP4)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK0004")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.WTP4._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MTP4)
        {
            Name (_HID, "STK0004")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.MTP4._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MTP5)
        {
            Name (_HID, "STK0005")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CA.MTP5._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.I2CB)
    {
        Device (WT21)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00012")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF2")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.WT21._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT21)
        {
            Name (_HID, "STK00012")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.MT21._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT22)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00022")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF2")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.WT22._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT22)
        {
            Name (_HID, "STK00022")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.MT22._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT23)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00032")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF2")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.WT23._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT23)
        {
            Name (_HID, "STK00032")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.MT23._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT24)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00042")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF2")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.WT24._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT24)
        {
            Name (_HID, "STK00042")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.MT24._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT25)
        {
            Name (_HID, "STK00052")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CB.MT25._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.I2CC)
    {
        Device (WT31)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00013")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF3")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.WT31._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT31)
        {
            Name (_HID, "STK00013")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.MT31._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT32)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00023")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF3")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.WT32._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT32)
        {
            Name (_HID, "STK00023")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.MT32._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT33)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00033")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF3")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.WT33._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT33)
        {
            Name (_HID, "STK00033")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.MT33._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT34)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00043")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF3")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.WT34._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT34)
        {
            Name (_HID, "STK00043")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.MT34._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT35)
        {
            Name (_HID, "STK00053")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CC.MT35._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.I2CD)
    {
        Device (WT41)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00014")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF4")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.WT41._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT41)
        {
            Name (_HID, "STK00014")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.MT41._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT42)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00024")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF4")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.WT42._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT42)
        {
            Name (_HID, "STK00024")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.MT42._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT43)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00034")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF4")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.WT43._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT43)
        {
            Name (_HID, "STK00034")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.MT43._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (WT44)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "STK00044")  // _HID: Hardware ID
            Name (_CID, "SPBTestKMDF4")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.WT44._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT44)
        {
            Name (_HID, "STK00044")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.MT44._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MT45)
        {
            Name (_HID, "STK00054")  // _HID: Hardware ID
            Name (_CID, "WITTTest")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.I2CD.MT45._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((MWTT == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.I2CA)
    {
        Device (TPDA)
        {
            Name (_HID, "SYNA0001")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0090
                        }
                })
                Return (RBUF) /* \_SB_.I2CA.TPDA._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((TPOS >= 0x60) & (TPID == One)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                If (Arg0){}
                Else
                {
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Switch (ToInteger (Arg1))
                            {
                                Case (One)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }

                            }
                        }
                        Case (One)
                        {
                            Return (0x20)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        Device (TPDB)
        {
            Name (_HID, "ELAN0001")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0090
                        }
                })
                Return (RBUF) /* \_SB_.I2CA.TPDB._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((TPOS >= 0x60) & (TPID == 0x02)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                If (Arg0){}
                Else
                {
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Switch (ToInteger (Arg1))
                            {
                                Case (One)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }

                            }
                        }
                        Case (One)
                        {
                            Return (One)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_TZ)
    {
        ThermalZone (TZ01)
        {
            Name (CRTT, 0x7D)
            Name (TSPS, 0x14)
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    If (!Acquire (\_SB.PCI0.LPC0.EC0.Z009, 0x012C))
                    {
                        Local0 = \_SB.PCI0.LPC0.EC0.CTML
                        Release (\_SB.PCI0.LPC0.EC0.Z009)
                        Return ((0x0AAC + (Local0 * 0x0A)))
                    }

                    Return (0x0B74)
                }
                Else
                {
                    Return (0x0B74)
                }
            }

            Method (_PSL, 0, Serialized)  // _PSL: Passive List
            {
                Return (Package (0x10)
                {
                    \_SB.PLTF.C000, 
                    \_SB.PLTF.C001, 
                    \_SB.PLTF.C002, 
                    \_SB.PLTF.C003, 
                    \_SB.PLTF.C004, 
                    \_SB.PLTF.C005, 
                    \_SB.PLTF.C006, 
                    \_SB.PLTF.C007, 
                    \_SB.PLTF.C008, 
                    \_SB.PLTF.C009, 
                    \_SB.PLTF.C00A, 
                    \_SB.PLTF.C00B, 
                    \_SB.PLTF.C00C, 
                    \_SB.PLTF.C00D, 
                    \_SB.PLTF.C00E, 
                    \_SB.PLTF.C00F
                })
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return ((0x0AAC + (CRTT * 0x0A)))
            }

            Method (_TC1, 0, Serialized)  // _TC1: Thermal Constant 1
            {
                Return (One)
            }

            Method (_TC2, 0, Serialized)  // _TC2: Thermal Constant 2
            {
                Return (0x02)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (TSPS) /* \_TZ_.TZ01.TSPS */
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        OperationRegion (ECF2, EmbeddedControl, Zero, 0xFF)
        Field (ECF2, ByteAcc, Lock, Preserve)
        {
            VCMD,   8, 
            VDAT,   8, 
            VSTA,   8
        }

        Device (VPC0)
        {
            Name (_HID, "VPC2004")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_VPC, Zero)
            Name (VPCD, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CFG, 0, NotSerialized)
            {
                If ((EMWK == Zero))
                {
                    EMWK = One
                }

                Local0 = Zero
                Local1 = Zero
                Local1 <<= 0x18
                Local0 |= Local1
                Local0 |= 0x04000000
                Local0 |= 0x08000000
                Local0 |= 0x10000000
                Local0 |= 0x20000000
                Local0 |= 0x40000000
                Local0 |= 0x80000000
                If (CMEX)
                {
                    Local0 |= 0x00080000
                }

                If (WLEX)
                {
                    Local0 |= 0x00040000
                }

                If (ECOK ())
                {
                    If (BTEX)
                    {
                        Local0 |= 0x00010000
                    }
                }

                Local0 |= 0x10
                _VPC = Local0
                Return (_VPC) /* \_SB_.PCI0.LPC0.EC0_.VPC0._VPC */
            }

            Name (TBSL, Package (0x0B)
            {
                One, 
                0x02, 
                0x03, 
                0x05, 
                0x08, 
                0x0C, 
                0x12, 
                0x1B, 
                0x27, 
                0x43, 
                0x64
            })
            Name (TBS2, Package (0x65)
            {
                Zero, 
                One, 
                0x02, 
                0x03, 
                0x04, 
                0x05, 
                0x06, 
                0x07, 
                0x08, 
                0x09, 
                0x0A, 
                0x0B, 
                0x0C, 
                0x0D, 
                0x0E, 
                0x0F, 
                0x10, 
                0x11, 
                0x12, 
                0x13, 
                0x14, 
                0x15, 
                0x16, 
                0x17, 
                0x18, 
                0x19, 
                0x1A, 
                0x1B, 
                0x1C, 
                0x1D, 
                0x1E, 
                0x1F, 
                0x20, 
                0x21, 
                0x22, 
                0x23, 
                0x24, 
                0x25, 
                0x26, 
                0x27, 
                0x28, 
                0x29, 
                0x2A, 
                0x2B, 
                0x2C, 
                0x2D, 
                0x2E, 
                0x2F, 
                0x30, 
                0x31, 
                0x32, 
                0x33, 
                0x34, 
                0x35, 
                0x36, 
                0x37, 
                0x38, 
                0x39, 
                0x3A, 
                0x3B, 
                0x3C, 
                0x3D, 
                0x3E, 
                0x3F, 
                0x40, 
                0x41, 
                0x42, 
                0x43, 
                0x44, 
                0x45, 
                0x46, 
                0x47, 
                0x48, 
                0x49, 
                0x4A, 
                0x4B, 
                0x4C, 
                0x4D, 
                0x4E, 
                0x4F, 
                0x50, 
                0x51, 
                0x52, 
                0x53, 
                0x54, 
                0x55, 
                0x56, 
                0x57, 
                0x58, 
                0x59, 
                0x5A, 
                0x5B, 
                0x5C, 
                0x5D, 
                0x5E, 
                0x5F, 
                0x60, 
                0x61, 
                0x62, 
                0x63, 
                0x64
            })
            Method (DBSL, 0, NotSerialized)
            {
                If ((OSTY < 0x07DC))
                {
                    Return (TBSL) /* \_SB_.PCI0.LPC0.EC0_.VPC0.TBSL */
                }
                Else
                {
                    Return (TBS2) /* \_SB_.PCI0.LPC0.EC0_.VPC0.TBS2 */
                }
            }

            Method (HALS, 0, NotSerialized)
            {
                Local0 = Zero
                If (KLEX)
                {
                    Local0 |= 0x10
                }

                If (KLEN)
                {
                    Local0 |= 0x20
                }

                If (UCEN)
                {
                    Local0 |= 0x80
                }

                Local0 |= 0x0200
                If (HOTM)
                {
                    Local0 |= 0x0400
                }

                Local0 &= 0xEFFF
                Local0 |= 0x4000
                If (UCBM)
                {
                    Local0 |= 0x8000
                }

                Return (Local0)
            }

            Method (SALS, 1, Serialized)
            {
                If ((Arg0 == Zero)){}
                If ((Arg0 == One)){}
                If ((Arg0 == 0x04)){}
                If ((Arg0 == 0x05)){}
                If ((Arg0 == 0x06)){}
                If ((Arg0 == 0x07)){}
                If ((Arg0 == 0x08))
                {
                    KLEN = One
                }

                If ((Arg0 == 0x09))
                {
                    KLEN = Zero
                }

                If ((Arg0 == 0x0A))
                {
                    UCEN = One
                }

                If ((Arg0 == 0x0B))
                {
                    UCEN = Zero
                }

                If ((Arg0 == 0x0C)){}
                If ((Arg0 == 0x0D)){}
                If ((Arg0 == 0x0E))
                {
                    HOTM = One
                }

                If ((Arg0 == 0x0F))
                {
                    HOTM = Zero
                }

                If ((Arg0 == 0x10)){}
                If ((Arg0 == 0x11)){}
                If ((Arg0 == 0x12))
                {
                    UCBM = Zero
                }

                If ((Arg0 == 0x13))
                {
                    UCBM = One
                }

                Return (Zero)
            }

            Method (MHTT, 1, Serialized)
            {
                Local0 = Zero
                Local0 = CTMP /* \_SB_.PCI0.LPC0.EC0_.CTMP */
                Return (Local0)
            }

            Method (MHQI, 1, Serialized)
            {
                Return (Zero)
            }

            Method (MHGI, 1, Serialized)
            {
                Return (Zero)
            }

            Method (SMTF, 1, Serialized)
            {
                If ((Arg0 == Zero))
                {
                    GBWD (0x16, 0x13)
                    Return (SMDW) /* \_SB_.PCI0.LPC0.EC0_.SMDW */
                }

                If ((Arg0 == One))
                {
                    Return (Zero)
                }
            }

            Method (GBMD, 0, NotSerialized)
            {
                Local0 = Zero
                If ((One == CDMB))
                {
                    Local0 |= One
                }

                If ((One == BTSG))
                {
                    Local0 |= 0x02
                }

                If ((One == FCGM))
                {
                    Local0 |= 0x04
                }

                If ((One == MBBD))
                {
                    Local0 |= 0x08
                }

                If ((One == SBBD))
                {
                    Local0 |= 0x10
                }

                If ((One == BTSM))
                {
                    Local0 |= 0x20
                }

                If ((One == BTIL))
                {
                    Local0 |= 0x80
                }

                If ((One == BTPF))
                {
                    Local0 |= 0x0100
                }

                If ((Zero == BTSM))
                {
                    Local0 |= 0x0200
                }

                If ((One == SBIL))
                {
                    Local0 |= 0x0400
                }

                If ((One == BTOV))
                {
                    Local0 |= 0x0800
                }

                If ((One == SBOV))
                {
                    Local0 |= 0x1000
                }

                If ((One == SBPF))
                {
                    Local0 |= 0x2000
                }

                If ((One == SPBA))
                {
                    Local0 |= 0x4000
                }

                If ((Zero == ADPS)){}
                If ((One == ADPS))
                {
                    Local0 |= 0x8000
                }

                If ((0x02 == ADPS))
                {
                    Local0 |= 0x00010000
                }

                If ((One == QCGS))
                {
                    Local0 |= 0x00020000
                }

                Return (Local0)
            }

            Method (SBMC, 1, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    CDMB = Zero
                    EDCC = One
                    Return (Zero)
                }

                If ((Arg0 == One))
                {
                    EDCC = Zero
                    CDMB = One
                    Return (Zero)
                }

                If ((Arg0 == 0x03))
                {
                    BTSM = One
                    LBTM = Zero
                    Return (Zero)
                }

                If ((Arg0 == 0x05))
                {
                    BTSM = Zero
                    LBTM = One
                    Return (Zero)
                }

                If ((Arg0 == 0x06))
                {
                    BTSG = Zero
                    Return (Zero)
                }

                If ((Arg0 == 0x07))
                {
                    FCGM = One
                    Return (Zero)
                }

                If ((Arg0 == 0x08))
                {
                    FCGM = Zero
                    Return (Zero)
                }

                If ((Arg0 == 0x09)){}
                If ((Arg0 == 0x10)){}
                Return (Zero)
            }

            Method (SHDC, 1, Serialized)
            {
                Return (Zero)
            }

            Method (SVCR, 1, Serialized)
            {
                Local0 = Zero
                If ((Arg0 == 0x04))
                {
                    LVAT = Zero
                }

                If ((Arg0 == 0x05))
                {
                    LVAT = One
                }
            }

            Method (VPCR, 1, Serialized)
            {
                If ((Arg0 == One))
                {
                    VPCD = VCMD /* \_SB_.PCI0.LPC0.EC0_.VCMD */
                }
                Else
                {
                    VPCD = VDAT /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                }

                Return (VPCD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.VPCD */
            }

            Method (VPCW, 2, Serialized)
            {
                If ((Arg0 == One))
                {
                    VCMD = Arg1
                    If ((Arg1 == 0x11))
                    {
                        VDAT = 0x0B
                        VCMD = Zero
                        Return (Zero)
                    }

                    If ((Arg1 == 0x13))
                    {
                        If ((OSTY < 0x07D6))
                        {
                            Local0 = VDAT /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                            Local0 += 0x02
                            Return (Zero)
                        }
                    }
                }
                Else
                {
                    VDAT = Arg1
                }

                Return (Zero)
            }

            Method (MHCF, 1, NotSerialized)
            {
                Local0 = Arg0
                Local0 &= 0x60
                Local0 >>= 0x05
                If ((Local0 == One))
                {
                    ECP4 = One
                    Sleep (0x01F4)
                }

                BFUC = Local0
                If (BFUC)
                {
                    BFFW = Zero
                }
                Else
                {
                    BFFW = One
                }

                Sleep (0x14)
                Return (Arg0)
            }

            Method (MHPF, 1, NotSerialized)
            {
                Name (BFWB, Buffer (0x25){})
                CreateByteField (BFWB, Zero, FB0)
                CreateByteField (BFWB, One, FB1)
                CreateByteField (BFWB, 0x02, FB2)
                CreateByteField (BFWB, 0x03, FB3)
                CreateField (BFWB, 0x20, 0x0100, FB4)
                CreateByteField (BFWB, 0x24, FB5)
                If ((SizeOf (Arg0) <= 0x25))
                {
                    If ((SMPR != Zero))
                    {
                        FB1 = SMST /* \_SB_.PCI0.LPC0.EC0_.SMST */
                    }
                    Else
                    {
                        BFWB = Arg0
                        SMAD = FB2 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB2_ */
                        SMCM = FB3 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB3_ */
                        BCNT = FB5 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB5_ */
                        Local0 = FB0 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB0_ */
                        If (((Local0 & One) == Zero))
                        {
                            SMD0 = FB4 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB4_ */
                        }

                        SMST = Zero
                        SMPR = FB0 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB0_ */
                        Local1 = Zero
                        While ((0x07D0 > Local1))
                        {
                            Sleep (One)
                            Local1++
                            If ((SMST && 0x80))
                            {
                                Break
                            }
                        }

                        Local0 = FB0 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.FB0_ */
                        If (((Local0 & One) != Zero))
                        {
                            FB4 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                        }

                        FB1 = SMST /* \_SB_.PCI0.LPC0.EC0_.SMST */
                        If ((Local1 >= 0x07D0))
                        {
                            SMPR = Zero
                            FB1 = 0x92
                        }
                    }

                    If (Ones)
                    {
                        Sleep (0x05)
                    }

                    Return (BFWB) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHPF.BFWB */
                }

                Return (Arg0)
            }

            Method (MHIF, 1, NotSerialized)
            {
                Name (BFWB, Buffer (0x20){})
                CreateField (BFWB, Zero, 0x10, FB10)
                CreateField (BFWB, Zero, 0x40, FB70)
                Name (RETB, Buffer (0x0A){})
                CreateField (RETB, Zero, 0x10, RB10)
                CreateField (RETB, 0x10, 0x40, RB92)
                If ((Arg0 == Zero))
                {
                    If (BOL0)
                    {
                        SBAT (0x09, 0x35)
                        BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                        RB10 = FB10 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHIF.FB10 */
                        SBAT (0x0B, 0x37)
                        BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                        RB92 = FB70 /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHIF.FB70 */
                    }
                }

                If ((Arg0 == One)){}
                Return (RETB) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHIF.RETB */
            }

            Method (GBID, 0, NotSerialized)
            {
                Name (BFWB, Buffer (0x20){})
                CreateField (BFWB, Zero, 0x10, FB10)
                CreateField (BFWB, Zero, 0x40, FB70)
                Name (RETB, Package (0x04)
                {
                    Buffer (0x02)
                    {
                         0x00, 0x00                                       // ..
                    }, 

                    Buffer (0x02)
                    {
                         0xFF, 0xFF                                       // ..
                    }, 

                    Buffer (0x08)
                    {
                         0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF   // ........
                    }, 

                    Buffer (0x08)
                    {
                         0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF   // ........
                    }
                })
                If (BOL0)
                {
                    SBAT (0x09, 0x17)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    RETB [Zero] = FB10 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GBID.FB10 */
                    SBAT (0x0B, 0x37)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    RETB [0x02] = FB70 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GBID.FB70 */
                }

                Return (RETB) /* \_SB_.PCI0.LPC0.EC0_.VPC0.GBID.RETB */
            }

            Method (GSBI, 1, NotSerialized)
            {
                Name (BFWB, Buffer (0x20){})
                CreateField (BFWB, Zero, 0x10, FB10)
                CreateField (BFWB, Zero, 0x40, FB70)
                CreateField (BFWB, Zero, 0x50, FBA0)
                CreateField (BFWB, Zero, 0x60, FBB0)
                Name (SBIF, Buffer (0x53){})
                If ((Arg0 == One))
                {
                    CreateWordField (SBIF, Zero, BDCX)
                    BDCX = BDC0 /* \_SB_.PCI0.LPC0.EC0_.BDC0 */
                    CreateWordField (SBIF, 0x02, BFCX)
                    BFCX = BFC0 /* \_SB_.PCI0.LPC0.EC0_.BFC0 */
                    CreateWordField (SBIF, 0x04, BRCX)
                    BRCX = BRC0 /* \_SB_.PCI0.LPC0.EC0_.BRC0 */
                    CreateWordField (SBIF, 0x06, TTEX)
                    TTEX = BRC0 /* \_SB_.PCI0.LPC0.EC0_.BRC0 */
                    CreateWordField (SBIF, 0x08, TTFX)
                    SBAT (0x09, 0x13)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    TTFX = FB10 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FB10 */
                    CreateWordField (SBIF, 0x0A, BPVX)
                    BPVX = BPV0 /* \_SB_.PCI0.LPC0.EC0_.BPV0 */
                    CreateWordField (SBIF, 0x0C, BPCX)
                    BPCX = BPC0 /* \_SB_.PCI0.LPC0.EC0_.BPC0 */
                    CreateWordField (SBIF, 0x0E, BTMX)
                    SBAT (0x09, 0x08)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    BTMX = FB10 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FB10 */
                    CreateWordField (SBIF, 0x10, BMDX)
                    SBAT (0x09, 0x1B)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    BMDX = FB10 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FB10 */
                    CreateWordField (SBIF, 0x12, FUDX)
                    SBAT (0x09, 0x3F)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    FUDX = FB10 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FB10 */
                    CreateWordField (SBIF, 0x14, BDVX)
                    BDVX = BDV0 /* \_SB_.PCI0.LPC0.EC0_.BDV0 */
                    CreateField (SBIF, 0xB0, 0x50, DECX)
                    SBAT (0x0B, 0x22)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    DECX = FBA0 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FBA0 */
                    CreateField (SBIF, 0x0100, 0x40, DENX)
                    SBAT (0x0B, 0x21)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    DENX = FB70 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FB70 */
                    CreateField (SBIF, 0x0140, 0x60, MANX)
                    SBAT (0x0B, 0x20)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    MANX = FBB0 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FBB0 */
                    CreateField (SBIF, 0x0258, 0x40, BFWV)
                    SBAT (0x0B, 0x37)
                    BFWB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    BFWV = FB70 /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.FB70 */
                }

                If ((Arg0 == 0x02)){}
                Return (SBIF) /* \_SB_.PCI0.LPC0.EC0_.VPC0.GSBI.SBIF */
            }

            Method (BTMC, 1, Serialized)
            {
                Local0 = (Arg0 & 0x0F)
                Name (BC01, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                           // ....
                })
                CreateField (BC01, Zero, One, BC02)
                CreateField (BC01, One, 0x1F, BC05)
                CreateField (BC01, 0x04, 0x1B, BC04)
                If ((BOL0 == Zero))
                {
                    Return (ToInteger (BC01))
                }

                BC02 = One
                Name (BC06, Buffer (0x20){})
                CreateField (BC06, Zero, 0x10, BC10)
                CreateField (BC06, Zero, 0x03, BC07)
                CreateField (BC06, 0x04, 0x04, BC08)
                CreateField (BC06, 0x08, 0x04, BC09)
                Switch (ToInteger (Local0))
                {
                    Case (One)
                    {
                        Local1 = (Arg0 >> 0x04)
                        Switch (ToInteger (Local1))
                        {
                            Case (One)
                            {
                                SBAT (0x09, 0x2A)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                Local3 = ToInteger (BC10)
                                If (((Local3 & 0x0200) == Zero))
                                {
                                    BC04 = Zero
                                }

                                If (((Local3 & 0x0208) == 0x0208))
                                {
                                    BC04 = One
                                }

                                If (((Local3 & 0x0208) == 0x0200))
                                {
                                    BC04 = 0x02
                                }
                            }
                            Case (0x02)
                            {
                                SBAT (0x09, 0x6A)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                BC04 = BC09 /* \_SB_.PCI0.LPC0.EC0_.VPC0.BTMC.BC09 */
                            }
                            Case (0x03)
                            {
                                SBAT (0x09, 0x6A)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                BC04 = BC08 /* \_SB_.PCI0.LPC0.EC0_.VPC0.BTMC.BC08 */
                            }
                            Case (0x04)
                            {
                                SBAT (0x09, 0x2A)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                BC04 = BC07 /* \_SB_.PCI0.LPC0.EC0_.VPC0.BTMC.BC07 */
                            }

                        }
                    }
                    Case (0x02)
                    {
                        Local1 = (Arg0 & 0x7FFFFFFF)
                        Local1 >>= 0x04
                        Local2 = (Arg0 >> 0x1F)
                        BC02 = Zero
                        Switch (ToInteger (Local1))
                        {
                            Case (Zero)
                            {
                            }
                            Case (One)
                            {
                                SBAT (0x09, 0x2A)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                Local3 = ToInteger (BC10)
                                If (((Local3 & 0x20) == Zero))
                                {
                                    If (ToInteger (Local2))
                                    {
                                        Local3 &= 0xFE3F
                                        Local3 |= 0x40
                                        BC10 = Local3
                                        BC04 = One
                                    }
                                    Else
                                    {
                                        Local3 &= 0xFE3F
                                        Local3 |= 0x0100
                                        BC10 = Local3
                                        BC04 = Zero
                                    }

                                    BC02 = One
                                    SMD0 = BC06 /* \_SB_.PCI0.LPC0.EC0_.VPC0.BTMC.BC06 */
                                    SBAT (0x08, 0x2A)
                                    If ((ToInteger (ESMS) == 0xFF)){}
                                    Else
                                    {
                                        BC02 = One
                                    }
                                }
                            }
                            Case (0x02)
                            {
                            }

                        }
                    }
                    Case (0x03)
                    {
                        Local1 = (Arg0 >> 0x04)
                        Switch (ToInteger (Local1))
                        {
                            Case (One)
                            {
                                SBAT (0x09, 0x2A)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                Local3 = ToInteger (BC10)
                                Switch ((Local3 & 0x30))
                                {
                                    Case (Zero)
                                    {
                                        BC05 = 0x03
                                    }
                                    Case (0x10)
                                    {
                                        BC05 = One
                                    }
                                    Case (0x20)
                                    {
                                        BC05 = 0x02
                                    }

                                }
                            }
                            Case (0x02)
                            {
                                SBAT (0x09, 0x3E)
                                BC06 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                                If ((ToInteger (ESMS) == 0xFF))
                                {
                                    BC02 = Zero
                                }

                                Local3 = ToInteger (BC10)
                                Local3 >>= 0x0D
                                If ((Local3 == 0x07))
                                {
                                    BC05 = One
                                }
                            }

                        }
                    }

                }

                Return (ToInteger (BC01))
            }

            Method (KBLC, 1, Serialized)
            {
                Name (KC00, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                           // ....
                })
                KC00 = Arg0
                CreateField (KC00, Zero, 0x04, KC01)
                CreateField (KC00, 0x04, 0x0C, KC02)
                CreateField (KC00, 0x10, 0x10, KC03)
                Name (KC04, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                           // ....
                })
                CreateField (KC04, Zero, One, KC05)
                Switch (ToInteger (KC01))
                {
                    Case (One)
                    {
                        KC05 = One
                        CreateField (KC04, One, 0x1F, KC06)
                        If (KLEX)
                        {
                            KC06 = Zero
                        }
                    }
                    Case (0x02)
                    {
                        CreateField (KC04, One, 0x0F, KC07)
                        Switch (ToInteger (KC02))
                        {
                            Case (One)
                            {
                            }
                            Case (0x02)
                            {
                                KC05 = One
                                KC07 = KLEN /* \_SB_.PCI0.LPC0.EC0_.KLEN */
                            }
                            Case (0x03)
                            {
                            }

                        }
                    }
                    Case (0x03)
                    {
                        CreateField (KC04, One, 0x0F, KC08)
                        Switch (ToInteger (KC02))
                        {
                            Case (One)
                            {
                            }
                            Case (0x02)
                            {
                                KC05 = One
                                KLEN = ToInteger (KC03)
                                KC08 = KC03 /* \_SB_.PCI0.LPC0.EC0_.VPC0.KBLC.KC03 */
                            }
                            Case (0x03)
                            {
                            }

                        }
                    }

                }

                Return (ToInteger (KC04))
            }
        }

        Method (_Q04, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If ((ECOK () == One))
            {
                Notify (VPC0, 0x80) // Status Change
            }
        }

        Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If ((OKEC == One))
            {
                Notify (VPC0, 0x80) // Status Change
            }
        }

        OperationRegion (ECAM, EmbeddedControl, Zero, 0xFF)
        Field (ECAM, ByteAcc, Lock, Preserve)
        {
        }

        Field (ECMM, AnyAcc, Lock, Preserve)
        {
            Offset (0x03), 
            KLEN,   2, 
            UCEN,   1, 
            UCEX,   1, 
            KLEX,   1, 
            DCRC,   1, 
            CREC,   1, 
            UCBM,   1, 
            SBOV,   1, 
            SBIL,   1, 
            SBPF,   1, 
                ,   2, 
            SBBD,   1, 
            Offset (0x05), 
            WOLS,   1, 
            Offset (0x06), 
            Offset (0x07), 
            BTOV,   1, 
            BTIL,   1, 
            BTPF,   1, 
            BTSG,   1, 
                ,   1, 
            MBBD,   1, 
            LVAT,   1, 
            FCGM,   1, 
            E080,   1, 
            E081,   1, 
            E082,   1, 
            Offset (0x09), 
            CPTY,   1, 
            E091,   1, 
            E092,   1, 
            Offset (0x0A), 
            EDCC,   1, 
                ,   1, 
            CDMB,   1, 
                ,   1, 
            BTSM,   1, 
                ,   1, 
            LBTM,   1, 
            EMWK,   1, 
            GZ13,   1, 
            GZ22,   1, 
            GZ25,   1, 
                ,   1, 
            ECRS,   1, 
                ,   1, 
            GZ44,   2, 
            YMCD,   8, 
            PODL,   8, 
            PODH,   8, 
            Offset (0x10), 
                ,   1, 
                ,   1, 
            STMD,   1, 
                ,   1, 
                ,   1, 
            QTMD,   1, 
            SS35,   1, 
            SBAM,   1, 
            BFUC,   2, 
            ECP4,   1, 
            Offset (0x12), 
            Offset (0x18), 
            GZ52,   1, 
            GZ35,   1, 
            Offset (0x1C), 
                ,   1, 
                ,   1, 
                ,   2, 
                ,   1, 
                ,   1, 
            E1C6,   1, 
            HOTM,   1, 
            BFFW,   1, 
            QCGS,   1, 
            SPBA,   1, 
            ADPS,   2, 
            QATD,   1, 
            QBSM,   1, 
            BATM,   1, 
            E1E0,   1, 
            Offset (0x1F), 
                ,   1, 
            CMEX,   1, 
                ,   1, 
            E1F3,   1
        }
    }

    Name (PSD1, Zero)
    Name (NVRF, Zero)
    Scope (_SB)
    {
        Method (SSFM, 2, NotSerialized)
        {
            Name (XX11, Buffer (0x07){})
            CreateWordField (XX11, Zero, SSZE)
            CreateByteField (XX11, 0x02, SMUF)
            CreateDWordField (XX11, 0x03, SMUD)
            SSZE = 0x07
            If ((ToInteger (Arg0) == One))
            {
                If (NVRF)
                {
                    Notify (^PCI0.GPP0.PEGP, 0xC0) // Hardware-Specific
                    Notify (NPCF, 0xC0) // Hardware-Specific
                }
            }
            ElseIf ((ToInteger (Arg1) == Zero))
            {
                Debug = "Balance Mode"
                If (((^PCI0.LPC0.EC0.ADPT == One) && (^PCI0.LPC0.EC0.ADPS == Zero)))
                {
                    Debug = "AC"
                    If ((PGID == One))
                    {
                        Debug = "GOG20 - GN20-P0P1"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xD2F0
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0xAFC8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xFDE8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0xC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x88B8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x88B8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0xC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == 0x02))
                    {
                        Debug = "GOG20 - N18P"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xD2F0
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0xAFC8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xFDE8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0xC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x88B8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x88B8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0xC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == Zero))
                    {
                        Debug = "GOG21 - GN20-E3"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xD2F0
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0xAFC8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xFDE8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0xC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x88B8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x88B8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0xC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                    }
                    Else
                    {
                        Debug = "GOG22 - GN20-S7B"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xD2F0
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0xAFC8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xFDE8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x012C
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x88B8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x88B8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x012C
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x0A
                            ALIB (0x0C, XX11)
                        }
                    }
                }
                Else
                {
                    Debug = "DC"
                    If ((PGID == One))
                    {
                        Debug = "GOG20 - GN20-P0P1"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == 0x02))
                    {
                        Debug = "GOG20 - N18P"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == Zero))
                    {
                        Debug = "GOG21 - GN20-E3"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    Else
                    {
                        Debug = "GOG22 - GN20-S7B"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0xAFC8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                }
            }
            ElseIf ((ToInteger (Arg1) == One))
            {
                Debug = "Performance Mode"
                If ((PGID == One))
                {
                    Debug = "GOG20 - GN20-P0P1"
                    If ((^PCI0.LPC0.EC0.DPOT == Zero))
                    {
                        Debug = "Normal Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xFDE8
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0x00013880
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xFDE8, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0x00013880
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                    Else
                    {
                        Debug = "Overheating Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xAFC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0xAFC8
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xAFC8, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0xAFC8
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                }
                ElseIf ((PGID == 0x02))
                {
                    Debug = "GOG20 - N18P"
                    If ((^PCI0.LPC0.EC0.DPOT == Zero))
                    {
                        Debug = "Normal Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xEA60
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0x00013880
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xEA60, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0x00013880
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                    Else
                    {
                        Debug = "Overheating Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xAFC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0xAFC8
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xAFC8, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0xAFC8
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                }
                ElseIf ((PGID == Zero))
                {
                    Debug = "GOG21 - GN20-E3"
                    If ((^PCI0.LPC0.EC0.DPOT == Zero))
                    {
                        Debug = "Normal Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xFDE8
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0x00013880
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xFDE8, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0x00013880
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                    Else
                    {
                        Debug = "Overheating Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0x88B8
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0x88B8
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0x88B8, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0x88B8
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                }
                Else
                {
                    Debug = "GOG22 - GN20-S7B"
                    If ((^PCI0.LPC0.EC0.DPOT == Zero))
                    {
                        Debug = "Normal Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xEA60
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0x00013880
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xEA60, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0x00013880
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                    Else
                    {
                        Debug = "Overheating Table"
                        If ((^PCI0.LPC0.EC0.NPST == Zero))
                        {
                            Debug = "Tier 0"
                            SMUF = 0x05
                            SMUD = 0xAFC8
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = 0xAFC8
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Tier 1-7"
                            Divide (0xAFC8, 0x64, Local0, Local1)
                            If ((^PCI0.LPC0.EC0.NPST == 0x03))
                            {
                                Local1 *= 0x55
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                            {
                                Local1 *= 0x46
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                            {
                                Local1 *= 0x37
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                            {
                                Local1 *= 0x28
                            }
                            ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                            {
                                Local1 *= 0x28
                            }
                            Else
                            {
                                Local1 *= 0x64
                            }

                            SMUF = 0x05
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                            SMUF = 0x07
                            SMUD = Local1
                            ALIB (0x0C, XX11)
                        }

                        SMUF = 0x06
                        SMUD = 0xAFC8
                        ALIB (0x0C, XX11)
                        SMUF = One
                        SMUD = 0x01F4
                        ALIB (0x0C, XX11)
                        SMUF = 0x08
                        SMUD = 0x1E
                        ALIB (0x0C, XX11)
                    }
                }
            }
            ElseIf ((ToInteger (Arg1) == 0x02))
            {
                Debug = "Quiet Mode"
                If (((^PCI0.LPC0.EC0.ADPT == One) && (^PCI0.LPC0.EC0.ADPS == Zero)))
                {
                    Debug = "AC"
                    If ((PGID == One))
                    {
                        Debug = "GOG20 - GN20-P0P1"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x927C
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == 0x02))
                    {
                        Debug = "GOG20 - N18P"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x927C
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == Zero))
                    {
                        Debug = "GOG21 - GN20-E3"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x927C
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    Else
                    {
                        Debug = "GOG22 - GN20-S7B"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x927C
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0xBB80
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                }
                Else
                {
                    Debug = "DC"
                    If ((PGID == One))
                    {
                        Debug = "GOG20 - GN20-P0P1"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x4E20, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x9C40
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x4E20, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x4E20
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == 0x02))
                    {
                        Debug = "GOG20 - N18P"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x4E20, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x9C40
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x4E20, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x4E20
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    ElseIf ((PGID == Zero))
                    {
                        Debug = "GOG21 - GN20-E3"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x4E20, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x9C40
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x4E20
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x4E20, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x4E20
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                    Else
                    {
                        Debug = "GOG22 - GN20-S7B"
                        If ((^PCI0.LPC0.EC0.DPOT == Zero))
                        {
                            Debug = "Normal Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x88B8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x9C40
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                        Else
                        {
                            Debug = "Overheating Table"
                            If ((^PCI0.LPC0.EC0.NPST == Zero))
                            {
                                Debug = "Tier 0"
                                SMUF = 0x05
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = 0x61A8
                                ALIB (0x0C, XX11)
                            }
                            Else
                            {
                                Debug = "Tier 1-7"
                                Divide (0x61A8, 0x64, Local0, Local1)
                                If ((^PCI0.LPC0.EC0.NPST == 0x03))
                                {
                                    Local1 *= 0x55
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x04))
                                {
                                    Local1 *= 0x46
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x05))
                                {
                                    Local1 *= 0x37
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST == 0x06))
                                {
                                    Local1 *= 0x28
                                }
                                ElseIf ((^PCI0.LPC0.EC0.NPST >= 0x07))
                                {
                                    Local1 *= 0x28
                                }
                                Else
                                {
                                    Local1 *= 0x64
                                }

                                SMUF = 0x05
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                                SMUF = 0x07
                                SMUD = Local1
                                ALIB (0x0C, XX11)
                            }

                            SMUF = 0x06
                            SMUD = 0x61A8
                            ALIB (0x0C, XX11)
                            SMUF = One
                            SMUD = 0x32
                            ALIB (0x0C, XX11)
                            SMUF = 0x08
                            SMUD = 0x05
                            ALIB (0x0C, XX11)
                        }
                    }
                }
            }
        }

        OperationRegion (XMOS, SystemIO, 0x72, 0x02)
        Field (XMOS, ByteAcc, Lock, Preserve)
        {
            IO72,   8, 
            IO73,   8
        }

        Method (WXMS, 2, NotSerialized)
        {
            IO72 = Arg0
            IO73 = Arg1
        }

        Method (RXMS, 1, NotSerialized)
        {
            IO72 = Arg0
            Return (IO73) /* \_SB_.IO73 */
        }

        Device (GZFD)
        {
            Name (FNQF, Zero)
            Name (TGZF, Zero)
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "GMZN")  // _UID: Unique ID
            Name (_WDG, Buffer (0x0140)
            {
                /* 0000 */  0xE1, 0x54, 0x7B, 0x88, 0xDC, 0xDD, 0x2C, 0x4B,  // .T{...,K
                /* 0008 */  0x8B, 0x88, 0x68, 0xA2, 0x6A, 0x88, 0x35, 0xD0,  // ..h.j.5.
                /* 0010 */  0x41, 0x42, 0x00, 0x01, 0xE2, 0x54, 0x7B, 0x88,  // AB...T{.
                /* 0018 */  0xDC, 0xDD, 0x2C, 0x4B, 0x8B, 0x88, 0x68, 0xA2,  // ..,K..h.
                /* 0020 */  0x6A, 0x88, 0x35, 0xD0, 0x41, 0x43, 0x02, 0x01,  // j.5.AC..
                /* 0028 */  0x0A, 0xCA, 0xF3, 0xB7, 0xDC, 0xAC, 0xD2, 0x42,  // .......B
                /* 0030 */  0x92, 0x17, 0x77, 0xC6, 0xC6, 0x28, 0xFB, 0xD2,  // ..w..(..
                /* 0038 */  0x41, 0x44, 0x00, 0x01, 0xD3, 0x7C, 0xA5, 0x93,  // AD...|..
                /* 0040 */  0xC6, 0xBB, 0xAB, 0x46, 0x95, 0x1D, 0x31, 0xF1,  // ...F..1.
                /* 0048 */  0x7C, 0xC9, 0x68, 0xA0, 0x41, 0x45, 0x01, 0x01,  // |.h.AE..
                /* 0050 */  0xE3, 0x54, 0x7B, 0x88, 0xDC, 0xDD, 0x2C, 0x4B,  // .T{...,K
                /* 0058 */  0x8B, 0x88, 0x68, 0xA2, 0x6A, 0x88, 0x35, 0xD0,  // ..h.j.5.
                /* 0060 */  0x41, 0x41, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // AA..!...
                /* 0068 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
                /* 0070 */  0xC9, 0x06, 0x29, 0x10, 0x44, 0x44, 0x01, 0x00,  // ..).DD..
                /* 0078 */  0x81, 0x24, 0xD4, 0xBF, 0xE3, 0xAE, 0x01, 0x45,  // .$.....E
                /* 0080 */  0xA1, 0x07, 0xAF, 0xB6, 0x84, 0x25, 0xC5, 0xF8,  // .....%..
                /* 0088 */  0xD0, 0x00, 0x01, 0x08, 0x6B, 0x90, 0x62, 0xD0,  // ....k.b.
                /* 0090 */  0xD4, 0x12, 0x10, 0x45, 0x99, 0x9D, 0x48, 0x31,  // ...E..H1
                /* 0098 */  0xEE, 0x80, 0xE9, 0x85, 0xD1, 0x00, 0x01, 0x08,  // ........
                /* 00A0 */  0x81, 0x24, 0xD4, 0xBF, 0xE3, 0xAE, 0x02, 0x45,  // .$.....E
                /* 00A8 */  0xA1, 0x07, 0xAF, 0xB6, 0x84, 0x25, 0xC5, 0xF8,  // .....%..
                /* 00B0 */  0xD2, 0x00, 0x01, 0x08, 0x35, 0xA4, 0x72, 0xBC,  // ....5.r.
                /* 00B8 */  0xC1, 0xE8, 0x75, 0x42, 0xB3, 0xE2, 0xD8, 0xB8,  // ..uB....
                /* 00C0 */  0x07, 0x4A, 0xBA, 0x59, 0xD3, 0x00, 0x01, 0x08,  // .J.Y....
                /* 00C8 */  0xD9, 0xC6, 0xAF, 0x10, 0x8B, 0xEA, 0x90, 0x45,  // .......E
                /* 00D0 */  0xA2, 0xE7, 0x1C, 0xD3, 0xC8, 0x4B, 0xB4, 0xB1,  // .....K..
                /* 00D8 */  0xD4, 0x00, 0x01, 0x08, 0x9E, 0x28, 0x20, 0xD3,  // .....( .
                /* 00E0 */  0xEA, 0x8F, 0xE0, 0x41, 0x86, 0xF9, 0x61, 0x1D,  // ...A..a.
                /* 00E8 */  0x83, 0x15, 0x1B, 0x5F, 0xD5, 0x00, 0x01, 0x08,  // ..._....
                /* 00F0 */  0x9E, 0x28, 0x20, 0xD3, 0xEA, 0x8F, 0xE1, 0x41,  // .( ....A
                /* 00F8 */  0x86, 0xF9, 0x61, 0x1D, 0x83, 0x15, 0x1B, 0x5F,  // ..a...._
                /* 0100 */  0xD6, 0x00, 0x01, 0x08, 0x9E, 0x28, 0x20, 0xD3,  // .....( .
                /* 0108 */  0xEA, 0x8F, 0xE0, 0x41, 0x86, 0xF9, 0x71, 0x1D,  // ...A..q.
                /* 0110 */  0x83, 0x15, 0x1B, 0x5F, 0xD7, 0x00, 0x01, 0x08,  // ..._....
                /* 0118 */  0x9E, 0x28, 0x20, 0xD3, 0xEA, 0x8F, 0xE0, 0x41,  // .( ....A
                /* 0120 */  0x86, 0xF9, 0x81, 0x1D, 0x83, 0x15, 0x1B, 0x5F,  // ......._
                /* 0128 */  0xD8, 0x00, 0x01, 0x08, 0x9E, 0x28, 0x20, 0xD3,  // .....( .
                /* 0130 */  0xEA, 0x8F, 0xE0, 0x41, 0x86, 0xF9, 0x91, 0x1D,  // ...A....
                /* 0138 */  0x83, 0x15, 0x1B, 0x5F, 0xD9, 0x00, 0x01, 0x08   // ..._....
            })
            Name (ECD0, Zero)
            Name (ECD1, Zero)
            Name (COC1, Buffer (0x0190)
            {
                /* 0000 */  0x49, 0x6E, 0x74, 0x65, 0x6C, 0x28, 0x52, 0x29,  // Intel(R)
                /* 0008 */  0x20, 0x43, 0x6F, 0x72, 0x65, 0x28, 0x54, 0x4D,  //  Core(TM
                /* 0010 */  0x29, 0x20, 0x69, 0x37, 0x2D, 0x36, 0x38, 0x32,  // ) i7-682
                /* 0018 */  0x30, 0x48, 0x4B, 0x20, 0x43, 0x50, 0x55, 0x20,  // 0HK CPU 
                /* 0020 */  0x24, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // $.......
                /* 0028 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0038 */  0x00, 0xD0, 0xF4, 0x3F, 0x01, 0x00, 0x00, 0x00,  // ...?....
                /* 0040 */  0x09, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 0048 */  0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x80, 0x44, 0x40, 0x05, 0x00, 0x00, 0x00,  // ..D@....
                /* 0060 */  0x05, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 0068 */  0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0078 */  0x00, 0x80, 0x44, 0x40, 0x06, 0x00, 0x00, 0x00,  // ..D@....
                /* 0080 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0088 */  0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0098 */  0x00, 0x80, 0x43, 0x40, 0x07, 0x00, 0x00, 0x00,  // ..C@....
                /* 00A0 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A8 */  0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  //  .......
                /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00B8 */  0x00, 0x00, 0x43, 0x40, 0x08, 0x00, 0x00, 0x00,  // ..C@....
                /* 00C0 */  0x02, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 00C8 */  0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ".......
                /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00D8 */  0x80, 0x25, 0x59, 0x40, 0x02, 0x00, 0x00, 0x00,  // .%Y@....
                /* 00E0 */  0x08, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 00E8 */  0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // /.......
                /* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00F8 */  0x00, 0x40, 0x55, 0x40, 0x03, 0x00, 0x00, 0x00,  // .@U@....
                /* 0100 */  0x07, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 0108 */  0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // 0.......
                /* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0118 */  0x00, 0x40, 0x55, 0x40, 0x04, 0x00, 0x00, 0x00,  // .@U@....
                /* 0120 */  0x06, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 0128 */  0x4C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // L.......
                /* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0138 */  0x00, 0x80, 0x44, 0x40, 0x09, 0x00, 0x00, 0x00,  // ..D@....
                /* 0140 */  0x01, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 0148 */  0x49, 0x6E, 0x74, 0x65, 0x6C, 0x28, 0x52, 0x29,  // Intel(R)
                /* 0150 */  0x20, 0x43, 0x6F, 0x72, 0x65, 0x28, 0x54, 0x4D,  //  Core(TM
                /* 0158 */  0x29, 0x20, 0x69, 0x37, 0x2D, 0x36, 0x37, 0x30,  // ) i7-670
                /* 0160 */  0x30, 0x48, 0x51, 0x20, 0x43, 0x50, 0x55, 0x20,  // 0HQ CPU 
                /* 0168 */  0x23, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // #.......
                /* 0170 */  0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // /.......
                /* 0178 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0180 */  0x00, 0xC0, 0x52, 0x40, 0x03, 0x00, 0x00, 0x00,  // ..R@....
                /* 0188 */  0x06, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00   // ........
            })
            Name (COC2, Buffer (0x0190)
            {
                /* 0000 */  0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // 0.......
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x40, 0x50, 0x40, 0x04, 0x00, 0x00, 0x00,  // .@P@....
                /* 0018 */  0x05, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0078 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0080 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0100 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0118 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0120 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0128 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0138 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0140 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0148 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0150 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0160 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0168 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0170 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0178 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0180 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
            })
            Name (COD0, Buffer (0x24)
            {
                /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x3F,  // ...?...?
                /* 0010 */  0x5C, 0x8F, 0xC2, 0x3F, 0x0A, 0xD7, 0x23, 0x3C,  // \..?..#<
                /* 0018 */  0x01, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD1, Buffer (0x24)
            {
                /* 0000 */  0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x42,  // t.....LB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x07, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD2, Buffer (0x24)
            {
                /* 0000 */  0x75, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x42,  // u.....LB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x08, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD3, Buffer (0x24)
            {
                /* 0000 */  0x76, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x42,  // v.....LB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD4, Buffer (0x24)
            {
                /* 0000 */  0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x42,  // w.....LB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x0A, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD5, Buffer (0x24)
            {
                /* 0000 */  0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x42,  // x.....TB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x0B, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD6, /**** Is ResourceTemplate, but EndTag not at buffer end ****/ Buffer (0x24)
            {
                /* 0000 */  0x79, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x42,  // y.....LB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x0C, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD7, Buffer (0x24)
            {
                /* 0000 */  0x7A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x42,  // z.....TB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD8, Buffer (0x24)
            {
                /* 0000 */  0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x42,  // {.....LB
                /* 0008 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x30, 0x42,  // ..TB..0B
                /* 0010 */  0x00, 0x00, 0x54, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..TB...?
                /* 0018 */  0x0E, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (COD9, Buffer (0x24)
            {
                /* 0000 */  0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ".......
                /* 0008 */  0x0A, 0xD7, 0x23, 0x3C, 0x0A, 0xD7, 0x23, 0xBE,  // ..#<..#.
                /* 0010 */  0x0A, 0xD7, 0x23, 0x3E, 0x0A, 0xD7, 0x23, 0x3C,  // ..#>..#<
                /* 0018 */  0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (CODA, Buffer (0x24)
            {
                /* 0000 */  0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x43,  // f......C
                /* 0008 */  0x00, 0x00, 0x0A, 0x43, 0x00, 0x00, 0x80, 0x3F,  // ...C...?
                /* 0010 */  0x00, 0x00, 0x7F, 0x43, 0x00, 0x00, 0x00, 0x3F,  // ...C...?
                /* 0018 */  0x05, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (CODB, Buffer (0x24)
            {
                /* 0000 */  0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // r.......
                /* 0008 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0010 */  0x00, 0x00, 0xF8, 0x41, 0x00, 0x00, 0x80, 0x3F,  // ...A...?
                /* 0018 */  0x12, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (CODC, Buffer (0x24)
            {
                /* 0000 */  0x4C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x42,  // L.....<B
                /* 0008 */  0x00, 0x00, 0x28, 0x42, 0x00, 0x00, 0x00, 0x41,  // ..(B...A
                /* 0010 */  0x00, 0x00, 0x3C, 0x42, 0x00, 0x00, 0x80, 0x3F,  // ..<B...?
                /* 0018 */  0x11, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (CODD, Buffer (0x24)
            {
                /* 0000 */  0x4D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // M.......
                /* 0008 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x3F,  // ...?...?
                /* 0010 */  0x5C, 0x8F, 0xC2, 0x3F, 0x0A, 0xD7, 0x23, 0x3C,  // \..?..#<
                /* 0018 */  0x02, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (CODE, Buffer (0x24)
            {
                /* 0000 */  0x4F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // O.......
                /* 0008 */  0x0A, 0xD7, 0x23, 0x3C, 0x0A, 0xD7, 0x23, 0xBE,  // ..#<..#.
                /* 0010 */  0x0A, 0xD7, 0x23, 0x3E, 0x0A, 0xD7, 0x23, 0x3C,  // ..#>..#<
                /* 0018 */  0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (CODF, Buffer (0x24)
            {
                /* 0000 */  0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x43,  // j......C
                /* 0008 */  0x00, 0x00, 0x0A, 0x43, 0x00, 0x00, 0x80, 0x3F,  // ...C...?
                /* 0010 */  0x00, 0x00, 0x7F, 0x43, 0x00, 0x00, 0x00, 0x3F,  // ...C...?
                /* 0018 */  0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0xC8, 0x00, 0x00, 0x00                           // ....
            })
            Name (GOC0, Buffer (0x30)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x42,  // .......B
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x43,  // .......C
                /* 0018 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0020 */  0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (GOC1, Buffer (0x30)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x43,  // ......HC
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x43,  // .......C
                /* 0018 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0020 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (GOC2, Buffer (0x30)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x42,  // .......B
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x43,  // .......C
                /* 0018 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0020 */  0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (GOC3, Buffer (0x30)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x43,  // ......HC
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x43,  // .......C
                /* 0018 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0020 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (GOC4, Buffer (0x30)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0020 */  0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (GOC5, Buffer (0x30)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00,  // ...?....
                /* 0020 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00                           // ....
            })
            Name (WTL1, Package (0x02)
            {
                "Hero.exe", 
                "2"
            })
            Method (WCAB, 1, NotSerialized)
            {
                If ((Arg0 == Zero)){}
                Else
                {
                }
            }

            Method (WCAC, 1, NotSerialized)
            {
                If ((Arg0 == Zero)){}
                Else
                {
                }
            }

            Method (WCAD, 1, NotSerialized)
            {
                If ((Arg0 == Zero)){}
                Else
                {
                }
            }

            Method (WQAB, 1, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    Return (COD0) /* \_SB_.GZFD.COD0 */
                }
            }

            Method (WQAC, 1, NotSerialized)
            {
                Local0 = RXMS (0x78)
                If ((Arg0 == Zero))
                {
                    If ((Local0 == One))
                    {
                        Return (GOC2) /* \_SB_.GZFD.GOC2 */
                    }
                    ElseIf ((Local0 == 0x02))
                    {
                        Return (GOC4) /* \_SB_.GZFD.GOC4 */
                    }
                    Else
                    {
                        Return (GOC0) /* \_SB_.GZFD.GOC0 */
                    }
                }

                If ((Arg0 == One))
                {
                    If ((Local0 == One))
                    {
                        Return (GOC3) /* \_SB_.GZFD.GOC3 */
                    }
                    ElseIf ((Local0 == 0x02))
                    {
                        Return (GOC5) /* \_SB_.GZFD.GOC5 */
                    }
                    Else
                    {
                        Return (GOC1) /* \_SB_.GZFD.GOC1 */
                    }
                }
            }

            Method (WQAD, 1, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    Return (COD0) /* \_SB_.GZFD.COD0 */
                }
            }

            Method (WMAA, 3, NotSerialized)
            {
                If ((Arg1 == One))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x02))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x03))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x04))
                {
                    Local0 = RXMS (0x78)
                    If ((Arg0 == Zero))
                    {
                        If ((Local0 == One))
                        {
                            Return (0x02)
                        }
                        ElseIf ((Local0 == 0x02))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x02)
                        }
                    }
                }

                If ((Arg1 == 0x05))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x06))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x07))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x08))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x09))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x0A))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x0B))
                {
                    Return (0x0B)
                }

                If ((Arg1 == 0x0C))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x0D))
                {
                    If ((ToInteger (Arg2) == One))
                    {
                        ^^PCI0.LPC0.EC0.GZ13 = One
                    }
                    ElseIf ((ToInteger (Arg2) == Zero))
                    {
                        ^^PCI0.LPC0.EC0.GZ13 = Zero
                    }

                    Return (^^PCI0.LPC0.EC0.GZ13) /* \_SB_.PCI0.LPC0.EC0_.GZ13 */
                }

                If ((Arg1 == 0x0E))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x0F))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x10))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x11))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x12))
                {
                    Return (^^PCI0.LPC0.EC0.CTMP) /* \_SB_.PCI0.LPC0.EC0_.CTMP */
                }

                If ((Arg1 == 0x13))
                {
                    Return (^^PCI0.LPC0.EC0.SKTC) /* \_SB_.PCI0.LPC0.EC0_.SKTC */
                }

                If ((Arg1 == 0x14))
                {
                    Return (^^PCI0.LPC0.EC0.GZ13) /* \_SB_.PCI0.LPC0.EC0_.GZ13 */
                }

                If ((Arg1 == 0x15))
                {
                    Return (One)
                }

                If ((Arg1 == 0x16))
                {
                    If ((ToInteger (Arg2) == One))
                    {
                        Debug = "SetWinKeyStatus 1"
                        ^^PCI0.LPC0.EC0.GZ22 = One
                    }
                    ElseIf ((ToInteger (Arg2) == Zero))
                    {
                        Debug = "SetWinKeyStatus 0"
                        ^^PCI0.LPC0.EC0.GZ22 = Zero
                    }

                    Notify (GZFD, 0xD4) // Hardware-Specific
                    Return (^^PCI0.LPC0.EC0.GZ22) /* \_SB_.PCI0.LPC0.EC0_.GZ22 */
                }

                If ((Arg1 == 0x17))
                {
                    Debug = "GetWinKeyStatus"
                    Return (^^PCI0.LPC0.EC0.GZ22) /* \_SB_.PCI0.LPC0.EC0_.GZ22 */
                }

                If ((Arg1 == 0x18))
                {
                    Return (One)
                }

                If ((Arg1 == 0x19))
                {
                    If ((ToInteger (Arg2) == One))
                    {
                        Debug = "SetTPStatus 1"
                        ^^PCI0.LPC0.EC0.GZ25 = One
                    }
                    ElseIf ((ToInteger (Arg2) == Zero))
                    {
                        Debug = "SetTPStatus 0"
                        ^^PCI0.LPC0.EC0.GZ25 = Zero
                    }

                    Notify (GZFD, 0xD4) // Hardware-Specific
                    Return (^^PCI0.LPC0.EC0.GZ25) /* \_SB_.PCI0.LPC0.EC0_.GZ25 */
                }

                If ((Arg1 == 0x1A))
                {
                    Debug = "GetTPStatus"
                    Return (^^PCI0.LPC0.EC0.GZ25) /* \_SB_.PCI0.LPC0.EC0_.GZ25 */
                }

                If ((Arg1 == 0x1B))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x1C))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x1D))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x1E))
                {
                    Return (0xF050)
                }

                If ((Arg1 == 0x1F))
                {
                    Local0 = 0x0A6B0A6B
                    Return (Local0)
                }

                If ((Arg1 == 0x20))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x21))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x22))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x23))
                {
                    If (^^PCI0.LPC0.EC0.GZ35)
                    {
                        Return (0x06)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                If ((Arg1 == 0x24))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x25))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x26))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x27))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x28))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x29))
                {
                    Local0 = Zero
                    Return (Local0)
                }

                If ((Arg1 == 0x2A)){}
                If ((Arg1 == 0x2B))
                {
                    Return (0x02)
                }

                If ((Arg1 == 0x2C))
                {
                    Debug = "SetFanMode"
                    If (((^^PCI0.LPC0.EC0.ADPT == One) && (^^PCI0.LPC0.EC0.ADPS == Zero)))
                    {
                        If ((ToInteger (Arg2) == One))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = 0x02
                            WXMS (0x76, 0x02)
                            SSFM (Zero, 0x02)
                            Debug = "AC_Quiet"
                        }
                        ElseIf ((ToInteger (Arg2) == 0x02))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = Zero
                            WXMS (0x76, Zero)
                            SSFM (Zero, Zero)
                            Debug = "AC_Balance"
                        }
                        ElseIf ((ToInteger (Arg2) == 0x03))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = One
                            WXMS (0x76, One)
                            SSFM (Zero, One)
                            Debug = "AC_Performance"
                        }
                    }
                    Else
                    {
                        If ((ToInteger (Arg2) == One))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = 0x02
                            WXMS (0x76, 0x02)
                            WXMS (0x77, 0x02)
                            SSFM (Zero, 0x02)
                            Debug = "DC_Quiet"
                        }
                        ElseIf ((ToInteger (Arg2) == 0x02))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = Zero
                            WXMS (0x76, Zero)
                            WXMS (0x77, Zero)
                            SSFM (Zero, Zero)
                            Debug = "DC_Balance"
                        }
                        ElseIf ((ToInteger (Arg2) == 0x03))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = Zero
                            WXMS (0x76, One)
                            WXMS (0x77, Zero)
                            SSFM (Zero, Zero)
                            Debug = "DC_Performance"
                        }

                        FNQF = One
                    }

                    Notify (GZFD, 0xD9) // Hardware-Specific
                    SSFM (One, Zero)
                    Return (RXMS (0x76))
                }

                If ((Arg1 == 0x2D))
                {
                    If ((RXMS (0x76) == One))
                    {
                        Debug = "GetSmartFanMode 1 - Performance mode"
                        Local0 = 0x03
                    }
                    ElseIf ((RXMS (0x76) == 0x02))
                    {
                        Debug = "GetSmartFanMode 2 - Quiet mode"
                        Local0 = One
                    }
                    Else
                    {
                        Debug = "GetSmartFanMode 0 - Balance Mode"
                        Local0 = 0x02
                    }

                    If (((^^PCI0.LPC0.EC0.ADPT == One) && (^^PCI0.LPC0.EC0.ADPS == Zero)))
                    {
                        If ((ToInteger (Local0) == One))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = 0x02
                            SSFM (Zero, 0x02)
                            Debug = "AC_Quiet"
                        }
                        ElseIf ((ToInteger (Local0) == 0x03))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = One
                            SSFM (Zero, One)
                            Debug = "AC_Performance"
                        }
                        Else
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = Zero
                            WXMS (0x76, Zero)
                            SSFM (Zero, Zero)
                            Debug = "AC_Balance"
                        }
                    }
                    Else
                    {
                        If ((ToInteger (Local0) == One))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = 0x02
                            WXMS (0x77, 0x02)
                            SSFM (Zero, 0x02)
                            Debug = "DC_Quiet"
                        }
                        ElseIf ((ToInteger (Local0) == 0x03))
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = Zero
                            WXMS (0x77, Zero)
                            SSFM (Zero, Zero)
                            Debug = "DC_Performance"
                        }
                        Else
                        {
                            ^^PCI0.LPC0.EC0.GZ44 = Zero
                            WXMS (0x76, Zero)
                            WXMS (0x77, Zero)
                            SSFM (Zero, Zero)
                            Debug = "DC_Balance"
                        }

                        FNQF = One
                    }

                    SSFM (One, Zero)
                    If ((RXMS (0x7C) == One))
                    {
                        M010 (0x82, One)
                    }
                    Else
                    {
                        M010 (0x82, Zero)
                    }

                    Return (Local0)
                }

                If ((Arg1 == 0x2E))
                {
                    If (Ones)
                    {
                        Local0 = One
                    }
                    ElseIf (Zero)
                    {
                        Local0 = 0x02
                    }

                    Return (Local0)
                }

                If ((Arg1 == 0x2F))
                {
                    If ((^^PCI0.LPC0.EC0.ADPT == One))
                    {
                        Local0 = One
                    }

                    If ((^^PCI0.LPC0.EC0.ADPT == Zero))
                    {
                        Local0 = 0x02
                    }

                    Return (Local0)
                }

                If ((Arg1 == 0x30))
                {
                    Return (0x64)
                }

                If ((Arg1 == 0x31))
                {
                    Return (PLOD) /* \PLOD */
                }

                If ((Arg1 == 0x32))
                {
                    Return (M009) /* External reference */
                    0x82
                }

                If ((Arg1 == 0x33))
                {
                    If ((ToInteger (Arg2) == One))
                    {
                        M010 (0x82, One)
                        WXMS (0x7C, One)
                    }
                    ElseIf ((ToInteger (Arg2) == Zero))
                    {
                        M010 (0x82, Zero)
                        WXMS (0x7C, Zero)
                    }

                    Return (M009) /* External reference */
                    0x82
                }

                If ((Arg1 == 0x34))
                {
                    If ((ToInteger (Arg2) == One))
                    {
                        Debug = "SetLightControlOwner 1 - APP"
                        ^^PCI0.LPC0.EC0.GZ52 = One
                    }
                    Else
                    {
                        Debug = "SetLightControlOwner 0 - ITE"
                        ^^PCI0.LPC0.EC0.GZ52 = Zero
                    }
                }

                If ((Arg1 == 0x35))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x36))
                {
                    Debug = "IsRestoreOCValue"
                    If (((^^PCI0.LPC0.EC0.ECRS == One) || (RXMS (0x72) == One)))
                    {
                        TGZF = One
                    }
                    Else
                    {
                        TGZF = Zero
                    }

                    Local0 = TGZF /* \_SB_.GZFD.TGZF */
                    If ((ToInteger (Arg2) == One))
                    {
                        TGZF = Zero
                        ^^PCI0.LPC0.EC0.ECRS = Zero
                        WXMS (0x72, Zero)
                    }

                    ADBG (Concatenate ("TGZF=", ToHexString (Local0)))
                    Return (Local0)
                }

                If ((Arg1 == 0x37))
                {
                    Debug = "GetThermalMode"
                    If ((^^PCI0.LPC0.EC0.GZ44 == Zero))
                    {
                        Debug = "Balance"
                        Local0 = 0x02
                    }
                    ElseIf ((^^PCI0.LPC0.EC0.GZ44 == One))
                    {
                        Debug = "Performance"
                        Local0 = 0x03
                    }
                    ElseIf ((^^PCI0.LPC0.EC0.GZ44 == 0x02))
                    {
                        Debug = "Quiet"
                        Local0 = One
                    }

                    Return (Local0)
                }

                If ((Arg1 == 0x38))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x39))
                {
                    If ((ToInteger (Arg2) == Zero))
                    {
                        Debug = "SetIntelligentSubMode - Balance mode"
                    }
                    ElseIf ((ToInteger (Arg2) == One))
                    {
                        Debug = "SetIntelligentSubMode - Performance mode"
                    }
                }

                If ((Arg1 == 0x3A))
                {
                    Debug = "GetIntelligentSubMode"
                }

                If ((Arg1 == 0x3B))
                {
                    Return (Zero)
                }

                If ((Arg1 == 0x3C))
                {
                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }
            }

            Method (WMAE, 3, NotSerialized)
            {
                Return (WTL1) /* \_SB_.GZFD.WTL1 */
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                If ((Arg0 == 0xD0))
                {
                    Return (Zero)
                }

                If ((Arg0 == 0xD2))
                {
                    Local0 = ^^PCI0.LPC0.EC0.SKTC /* \_SB_.PCI0.LPC0.EC0_.SKTC */
                    Local0 &= 0xFF
                    Return (Local0)
                }

                If ((Arg0 == 0xD1))
                {
                    Return (Zero)
                }

                If ((Arg0 == 0xD3))
                {
                    Return (^^PCI0.LPC0.EC0.GZ13) /* \_SB_.PCI0.LPC0.EC0_.GZ13 */
                }

                If ((Arg0 == 0xD4))
                {
                    Local0 = Zero
                    If ((^^PCI0.LPC0.EC0.GZ22 == One))
                    {
                        Local0 |= One
                    }

                    If ((^^PCI0.LPC0.EC0.GZ25 == One))
                    {
                        Local0 |= 0x02
                    }

                    Return (Local0)
                }

                If ((Arg0 == 0xD5))
                {
                    Name (SFM1, Package (0x02)
                    {
                        One, 
                        0x02
                    })
                    Name (SFM2, Package (0x02)
                    {
                        0x02, 
                        0x02
                    })
                    Name (SFM3, Package (0x02)
                    {
                        0x03, 
                        0x02
                    })
                    If ((^^PCI0.LPC0.EC0.GZ44 == Zero))
                    {
                        Return (SFM2) /* \_SB_.GZFD._WED.SFM2 */
                    }
                    ElseIf ((^^PCI0.LPC0.EC0.GZ44 == One))
                    {
                        Return (SFM3) /* \_SB_.GZFD._WED.SFM3 */
                    }
                    ElseIf ((^^PCI0.LPC0.EC0.GZ44 == 0x02))
                    {
                        Return (SFM1) /* \_SB_.GZFD._WED.SFM1 */
                    }
                }

                If ((Arg0 == 0xD6))
                {
                    If (Ones)
                    {
                        Local0 = One
                    }
                    ElseIf (Zero)
                    {
                        Local0 = 0x02
                    }

                    Return (Local0)
                }

                If ((Arg0 == 0xD7))
                {
                    If ((^^PCI0.LPC0.EC0.ADPT == One))
                    {
                        Local0 = One
                        If ((FNQF == One))
                        {
                            FNQF = Zero
                            If (NVRF)
                            {
                                Notify (^^PCI0.GPP0.PEGP, 0xC0) // Hardware-Specific
                            }

                            Debug = "PowerChargeModeEvent_Update"
                        }

                        Debug = "PowerChargeModeEvent_AC"
                    }

                    If ((^^PCI0.LPC0.EC0.ADPT == Zero))
                    {
                        Local0 = 0x02
                        Debug = "PowerChargeModeEvent_DC"
                    }

                    Return (Local0)
                }

                If ((Arg0 == 0xD8))
                {
                    Local0 = Zero
                    If ((^^PCI0.LPC0.EC0.GZ52 == Zero))
                    {
                        Local0 = One
                    }

                    Return (Local0)
                }

                If ((Arg0 == 0xD9))
                {
                    If ((^^PCI0.LPC0.EC0.GZ44 == Zero))
                    {
                        Local0 = 0x02
                    }
                    ElseIf ((^^PCI0.LPC0.EC0.GZ44 == One))
                    {
                        Local0 = 0x03
                    }
                    ElseIf ((^^PCI0.LPC0.EC0.GZ44 == 0x02))
                    {
                        Local0 = One
                    }

                    Return (Local0)
                }

                Return (Zero)
            }

            Name (WQDD, Buffer (0x1CD3)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0xC3, 0x1C, 0x00, 0x00, 0x2A, 0xD3, 0x00, 0x00,  // ....*...
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0x98, 0xB1, 0xA6, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
                /* 0020 */  0x10, 0x1B, 0x10, 0x0A, 0xE9, 0x82, 0x42, 0x04,  // ......B.
                /* 0028 */  0x8A, 0x41, 0xA4, 0x58, 0x30, 0x28, 0x0D, 0x20,  // .A.X0(. 
                /* 0030 */  0x92, 0x03, 0x21, 0x26, 0x2A, 0x40, 0x04, 0x84,  // ..!&*@..
                /* 0038 */  0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA,  // ...).$..
                /* 0040 */  0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42,  // ..(..%.B
                /* 0048 */  0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61,  // .....[.a
                /* 0050 */  0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92,  // ........
                /* 0058 */  0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1,  // J.....!.
                /* 0060 */  0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2,  // ....-@;.
                /* 0068 */  0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x22,  // $...#.."
                /* 0070 */  0xB2, 0xD1, 0x38, 0x34, 0x76, 0x18, 0x96, 0x09,  // ..84v...
                /* 0078 */  0xA6, 0x41, 0x1C, 0x46, 0xD9, 0xC8, 0x22, 0xF0,  // .A.F..".
                /* 0080 */  0x84, 0x3A, 0x15, 0x20, 0x57, 0x80, 0x30, 0x01,  // .:. W.0.
                /* 0088 */  0xE2, 0x51, 0x85, 0xD1, 0x1C, 0x14, 0x11, 0x0E,  // .Q......
                /* 0090 */  0x8D, 0x12, 0x33, 0x26, 0x02, 0xDB, 0x39, 0xB6,  // ..3&..9.
                /* 0098 */  0x46, 0x71, 0x1A, 0xE1, 0x4A, 0xC7, 0xD0, 0x08,  // Fq..J...
                /* 00A0 */  0x8E, 0x2B, 0x18, 0xD3, 0x8C, 0x23, 0x98, 0x10,  // .+...#..
                /* 00A8 */  0xB1, 0xB8, 0x20, 0x0C, 0x41, 0xC5, 0xE8, 0x70,  // .. .A..p
                /* 00B0 */  0x44, 0xB2, 0x0A, 0x22, 0x9F, 0x28, 0xC2, 0x88,  // D..".(..
                /* 00B8 */  0x7D, 0x32, 0xF1, 0xCF, 0xD1, 0xC8, 0x51, 0x8F,  // }2....Q.
                /* 00C0 */  0xCD, 0x50, 0x27, 0x14, 0xF9, 0x2C, 0xE2, 0x24,  // .P'..,.$
                /* 00C8 */  0x88, 0x72, 0x30, 0x18, 0x19, 0x10, 0xF2, 0x2C,  // .r0....,
                /* 00D0 */  0xC0, 0xFA, 0x28, 0x09, 0x81, 0xDD, 0x0B, 0x50,  // ..(....P
                /* 00D8 */  0x28, 0xC0, 0x9B, 0x00, 0x8D, 0x02, 0x9C, 0x0D,  // (.......
                /* 00E0 */  0x41, 0x06, 0x27, 0x26, 0x88, 0xB6, 0x20, 0x04,  // A.'&.. .
                /* 00E8 */  0x73, 0x3C, 0x21, 0xA2, 0x1C, 0x5D, 0x65, 0x28,  // s<!..]e(
                /* 00F0 */  0x82, 0x88, 0x72, 0x7A, 0x31, 0x1A, 0x43, 0x15,  // ..rz1.C.
                /* 00F8 */  0x4A, 0x88, 0x08, 0xE1, 0x6A, 0x83, 0x20, 0x50,  // J...j. P
                /* 0100 */  0xC5, 0xC1, 0x6B, 0x02, 0x21, 0x6D, 0x7F, 0x10,  // ..k.!m..
                /* 0108 */  0x44, 0x90, 0x8A, 0xA3, 0x01, 0x8B, 0x34, 0x1A,  // D.....4.
                /* 0110 */  0xD4, 0x39, 0x20, 0xC1, 0x73, 0x81, 0xCF, 0x04,  // .9 .s...
                /* 0118 */  0x07, 0x78, 0x52, 0x1E, 0x5A, 0x90, 0x73, 0x3D,  // .xR.Z.s=
                /* 0120 */  0xB3, 0x3A, 0x27, 0x47, 0x09, 0x3C, 0x34, 0x3B,  // .:'G.<4;
                /* 0128 */  0x38, 0x21, 0xA0, 0xFF, 0xFF, 0x03, 0xB0, 0x6B,  // 8!.....k
                /* 0130 */  0x40, 0x5D, 0x0D, 0x1E, 0x0C, 0xD8, 0x28, 0xC3,  // @]....(.
                /* 0138 */  0x61, 0x86, 0xE8, 0x99, 0x86, 0x3B, 0x81, 0x43,  // a....;.C
                /* 0140 */  0x64, 0x80, 0x9E, 0xDF, 0x33, 0x01, 0x76, 0x62,  // d...3.vb
                /* 0148 */  0x27, 0xF3, 0x40, 0x50, 0xAA, 0x00, 0xB3, 0x63,  // '.@P...c
                /* 0150 */  0x97, 0x45, 0x20, 0x8D, 0xC7, 0x27, 0x01, 0xCF,  // .E ..'..
                /* 0158 */  0xE7, 0x84, 0x13, 0x58, 0xFE, 0x20, 0x50, 0x23,  // ...X. P#
                /* 0160 */  0x33, 0xB4, 0xC7, 0x7B, 0x5A, 0xCF, 0x02, 0x3E,  // 3..{Z..>
                /* 0168 */  0x27, 0x1C, 0x16, 0x13, 0x0B, 0x21, 0x05, 0xC3,  // '....!..
                /* 0170 */  0xF4, 0x78, 0x40, 0xAF, 0xF8, 0x78, 0x20, 0x84,  // .x@..x .
                /* 0178 */  0xB7, 0x06, 0xCF, 0xD7, 0x04, 0x23, 0x43, 0xC8,  // .....#C.
                /* 0180 */  0xC9, 0x78, 0xD0, 0xB8, 0x8F, 0x05, 0xE1, 0x22,  // .x....."
                /* 0188 */  0x3E, 0x17, 0xF0, 0x80, 0x10, 0x92, 0x00, 0x21,  // >......!
                /* 0190 */  0x51, 0xE3, 0xA6, 0xC7, 0x0A, 0x7E, 0xA2, 0x60,  // Q....~.`
                /* 0198 */  0xA7, 0x81, 0x53, 0x78, 0x06, 0xF0, 0x50, 0xE2,  // ..Sx..P.
                /* 01A0 */  0xFA, 0xE0, 0xE1, 0x91, 0xC1, 0x17, 0x78, 0x9C,  // ......x.
                /* 01A8 */  0x00, 0xCD, 0x29, 0x82, 0x01, 0x9D, 0x13, 0x43,  // ..)....C
                /* 01B0 */  0x39, 0x28, 0xEB, 0x02, 0xD3, 0x48, 0xE1, 0xDF,  // 9(...H..
                /* 01B8 */  0x22, 0x8C, 0x1C, 0xFC, 0x19, 0xE2, 0x9D, 0x21,  // "......!
                /* 01C0 */  0x81, 0xC3, 0x8F, 0x14, 0x7D, 0x4E, 0xF0, 0x29,  // ....}N.)
                /* 01C8 */  0x83, 0xCD, 0x2A, 0xEC, 0x31, 0x47, 0xAD, 0xF5,  // ..*.1G..
                /* 01D0 */  0xEA, 0x41, 0x60, 0x9E, 0x05, 0x58, 0xC8, 0xC1,  // .A`..X..
                /* 01D8 */  0xA2, 0xFF, 0xFF, 0x83, 0x85, 0x7B, 0x2A, 0x00,  // .....{*.
                /* 01E0 */  0x87, 0xC8, 0xA3, 0x08, 0xC8, 0x46, 0xC5, 0x67,  // .....F.g
                /* 01E8 */  0xF1, 0xBC, 0x70, 0x56, 0x7C, 0xB6, 0x1E, 0x2E,  // ..pV|...
                /* 01F0 */  0x18, 0x03, 0x9F, 0x13, 0xA0, 0x9C, 0x02, 0x3C,  // .......<
                /* 01F8 */  0x57, 0x5C, 0xBC, 0xB1, 0x82, 0x0A, 0xD0, 0x63,  // W\.....c
                /* 0200 */  0x85, 0x2F, 0xEF, 0x9C, 0x00, 0xB2, 0x29, 0x61,  // ./....)a
                /* 0208 */  0x8E, 0x09, 0xE0, 0x0C, 0x3D, 0x50, 0xF4, 0xF0,  // ....=P..
                /* 0210 */  0x0C, 0x1C, 0xD2, 0x87, 0x04, 0xEC, 0x01, 0x03,  // ........
                /* 0218 */  0x5C, 0xA0, 0x1E, 0x29, 0xFE, 0xFF, 0x7F, 0xC0,  // \..)....
                /* 0220 */  0x00, 0xEF, 0x98, 0xD8, 0x4C, 0xF1, 0x43, 0x05,  // ....L.C.
                /* 0228 */  0x1E, 0xA3, 0x78, 0x46, 0x3A, 0x54, 0x30, 0x5B,  // ..xF:T0[
                /* 0230 */  0x18, 0x2A, 0x90, 0x19, 0x93, 0x87, 0x0A, 0x0C,  // .*......
                /* 0238 */  0x82, 0x0F, 0x15, 0x3D, 0x1A, 0xDF, 0xAE, 0xDE,  // ...=....
                /* 0240 */  0xB0, 0xF8, 0x58, 0xB1, 0x11, 0xC7, 0x0A, 0xAA,  // ..X.....
                /* 0248 */  0x53, 0x99, 0xC7, 0x0A, 0x1F, 0xF9, 0x58, 0x61,  // S.....Xa
                /* 0250 */  0xFE, 0xFF, 0xC7, 0x8A, 0x1B, 0x14, 0x66, 0xB0,  // ......f.
                /* 0258 */  0xC0, 0x20, 0xF6, 0x31, 0x01, 0xCA, 0xB1, 0xC3,  // . .1....
                /* 0260 */  0x10, 0x67, 0xF3, 0xAA, 0xC6, 0x2E, 0x44, 0x6C,  // .g....Dl
                /* 0268 */  0xAC, 0xE0, 0xF2, 0x30, 0x56, 0xA0, 0x72, 0x32,  // ...0V.r2
                /* 0270 */  0x61, 0x73, 0xC2, 0x5C, 0x88, 0x30, 0x27, 0x22,  // as.\.0'"
                /* 0278 */  0x60, 0x30, 0x1C, 0x1F, 0xC7, 0xCE, 0x15, 0x0E,  // `0......
                /* 0280 */  0xC1, 0x98, 0x83, 0x05, 0xD5, 0x88, 0x3C, 0x58,  // ......<X
                /* 0288 */  0xF8, 0x67, 0xBE, 0x83, 0x05, 0xCB, 0xA0, 0x0C,  // .g......
                /* 0290 */  0xF1, 0x1A, 0x77, 0xB8, 0xF8, 0xFF, 0xFF, 0x70,  // ..w....p
                /* 0298 */  0xC1, 0x1D, 0xFD, 0xA4, 0x00, 0xE5, 0x40, 0xE7,  // ......@.
                /* 02A0 */  0x7B, 0x1F, 0xBB, 0x28, 0xB1, 0xD1, 0x82, 0xCF,  // {..(....
                /* 02A8 */  0xC4, 0x68, 0x81, 0x0A, 0x98, 0x27, 0x14, 0xFD,  // .h...'..
                /* 02B0 */  0x39, 0xEF, 0x55, 0xCC, 0x58, 0x8F, 0x7C, 0x1E,  // 9.U.X.|.
                /* 02B8 */  0xAC, 0x8F, 0x37, 0x86, 0x89, 0xFC, 0x58, 0x04,  // ..7...X.
                /* 02C0 */  0xCE, 0xA3, 0x64, 0x60, 0xEC, 0x70, 0xED, 0x57,  // ..d`.p.W
                /* 02C8 */  0x00, 0x42, 0xF0, 0xB3, 0x7A, 0xCC, 0x7B, 0x01,  // .B..z.{.
                /* 02D0 */  0x89, 0x70, 0x60, 0x46, 0x7F, 0x18, 0xF0, 0x09,  // .p`F....
                /* 02D8 */  0x24, 0x44, 0xB4, 0x1E, 0xC1, 0x34, 0x89, 0x48,  // $D...4.H
                /* 02E0 */  0xD5, 0x5E, 0x08, 0x08, 0x48, 0x58, 0x1F, 0x23,  // .^..HX.#
                /* 02E8 */  0x0D, 0xF2, 0x4C, 0x60, 0x8C, 0x33, 0x0B, 0x78,  // ..L`.3.x
                /* 02F0 */  0x30, 0x21, 0x9E, 0xC1, 0x60, 0x8C, 0x83, 0x63,  // 0!..`..c
                /* 02F8 */  0x9F, 0x00, 0x1B, 0x47, 0xF0, 0xC7, 0x47, 0x0F,  // ...G..G.
                /* 0300 */  0xCB, 0xE7, 0x4E, 0x23, 0x1C, 0xD6, 0x41, 0x3D,  // ..N#..A=
                /* 0308 */  0x22, 0xF8, 0x1A, 0x86, 0x39, 0x25, 0xF2, 0x83,  // "...9%..
                /* 0310 */  0x01, 0x79, 0x39, 0xFA, 0x7C, 0x4A, 0xC3, 0xC2,  // .y9.|J..
                /* 0318 */  0xA0, 0x8E, 0xA8, 0xB8, 0xFF, 0xFF, 0x11, 0x15,  // ........
                /* 0320 */  0x70, 0x7C, 0x21, 0x78, 0x44, 0x05, 0x1E, 0x57,  // p|!xD..W
                /* 0328 */  0xD2, 0x08, 0xAF, 0xA5, 0xCF, 0xA4, 0xAD, 0x4D,  // .......M
                /* 0330 */  0x4C, 0x37, 0x82, 0xA7, 0x53, 0x0F, 0x27, 0x82,  // L7..S.'.
                /* 0338 */  0x8F, 0xA8, 0x0C, 0x2C, 0x52, 0x14, 0x43, 0x46,  // ...,R.CF
                /* 0340 */  0x89, 0x6A, 0x94, 0xF7, 0xD3, 0x18, 0x2F, 0x07,  // .j..../.
                /* 0348 */  0xB1, 0x82, 0xC4, 0x88, 0xE4, 0x1B, 0x44, 0xF4,  // ......D.
                /* 0350 */  0xB8, 0xC7, 0xF9, 0x88, 0xCA, 0x64, 0x2E, 0x44,  // .....d.D
                /* 0358 */  0x3E, 0x8E, 0xA8, 0x40, 0xFF, 0xFF, 0x7F, 0x44,  // >..@...D
                /* 0360 */  0x05, 0x1C, 0x9D, 0xDC, 0xE0, 0xA0, 0x3E, 0x3B,  // ......>;
                /* 0368 */  0x9C, 0xB7, 0x2F, 0x08, 0xC6, 0x7F, 0x5B, 0xF2,  // ../...[.
                /* 0370 */  0x19, 0x15, 0x98, 0x8F, 0xE9, 0x55, 0xE1, 0x9C,  // .....U..
                /* 0378 */  0x30, 0xB3, 0x38, 0x28, 0x9F, 0x63, 0xC0, 0x79,  // 0.8(.c.y
                /* 0380 */  0xCA, 0x84, 0x03, 0x7D, 0xC8, 0x6F, 0x1E, 0x3E,  // ...}.o.>
                /* 0388 */  0x27, 0x9C, 0x29, 0x3B, 0x65, 0x82, 0xEB, 0x4C,  // '.);e..L
                /* 0390 */  0x00, 0x8E, 0xFF, 0xFF, 0x29, 0x13, 0x3C, 0x07,  // ....).<.
                /* 0398 */  0x1D, 0x1F, 0x40, 0xEC, 0x72, 0xA0, 0xA0, 0x3E,  // ..@.r..>
                /* 03A0 */  0xDB, 0xC2, 0xB9, 0xDF, 0x60, 0x6F, 0xAD, 0x98,  // ....`o..
                /* 03A8 */  0xB3, 0x2D, 0xF8, 0x0E, 0xA8, 0xE0, 0x38, 0xDB,  // .-....8.
                /* 03B0 */  0x02, 0xEF, 0xB7, 0x84, 0x87, 0x8B, 0xBF, 0xB7,  // ........
                /* 03B8 */  0xB1, 0x99, 0x44, 0x38, 0xA1, 0x47, 0x1A, 0x5F,  // ..D8.G._
                /* 03C0 */  0xD4, 0xCF, 0xCD, 0xC6, 0x21, 0x49, 0xD0, 0x53,  // ....!I.S
                /* 03C8 */  0x2A, 0xD0, 0x99, 0xD5, 0xE1, 0xC2, 0xFC, 0xFF,  // *.......
                /* 03D0 */  0x9F, 0xFA, 0xE0, 0xCC, 0x0A, 0x83, 0x13, 0xE5,  // ........
                /* 03D8 */  0xB0, 0x18, 0xC4, 0x23, 0x8D, 0xEF, 0x31, 0x8F,  // ...#..1.
                /* 03E0 */  0x0B, 0xE0, 0x1C, 0x30, 0x7E, 0x44, 0x1E, 0x8B,  // ...0~D..
                /* 03E8 */  0x4F, 0xB0, 0x6C, 0x30, 0x38, 0x82, 0x51, 0x8F,  // O.l08.Q.
                /* 03F0 */  0xAA, 0x40, 0x67, 0x56, 0xC7, 0x0B, 0xAE, 0x5B,  // .@gV...[
                /* 03F8 */  0x2E, 0x3F, 0x3E, 0x79, 0xC4, 0x98, 0x03, 0x03,  // .?>y....
                /* 0400 */  0xF0, 0x19, 0x30, 0xE6, 0x1C, 0xEB, 0x01, 0x83,  // ..0.....
                /* 0408 */  0xF9, 0xBC, 0x0A, 0x8E, 0x01, 0xC3, 0xFF, 0xFF,  // ........
                /* 0410 */  0x0F, 0x18, 0x7F, 0xD7, 0x65, 0x03, 0x06, 0x36,  // ....e..6
                /* 0418 */  0xF1, 0x8F, 0x2B, 0x50, 0x0E, 0x1C, 0xF8, 0xF3,  // ..+P....
                /* 0420 */  0x2C, 0xE6, 0xF0, 0x08, 0xB6, 0x53, 0x2B, 0x38,  // ,....S+8
                /* 0428 */  0x0E, 0x8F, 0xE0, 0x39, 0x70, 0xC0, 0x19, 0x16,  // ...9p...
                /* 0430 */  0xE6, 0xC8, 0x0B, 0x98, 0x38, 0xB6, 0x82, 0xE3,  // ....8...
                /* 0438 */  0xC8, 0x0B, 0x9E, 0xFF, 0xFF, 0x91, 0x17, 0x70,  // .......p
                /* 0440 */  0x74, 0x6A, 0x05, 0x2E, 0x47, 0x5E, 0xC0, 0x93,  // tj..G^..
                /* 0448 */  0x8A, 0x23, 0x2F, 0xD0, 0xFC, 0xFF, 0x1F, 0x79,  // .#/....y
                /* 0450 */  0xC1, 0x7B, 0xCC, 0xC0, 0x0F, 0xC8, 0xD0, 0x47,  // .{.....G
                /* 0458 */  0xF2, 0x1E, 0xEA, 0x03, 0x62, 0xD8, 0x97, 0x50,  // ....b..P
                /* 0460 */  0xE3, 0xBE, 0x53, 0xFA, 0x58, 0x08, 0xB6, 0xC1,  // ..S.X...
                /* 0468 */  0xFA, 0x58, 0x08, 0x3C, 0x06, 0x05, 0xEF, 0xB4,  // .X.<....
                /* 0470 */  0x0C, 0x9C, 0x4F, 0xB4, 0xEC, 0xB4, 0x0C, 0x0C,  // ..O.....
                /* 0478 */  0x95, 0x44, 0x00, 0x61, 0xF2, 0x4F, 0x53, 0x92,  // .D.a.OS.
                /* 0480 */  0xF7, 0x16, 0xA0, 0x30, 0x3E, 0x2D, 0xC3, 0xFB,  // ...0>-..
                /* 0488 */  0xFF, 0x9F, 0x96, 0x01, 0x27, 0x82, 0x0F, 0x0A,  // ....'...
                /* 0490 */  0xA0, 0x39, 0x0D, 0xC0, 0xBF, 0x09, 0xF0, 0x43,  // .9.....C
                /* 0498 */  0x44, 0xF8, 0x07, 0x0E, 0x8F, 0x20, 0x42, 0x02,  // D.... B.
                /* 04A0 */  0x9F, 0x94, 0xC1, 0x75, 0x62, 0x78, 0x52, 0x06,  // ...ubxR.
                /* 04A8 */  0x7B, 0xC0, 0xF3, 0x80, 0xCE, 0x1B, 0x3E, 0x29,  // {.....>)
                /* 04B0 */  0x03, 0x5E, 0xFE, 0xFF, 0x27, 0x65, 0xC0, 0xC3,  // .^..'e..
                /* 04B8 */  0xC9, 0x12, 0x77, 0x12, 0x01, 0xEF, 0x2D, 0x04,  // ..w...-.
                /* 04C0 */  0x73, 0x0C, 0x01, 0x26, 0x09, 0x03, 0x40, 0xBC,  // s..&..@.
                /* 04C8 */  0x33, 0x3C, 0x6C, 0x68, 0xB5, 0xB2, 0xB1, 0x5A,  // 3<lh...Z
                /* 04D0 */  0x9F, 0x37, 0xA8, 0xE0, 0x63, 0x82, 0x26, 0xF4,  // .7..c.&.
                /* 04D8 */  0xE4, 0xE6, 0x61, 0x56, 0x3A, 0x1B, 0xA1, 0xBC,  // ..aV:...
                /* 04E0 */  0x1E, 0x3C, 0xDB, 0x5B, 0x26, 0x98, 0xCE, 0xD1,  // .<.[&...
                /* 04E8 */  0x86, 0xB0, 0xC0, 0x13, 0x89, 0x21, 0x34, 0x1E,  // .....!4.
                /* 04F0 */  0x83, 0x5B, 0x10, 0x1C, 0x05, 0xF1, 0x09, 0xC0,  // .[......
                /* 04F8 */  0x61, 0x4F, 0x40, 0xE8, 0x23, 0x80, 0xEF, 0x3C,  // aO@.#..<
                /* 0500 */  0x9C, 0xC0, 0xE1, 0x8E, 0x3F, 0xF4, 0xC4, 0x80,  // ....?...
                /* 0508 */  0x1F, 0xDB, 0x81, 0x9D, 0x97, 0x4F, 0xB9, 0xE0,  // .....O..
                /* 0510 */  0x9A, 0x99, 0xEF, 0x4B, 0x1E, 0x1A, 0xBB, 0x9B,  // ...K....
                /* 0518 */  0x78, 0x28, 0x1E, 0xC2, 0xFF, 0xFF, 0xF1, 0xC0,  // x(......
                /* 0520 */  0x04, 0x1E, 0x89, 0xCF, 0x45, 0x7C, 0x10, 0x3E,  // ....E|.>
                /* 0528 */  0x85, 0xF3, 0xC3, 0x0F, 0x38, 0x0F, 0x46, 0xB8,  // ....8.F.
                /* 0530 */  0x33, 0x02, 0x3C, 0x20, 0x5F, 0x08, 0x3C, 0xAB,  // 3.< _.<.
                /* 0538 */  0x87, 0x02, 0x36, 0x87, 0x10, 0x61, 0xA2, 0x19,  // ..6..a..
                /* 0540 */  0x1E, 0x13, 0x68, 0x54, 0x54, 0xD6, 0xB8, 0x50,  // ..hTT..P
                /* 0548 */  0x23, 0xF5, 0x49, 0x86, 0x61, 0xBF, 0x0F, 0x58,  // #.I.a..X
                /* 0550 */  0xF4, 0x40, 0x75, 0x3B, 0x78, 0x4A, 0xC7, 0xC0,  // .@u;xJ..
                /* 0558 */  0x7A, 0xEC, 0x1C, 0xD6, 0x68, 0x07, 0xEB, 0xA3,  // z...h...
                /* 0560 */  0x84, 0xAF, 0x21, 0x3E, 0x95, 0x31, 0x58, 0x1F,  // ..!>.1X.
                /* 0568 */  0xA1, 0xC0, 0x75, 0x54, 0x60, 0xC7, 0x6D, 0x9F,  // ..uT`.m.
                /* 0570 */  0x00, 0x70, 0xE7, 0x04, 0x9D, 0x1A, 0x50, 0x07,  // .p....P.
                /* 0578 */  0x20, 0x8B, 0x3F, 0x35, 0x20, 0xE6, 0x78, 0x58,  //  .?5 .xX
                /* 0580 */  0x4F, 0x02, 0x06, 0x7D, 0xD5, 0x31, 0xCE, 0x13,  // O..}.1..
                /* 0588 */  0x95, 0x47, 0xE4, 0x5B, 0x00, 0x93, 0x7A, 0x72,  // .G.[..zr
                /* 0590 */  0x40, 0x89, 0xA4, 0x90, 0xC4, 0x93, 0x03, 0x4A,  // @......J
                /* 0598 */  0x14, 0x1C, 0x05, 0xF1, 0xC9, 0xC1, 0xA7, 0x76,  // .......v
                /* 05A0 */  0xFC, 0xC9, 0x01, 0x7F, 0x0E, 0xE3, 0x27, 0x07,  // ......'.
                /* 05A8 */  0xB8, 0x07, 0x66, 0xB8, 0xFF, 0xFF, 0xA1, 0xC2,  // ..f.....
                /* 05B0 */  0x99, 0x1F, 0xBC, 0xEB, 0x3A, 0x3B, 0x3B, 0x00,  // ....:;;.
                /* 05B8 */  0x56, 0x82, 0x9D, 0x1D, 0x40, 0x77, 0x0E, 0xF0,  // V...@w..
                /* 05C0 */  0xD9, 0x01, 0x5C, 0x27, 0x00, 0xE0, 0x73, 0x7E,  // ..\'..s~
                /* 05C8 */  0x80, 0x33, 0xC9, 0xE7, 0x07, 0x60, 0xFC, 0xFF,  // .3...`..
                /* 05D0 */  0x3F, 0x3F, 0xC0, 0xB9, 0x18, 0xF8, 0xFC, 0x0E,  // ??......
                /* 05D8 */  0xBE, 0xF1, 0xB1, 0xF3, 0x03, 0x60, 0x19, 0x96,  // .....`..
                /* 05E0 */  0x9F, 0x1F, 0x80, 0xCF, 0x09, 0x00, 0x3C, 0x22,  // ......<"
                /* 05E8 */  0xCF, 0x0F, 0x28, 0x0E, 0x1F, 0x14, 0x8D, 0x76,  // ..(....v
                /* 05F0 */  0x12, 0x07, 0x70, 0xE2, 0x07, 0x11, 0xE1, 0x1C,  // ..p.....
                /* 05F8 */  0xC2, 0x1F, 0xC2, 0x2B, 0x45, 0x94, 0x40, 0x0F,  // ...+E.@.
                /* 0600 */  0x93, 0x3E, 0x61, 0x92, 0xE3, 0x03, 0x4A, 0x28,  // .>a...J(
                /* 0608 */  0x85, 0x8E, 0x56, 0x1E, 0xBC, 0xFF, 0xFF, 0xC7,  // ..V.....
                /* 0610 */  0x01, 0x02, 0x47, 0x41, 0x7C, 0x7C, 0x70, 0xE8,  // ..GA||p.
                /* 0618 */  0xE3, 0x03, 0xF4, 0x90, 0xA7, 0x19, 0x50, 0x1C,  // ......P.
                /* 0620 */  0xDD, 0x7C, 0xAC, 0x02, 0x0B, 0xD6, 0x9B, 0xB8,  // .|......
                /* 0628 */  0xA7, 0x07, 0xE3, 0x5E, 0xEC, 0xDB, 0x9C, 0x91,  // ...^....
                /* 0630 */  0x4E, 0xF0, 0x7C, 0xDF, 0x1E, 0x7D, 0xDE, 0x7B,  // N.|..}.{
                /* 0638 */  0x80, 0x00, 0xAC, 0x1C, 0xCD, 0x7C, 0x80, 0x00,  // .....|..
                /* 0640 */  0xD7, 0xF8, 0x7D, 0x80, 0x00, 0xD7, 0x19, 0x00,  // ..}.....
                /* 0648 */  0x78, 0x89, 0x7A, 0x2B, 0xE8, 0xFF, 0x7F, 0x84,  // x.z+....
                /* 0650 */  0xC0, 0xC9, 0x3E, 0x60, 0x21, 0xB0, 0x19, 0x86,  // ..>`!...
                /* 0658 */  0x6F, 0x11, 0x3E, 0x2E, 0x78, 0x50, 0x26, 0xF0,  // o.>.xP&.
                /* 0660 */  0x41, 0x0F, 0xF0, 0x72, 0x1C, 0xE2, 0xD3, 0x83,  // A..r....
                /* 0668 */  0x77, 0x7C, 0x00, 0x9C, 0x84, 0x3A, 0x3E, 0x80,  // w|...:>.
                /* 0670 */  0xCE, 0xC2, 0xF1, 0x01, 0x74, 0xE3, 0x07, 0xC7,  // ....t...
                /* 0678 */  0xFF, 0x7F, 0xFC, 0xE0, 0x38, 0x3A, 0xC0, 0x39,  // ....8:.9
                /* 0680 */  0xDB, 0xB0, 0xA3, 0x03, 0xB0, 0x3F, 0x5A, 0xE1,  // .....?Z.
                /* 0688 */  0xC6, 0x0A, 0x9E, 0x93, 0x10, 0x3F, 0x3A, 0x00,  // .....?:.
                /* 0690 */  0xA7, 0x83, 0x7A, 0xA0, 0x07, 0xD9, 0x40, 0x8F,  // ..z...@.
                /* 0698 */  0x0E, 0xC0, 0xFF, 0xAC, 0xEE, 0xA3, 0x03, 0x78,  // .......x
                /* 06A0 */  0xFE, 0xFF, 0xE3, 0x07, 0x2E, 0x42, 0x8E, 0x0E,  // .....B..
                /* 06A8 */  0xA8, 0x21, 0x58, 0xEC, 0x21, 0x06, 0xA1, 0xF1,  // .!X.!...
                /* 06B0 */  0xA6, 0x4C, 0x86, 0xFB, 0x9A, 0xE2, 0xF1, 0xF8,  // .L......
                /* 06B8 */  0xD4, 0xC0, 0x0E, 0x0E, 0x5C, 0x1A, 0x85, 0xCE,  // ....\...
                /* 06C0 */  0x53, 0x3E, 0x38, 0x70, 0x29, 0x70, 0x14, 0xC4,  // S>8p)p..
                /* 06C8 */  0x07, 0x07, 0xC7, 0x3C, 0x38, 0x40, 0x8F, 0x75,  // ...<8@.u
                /* 06D0 */  0x84, 0x01, 0x85, 0xBC, 0x91, 0x82, 0x66, 0x6A,  // ......fj
                /* 06D8 */  0x6C, 0x85, 0xC7, 0x86, 0x3B, 0x35, 0x00, 0x4E,  // l...;5.N
                /* 06E0 */  0x0E, 0xF1, 0x3E, 0x35, 0x80, 0xCB, 0xC3, 0xA9,  // ..>5....
                /* 06E8 */  0x01, 0xDA, 0xFF, 0xFF, 0xD4, 0x00, 0x6F, 0xA2,  // ......o.
                /* 06F0 */  0x3E, 0xBF, 0x80, 0x6B, 0xF8, 0x90, 0x0E, 0x0D,  // >..k....
                /* 06F8 */  0xA8, 0x13, 0x80, 0x4F, 0xDF, 0x18, 0x5C, 0x66,  // ...O..\f
                /* 0700 */  0x6C, 0x94, 0x3A, 0x53, 0x7B, 0x36, 0xEC, 0x8C,  // l.:S{6..
                /* 0708 */  0xC9, 0x4E, 0x0D, 0x5C, 0x1C, 0x85, 0x8E, 0x0D,  // .N.\....
                /* 0710 */  0x3E, 0x35, 0x70, 0x31, 0x70, 0x14, 0xC4, 0xA7,  // >5p1p...
                /* 0718 */  0x06, 0x07, 0x3D, 0x35, 0x40, 0x3F, 0x25, 0xFA,  // ..=5@?%.
                /* 0720 */  0xD4, 0x00, 0xFF, 0xC0, 0x0C, 0x9E, 0xB9, 0xF1,  // ........
                /* 0728 */  0x73, 0x98, 0x07, 0x87, 0x3B, 0xBB, 0x00, 0x0E,  // s...;...
                /* 0730 */  0xFF, 0xFF, 0xE0, 0x3E, 0x45, 0x01, 0xB7, 0xF1,  // ...>E...
                /* 0738 */  0x43, 0x3C, 0x37, 0x40, 0x9F, 0xF5, 0x73, 0x03,  // C<7@..s.
                /* 0740 */  0xE0, 0x6A, 0x6E, 0xCF, 0x0D, 0x80, 0xB7, 0xFF,  // .jn.....
                /* 0748 */  0xFF, 0xB9, 0x01, 0xAE, 0x89, 0x73, 0x03, 0x90,  // .....s..
                /* 0750 */  0x1C, 0x3F, 0x8C, 0xC3, 0x1C, 0x5E, 0xF4, 0xB9,  // .?...^..
                /* 0758 */  0x01, 0x3D, 0xB5, 0x18, 0xC5, 0x43, 0xA3, 0xCF,  // .=...C..
                /* 0760 */  0xDC, 0x3E, 0x38, 0xF0, 0xB3, 0x9C, 0x4F, 0x0E,  // .>8...O.
                /* 0768 */  0x3E, 0x38, 0x70, 0x39, 0x70, 0x14, 0xC4, 0x07,  // >8p9p...
                /* 0770 */  0x07, 0x47, 0x3D, 0x38, 0x40, 0x8F, 0x76, 0x70,  // .G=8@.vp
                /* 0778 */  0x00, 0xC5, 0xC1, 0x07, 0x3C, 0xC7, 0x1E, 0x3E,  // ....<..>
                /* 0780 */  0x3A, 0x36, 0x55, 0xEC, 0xC9, 0x01, 0x70, 0xF0,  // :6U...p.
                /* 0788 */  0xFF, 0x3F, 0x39, 0xE0, 0xCF, 0x60, 0x3E, 0x39,  // .?9..`>9
                /* 0790 */  0x80, 0x4B, 0xC5, 0xC9, 0x01, 0x74, 0x73, 0x7A,  // .K...tsz
                /* 0798 */  0x8C, 0x02, 0xEB, 0x01, 0x00, 0xCE, 0xD1, 0x01,  // ........
                /* 07A0 */  0x37, 0x06, 0x4B, 0x3E, 0x3A, 0x20, 0xB4, 0x9E,  // 7.K>: ..
                /* 07A8 */  0x75, 0xC9, 0x30, 0xCE, 0x81, 0x1F, 0x6F, 0x01,  // u.0...o.
                /* 07B0 */  0x33, 0x57, 0x82, 0x58, 0xA7, 0xFE, 0xF6, 0xE5,  // 3W.X....
                /* 07B8 */  0x49, 0xBE, 0xA8, 0xFB, 0x66, 0xCC, 0xA6, 0x87,  // I...f...
                /* 07C0 */  0x39, 0x39, 0x00, 0xBF, 0xFF, 0xFF, 0xE1, 0x1F,  // 99......
                /* 07C8 */  0x38, 0x8E, 0xDC, 0x87, 0x7F, 0xE0, 0x74, 0x72,  // 8.....tr
                /* 07D0 */  0xE0, 0x27, 0x00, 0xFC, 0x7D, 0x01, 0x7F, 0xF8,  // .'..}...
                /* 07D8 */  0xC7, 0x89, 0x82, 0x50, 0x80, 0xC3, 0x3F, 0xA4,  // ...P..?.
                /* 07E0 */  0x93, 0x25, 0x06, 0xE1, 0x1C, 0x9E, 0x63, 0xED,  // .%....c.
                /* 07E8 */  0xF9, 0x84, 0x49, 0x8F, 0x0F, 0xFC, 0x04, 0xE1,  // ..I.....
                /* 07F0 */  0xA3, 0x8C, 0x8F, 0x0F, 0x5C, 0x16, 0x1C, 0x05,  // ....\...
                /* 07F8 */  0xF1, 0xF1, 0xC1, 0x91, 0x8F, 0x0F, 0xD0, 0x23,  // .......#
                /* 0800 */  0x1E, 0x1F, 0x40, 0x71, 0x18, 0x78, 0x8C, 0x01,  // ..@q.x..
                /* 0808 */  0x1B, 0xDA, 0xC1, 0xE1, 0x80, 0x0C, 0x16, 0x34,  // .......4
                /* 0810 */  0x44, 0xC5, 0x50, 0x04, 0xB8, 0xF9, 0x13, 0x04,  // D.P.....
                /* 0818 */  0xF4, 0xFF, 0xFF, 0x09, 0x02, 0x78, 0x9F, 0x84,  // .....x..
                /* 0820 */  0x7C, 0x82, 0x00, 0xD7, 0x19, 0xC0, 0x27, 0x08,  // |.....'.
                /* 0828 */  0x70, 0x1D, 0x01, 0x80, 0x09, 0x52, 0xAC, 0x47,  // p....R.G
                /* 0830 */  0x00, 0x26, 0xF1, 0x74, 0x87, 0x16, 0x7F, 0xE4,  // .&.t....
                /* 0838 */  0x46, 0x9C, 0x1F, 0x60, 0xC9, 0x3D, 0x3F, 0xA0,  // F..`.=?.
                /* 0840 */  0x84, 0x52, 0xE8, 0x00, 0xE1, 0xF3, 0x03, 0x3F,  // .R.....?
                /* 0848 */  0xEC, 0x1A, 0xCC, 0x20, 0x3E, 0x3F, 0x38, 0xF4,  // ... >?8.
                /* 0850 */  0xF9, 0x01, 0x7A, 0xC8, 0x13, 0x37, 0x28, 0xC4,  // ..z..7(.
                /* 0858 */  0x1E, 0x91, 0x41, 0x37, 0x3B, 0xFF, 0xFF, 0xC7,  // ..A7;...
                /* 0860 */  0x0B, 0x07, 0xD3, 0xBE, 0x30, 0xA4, 0x19, 0x41,  // ....0..A
                /* 0868 */  0x67, 0x3C, 0xC0, 0xCB, 0x89, 0xC8, 0x07, 0x08,  // g<......
                /* 0870 */  0x70, 0xD9, 0x38, 0x40, 0x80, 0xEE, 0x0C, 0x00,  // p.8@....
                /* 0878 */  0xBC, 0x84, 0x9D, 0xF3, 0xD0, 0xC2, 0xCF, 0x34,  // .......4
                /* 0880 */  0x90, 0xE6, 0xFC, 0x22, 0x6E, 0x9F, 0x20, 0x22,  // ..."n. "
                /* 0888 */  0xF0, 0xF9, 0xC1, 0x47, 0x08, 0x7E, 0xE4, 0xF4,  // ...G.~..
                /* 0890 */  0x01, 0xCB, 0x47, 0x08, 0x2E, 0x09, 0x8E, 0x82,  // ..G.....
                /* 0898 */  0xF8, 0x08, 0xE1, 0xB8, 0x47, 0x08, 0xE8, 0xF1,  // ....G...
                /* 08A0 */  0x8E, 0x10, 0xE8, 0xFF, 0xFF, 0x89, 0x06, 0xCE,  // ........
                /* 08A8 */  0xC9, 0x0C, 0x3C, 0x48, 0x67, 0xE6, 0x91, 0x1A,  // ..<Hg...
                /* 08B0 */  0xE5, 0xE5, 0x03, 0x7F, 0x9E, 0x01, 0xDC, 0x9C,  // ........
                /* 08B8 */  0xF4, 0xC0, 0xA7, 0xE3, 0xA4, 0x07, 0xB4, 0x0E,  // ........
                /* 08C0 */  0x00, 0xE0, 0x10, 0x7C, 0x78, 0x40, 0x87, 0x38,  // ...|x@.8
                /* 08C8 */  0x3C, 0x50, 0x85, 0x18, 0x3A, 0x38, 0x1C, 0xAD,  // <P..:8..
                /* 08D0 */  0x8F, 0x0F, 0xB8, 0xCB, 0x03, 0x3B, 0x7C, 0xFA,  // .....;|.
                /* 08D8 */  0xF0, 0xC0, 0x4F, 0x34, 0x3E, 0x61, 0xF9, 0xF0,  // ..O4>a..
                /* 08E0 */  0xC0, 0x8F, 0x7B, 0x3E, 0x79, 0xF2, 0xC3, 0x83,  // ..{>y...
                /* 08E8 */  0xFF, 0xFF, 0xD1, 0x0F, 0x0F, 0xD0, 0xCF, 0x9E,  // ........
                /* 08F0 */  0x3E, 0x3C, 0xC0, 0x3F, 0x42, 0xF3, 0xC1, 0xC2,  // ><.?B...
                /* 08F8 */  0x9F, 0xA6, 0x51, 0xA2, 0x1D, 0xE2, 0x7B, 0xC0,  // ..Q...{.
                /* 0900 */  0x79, 0x04, 0x31, 0xCE, 0xC3, 0x1E, 0x83, 0x3D,  // y.1....=
                /* 0908 */  0xD9, 0x33, 0xB6, 0xEB, 0x23, 0x04, 0x20, 0xEB,  // .3..#. .
                /* 0910 */  0x90, 0xE6, 0x23, 0x04, 0xB8, 0x7C, 0x1C, 0x21,  // ..#..|.!
                /* 0918 */  0x40, 0x77, 0x0C, 0x00, 0x8E, 0xFF, 0x7F, 0xD9,  // @w......
                /* 0920 */  0x07, 0x09, 0x94, 0x94, 0x83, 0x04, 0x3D, 0xE5,  // ......=.
                /* 0928 */  0xB0, 0x8B, 0x04, 0x3F, 0x45, 0x30, 0xE9, 0xA7,  // ...?E0..
                /* 0930 */  0x08, 0xD4, 0x41, 0xC2, 0x67, 0x51, 0x9F, 0x22,  // ..A.gQ."
                /* 0938 */  0xF8, 0x79, 0x98, 0x83, 0xF8, 0x14, 0x61, 0x1A,  // .y....a.
                /* 0940 */  0x9F, 0x22, 0xE0, 0x06, 0x3E, 0x63, 0x81, 0x62,  // ."..>c.b
                /* 0948 */  0x6A, 0xC7, 0x0B, 0x96, 0xD1, 0xFB, 0xAC, 0xE7,  // j.......
                /* 0950 */  0xE3, 0xA2, 0x4F, 0x1C, 0xC6, 0x38, 0xFB, 0x70,  // ..O..8.p
                /* 0958 */  0x51, 0x5F, 0xF8, 0x18, 0x16, 0x1B, 0x33, 0x8C,  // Q_....3.
                /* 0960 */  0xA9, 0x18, 0xE3, 0xF0, 0xF9, 0x49, 0x0B, 0xF0,  // .....I..
                /* 0968 */  0x72, 0xC4, 0xF7, 0x41, 0x02, 0x5C, 0x63, 0xF1,  // r..A.\c.
                /* 0970 */  0x41, 0x02, 0x5C, 0x27, 0x01, 0xFF, 0xFF, 0x4F,  // A.\'...O
                /* 0978 */  0x02, 0xC0, 0x35, 0xD4, 0x59, 0x02, 0x25, 0xEE,  // ..5.Y.%.
                /* 0980 */  0x84, 0xE6, 0xC3, 0x31, 0x62, 0xBE, 0x47, 0xE3,  // ...1b.G.
                /* 0988 */  0xC3, 0x57, 0x84, 0x33, 0x30, 0xCE, 0xB9, 0xF9,  // .W.30...
                /* 0990 */  0xA8, 0x6C, 0x98, 0xB7, 0x07, 0x5F, 0x65, 0x82,  // .l..._e.
                /* 0998 */  0x84, 0x79, 0x4B, 0x0D, 0x73, 0x1E, 0x61, 0xA2,  // .yK.s.a.
                /* 09A0 */  0x24, 0xF0, 0x09, 0xD5, 0x87, 0x0A, 0x7E, 0xAE,  // $.....~.
                /* 09A8 */  0xF0, 0x11, 0xCC, 0x87, 0x0A, 0x2E, 0x15, 0x8E,  // ........
                /* 09B0 */  0x82, 0xF8, 0x50, 0x61, 0x19, 0x87, 0x0A, 0xE8,  // ..Pa....
                /* 09B8 */  0xB1, 0x4F, 0x3A, 0xA0, 0x90, 0x7F, 0xAA, 0x05,  // .O:.....
                /* 09C0 */  0xDD, 0x51, 0xC0, 0x23, 0x84, 0x71, 0x23, 0xF1,  // .Q.#.q#.
                /* 09C8 */  0xC9, 0xC4, 0xE7, 0x36, 0xE3, 0x18, 0xEC, 0x70,  // ...6...p
                /* 09D0 */  0x71, 0xD8, 0x98, 0x23, 0xB3, 0xE7, 0x8A, 0x39,  // q..#...9
                /* 09D8 */  0x57, 0x00, 0xB7, 0xFF, 0xFF, 0xB9, 0x02, 0xBC,  // W.......
                /* 09E0 */  0x47, 0x39, 0x9F, 0x2B, 0xC0, 0x65, 0xE4, 0x5C,  // G9.+.e.\
                /* 09E8 */  0x01, 0xBA, 0xC3, 0x00, 0x70, 0x3F, 0x19, 0xE2,  // ....p?..
                /* 09F0 */  0xC6, 0x63, 0xD9, 0x47, 0x0B, 0xC4, 0xCC, 0x0F,  // .c.G....
                /* 09F8 */  0xFB, 0x25, 0xE0, 0xC1, 0x82, 0x9F, 0x25, 0x70,  // .%....%p
                /* 0A00 */  0x07, 0x1E, 0x7E, 0x30, 0xF4, 0x91, 0x82, 0x8B,  // ..~0....
                /* 0A08 */  0x82, 0xA3, 0x20, 0x3E, 0x52, 0xF8, 0xB8, 0xE3,  // .. >R...
                /* 0A10 */  0x23, 0x05, 0xDC, 0x80, 0x47, 0x0A, 0x50, 0x9C,  // #...G.P.
                /* 0A18 */  0xBB, 0xC1, 0x37, 0x39, 0x36, 0x70, 0x78, 0x04,  // ..796px.
                /* 0A20 */  0xFF, 0xFF, 0x07, 0x79, 0xC0, 0xA1, 0x92, 0x83,  // ...y....
                /* 0A28 */  0x3C, 0xD0, 0x3B, 0x01, 0xC0, 0x3F, 0x3C, 0xC0,  // <.;..?<.
                /* 0A30 */  0xC4, 0x78, 0x78, 0x00, 0xFC, 0xFC, 0xFF, 0xC7,  // .xx.....
                /* 0A38 */  0x8A, 0x9F, 0x1C, 0x3B, 0x3C, 0x00, 0x76, 0x4F,  // ...;<.vO
                /* 0A40 */  0x01, 0x3E, 0x3C, 0x00, 0xB7, 0x13, 0x00, 0x7C,  // .><....|
                /* 0A48 */  0xD1, 0x87, 0x07, 0x94, 0x28, 0x08, 0x05, 0x39,  // ....(..9
                /* 0A50 */  0x3C, 0x20, 0x8E, 0xF0, 0x70, 0xC6, 0xFA, 0xB0,  // < ..p...
                /* 0A58 */  0x60, 0x7C, 0xDF, 0xC0, 0x7C, 0x4E, 0x05, 0x3E,  // `|..|N.>
                /* 0A60 */  0xFF, 0xFF, 0x73, 0x2A, 0xF0, 0x18, 0x2F, 0x3F,  // ..s*../?
                /* 0A68 */  0x72, 0x83, 0x03, 0xE7, 0x04, 0x8E, 0x12, 0x77,  // r......w
                /* 0A70 */  0x4E, 0x05, 0x1C, 0x9E, 0x3F, 0x7D, 0x4E, 0x05,  // N...?}N.
                /* 0A78 */  0x4E, 0xC7, 0x00, 0x70, 0x07, 0x3A, 0x4A, 0xA0,  // N..p.:J.
                /* 0A80 */  0x8E, 0x00, 0x0E, 0x76, 0x96, 0x87, 0xF2, 0xFF,  // ...v....
                /* 0A88 */  0x87, 0x3D, 0x9D, 0x67, 0x44, 0xDC, 0x40, 0x4F,  // .=.gD.@O
                /* 0A90 */  0xC3, 0x2E, 0x51, 0x74, 0x6F, 0xF5, 0x51, 0x10,  // ..Qto.Q.
                /* 0A98 */  0x30, 0x73, 0x39, 0x78, 0x49, 0x38, 0x58, 0x4F,  // 0s9xI8XO
                /* 0AA0 */  0x11, 0x77, 0xAC, 0x84, 0xE1, 0x7D, 0x8E, 0x04,  // .w...}..
                /* 0AA8 */  0x2B, 0x60, 0x94, 0xC7, 0x5E, 0x1F, 0x2B, 0x0F,  // +`..^.+.
                /* 0AB0 */  0xD3, 0x27, 0x69, 0xC0, 0xD5, 0x51, 0x10, 0x7C,  // .'i..Q.|
                /* 0AB8 */  0x56, 0x8E, 0x14, 0xA0, 0xFB, 0xFF, 0x1F, 0x06,  // V.......
                /* 0AC0 */  0x80, 0xFB, 0x91, 0x07, 0xC7, 0xE1, 0x18, 0xE7,  // ........
                /* 0AC8 */  0x69, 0xC4, 0x8D, 0x02, 0x77, 0xE0, 0xC1, 0x9E,  // i...w...
                /* 0AD0 */  0xC3, 0x7C, 0xA8, 0xE0, 0x82, 0x29, 0x74, 0xE2,  // .|...)t.
                /* 0AD8 */  0xF1, 0xA1, 0x82, 0x0B, 0x84, 0xA3, 0x20, 0x3E,  // ...... >
                /* 0AE0 */  0x54, 0x38, 0xFC, 0x81, 0x07, 0x7A, 0xD8, 0x23,  // T8...z.#
                /* 0AE8 */  0x35, 0x28, 0xCE, 0x01, 0x07, 0x0E, 0x96, 0xE1,  // 5(......
                /* 0AF0 */  0xB1, 0x09, 0xC3, 0x9C, 0x3A, 0xF6, 0x72, 0xF2,  // ....:.r.
                /* 0AF8 */  0x48, 0x60, 0x1C, 0x7E, 0xA0, 0x06, 0xEE, 0xFF,  // H`.~....
                /* 0B00 */  0xFF, 0xF3, 0x04, 0xDC, 0x90, 0xE7, 0x09, 0xD0,  // ........
                /* 0B08 */  0x69, 0x39, 0x4F, 0x80, 0xEE, 0x1C, 0x00, 0x3C,  // i9O....<
                /* 0B10 */  0x03, 0x1C, 0x25, 0xD0, 0x61, 0x0E, 0x63, 0x88,  // ..%.a.c.
                /* 0B18 */  0xA3, 0x04, 0x4C, 0xF1, 0x47, 0x09, 0xD4, 0x69,  // ..L.G..i
                /* 0B20 */  0xC2, 0xC7, 0x31, 0x1F, 0x25, 0xB8, 0x4C, 0x38,  // ..1.%.L8
                /* 0B28 */  0x0A, 0xE2, 0xA3, 0x84, 0x25, 0x1C, 0x77, 0xA0,  // ....%.w.
                /* 0B30 */  0x47, 0x3E, 0xEE, 0x80, 0x02, 0xC4, 0x87, 0x26,  // G>.....&
                /* 0B38 */  0x70, 0x8D, 0x19, 0x9C, 0xC7, 0x31, 0x38, 0xFF,  // p....18.
                /* 0B40 */  0xFF, 0xD3, 0x04, 0xE0, 0xE3, 0x54, 0xE7, 0xD3,  // .....T..
                /* 0B48 */  0x04, 0xB8, 0xBC, 0x9C, 0x26, 0x40, 0x77, 0x14,  // ....&@w.
                /* 0B50 */  0x00, 0xCE, 0x41, 0x0E, 0x8B, 0xE8, 0x48, 0x47,  // ..A...HG
                /* 0B58 */  0x32, 0x50, 0x8C, 0xFB, 0x6D, 0xD2, 0x07, 0x23,  // 2P..m..#
                /* 0B60 */  0x1D, 0x29, 0x50, 0xE7, 0x31, 0x9F, 0x29, 0x7C,  // .)P.1.)|
                /* 0B68 */  0xA4, 0xE0, 0x42, 0xE1, 0x28, 0x88, 0x8F, 0x14,  // ..B.(...
                /* 0B70 */  0x16, 0x71, 0xA4, 0x80, 0x1E, 0xFA, 0x48, 0x01,  // .q....H.
                /* 0B78 */  0xE5, 0xFF, 0x7F, 0xA4, 0xC0, 0x8B, 0x3F, 0x34,  // ......?4
                /* 0B80 */  0x01, 0x19, 0xA8, 0xE3, 0xF0, 0x89, 0xDC, 0xF7,  // ........
                /* 0B88 */  0x25, 0xE3, 0xBD, 0x32, 0xC1, 0x3B, 0x53, 0x00,  // %..2.;S.
                /* 0B90 */  0x56, 0x0E, 0x4E, 0x3E, 0x53, 0x80, 0x0B, 0xCE,  // V.N>S...
                /* 0B98 */  0x67, 0x0A, 0x70, 0x9D, 0x05, 0x80, 0xB7, 0xD0,  // g.p.....
                /* 0BA0 */  0x43, 0x05, 0xEA, 0xFF, 0x3F, 0x1C, 0x9F, 0x24,  // C...?..$
                /* 0BA8 */  0x7C, 0x12, 0x62, 0xB7, 0x09, 0x1F, 0x79, 0xB0,  // |.b...y.
                /* 0BB0 */  0x92, 0x0F, 0x14, 0xA8, 0xB3, 0xAC, 0xCF, 0x8A,  // ........
                /* 0BB8 */  0x3E, 0x50, 0x70, 0x71, 0x70, 0x14, 0xC4, 0x07,  // >Ppqp...
                /* 0BC0 */  0x0A, 0x07, 0x3F, 0x8C, 0x41, 0x0F, 0x7A, 0x18,  // ..?.A.z.
                /* 0BC8 */  0x03, 0x85, 0xE0, 0x53, 0x13, 0xE8, 0x66, 0x0B,  // ...S..f.
                /* 0BD0 */  0xE3, 0xCE, 0x04, 0xFB, 0x28, 0x01, 0x38, 0x39,  // ....(.89
                /* 0BD8 */  0xA2, 0xFB, 0x28, 0x01, 0x2E, 0x33, 0x47, 0x09,  // ..(..3G.
                /* 0BE0 */  0xD0, 0x9D, 0x02, 0xE0, 0xFE, 0xFF, 0x4F, 0x01,  // ......O.
                /* 0BE8 */  0xC0, 0x41, 0xF8, 0x21, 0x02, 0x7D, 0x44, 0xF4,  // .A.!.}D.
                /* 0BF0 */  0x01, 0x88, 0x1D, 0x22, 0x60, 0x9C, 0x60, 0x7D,  // ..."`.`}
                /* 0BF8 */  0x88, 0xE0, 0xA7, 0x30, 0x1F, 0x24, 0x7C, 0x88,  // ...0.$|.
                /* 0C00 */  0xE0, 0x87, 0x7E, 0x1F, 0xFB, 0xF9, 0x21, 0xC2,  // ..~...!.
                /* 0C08 */  0x34, 0x3E, 0x44, 0xC0, 0x3D, 0xF8, 0xFB, 0x90,  // 4>D.=...
                /* 0C10 */  0x03, 0x7F, 0x82, 0x0F, 0x4B, 0x60, 0x1B, 0x2F,  // ....K`./
                /* 0C18 */  0xD8, 0xAE, 0x4A, 0xF8, 0x83, 0x04, 0x60, 0xE5,  // ..J...`.
                /* 0C20 */  0x38, 0xE2, 0x83, 0x04, 0xBC, 0xFF, 0xFF, 0x41,  // 8......A
                /* 0C28 */  0x02, 0x8E, 0x9A, 0x83, 0x04, 0xE8, 0x4E, 0x02,  // ......N.
                /* 0C30 */  0xC0, 0x57, 0xEE, 0x61, 0x02, 0x75, 0x1C, 0xF7,  // .W.a.u..
                /* 0C38 */  0xC9, 0xDA, 0xE3, 0x60, 0x18, 0xC7, 0xFC, 0x06,  // ...`....
                /* 0C40 */  0x10, 0xE2, 0xDD, 0xCC, 0x67, 0x57, 0x60, 0x79,  // ....gW`y
                /* 0C48 */  0x96, 0xC0, 0x1D, 0x32, 0xC1, 0x33, 0x64, 0x3E,  // ...2.3d>
                /* 0C50 */  0x37, 0x06, 0x12, 0xEA, 0x29, 0xC9, 0xC7, 0x80,  // 7...)...
                /* 0C58 */  0x53, 0x39, 0xD8, 0x38, 0x41, 0x5E, 0x09, 0x3C,  // S9.8A^.<
                /* 0C60 */  0x5C, 0x23, 0xF9, 0xE4, 0x14, 0xE4, 0x29, 0xE1,  // \#....).
                /* 0C68 */  0x14, 0xA2, 0xBE, 0xBE, 0x3D, 0x1C, 0x34, 0x75,  // ....=.4u
                /* 0C70 */  0x92, 0x00, 0x42, 0xFF, 0xFF, 0xB3, 0x2B, 0xF0,  // ..B...+.
                /* 0C78 */  0x76, 0x73, 0x76, 0x05, 0x5A, 0xE7, 0x00, 0xF0,  // vsv.Z...
                /* 0C80 */  0x9F, 0xBB, 0xE0, 0x9C, 0x23, 0x70, 0x3E, 0xA7,  // ....#p>.
                /* 0C88 */  0xAD, 0x83, 0x04, 0x3F, 0x77, 0x01, 0xC7, 0x83,  // ...?w...
                /* 0C90 */  0x04, 0xEE, 0x88, 0x04, 0x9E, 0x11, 0xE3, 0x47,  // .......G
                /* 0C98 */  0xE7, 0xF1, 0xC2, 0xFB, 0xFF, 0x1F, 0x23, 0x00,  // ......#.
                /* 0CA0 */  0x3F, 0xE7, 0x2E, 0xF0, 0x8D, 0xD0, 0xE7, 0x2E,  // ?.......
                /* 0CA8 */  0xE0, 0x74, 0x0A, 0x00, 0xAF, 0xA4, 0x43, 0x04,  // .t....C.
                /* 0CB0 */  0x6A, 0x5C, 0x3E, 0x6D, 0xF9, 0x10, 0x81, 0x87,  // j\>m....
                /* 0CB8 */  0x7E, 0x2C, 0x3C, 0x96, 0x67, 0x6B, 0x76, 0x8E,  // ~,<.gkv.
                /* 0CC0 */  0xE6, 0xE7, 0x1A, 0x2E, 0xEF, 0x14, 0x81, 0x12,  // ........
                /* 0CC8 */  0x04, 0x47, 0x41, 0x7C, 0x8A, 0xF0, 0xA9, 0xC6,  // .GA|....
                /* 0CD0 */  0xA7, 0x08, 0xB8, 0xE1, 0x4E, 0x11, 0xA0, 0xF8,  // ....N...
                /* 0CD8 */  0xFF, 0x8B, 0x1C, 0x30, 0xC8, 0x2F, 0x91, 0x9E,  // ...0./..
                /* 0CE0 */  0x1E, 0x3B, 0x3F, 0x00, 0x4E, 0x42, 0x9D, 0x1F,  // .;?.NB..
                /* 0CE8 */  0x40, 0x67, 0xE7, 0xFC, 0x00, 0xBA, 0xF1, 0x03,  // @g......
                /* 0CF0 */  0x0F, 0xC1, 0x27, 0x07, 0xD4, 0xD8, 0x1D, 0xE4,  // ..'.....
                /* 0CF8 */  0xE4, 0x80, 0xB8, 0xD6, 0xB3, 0x23, 0xD7, 0x21,  // .....#.!
                /* 0D00 */  0xBC, 0x24, 0x9C, 0xC5, 0xE1, 0xD4, 0x0C, 0xA4,  // .$......
                /* 0D08 */  0x2B, 0x17, 0xC3, 0x89, 0xF2, 0x94, 0xEA, 0x73,  // +......s
                /* 0D10 */  0x97, 0x09, 0x7C, 0xD0, 0xF2, 0xF1, 0x81, 0x1F,  // ..|.....
                /* 0D18 */  0x69, 0x7C, 0x6A, 0xF6, 0xF1, 0x81, 0x4B, 0x83,  // i|j...K.
                /* 0D20 */  0xA3, 0x20, 0x3E, 0x3E, 0x38, 0xF6, 0xF1, 0x01,  // . >>8...
                /* 0D28 */  0xF5, 0xFF, 0x3F, 0x3E, 0xC0, 0x89, 0x79, 0x7C,  // ..?>..y|
                /* 0D30 */  0x00, 0x85, 0xDC, 0xF1, 0x82, 0x6E, 0x8A, 0x78,  // .....n.x
                /* 0D38 */  0xA4, 0x63, 0xC4, 0x02, 0x9D, 0x23, 0xE6, 0x0C,  // .c...#..
                /* 0D40 */  0x01, 0x38, 0x89, 0x77, 0x86, 0x00, 0x9D, 0x9E,  // .8.w....
                /* 0D48 */  0x33, 0x04, 0xE8, 0x0E, 0x01, 0xC0, 0xED, 0x94,  // 3.......
                /* 0D50 */  0x85, 0xE3, 0xF0, 0xE1, 0x0F, 0x33, 0xBC, 0xFF,  // .....3..
                /* 0D58 */  0xFF, 0x31, 0xF9, 0xE2, 0xE5, 0x31, 0xBC, 0x55,  // .1...1.U
                /* 0D60 */  0x78, 0x62, 0x47, 0x72, 0x08, 0x81, 0x1E, 0x22,  // xbGr..."
                /* 0D68 */  0x00, 0x43, 0xD3, 0xC3, 0x5D, 0x42, 0xF8, 0xFC,  // .C..]B..
                /* 0D70 */  0xF8, 0x61, 0x8D, 0x41, 0x63, 0x0E, 0x11, 0x80,  // .a.Ac...
                /* 0D78 */  0x43, 0x3F, 0x87, 0x08, 0xA0, 0xF5, 0xFF, 0x3F,  // C?.....?
                /* 0D80 */  0x04, 0x80, 0x53, 0xFE, 0x21, 0x02, 0x35, 0x2A,  // ..S.!.5*
                /* 0D88 */  0xC7, 0x39, 0x32, 0x08, 0xF6, 0x3C, 0x4E, 0xF4,  // .92..<N.
                /* 0D90 */  0xC5, 0x1E, 0x37, 0xC5, 0xD0, 0x9E, 0x45, 0x98,  // ..7...E.
                /* 0D98 */  0x63, 0x88, 0x14, 0xE1, 0xA1, 0xC2, 0xF8, 0x3D,  // c......=
                /* 0DA0 */  0x1F, 0x9E, 0x7D, 0x8E, 0x40, 0x9D, 0x00, 0x7D,  // ..}.@..}
                /* 0DA8 */  0x96, 0xF0, 0x39, 0x82, 0x4B, 0x84, 0xA3, 0x20,  // ..9.K.. 
                /* 0DB0 */  0x3E, 0x47, 0x38, 0xFE, 0x39, 0x02, 0x7A, 0xDC,  // >G8.9.z.
                /* 0DB8 */  0x73, 0x04, 0x28, 0xA6, 0x73, 0xCC, 0x60, 0x99,  // s.(.s.`.
                /* 0DC0 */  0x1C, 0x66, 0x9D, 0x47, 0x87, 0xBD, 0x87, 0xC0,  // .f.G....
                /* 0DC8 */  0xC0, 0x8F, 0xF3, 0x7E, 0xEB, 0x0B, 0x49, 0xC4,  // ...~..I.
                /* 0DD0 */  0x98, 0xBE, 0x23, 0xF9, 0x04, 0x08, 0x78, 0x39,  // ..#...x9
                /* 0DD8 */  0x90, 0xF8, 0x2C, 0x01, 0xEF, 0xFF, 0x7F, 0x96,  // ..,.....
                /* 0DE0 */  0x80, 0xF3, 0x4D, 0xF0, 0x59, 0x02, 0x5C, 0x07,  // ..M.Y.\.
                /* 0DE8 */  0x01, 0xE0, 0x7A, 0x5E, 0xC6, 0x8D, 0xCC, 0x67,  // ..z^...g
                /* 0DF0 */  0x79, 0x1F, 0xEF, 0xD9, 0x61, 0x02, 0xDE, 0x81,  // y...a...
                /* 0DF8 */  0x1E, 0x7B, 0xCC, 0x01, 0x8E, 0xC3, 0x31, 0x34,  // .{....14
                /* 0E00 */  0x3B, 0x92, 0x80, 0x69, 0x84, 0x6C, 0x99, 0x47,  // ;..i.l.G
                /* 0E08 */  0x0E, 0xF7, 0x2C, 0x0F, 0x9C, 0xFE, 0xFF, 0xC7,  // ..,.....
                /* 0E10 */  0x1C, 0xE0, 0x6F, 0xE8, 0x98, 0x03, 0xB4, 0x0E,  // ..o.....
                /* 0E18 */  0x01, 0xE0, 0x3C, 0x47, 0xC0, 0x39, 0xF8, 0xB0,  // ..<G.9..
                /* 0E20 */  0x73, 0x04, 0x60, 0xE2, 0xF4, 0x05, 0xEE, 0x31,  // s.`....1
                /* 0E28 */  0xC3, 0xF9, 0xFF, 0x9F, 0x23, 0x00, 0xB7, 0x8A,  // ....#...
                /* 0E30 */  0x4E, 0x5F, 0x40, 0xEF, 0x10, 0x00, 0x2E, 0xD9,  // N_@.....
                /* 0E38 */  0xE7, 0x08, 0x94, 0x34, 0x08, 0x85, 0x39, 0x7D,  // ...4..9}
                /* 0E40 */  0x41, 0x1A, 0xF4, 0x01, 0xC4, 0x3F, 0xC2, 0x63,  // A....?.c
                /* 0E48 */  0xF1, 0x10, 0xAC, 0xF1, 0xD6, 0x83, 0x24, 0xF0,  // ......$.
                /* 0E50 */  0x69, 0x1E, 0xF8, 0xFC, 0xFF, 0x4F, 0xF3, 0xC0,  // i....O..
                /* 0E58 */  0x63, 0x7A, 0xF8, 0x4B, 0x12, 0x78, 0x4E, 0xF3,  // cz.K.xN.
                /* 0E60 */  0x80, 0x43, 0x47, 0xA7, 0x79, 0xA0, 0x75, 0x0A,  // .CG.y.u.
                /* 0E68 */  0x00, 0xAF, 0xF4, 0xB3, 0x04, 0x4A, 0xD2, 0x21,  // .....J.!
                /* 0E70 */  0x9A, 0x1E, 0x7A, 0xD8, 0xED, 0x15, 0x3F, 0x91,  // ..z...?.
                /* 0E78 */  0xFF, 0xFF, 0x89, 0xF0, 0x93, 0x05, 0x39, 0x47,  // ......9G
                /* 0E80 */  0xA0, 0xCE, 0x38, 0x96, 0x7B, 0x8E, 0x40, 0x9D,  // ..8.{.@.
                /* 0E88 */  0xE9, 0x7D, 0xAA, 0xE7, 0xE7, 0x08, 0x87, 0x3F,  // .}.....?
                /* 0E90 */  0x47, 0x40, 0x3F, 0xD7, 0xFB, 0xDC, 0x05, 0x7F,  // G@?.....
                /* 0E98 */  0x38, 0x87, 0x0C, 0x16, 0xD7, 0x67, 0x5D, 0x08,  // 8....g].
                /* 0EA0 */  0x63, 0xF5, 0xF0, 0x18, 0x4C, 0xAC, 0xB3, 0x8E,  // c...L...
                /* 0EA8 */  0x10, 0xC4, 0x47, 0x12, 0x23, 0xFB, 0x3E, 0x62,  // ..G.#.>b
                /* 0EB0 */  0xEF, 0x73, 0x26, 0x63, 0x38, 0x12, 0x9F, 0x24,  // .s&c8..$
                /* 0EB8 */  0x00, 0x27, 0xE7, 0x11, 0x9F, 0x24, 0xC0, 0x75,  // .'...$.u
                /* 0EC0 */  0x44, 0xF0, 0x49, 0x02, 0x5C, 0x60, 0xCF, 0x01,  // D.I.\`..
                /* 0EC8 */  0x60, 0xF9, 0xFF, 0x1F, 0xBD, 0xF8, 0x49, 0x00,  // `.....I.
                /* 0ED0 */  0x8C, 0x60, 0x41, 0x62, 0xBC, 0xB6, 0x5A, 0xFC,  // .`Ab..Z.
                /* 0ED8 */  0x69, 0x02, 0x4A, 0x94, 0x13, 0x3E, 0xC4, 0xD3,  // i.J..>..
                /* 0EE0 */  0x04, 0xF6, 0xCC, 0x0A, 0x78, 0x39, 0x29, 0xF1,  // ....x9).
                /* 0EE8 */  0x61, 0xC3, 0x87, 0xED, 0x6B, 0xDE, 0x88, 0x13,  // a...k...
                /* 0EF0 */  0x18, 0xE0, 0xE8, 0xCC, 0x8A, 0xFF, 0xFF, 0x1F,  // ........
                /* 0EF8 */  0x27, 0xE0, 0x5B, 0x3A, 0xB3, 0x02, 0xAD, 0x83,  // '.[:....
                /* 0F00 */  0x00, 0x70, 0x10, 0xBD, 0x40, 0x9D, 0x26, 0xB8,  // .p..@.&.
                /* 0F08 */  0xA8, 0x23, 0xB5, 0x5F, 0x0E, 0x3A, 0xE6, 0x73,  // .#._.:.s
                /* 0F10 */  0xD0, 0xA3, 0x31, 0xFA, 0x81, 0xB0, 0x11, 0xBF,  // ..1.....
                /* 0F18 */  0xFA, 0x78, 0x0C, 0x31, 0x4E, 0xD3, 0x57, 0x30,  // .x.1N.W0
                /* 0F20 */  0x1F, 0x2E, 0x7C, 0x8E, 0xF0, 0x31, 0xC2, 0xA2,  // ..|..1..
                /* 0F28 */  0x29, 0x24, 0xEB, 0x38, 0x81, 0x12, 0x72, 0x9C,  // )$.8..r.
                /* 0F30 */  0xA0, 0x20, 0x06, 0x74, 0xCA, 0xE3, 0x04, 0xFA,  // . .t....
                /* 0F38 */  0x88, 0xC3, 0x86, 0xF0, 0xB8, 0xE1, 0x5C, 0xA7,  // ......\.
                /* 0F40 */  0x09, 0x3A, 0x56, 0x8F, 0x9C, 0x6B, 0x38, 0xEA,  // .:V..k8.
                /* 0F48 */  0x20, 0x60, 0x5F, 0xD0, 0x0E, 0x1A, 0x2C, 0x93,  //  `_...,.
                /* 0F50 */  0xC3, 0xEF, 0xF2, 0x04, 0x3C, 0x36, 0xCF, 0xC4,  // ....<6..
                /* 0F58 */  0x6A, 0xEE, 0x06, 0xA8, 0x79, 0xF8, 0x0A, 0x81,  // j...y...
                /* 0F60 */  0xD1, 0x75, 0x84, 0x00, 0x99, 0xBE, 0x1B, 0x04,  // .u......
                /* 0F68 */  0x84, 0xFF, 0xFF, 0x0D, 0x02, 0x5C, 0xE8, 0xFC,  // .....\..
                /* 0F70 */  0x20, 0xE7, 0xB1, 0x73, 0x39, 0x63, 0xA7, 0x20,  //  ..s9c. 
                /* 0F78 */  0x1E, 0xBB, 0xA3, 0x8E, 0x1D, 0x2D, 0x05, 0x44,  // .....-.D
                /* 0F80 */  0x83, 0xF5, 0x7D, 0x00, 0x4B, 0x30, 0xD6, 0xD9,  // ..}.K0..
                /* 0F88 */  0x04, 0x14, 0xF2, 0x4E, 0x38, 0x20, 0x1A, 0x08,  // ...N8 ..
                /* 0F90 */  0x3B, 0x74, 0x79, 0x22, 0xFC, 0x3C, 0x02, 0x6F,  // ;ty".<.o
                /* 0F98 */  0x6C, 0x3E, 0x8F, 0x00, 0xEF, 0x70, 0xE7, 0x11,  // l>...p..
                /* 0FA0 */  0xD0, 0x69, 0x3A, 0x8F, 0x80, 0x4E, 0xEC, 0x79,  // .i:..N.y
                /* 0FA8 */  0x04, 0x74, 0xA7, 0x09, 0xFF, 0xFF, 0x4F, 0x13,  // .t....O.
                /* 0FB0 */  0xD8, 0xAB, 0x01, 0xBF, 0x02, 0xE0, 0x0E, 0x97,  // ........
                /* 0FB8 */  0x3A, 0x27, 0xA1, 0x4F, 0x47, 0x3E, 0x8A, 0xC0,  // :'.OG>..
                /* 0FC0 */  0xBA, 0x71, 0xFA, 0x80, 0x70, 0x56, 0x26, 0xB0,  // .q..pV&.
                /* 0FC8 */  0xCC, 0x73, 0x12, 0xEA, 0xF8, 0x66, 0x79, 0xC7,  // .s...fy.
                /* 0FD0 */  0x07, 0x94, 0x20, 0x38, 0x0A, 0xE2, 0xE3, 0x83,  // .. 8....
                /* 0FD8 */  0x0F, 0x6F, 0x3E, 0x27, 0xC1, 0x1D, 0xBF, 0x0F,  // .o>'....
                /* 0FE0 */  0x0F, 0xF0, 0x45, 0x9E, 0x45, 0x40, 0x3C, 0x57,  // ..E.E@<W
                /* 0FE8 */  0x0F, 0x0F, 0x73, 0x3C, 0x02, 0x9C, 0x04, 0x3B,  // ..s<...;
                /* 0FF0 */  0x3F, 0x80, 0xCE, 0xD3, 0xF9, 0x01, 0x34, 0xFF,  // ?.....4.
                /* 0FF8 */  0xFF, 0xF3, 0x03, 0x1F, 0xD0, 0xF3, 0x03, 0xF8,  // ........
                /* 1000 */  0x4F, 0x00, 0x58, 0x91, 0xA7, 0x07, 0x14, 0x87,  // O.X.....
                /* 1008 */  0xE5, 0x1F, 0x76, 0x21, 0xCD, 0x21, 0x50, 0xF8,  // ..v!.!P.
                /* 1010 */  0xD7, 0x16, 0x1F, 0xC8, 0xC9, 0xE1, 0x01, 0x75,  // .......u
                /* 1018 */  0xFE, 0xF6, 0x01, 0xC2, 0x87, 0x07, 0x2E, 0x0C,  // ........
                /* 1020 */  0x8E, 0x82, 0xF8, 0xF0, 0xE0, 0xD0, 0x87, 0x07,  // ........
                /* 1028 */  0xE8, 0x21, 0x0F, 0x0F, 0xA0, 0x38, 0x7C, 0x80,  // .!...8|.
                /* 1030 */  0x67, 0x74, 0xD8, 0x39, 0x9E, 0x5D, 0x5B, 0xC3,  // gt.9.][.
                /* 1038 */  0x43, 0x9C, 0x4A, 0xF1, 0x07, 0x08, 0xC0, 0xCB,  // C.J.....
                /* 1040 */  0x79, 0x06, 0xDE, 0xFF, 0xFF, 0x00, 0x01, 0xEF,  // y.......
                /* 1048 */  0x10, 0xE6, 0xF3, 0x0C, 0x70, 0x3A, 0x03, 0x80,  // ....p:..
                /* 1050 */  0x4F, 0xDC, 0x11, 0x02, 0x2D, 0xFD, 0x3C, 0x83,  // O...-.<.
                /* 1058 */  0x38, 0x3F, 0x60, 0x40, 0x1E, 0xDB, 0xB0, 0xA7,  // 8?`@....
                /* 1060 */  0x6E, 0x1F, 0x21, 0xB8, 0x48, 0x0A, 0x1D, 0x20,  // n.!.H.. 
                /* 1068 */  0x7D, 0x84, 0xE0, 0xA2, 0xE0, 0x28, 0x88, 0x8F,  // }....(..
                /* 1070 */  0x10, 0x0E, 0x7C, 0x84, 0x80, 0x7E, 0x66, 0xF6,  // ..|..~f.
                /* 1078 */  0x11, 0x02, 0xFE, 0xF9, 0x03, 0x7C, 0xA3, 0xC5,  // .....|..
                /* 1080 */  0xCE, 0x0F, 0x77, 0xA0, 0x01, 0xC6, 0xFF, 0xFF,  // ..w.....
                /* 1088 */  0x03, 0x0D, 0xF0, 0x32, 0x75, 0xA0, 0x01, 0x7A,  // ...2u..z
                /* 1090 */  0x27, 0x00, 0xF8, 0xC7, 0x07, 0x38, 0x67, 0x5D,  // '....8g]
                /* 1098 */  0x76, 0x7C, 0x00, 0xF6, 0x07, 0x6E, 0xDC, 0x68,  // v|...n.h
                /* 10A0 */  0xC1, 0x73, 0x32, 0xE6, 0xC7, 0x07, 0xE0, 0xF4,  // .s2.....
                /* 10A8 */  0xFF, 0x3F, 0x3E, 0x00, 0x3E, 0x54, 0x1D, 0x1F,  // .?>.>T..
                /* 10B0 */  0x80, 0xD6, 0x09, 0x00, 0x3C, 0x52, 0xCF, 0x7A,  // ....<R.z
                /* 10B8 */  0xE8, 0x08, 0xC7, 0x2B, 0x48, 0x38, 0x8F, 0xDB,  // ...+H8..
                /* 10C0 */  0x46, 0xF1, 0x41, 0xF5, 0xE1, 0xCF, 0xC7, 0x6B,  // F.A....k
                /* 10C8 */  0x76, 0x7E, 0xE0, 0x47, 0x08, 0x1F, 0xB0, 0x7C,  // v~.G...|
                /* 10D0 */  0x7E, 0xE0, 0xD2, 0xE0, 0x28, 0x88, 0xCF, 0x0F,  // ~...(...
                /* 10D8 */  0x8E, 0x7D, 0x7E, 0x80, 0x7E, 0x32, 0xF6, 0x69,  // .}~.~2.i
                /* 10E0 */  0x06, 0xBE, 0xDC, 0xC3, 0x10, 0x68, 0xA7, 0x87,  // .....h..
                /* 10E8 */  0x81, 0x39, 0x3E, 0xFF, 0xFF, 0xCF, 0x8A, 0xBE,  // .9>.....
                /* 10F0 */  0x0D, 0xE1, 0x8F, 0x10, 0x80, 0x93, 0x78, 0x47,  // ......xG
                /* 10F8 */  0x08, 0xD0, 0xB9, 0x3A, 0x42, 0x80, 0xEE, 0x10,  // ...:B...
                /* 1100 */  0x00, 0xDC, 0xCE, 0x34, 0x30, 0x8F, 0x10, 0xF8,  // ...40...
                /* 1108 */  0x21, 0xBE, 0x8D, 0xF2, 0x33, 0x0D, 0xF0, 0xFC,  // !...3...
                /* 1110 */  0xFF, 0x9F, 0x69, 0xC0, 0x3B, 0x5C, 0x38, 0xF3,  // ..i.;\8.
                /* 1118 */  0xC3, 0x9C, 0x69, 0x00, 0x8B, 0xA0, 0x3E, 0xD3,  // ..i...>.
                /* 1120 */  0x00, 0xB7, 0x13, 0x00, 0xFC, 0xF3, 0x1E, 0xCC,  // ........
                /* 1128 */  0xE3, 0x03, 0x30, 0xF9, 0xFF, 0x9F, 0xF7, 0x80,  // ..0.....
                /* 1130 */  0xEF, 0xF1, 0x01, 0x70, 0x7C, 0x91, 0x7A, 0xDE,  // ...p|.z.
                /* 1138 */  0x03, 0x76, 0x27, 0x00, 0xF8, 0x62, 0x8F, 0x0F,  // .v'..b..
                /* 1140 */  0xA8, 0x23, 0xAA, 0x4F, 0x58, 0x3E, 0x3E, 0xC0,  // .#.OX>>.
                /* 1148 */  0x02, 0xFA, 0xFF, 0xC7, 0xF2, 0x44, 0x0C, 0xD3,  // .....D..
                /* 1150 */  0xF3, 0x89, 0x18, 0x90, 0x33, 0x5E, 0x38, 0xF3,  // ....3^8.
                /* 1158 */  0xC3, 0x1E, 0x21, 0x00, 0x43, 0x87, 0x10, 0x1F,  // ..!.C...
                /* 1160 */  0x21, 0xC0, 0xA5, 0xEB, 0x08, 0x01, 0x3A, 0xC1,  // !.....:.
                /* 1168 */  0x67, 0x00, 0x50, 0xFE, 0xFF, 0x8F, 0x10, 0xF8,  // g.P.....
                /* 1170 */  0x53, 0x00, 0xDC, 0x53, 0x3A, 0xEE, 0x18, 0xE1,  // S..S:...
                /* 1178 */  0x00, 0xC7, 0x08, 0xC4, 0x74, 0x63, 0xF6, 0x8E,  // ....tc..
                /* 1180 */  0xA2, 0x31, 0x1C, 0xF5, 0x09, 0x1E, 0x85, 0xE1,  // .1......
                /* 1188 */  0xE3, 0x3C, 0x55, 0x20, 0x8F, 0x11, 0xA8, 0x53,  // .<U ...S
                /* 1190 */  0x84, 0xCF, 0x35, 0x3E, 0x46, 0x70, 0x59, 0x70,  // ..5>FpYp
                /* 1198 */  0x14, 0xC4, 0xC7, 0x08, 0x47, 0x3E, 0x46, 0x40,  // ....G>F@
                /* 11A0 */  0x8F, 0x78, 0x8C, 0x00, 0xC5, 0x81, 0xE0, 0x98,  // .x......
                /* 11A8 */  0xC1, 0x36, 0x41, 0x0C, 0xCC, 0x11, 0xE2, 0x26,  // .6A....&
                /* 11B0 */  0x8C, 0x3B, 0x45, 0x00, 0x4E, 0xA2, 0x9D, 0x22,  // .;E.N.."
                /* 11B8 */  0x40, 0xE7, 0xEB, 0x14, 0x81, 0xFE, 0xFF, 0x9F,  // @.......
                /* 11C0 */  0x22, 0xE0, 0x1F, 0x01, 0x80, 0xD3, 0x11, 0x02,  // ".......
                /* 11C8 */  0xC7, 0x61, 0xF9, 0x47, 0x08, 0x14, 0x6E, 0x4C,  // .a.G..nL
                /* 11D0 */  0x1F, 0x11, 0x4E, 0x24, 0xCE, 0x61, 0x9D, 0xC6,  // ..N$.a..
                /* 11D8 */  0x33, 0x60, 0xA0, 0xC7, 0x1A, 0xC0, 0x11, 0xC8,  // 3`......
                /* 11E0 */  0x71, 0xBC, 0x0C, 0xF8, 0xF6, 0xC1, 0x86, 0x88,  // q.......
                /* 11E8 */  0x05, 0x3A, 0x45, 0xCC, 0x09, 0x02, 0xF0, 0xF1,  // .:E.....
                /* 11F0 */  0xFF, 0x27, 0x70, 0xB8, 0x13, 0x04, 0xE8, 0x86,  // .'p.....
                /* 11F8 */  0xE6, 0x13, 0x04, 0xB8, 0xCE, 0x00, 0xC0, 0xEB,  // ........
                /* 1200 */  0xA8, 0x85, 0x1B, 0x86, 0x0F, 0x35, 0x3E, 0x1B,  // .....5>.
                /* 1208 */  0xC3, 0xF0, 0x79, 0x11, 0x20, 0xA2, 0x0F, 0x10,  // ..y. ...
                /* 1210 */  0xA8, 0x33, 0x84, 0x0F, 0x35, 0x3E, 0x40, 0x70,  // .3..5>@p
                /* 1218 */  0x79, 0x70, 0x14, 0xC4, 0x07, 0x08, 0x47, 0x3F,  // yp....G?
                /* 1220 */  0x40, 0x40, 0x8F, 0x7A, 0x80, 0x00, 0xC5, 0x78,  // @@.z...x
                /* 1228 */  0x3D, 0x5A, 0x70, 0xCC, 0xAB, 0xF6, 0xBB, 0x07,  // =Zp.....
                /* 1230 */  0x45, 0x0C, 0x67, 0x1C, 0x5F, 0x60, 0xF1, 0x40,  // E.g._`.@
                /* 1238 */  0xC1, 0xE3, 0xC4, 0x0E, 0x51, 0x31, 0xA2, 0x4E,  // ....Q1.N
                /* 1240 */  0x02, 0x21, 0xA2, 0xBD, 0x60, 0x3F, 0x43, 0x00,  // .!..`?C.
                /* 1248 */  0x8B, 0xFF, 0xFF, 0x19, 0x02, 0xF8, 0x9C, 0x8B,  // ........
                /* 1250 */  0x7C, 0x86, 0x00, 0x97, 0xB1, 0x33, 0x04, 0xE8,  // |....3..
                /* 1258 */  0x8E, 0x01, 0xC0, 0xF1, 0x38, 0x8A, 0x1B, 0x89,  // ....8...
                /* 1260 */  0x85, 0x1F, 0x6C, 0x10, 0x67, 0x08, 0x9F, 0xDE,  // ..l.g...
                /* 1268 */  0x71, 0xC7, 0x2C, 0xC0, 0xD0, 0x90, 0x61, 0xDD,  // q.,...a.
                /* 1270 */  0xF5, 0x3D, 0x42, 0xF6, 0xFF, 0x1F, 0xA1, 0x8F,  // .=B.....
                /* 1278 */  0x59, 0x80, 0xC3, 0xF9, 0xF8, 0x98, 0x05, 0xDC,  // Y.......
                /* 1280 */  0x8E, 0x00, 0xE0, 0x38, 0x3E, 0xC0, 0x39, 0x04,  // ...8>.9.
                /* 1288 */  0xB2, 0xE3, 0x03, 0xB0, 0x3E, 0xA8, 0xE3, 0x06,  // ....>...
                /* 1290 */  0x0B, 0xEF, 0xFF, 0x7F, 0xAE, 0x86, 0x77, 0x7C,  // ......w|
                /* 1298 */  0x00, 0x3C, 0x0F, 0xE8, 0xF1, 0x01, 0x58, 0x1D,  // .<....X.
                /* 12A0 */  0x01, 0xC0, 0x25, 0xF5, 0xF8, 0x80, 0x1A, 0x93,  // ..%.....
                /* 12A8 */  0x43, 0x1C, 0x1F, 0x10, 0xE3, 0x8D, 0xFC, 0xC4,  // C.......
                /* 12B0 */  0x75, 0x70, 0x51, 0x0E, 0xF9, 0x30, 0x0C, 0xF2,  // upQ..0..
                /* 12B8 */  0xCC, 0xE5, 0x69, 0x9D, 0xC5, 0x93, 0x60, 0x9C,  // ..i...`.
                /* 12C0 */  0xC3, 0xF0, 0xB9, 0x0F, 0xFC, 0xFF, 0xFF, 0x73,  // .......s
                /* 12C8 */  0x1F, 0x78, 0xCE, 0x10, 0xB8, 0x43, 0x1A, 0x78,  // .x...C.x
                /* 12D0 */  0x46, 0xCC, 0x67, 0x88, 0x39, 0x35, 0x7A, 0x88,  // F.g.95z.
                /* 12D8 */  0xB8, 0x81, 0x7B, 0x8A, 0x98, 0x73, 0x1F, 0xE0,  // ..{..s..
                /* 12E0 */  0x50, 0xDA, 0xB9, 0x0F, 0x68, 0x9D, 0x01, 0xC0,  // P...h...
                /* 12E8 */  0x77, 0x36, 0x86, 0x33, 0x02, 0x36, 0x91, 0x67,  // w6.3.6.g
                /* 12F0 */  0x1A, 0xC3, 0xF3, 0xFF, 0xFF, 0x21, 0x02, 0xCE,  // .....!..
                /* 12F8 */  0xB9, 0x06, 0xF0, 0x33, 0x41, 0x76, 0x86, 0x00,  // ...3Av..
                /* 1300 */  0x8C, 0x9D, 0x6B, 0xC0, 0x67, 0xED, 0x5C, 0x03,  // ..k.g.\.
                /* 1308 */  0xF4, 0x8E, 0x00, 0xFE, 0xFF, 0x1F, 0x01, 0xE0,  // ........
                /* 1310 */  0xA7, 0x58, 0x9A, 0x8E, 0x10, 0x5C, 0x12, 0x84,  // .X...\..
                /* 1318 */  0x52, 0xBD, 0x16, 0x74, 0x12, 0xF5, 0x38, 0x8F,  // R..t..8.
                /* 1320 */  0xC3, 0xD0, 0x4F, 0xA2, 0x46, 0x89, 0x7C, 0x04,  // ..O.F.|.
                /* 1328 */  0xB5, 0x5E, 0x16, 0x84, 0xFF, 0x92, 0xF3, 0xB0,  // .^......
                /* 1330 */  0xCE, 0x32, 0x80, 0xEA, 0xE8, 0xE0, 0x93, 0x83,  // .2......
                /* 1338 */  0xD5, 0x53, 0x48, 0xD7, 0x09, 0x02, 0xA5, 0xE4,  // .SH.....
                /* 1340 */  0x04, 0x41, 0x41, 0x0C, 0xE8, 0x98, 0x27, 0x08,  // .AA...'.
                /* 1348 */  0xF4, 0xC1, 0x81, 0xCD, 0xB2, 0x78, 0x10, 0x05,  // .....x..
                /* 1350 */  0x3B, 0x40, 0xD0, 0x41, 0x7A, 0xC8, 0x5C, 0xC3,  // ;@.Az.\.
                /* 1358 */  0x01, 0x02, 0x01, 0x5B, 0xE4, 0x68, 0x41, 0x33,  // ...[.hA3
                /* 1360 */  0xB0, 0xA3, 0xF7, 0x49, 0x9F, 0xDD, 0x04, 0x0C,  // ...I....
                /* 1368 */  0x16, 0xF3, 0xA1, 0xD1, 0x58, 0xA1, 0x1E, 0x42,  // ....X..B
                /* 1370 */  0x12, 0x54, 0x73, 0x2A, 0x40, 0x0D, 0xC4, 0x87,  // .Ts*@...
                /* 1378 */  0x07, 0x8C, 0xAE, 0xBB, 0x03, 0xC8, 0xF4, 0x9D,  // ........
                /* 1380 */  0x1D, 0x40, 0x8E, 0xCE, 0x6F, 0x90, 0xC0, 0xF4,  // .@..o...
                /* 1388 */  0xFF, 0x3F, 0x7B, 0xD8, 0x37, 0x05, 0x06, 0xF3,  // .?{.7...
                /* 1390 */  0xDC, 0xE0, 0xE3, 0x95, 0x51, 0x42, 0xC6, 0x78,  // ....QB.x
                /* 1398 */  0xC2, 0x7A, 0x55, 0xE0, 0x17, 0x00, 0xDC, 0x65,  // .zU....e
                /* 13A0 */  0x04, 0xDE, 0x7D, 0x8A, 0x5C, 0x46, 0x80, 0xF6,  // ..}.\F..
                /* 13A8 */  0x35, 0xC2, 0x97, 0x11, 0x70, 0x69, 0xBB, 0x8C,  // 5...pi..
                /* 13B0 */  0x80, 0x0E, 0xEB, 0x0D, 0x12, 0x6C, 0x73, 0xF1,  // .....ls.
                /* 13B8 */  0xEC, 0x71, 0x97, 0x00, 0xC3, 0xC4, 0x78, 0x0F,  // .q....x.
                /* 13C0 */  0xF0, 0x1D, 0x04, 0x73, 0x21, 0xF1, 0x54, 0x1F,  // ...s!.T.
                /* 13C8 */  0x05, 0x70, 0x04, 0xBE, 0x47, 0xE2, 0x38, 0x7C,  // .p..G.8|
                /* 13D0 */  0xAB, 0xC5, 0x4C, 0xF7, 0x2C, 0x8C, 0x7E, 0x60,  // ..L.,.~`
                /* 13D8 */  0x81, 0x3D, 0xCB, 0x83, 0x34, 0x34, 0xBB, 0xB3,  // .=..44..
                /* 13E0 */  0xF9, 0x8A, 0xC4, 0x25, 0x52, 0x48, 0xE0, 0x31,  // ...%RH.1
                /* 13E8 */  0x02, 0x25, 0x09, 0x8E, 0xFC, 0xFF, 0x41, 0xD8,  // .%....A.
                /* 13F0 */  0x31, 0xC2, 0x71, 0x8F, 0x11, 0xD0, 0xE3, 0x1D,  // 1.q.....
                /* 13F8 */  0x23, 0x40, 0x71, 0x2F, 0x78, 0x8C, 0x00, 0xD3,  // #@q/x...
                /* 1400 */  0xD8, 0x3C, 0xC4, 0xE3, 0xF3, 0x68, 0x3D, 0x3E,  // .<...h=>
                /* 1408 */  0x06, 0x74, 0x7E, 0x98, 0x0B, 0x12, 0xE0, 0xD0,  // .t~.....
                /* 1410 */  0xDB, 0xAD, 0x16, 0xE8, 0x1D, 0x01, 0xC0, 0x11,  // ........
                /* 1418 */  0xEF, 0x75, 0x60, 0x02, 0x89, 0x3F, 0x2A, 0x28,  // .u`..?*(
                /* 1420 */  0x10, 0x0C, 0xEA, 0xA6, 0xE3, 0x93, 0xC0, 0xFF,  // ........
                /* 1428 */  0xFF, 0x19, 0x01, 0x3B, 0xC4, 0xE0, 0x07, 0x76,  // ...;...v
                /* 1430 */  0x4C, 0xEC, 0xAE, 0x64, 0x38, 0x3E, 0x7A, 0x8F,  // L..d8>z.
                /* 1438 */  0xE9, 0xB9, 0xFB, 0x78, 0xCE, 0xE3, 0x54, 0x3D,  // ...x..T=
                /* 1440 */  0xA9, 0x90, 0xEC, 0xAE, 0xE7, 0xC1, 0x71, 0x29,  // ......q)
                /* 1448 */  0x87, 0x09, 0x9F, 0xA0, 0xC8, 0xF1, 0xE2, 0xFD,  // ........
                /* 1450 */  0xC8, 0x77, 0x38, 0x3E, 0x6E, 0x86, 0xC6, 0xA1,  // .w8>n...
                /* 1458 */  0xB1, 0xC3, 0xF0, 0x85, 0xE0, 0x2D, 0xC6, 0xB3,  // .....-..
                /* 1460 */  0xF3, 0xE9, 0x82, 0x4D, 0xE8, 0x69, 0xA0, 0xDC,  // ...M.i..
                /* 1468 */  0x8B, 0x82, 0xEE, 0x4B, 0x51, 0x63, 0x34, 0x77,  // ...KQc4w
                /* 1470 */  0xD1, 0x64, 0xC3, 0x06, 0xCD, 0x8C, 0x4F, 0xD8,  // .d....O.
                /* 1478 */  0x48, 0xC7, 0xE3, 0xA3, 0x3A, 0x76, 0xDE, 0xCF,  // H...:v..
                /* 1480 */  0x4B, 0xBE, 0x8C, 0xC4, 0x31, 0xC4, 0x1B, 0xA9,  // K...1...
                /* 1488 */  0xAF, 0x03, 0x3E, 0x82, 0xF8, 0x84, 0x82, 0x3B,  // ..>....;
                /* 1490 */  0x6D, 0x18, 0x32, 0xF6, 0x01, 0x9A, 0xC0, 0xEE,  // m.2.....
                /* 1498 */  0x05, 0x28, 0x14, 0xA0, 0x71, 0x2E, 0x9A, 0xD2,  // .(..q...
                /* 14A0 */  0x23, 0x44, 0x88, 0xE2, 0xEE, 0xF6, 0xB2, 0x75,  // #D.....u
                /* 14A8 */  0x6F, 0xD0, 0xB1, 0x21, 0xC2, 0x6B, 0x44, 0x94,  // o..!.kD.
                /* 14B0 */  0x48, 0x2F, 0x66, 0x27, 0x16, 0x8A, 0x61, 0x44,  // H/f'..aD
                /* 14B8 */  0x79, 0x57, 0x88, 0x62, 0xE0, 0xD0, 0x8F, 0x30,  // yW.b...0
                /* 14C0 */  0x61, 0x43, 0x1B, 0xF0, 0x45, 0x22, 0x44, 0xA4,  // aC..E"D.
                /* 14C8 */  0x38, 0xED, 0x5F, 0x09, 0xD9, 0xEB, 0x41, 0xC7,  // 8._...A.
                /* 14D0 */  0x01, 0x47, 0x1A, 0x0D, 0xEA, 0x4C, 0xE1, 0x23,  // .G...L.#
                /* 14D8 */  0x81, 0x8F, 0x03, 0x27, 0xF5, 0xD8, 0xCA, 0x40,  // ...'...@
                /* 14E0 */  0x0E, 0xEE, 0xC0, 0x1E, 0x30, 0x9E, 0x05, 0x3C,  // ....0..<
                /* 14E8 */  0x6A, 0x76, 0x10, 0xF1, 0x61, 0xC2, 0x87, 0x03,  // jv..a...
                /* 14F0 */  0xBC, 0x6B, 0x40, 0x5D, 0xEE, 0x7D, 0x26, 0xF0,  // .k@].}&.
                /* 14F8 */  0x18, 0x0D, 0xC7, 0x87, 0xE8, 0xE9, 0x7A, 0x02,  // ......z.
                /* 1500 */  0x87, 0xC8, 0x00, 0x7D, 0xFA, 0x80, 0xF5, 0xFF,  // ...}....
                /* 1508 */  0x3F, 0x7D, 0x60, 0xC6, 0xE3, 0x43, 0x80, 0x67,  // ?}`..C.g
                /* 1510 */  0x6E, 0x02, 0xCB, 0x1F, 0x04, 0x6A, 0x64, 0x86,  // n....jd.
                /* 1518 */  0xF6, 0x3C, 0x4F, 0xEB, 0x5D, 0xC0, 0x07, 0x00,  // .<O.]...
                /* 1520 */  0x5F, 0x1D, 0xC9, 0x45, 0x8D, 0x8E, 0x07, 0xFC,  // _..E....
                /* 1528 */  0x8A, 0x0F, 0x08, 0x3A, 0xCF, 0xF9, 0x62, 0xC6,  // ...:..b.
                /* 1530 */  0x4E, 0x0A, 0x3A, 0x58, 0xE8, 0x4C, 0x83, 0x3B,  // N.:X.L.;
                /* 1538 */  0x53, 0xF8, 0x9C, 0xC0, 0xE1, 0x9F, 0x11, 0x30,  // S......0
                /* 1540 */  0xF0, 0xAF, 0x08, 0xFC, 0x30, 0xC2, 0x02, 0x9F,  // ....0...
                /* 1548 */  0x6C, 0xE8, 0x65, 0xD3, 0x07, 0x13, 0x7E, 0xAC,  // l.e...~.
                /* 1550 */  0xF0, 0x89, 0x82, 0xDD, 0x71, 0x38, 0x2C, 0x3B,  // ....q8,;
                /* 1558 */  0xEF, 0x78, 0x78, 0xF0, 0x05, 0x1F, 0x27, 0x80,  // .xx...'.
                /* 1560 */  0xD6, 0x41, 0x82, 0x0F, 0x1B, 0xFE, 0x95, 0xC2,  // .A......
                /* 1568 */  0xC0, 0x3E, 0xE2, 0xF0, 0x23, 0x07, 0xEE, 0x88,  // .>..#...
                /* 1570 */  0x03, 0x0F, 0x25, 0xFA, 0xF3, 0xC3, 0x0B, 0xD4,  // ..%.....
                /* 1578 */  0x43, 0x61, 0x88, 0x68, 0xAF, 0x2E, 0xEF, 0x38,  // Ca.h...8
                /* 1580 */  0x4C, 0x2D, 0x8E, 0xB0, 0x82, 0x44, 0x7A, 0xCC,  // L-...Dz.
                /* 1588 */  0x31, 0xD2, 0x81, 0x44, 0x09, 0x12, 0xF2, 0xFF,  // 1..D....
                /* 1590 */  0x1F, 0xD6, 0xB7, 0x19, 0x9F, 0xE6, 0x34, 0x56,  // ......4V
                /* 1598 */  0xF4, 0x38, 0x38, 0xE0, 0x09, 0xB0, 0x71, 0xBC,  // .88...q.
                /* 15A0 */  0xF7, 0x78, 0x2A, 0x87, 0xE5, 0x33, 0x8A, 0x6F,  // .x*..3.o
                /* 15A8 */  0x6D, 0x1E, 0xD4, 0xA3, 0x8A, 0x2F, 0x58, 0x47,  // m..../XG
                /* 15B0 */  0x7A, 0x6A, 0xEF, 0x07, 0x6F, 0x16, 0x1E, 0xB9,  // zj..o...
                /* 15B8 */  0x87, 0x80, 0x39, 0x5C, 0x78, 0x08, 0x7C, 0x00,  // ..9\x.|.
                /* 15C0 */  0x6F, 0x45, 0x67, 0xE9, 0xD3, 0xCD, 0xB9, 0xE1,  // oEg.....
                /* 15C8 */  0x4E, 0x33, 0xFC, 0x8A, 0x80, 0x39, 0x0C, 0xE1,  // N3...9..
                /* 15D0 */  0xE2, 0x1E, 0x6E, 0xE8, 0xFD, 0xD6, 0x01, 0x61,  // ..n....a
                /* 15D8 */  0x50, 0xE7, 0x1B, 0xC0, 0xD5, 0x55, 0xC1, 0xA7,  // P....U..
                /* 15E0 */  0x24, 0xB0, 0xE0, 0xBC, 0x01, 0xBC, 0x22, 0xF9,  // $.....".
                /* 15E8 */  0x84, 0x03, 0x5C, 0xFF, 0xFF, 0x27, 0x1C, 0x86,  // ..\..'..
                /* 15F0 */  0xF6, 0x84, 0x03, 0x26, 0x81, 0x27, 0x1C, 0x80,  // ...&.'..
                /* 15F8 */  0x26, 0xA2, 0x4E, 0x38, 0xE8, 0x23, 0x9B, 0x4F,  // &.N8.#.O
                /* 1600 */  0x0A, 0xEC, 0x8A, 0x03, 0x0E, 0x82, 0xA1, 0xCF,  // ........
                /* 1608 */  0x38, 0x40, 0x67, 0x2C, 0x8F, 0x14, 0x70, 0xFE,  // 8@g,..p.
                /* 1610 */  0xFF, 0x47, 0x0A, 0x60, 0x72, 0xCA, 0x01, 0xEF,  // .G.`r...
                /* 1618 */  0xC1, 0x03, 0x77, 0xCA, 0x01, 0x2F, 0xD2, 0x71,  // ..w../.q
                /* 1620 */  0xBC, 0xC7, 0x3C, 0xE7, 0x00, 0xB6, 0xA2, 0x1C,  // ..<.....
                /* 1628 */  0x72, 0xA8, 0xF4, 0xF7, 0x81, 0xC4, 0xC3, 0xA0,  // r.......
                /* 1630 */  0xCE, 0x39, 0xC0, 0xF6, 0xFF, 0x7F, 0xCE, 0x01,  // .9......
                /* 1638 */  0xFB, 0xF9, 0xC3, 0xA7, 0x08, 0x70, 0x1C, 0x72,  // .....p.r
                /* 1640 */  0xD9, 0xC5, 0xE3, 0xD5, 0xD5, 0x37, 0x5D, 0xDF,  // .....7].
                /* 1648 */  0xC8, 0x0D, 0xF8, 0xB6, 0xCB, 0x10, 0x1E, 0x38,  // .......8
                /* 1650 */  0x7D, 0x85, 0xC0, 0x1D, 0x72, 0xE0, 0xCF, 0xE4,  // }...r...
                /* 1658 */  0x80, 0xDE, 0x6B, 0xDE, 0x1F, 0x8E, 0x28, 0x88,  // ..k...(.
                /* 1660 */  0xAF, 0x36, 0x2F, 0x37, 0xAF, 0x37, 0x71, 0x5E,  // .6/7.7q^
                /* 1668 */  0x74, 0x7C, 0xC8, 0x61, 0x47, 0x1C, 0xA3, 0xC4,  // t|.aG...
                /* 1670 */  0x8B, 0x60, 0xAC, 0x50, 0x3E, 0xDF, 0xBC, 0x4B,  // .`.P>..K
                /* 1678 */  0xC4, 0x7A, 0xDA, 0x31, 0x4A, 0xB8, 0x18, 0xC1,  // .z.1J...
                /* 1680 */  0x82, 0x04, 0x7D, 0xC8, 0x61, 0x12, 0x0E, 0x39,  // ..}.a..9
                /* 1688 */  0x80, 0xFC, 0xFF, 0xFF, 0x21, 0x07, 0x4C, 0xE1,  // ....!.L.
                /* 1690 */  0x0F, 0xCE, 0xE8, 0xE1, 0xFA, 0x98, 0xE0, 0x03,  // ........
                /* 1698 */  0xC1, 0x5B, 0x02, 0xE6, 0x34, 0xF2, 0x72, 0x8D,  // .[..4.r.
                /* 16A0 */  0x09, 0x79, 0xC0, 0x01, 0x3A, 0x27, 0x14, 0xFC,  // .y..:'..
                /* 16A8 */  0x59, 0x02, 0x5C, 0xE7, 0x08, 0xDC, 0xC1, 0x06,  // Y.\.....
                /* 16B0 */  0x7C, 0x27, 0x0D, 0xDC, 0xC1, 0x06, 0xBC, 0xA3,  // |'......
                /* 16B8 */  0xF2, 0xA9, 0x06, 0xB0, 0xF2, 0xFF, 0x3F, 0xD5,  // ......?.
                /* 16C0 */  0x60, 0xA3, 0x1D, 0x69, 0x50, 0x61, 0x4E, 0x35,  // `..iPaN5
                /* 16C8 */  0x80, 0xDE, 0x4B, 0xDE, 0x5B, 0x0A, 0xBB, 0x69,  // ..K.[..i
                /* 16D0 */  0xB0, 0x93, 0x08, 0xBB, 0x3A, 0x3C, 0x07, 0x44,  // ....:<.D
                /* 16D8 */  0x31, 0x44, 0xE4, 0x37, 0xAD, 0xA7, 0x1A, 0x70,  // 1D.7...p
                /* 16E0 */  0xDD, 0x38, 0xDE, 0x04, 0x9E, 0xFF, 0x5E, 0x1E,  // .8....^.
                /* 16E8 */  0x1E, 0x05, 0x4E, 0xE9, 0xF5, 0xE1, 0x39, 0xE6,  // ..N...9.
                /* 16F0 */  0x6D, 0xE6, 0x59, 0xC6, 0x50, 0xEF, 0x82, 0xBE,  // m.Y.P...
                /* 16F8 */  0x01, 0x1A, 0x2E, 0x94, 0x31, 0xC3, 0x05, 0x7B,  // ....1..{
                /* 1700 */  0x17, 0xF4, 0xAC, 0xE2, 0xC5, 0x79, 0xA7, 0x31,  // .....y.1
                /* 1708 */  0x5A, 0xC0, 0xD8, 0x61, 0x42, 0x44, 0x3C, 0xC1,  // Z..aBD<.
                /* 1710 */  0xA7, 0x1A, 0x26, 0xE9, 0x54, 0x03, 0x44, 0xFF,  // ..&.T.D.
                /* 1718 */  0xFF, 0xA7, 0x1A, 0xC0, 0x9E, 0x88, 0x93, 0x20,  // ....... 
                /* 1720 */  0x1A, 0xDA, 0x57, 0x40, 0x7C, 0xE4, 0x23, 0x0D,  // ..W@|.#.
                /* 1728 */  0xD0, 0x39, 0xA4, 0x82, 0xE7, 0x20, 0x01, 0x0B,  // .9... ..
                /* 1730 */  0xE8, 0xFC, 0xF8, 0x59, 0x02, 0xEE, 0xC9, 0x06,  // ...Y....
                /* 1738 */  0x7C, 0xE7, 0x44, 0xDC, 0xC9, 0x06, 0x6C, 0xFF,  // |.D...l.
                /* 1740 */  0xFF, 0x93, 0x0D, 0x66, 0x70, 0x91, 0xA2, 0x84,  // ...fp...
                /* 1748 */  0x36, 0x52, 0x84, 0xB8, 0x27, 0x13, 0x27, 0xE6,  // 6R..'.'.
                /* 1750 */  0xDB, 0x0D, 0xF6, 0x74, 0x03, 0x38, 0x89, 0x7A,  // ...t.8.z
                /* 1758 */  0x6C, 0x46, 0x85, 0x3B, 0x39, 0x03, 0x7A, 0x5D,  // lF.;9.z]
                /* 1760 */  0x1E, 0x51, 0xC8, 0xD9, 0xE1, 0x18, 0x8E, 0xC2,  // .Q......
                /* 1768 */  0xB7, 0x94, 0x28, 0xAF, 0x2C, 0xEC, 0x5E, 0x6A,  // ..(.,.^j
                /* 1770 */  0x94, 0xE7, 0x52, 0x98, 0x04, 0x3E, 0xE0, 0xC0,  // ..R..>..
                /* 1778 */  0xFA, 0xFF, 0x1F, 0x70, 0xF8, 0xE9, 0xCF, 0xC7,  // ...p....
                /* 1780 */  0x65, 0x1F, 0x07, 0x5E, 0x02, 0xCF, 0xE7, 0xAC,  // e..^....
                /* 1788 */  0x1E, 0x70, 0x0C, 0xF4, 0x64, 0xE3, 0x53, 0x20,  // .p..d.S 
                /* 1790 */  0x3B, 0x0B, 0xFA, 0xDA, 0xEC, 0xC3, 0x44, 0xB0,  // ;.....D.
                /* 1798 */  0x27, 0x67, 0x03, 0x47, 0x0D, 0xFA, 0x40, 0x11,  // 'g.G..@.
                /* 17A0 */  0xE3, 0xCD, 0xD9, 0x98, 0x11, 0x62, 0x18, 0xEB,  // .....b..
                /* 17A8 */  0x01, 0x87, 0x89, 0x3B, 0xE0, 0x00, 0x34, 0x91,  // ...;..4.
                /* 17B0 */  0x72, 0xC0, 0x41, 0x0F, 0xD7, 0x27, 0x05, 0x76,  // r.A..'.v
                /* 17B8 */  0x7B, 0x60, 0xC3, 0x7D, 0x76, 0x78, 0x50, 0x60,  // {`.}vxP`
                /* 17C0 */  0x43, 0x62, 0x67, 0x1C, 0x60, 0xF4, 0xFF, 0x3F,  // Cbg.`..?
                /* 17C8 */  0x4E, 0x00, 0xC3, 0x33, 0x0E, 0xF8, 0x86, 0xF3,  // N..3....
                /* 17D0 */  0x8C, 0x03, 0x0C, 0x06, 0x17, 0xE3, 0x40, 0x62,  // ......@b
                /* 17D8 */  0x3E, 0x0E, 0x1A, 0xE6, 0x31, 0xC6, 0x83, 0x09,  // >...1...
                /* 17E0 */  0x19, 0xE2, 0x3D, 0x26, 0xCA, 0x23, 0x21, 0xE0,  // ..=&.#!.
                /* 17E8 */  0x28, 0xDE, 0x11, 0x87, 0xCA, 0x7F, 0x21, 0x28,  // (.....!(
                /* 17F0 */  0x10, 0x0C, 0xEA, 0x94, 0x03, 0x8C, 0xFE, 0xFF,  // ........
                /* 17F8 */  0xA7, 0x1C, 0x60, 0x26, 0xF8, 0x1C, 0x01, 0x1A,  // ..`&....
                /* 1800 */  0xF4, 0x63, 0x39, 0x85, 0x58, 0x91, 0x5E, 0x1F,  // .c9.X.^.
                /* 1808 */  0x9E, 0xBE, 0x18, 0x48, 0xA4, 0x70, 0xE7, 0xE4,  // ...H.p..
                /* 1810 */  0x6B, 0x04, 0xDC, 0x93, 0x33, 0xFC, 0x43, 0x84,  // k...3.C.
                /* 1818 */  0xC7, 0x14, 0xE2, 0xC1, 0xE6, 0xA0, 0xDE, 0x04,  // ........
                /* 1820 */  0x5E, 0x6E, 0x82, 0x9C, 0xC7, 0x53, 0x8E, 0x0F,  // ^n...S..
                /* 1828 */  0x39, 0x3E, 0x33, 0xFB, 0x90, 0x63, 0xA8, 0x77,  // 9>3..c.w
                /* 1830 */  0x9D, 0x58, 0xEF, 0x3A, 0x06, 0x09, 0x15, 0xE1,  // .X.:....
                /* 1838 */  0xAD, 0xD0, 0x57, 0x67, 0x9F, 0xA0, 0x7D, 0xC7,  // ..Wg..}.
                /* 1840 */  0x89, 0x11, 0xEE, 0xA1, 0x10, 0xF0, 0xFB, 0xFF,  // ........
                /* 1848 */  0x3F, 0xE4, 0x00, 0x9B, 0xD7, 0x8C, 0x0F, 0x39,  // ?......9
                /* 1850 */  0xB8, 0x51, 0xF8, 0x8C, 0xC0, 0x09, 0x1C, 0xF8,  // .Q......
                /* 1858 */  0x80, 0x03, 0x74, 0x4E, 0x12, 0xE0, 0x1E, 0xE2,  // ..tN....
                /* 1860 */  0x93, 0x04, 0x18, 0xCE, 0x37, 0xC0, 0x19, 0x32,  // ....7..2
                /* 1868 */  0x50, 0xA8, 0x77, 0x97, 0x33, 0x79, 0x2A, 0xC4,  // P.w.3y*.
                /* 1870 */  0x20, 0xC5, 0x3B, 0xCE, 0x78, 0x3E, 0xDF, 0x00,  //  .;.x>..
                /* 1878 */  0x9F, 0xFF, 0xFF, 0xF9, 0x06, 0x18, 0x05, 0x3E,  // .......>
                /* 1880 */  0xDC, 0xD0, 0x18, 0x0F, 0x04, 0x45, 0x84, 0x41,  // .....E.A
                /* 1888 */  0x9D, 0x6F, 0x00, 0x57, 0x47, 0x04, 0xDC, 0x31,  // .o.WG..1
                /* 1890 */  0x02, 0x7C, 0xA0, 0x61, 0x5F, 0xE7, 0x7D, 0x59,  // .|.a_.}Y
                /* 1898 */  0xE5, 0x67, 0x1C, 0xE0, 0x78, 0x93, 0xF6, 0x19,  // .g..x...
                /* 18A0 */  0x07, 0x3C, 0xE7, 0x42, 0xEC, 0xFF, 0xFF, 0x8C,  // .<.B....
                /* 18A8 */  0x03, 0x30, 0x43, 0xC8, 0x19, 0x07, 0x7A, 0xF0,  // .0C...z.
                /* 18B0 */  0x33, 0x0E, 0xD0, 0x39, 0x4D, 0x80, 0x1B, 0xEA,  // 3..9M...
                /* 18B8 */  0x69, 0x02, 0x8C, 0x83, 0x66, 0xFF, 0xFF, 0x73,  // i...f..s
                /* 18C0 */  0x0E, 0x98, 0xA0, 0x7D, 0xCE, 0x01, 0x4E, 0x50,  // ...}..NP
                /* 18C8 */  0xD1, 0x02, 0x45, 0x78, 0x98, 0x06, 0x3C, 0xC5,  // ..Ex..<.
                /* 18D0 */  0x3D, 0xE5, 0xD0, 0x08, 0xAF, 0x04, 0x05, 0x84,  // =.......
                /* 18D8 */  0x41, 0x1D, 0x74, 0x00, 0x57, 0x87, 0x77, 0xCC,  // A.t.W.w.
                /* 18E0 */  0xFF, 0xFF, 0x2C, 0x01, 0x7B, 0x26, 0xAF, 0x07,  // ..,.{&..
                /* 18E8 */  0x07, 0x73, 0xE0, 0x3E, 0x3F, 0x9C, 0xF8, 0x3B,  // .s.>?..;
                /* 18F0 */  0xC1, 0xF3, 0x81, 0x4F, 0x06, 0x81, 0xDE, 0xBF,  // ...O....
                /* 18F8 */  0x7C, 0xA9, 0x62, 0x60, 0xBE, 0x48, 0xE0, 0x0E,  // |.b`.H..
                /* 1900 */  0x56, 0xD8, 0x93, 0x21, 0xB0, 0x39, 0x4E, 0x3F,  // V..!.9N?
                /* 1908 */  0xE6, 0xC0, 0x95, 0x77, 0xCC, 0x01, 0x68, 0x22,  // ...w..h"
                /* 1910 */  0xE2, 0x98, 0x83, 0xFC, 0xFF, 0x1F, 0x73, 0x60,  // ......s`
                /* 1918 */  0x84, 0x3E, 0xE6, 0x00, 0x9D, 0xB3, 0x04, 0xF0,  // .>......
                /* 1920 */  0x3C, 0xE4, 0x80, 0x2F, 0xC0, 0x21, 0x07, 0x28,  // <../.!.(
                /* 1928 */  0x8C, 0x0E, 0x03, 0xEE, 0xD1, 0x61, 0x2E, 0x87,  // .....a..
                /* 1930 */  0xB0, 0xCE, 0x39, 0x80, 0x93, 0xFF, 0xFF, 0x39,  // ..9....9
                /* 1938 */  0x07, 0x1B, 0xFE, 0x90, 0x43, 0x43, 0x3D, 0x13,  // ....CC=.
                /* 1940 */  0x74, 0xD4, 0xE1, 0x30, 0x3E, 0xE7, 0x00, 0xAE,  // t..0>...
                /* 1948 */  0x62, 0x1C, 0x26, 0x40, 0x73, 0x7C, 0x89, 0xD1,  // b.&@s|..
                /* 1950 */  0xD5, 0x00, 0x04, 0x75, 0x10, 0x4F, 0x2D, 0x3E,  // ...u.O->
                /* 1958 */  0x7B, 0x79, 0x18, 0x07, 0xE7, 0x83, 0xBE, 0xAF,  // {y......
                /* 1960 */  0x5E, 0x18, 0x59, 0xC7, 0x7D, 0x02, 0xF6, 0x34,  // ^.Y.}..4
                /* 1968 */  0xF1, 0x3C, 0xF1, 0x34, 0x66, 0xE0, 0xF3, 0xF2,  // .<.4f...
                /* 1970 */  0x89, 0x20, 0xD2, 0x19, 0xF9, 0xBC, 0x0F, 0xFB,  // . ......
                /* 1978 */  0xC0, 0x03, 0x6C, 0x50, 0x1E, 0x78, 0xE0, 0x4A,  // ..lP.x.J
                /* 1980 */  0x3B, 0xF0, 0x80, 0xF4, 0xFF, 0x7F, 0xE0, 0x01,  // ;.......
                /* 1988 */  0x8C, 0x4B, 0x38, 0xF0, 0xA0, 0xA1, 0x7D, 0xE7,  // .K8...}.
                /* 1990 */  0xC0, 0x1C, 0x73, 0xD8, 0xD1, 0x1A, 0x78, 0x1F,  // ..s...x.
                /* 1998 */  0x34, 0x1E, 0x25, 0xC0, 0x7A, 0xDE, 0x01, 0xDF,  // 4.%.z...
                /* 19A0 */  0x81, 0xC0, 0xC0, 0xEC, 0xFF, 0x7F, 0xDE, 0x01,  // ........
                /* 19A8 */  0x33, 0xE0, 0x91, 0xC4, 0x7A, 0xC3, 0x79, 0xCC,  // 3...z.y.
                /* 19B0 */  0xF1, 0x4C, 0xDE, 0x64, 0x82, 0xBD, 0x52, 0x44,  // .L.d..RD
                /* 19B8 */  0x8A, 0xED, 0x33, 0x0F, 0x3F, 0x24, 0xFA, 0x74,  // ..3.?$.t
                /* 19C0 */  0x0D, 0x58, 0x3A, 0x22, 0xF2, 0xA3, 0xB5, 0x23,  // .X:"...#
                /* 19C8 */  0x9D, 0xAE, 0x01, 0xBD, 0x37, 0x82, 0x47, 0x88,  // ....7.G.
                /* 19D0 */  0xC3, 0xF1, 0x0D, 0xD6, 0x83, 0xF8, 0xFF, 0x3F,  // .......?
                /* 19D8 */  0xF2, 0xE3, 0x26, 0xFF, 0x76, 0x61, 0x28, 0xEC,  // ..&.va(.
                /* 19E0 */  0xE9, 0x1A, 0x98, 0x9D, 0x73, 0xB0, 0x10, 0xCF,  // ....s...
                /* 19E8 */  0x39, 0x70, 0xC5, 0x9C, 0x73, 0x00, 0x9A, 0x84,  // 9p..s...
                /* 19F0 */  0x87, 0xD0, 0x39, 0x11, 0x6E, 0xD8, 0x63, 0x0E,  // ..9.n.c.
                /* 19F8 */  0x84, 0xFF, 0xFF, 0x31, 0x07, 0xEC, 0x43, 0xF4,  // ...1..C.
                /* 1A00 */  0x69, 0x02, 0xF8, 0x1C, 0x72, 0xC0, 0x79, 0xA6,  // i...r.y.
                /* 1A08 */  0xC0, 0x1D, 0x72, 0xC0, 0x3B, 0x8F, 0xD7, 0x9A,  // ..r.;...
                /* 1A10 */  0xB7, 0x17, 0x5F, 0xAC, 0x0D, 0xFB, 0x82, 0x08,  // .._.....
                /* 1A18 */  0xEB, 0x80, 0x03, 0x78, 0x51, 0x68, 0xD3, 0xA7,  // ...xQh..
                /* 1A20 */  0x46, 0xA3, 0x56, 0x0D, 0xCA, 0xD4, 0x28, 0xD3,  // F.V...(.
                /* 1A28 */  0xA0, 0x56, 0x9F, 0x4A, 0x8D, 0x19, 0x4B, 0x75,  // .V.J..Ku
                /* 1A30 */  0x02, 0xF0, 0x43, 0x42, 0x27, 0x05, 0xC7, 0x02,  // ..CB'...
                /* 1A38 */  0xA1, 0x41, 0x28, 0x04, 0xE2, 0x10, 0x0F, 0x06,  // .A(.....
                /* 1A40 */  0x81, 0x58, 0xB4, 0x05, 0x10, 0xFF, 0xFF, 0x0F,  // .X......
                /* 1A48 */  0x35, 0x7A, 0x86, 0x08, 0xC4, 0xE2, 0x3C, 0x80,  // 5z....<.
                /* 1A50 */  0x30, 0x51, 0xAB, 0x10, 0x88, 0xA5, 0x98, 0x00,  // 0Q......
                /* 1A58 */  0x61, 0x32, 0x54, 0x9C, 0x1D, 0xE8, 0x93, 0x41,  // a2T....A
                /* 1A60 */  0x20, 0x0E, 0x6F, 0x03, 0x84, 0x49, 0xD7, 0x01,  //  .o..I..
                /* 1A68 */  0xC2, 0xE4, 0xFA, 0x00, 0x61, 0xF2, 0x9E, 0x03,  // ....a...
                /* 1A70 */  0x02, 0xB1, 0x34, 0x23, 0x20, 0x54, 0x09, 0x08,  // ..4# T..
                /* 1A78 */  0x7D, 0x54, 0x08, 0x84, 0x3C, 0x25, 0x04, 0x62,  // }T..<%.b
                /* 1A80 */  0x61, 0x56, 0x4E, 0x25, 0x54, 0xCB, 0x50, 0xA8,  // aVN%T.P.
                /* 1A88 */  0x17, 0x10, 0x26, 0xE2, 0x0D, 0x20, 0x10, 0x47,  // ..&.. .G
                /* 1A90 */  0x07, 0xA1, 0x71, 0xDD, 0x80, 0x30, 0xB1, 0xEB,  // ..q..0..
                /* 1A98 */  0x16, 0x20, 0xD1, 0x03, 0x71, 0x1B, 0x3A, 0x0D,  // . ..q.:.
                /* 1AA0 */  0x05, 0xD1, 0x20, 0xC8, 0xBB, 0x42, 0x40, 0x16,  // .. ..B@.
                /* 1AA8 */  0x0A, 0x22, 0x20, 0x0B, 0x57, 0x04, 0xC4, 0x62,  // ." .W..b
                /* 1AB0 */  0x80, 0x08, 0xC8, 0xC1, 0xDE, 0x45, 0x02, 0x72,  // .....E.r
                /* 1AB8 */  0x4C, 0x10, 0x01, 0x39, 0xB4, 0x26, 0x20, 0x26,  // L..9.& &
                /* 1AC0 */  0xC1, 0x13, 0x10, 0x13, 0x62, 0x0A, 0x88, 0xC9,  // ....b...
                /* 1AC8 */  0x02, 0x11, 0x90, 0x25, 0xBD, 0x19, 0x03, 0x11,  // ...%....
                /* 1AD0 */  0x81, 0x20, 0x1A, 0x24, 0x79, 0xD5, 0x04, 0x22,  // . .$y.."
                /* 1AD8 */  0x62, 0x41, 0x34, 0x24, 0xE2, 0x0B, 0x88, 0x49,  // bA4$...I
                /* 1AE0 */  0x07, 0x11, 0x90, 0xE5, 0x7F, 0x6C, 0x02, 0x91,  // .....l..
                /* 1AE8 */  0x30, 0x20, 0x02, 0x72, 0xA0, 0x37, 0x45, 0x20,  // 0 .r.7E 
                /* 1AF0 */  0x12, 0x0F, 0x44, 0x40, 0x8E, 0xFC, 0xBF, 0x09,  // ..D@....
                /* 1AF8 */  0x44, 0x3E, 0x3A, 0x1A, 0x08, 0xFB, 0xE6, 0x1C,  // D>:.....
                /* 1B00 */  0x08, 0x03, 0x11, 0x90, 0x05, 0xAB, 0x03, 0x62,  // .......b
                /* 1B08 */  0xF2, 0x41, 0x04, 0xE4, 0x50, 0xF2, 0x80, 0x58,  // .A..P..X
                /* 1B10 */  0x44, 0x10, 0x0D, 0x96, 0xF8, 0x1B, 0x2C, 0x05,  // D.....,.
                /* 1B18 */  0x11, 0x90, 0x23, 0x7D, 0x19, 0x02, 0x91, 0x80,  // ..#}....
                /* 1B20 */  0x20, 0x3A, 0x14, 0x90, 0x07, 0x84, 0x80, 0x2C,  //  :.....,
                /* 1B28 */  0x07, 0x44, 0xC7, 0x00, 0xF2, 0xF6, 0x09, 0x44,  // .D.....D
                /* 1B30 */  0x5E, 0x0C, 0x81, 0x58, 0x84, 0xA7, 0x85, 0x80,  // ^..X....
                /* 1B38 */  0x1C, 0x08, 0x44, 0x47, 0x04, 0xE2, 0x12, 0x88,  // ..DG....
                /* 1B40 */  0x89, 0x02, 0xD1, 0x91, 0x81, 0xFC, 0x21, 0x02,  // ......!.
                /* 1B48 */  0xE9, 0xFF, 0x3F, 0x0C, 0x81, 0x08, 0xC8, 0xF1,  // ..?.....
                /* 1B50 */  0xFF, 0x1A, 0x81, 0x88, 0x98, 0xF7, 0x44, 0x40,  // ......D@
                /* 1B58 */  0xF6, 0xA0, 0x08, 0xC8, 0x40, 0x04, 0xE4, 0xE0,  // ....@...
                /* 1B60 */  0xFF, 0x0D, 0x01, 0x59, 0xC6, 0xBF, 0xE2, 0xF1,  // ...Y....
                /* 1B68 */  0x81, 0x3D, 0x2A, 0x02, 0x11, 0xD9, 0x20, 0x02,  // .=*... .
                /* 1B70 */  0x72, 0xB4, 0x77, 0x49, 0x20, 0x12, 0x14, 0x44,  // r.wI ..D
                /* 1B78 */  0x83, 0x21, 0xAF, 0x8D, 0x83, 0x61, 0x20, 0x02,  // .!...a .
                /* 1B80 */  0xB2, 0x48, 0xBD, 0x40, 0x4C, 0x32, 0x88, 0x80,  // .H.@L2..
                /* 1B88 */  0x1C, 0xE5, 0xD5, 0x27, 0x20, 0x07, 0x03, 0xD1,  // ...' ...
                /* 1B90 */  0xE0, 0xC9, 0x1B, 0xE7, 0xE0, 0xD9, 0xF3, 0x4B,  // .......K
                /* 1B98 */  0x03, 0x21, 0x5F, 0x16, 0x0D, 0x84, 0x80, 0x08,  // .!_.....
                /* 1BA0 */  0xC8, 0xF1, 0xFE, 0x41, 0x02, 0x72, 0x58, 0x10,  // ...A.rX.
                /* 1BA8 */  0x01, 0x59, 0x8C, 0x6A, 0x20, 0x26, 0x0D, 0x44,  // .Y.j &.D
                /* 1BB0 */  0x40, 0x0E, 0xF0, 0x62, 0x11, 0x90, 0xE3, 0x80,  // @..b....
                /* 1BB8 */  0x68, 0x10, 0xE4, 0x39, 0xA3, 0x41, 0x90, 0x07,  // h..9.A..
                /* 1BC0 */  0xC9, 0xA3, 0x05, 0x33, 0x0E, 0xC4, 0xC4, 0x83,  // ...3....
                /* 1BC8 */  0x08, 0xC8, 0x99, 0x9E, 0x36, 0x0F, 0x01, 0x0C,  // ....6...
                /* 1BD0 */  0x44, 0x40, 0x0E, 0xFB, 0x09, 0x11, 0x90, 0xA3,  // D@......
                /* 1BD8 */  0x83, 0xE8, 0x58, 0x41, 0xBC, 0x03, 0x31, 0x61,  // ..XA..1a
                /* 1BE0 */  0x20, 0x02, 0xB2, 0xD4, 0xC7, 0x93, 0x80, 0x2C,  //  ......,
                /* 1BE8 */  0x1C, 0x44, 0x03, 0x24, 0x2F, 0xAD, 0x03, 0x64,  // .D.$/..d
                /* 1BF0 */  0x20, 0x02, 0x72, 0xCC, 0xAF, 0x95, 0x80, 0x1C,  //  .r.....
                /* 1BF8 */  0x1A, 0x44, 0x03, 0x20, 0x0F, 0x69, 0x0D, 0x80,  // .D. .i..
                /* 1C00 */  0x80, 0xE8, 0x00, 0x41, 0x12, 0x1C, 0x20, 0x28,  // ...A.. (
                /* 1C08 */  0x88, 0x0E, 0x25, 0x24, 0x02, 0x10, 0x8B, 0x05,  // ..%$....
                /* 1C10 */  0xA2, 0x01, 0x91, 0x0C, 0x03, 0xA2, 0x20, 0x02,  // ...... .
                /* 1C18 */  0xB2, 0xAC, 0x12, 0x40, 0x4C, 0x24, 0x88, 0x0E,  // ...@L$..
                /* 1C20 */  0x1A, 0xA4, 0xC5, 0x41, 0x83, 0x82, 0x68, 0xD0,  // ...A..h.
                /* 1C28 */  0xA4, 0xC6, 0xA0, 0x29, 0x88, 0x80, 0x2C, 0x21,  // ...)..,!
                /* 1C30 */  0x08, 0x10, 0x13, 0x04, 0xA2, 0x03, 0x06, 0x49,  // .......I
                /* 1C38 */  0x72, 0xC0, 0xA0, 0x20, 0x02, 0x72, 0x8C, 0x28,  // r.. .r.(
                /* 1C40 */  0x40, 0x2C, 0x14, 0x88, 0x06, 0x43, 0xB2, 0x00,  // @,...C..
                /* 1C48 */  0xF9, 0xFF, 0x3F, 0x18, 0x81, 0xE8, 0x30, 0x41,  // ..?...0A
                /* 1C50 */  0xCA, 0x00, 0x31, 0x45, 0x20, 0x02, 0xB2, 0xCA,  // ..1E ...
                /* 1C58 */  0x34, 0x40, 0x4C, 0x33, 0x88, 0x80, 0x9C, 0x26,  // 4@L3...&
                /* 1C60 */  0x0E, 0x10, 0xCB, 0x06, 0x22, 0x20, 0xA7, 0xEE,  // ...." ..
                /* 1C68 */  0x03, 0xC2, 0x34, 0x07, 0x02, 0x61, 0xFA, 0x0B,  // ..4..a..
                /* 1C70 */  0x81, 0xB0, 0x5C, 0x2F, 0x33, 0x81, 0x58, 0x55,  // ..\/3.XU
                /* 1C78 */  0x25, 0x10, 0xA6, 0x34, 0x13, 0x20, 0x2D, 0x05,  // %..4. -.
                /* 1C80 */  0xC2, 0xD2, 0x83, 0xD0, 0xE4, 0x2F, 0x1B, 0x81,  // ...../..
                /* 1C88 */  0x58, 0x49, 0x2E, 0x10, 0x96, 0x03, 0x84, 0x66,  // XI.....f
                /* 1C90 */  0xE9, 0x05, 0xC2, 0x92, 0x26, 0x03, 0x61, 0x3A,  // ....&.a:
                /* 1C98 */  0x9B, 0x81, 0x30, 0xC5, 0xD1, 0x40, 0x58, 0xA2,  // ..0..@X.
                /* 1CA0 */  0x6E, 0x20, 0x4C, 0x4F, 0x38, 0x10, 0x5A, 0x0E,  // n LO8.Z.
                /* 1CA8 */  0x84, 0xE9, 0x8E, 0x37, 0x2C, 0x0A, 0x42, 0xD3,  // ...7,.B.
                /* 1CB0 */  0xD7, 0x03, 0x61, 0x1A, 0x0B, 0x82, 0xB0, 0x84,  // ..a.....
                /* 1CB8 */  0x20, 0x34, 0x65, 0x42, 0x30, 0x9A, 0x11, 0x8C,  //  4eB0...
                /* 1CC0 */  0x82, 0xD0, 0x8C, 0x1D, 0x41, 0x98, 0xA2, 0x96,  // ....A...
                /* 1CC8 */  0x20, 0x2C, 0x0F, 0x08, 0xCD, 0x12, 0x13, 0x84,  //  ,......
                /* 1CD0 */  0xFD, 0xFF, 0x01                                 // ...
            })
        }
    }

    Scope (_SB)
    {
        Device (HKDV)
        {
            Name (_HID, "LHK2019")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (WMIU)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "LSK20")  // _UID: Unique ID
            Name (_WDG, Buffer (0x3C)
            {
                /* 0000 */  0x74, 0x09, 0x6C, 0xCE, 0x07, 0x04, 0x50, 0x4F,  // t.l...PO
                /* 0008 */  0x88, 0xBA, 0x4F, 0xC3, 0xB6, 0x55, 0x9A, 0xD8,  // ..O..U..
                /* 0010 */  0x53, 0x4B, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // SK..!...
                /* 0018 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
                /* 0020 */  0xC9, 0x06, 0x29, 0x10, 0x44, 0x41, 0x01, 0x00,  // ..).DA..
                /* 0028 */  0x0C, 0xDE, 0xC0, 0x8F, 0xE4, 0xB4, 0xFD, 0x43,  // .......C
                /* 0030 */  0xB0, 0xF3, 0x88, 0x71, 0x71, 0x1C, 0x12, 0x94,  // ...qq...
                /* 0038 */  0xD0, 0x00, 0x01, 0x08                           // ....
            })
            Method (WMSK, 3, NotSerialized)
            {
                If ((Arg1 == One))
                {
                    If ((ToInteger (Arg2) == One))
                    {
                        Return (0x02)
                    }
                    ElseIf ((ToInteger (Arg2) == 0x02))
                    {
                        Return (One)
                    }
                    ElseIf ((ToInteger (Arg2) == 0x03))
                    {
                        Return (One)
                    }
                    ElseIf ((ToInteger (Arg2) == 0x04))
                    {
                        Return (One)
                    }
                    ElseIf ((ToInteger (Arg2) == 0x16))
                    {
                        Return (0x1B)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                If ((Arg0 == 0xD0))
                {
                    Return (PSD1) /* \PSD1 */
                }
            }

            Name (WQDA, Buffer (0x0422)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0x12, 0x04, 0x00, 0x00, 0x66, 0x0C, 0x00, 0x00,  // ....f...
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0xA8, 0x42, 0x86, 0x00, 0x01, 0x06, 0x18, 0x42,  // .B.....B
                /* 0020 */  0x10, 0x05, 0x10, 0x8A, 0x29, 0x81, 0x42, 0x04,  // ....).B.
                /* 0028 */  0x8A, 0x40, 0xA4, 0x60, 0x30, 0x28, 0x0D, 0x20,  // .@.`0(. 
                /* 0030 */  0x92, 0x03, 0x21, 0x17, 0x4C, 0x4C, 0x80, 0x08,  // ..!.LL..
                /* 0038 */  0x08, 0x79, 0x15, 0x60, 0x53, 0x80, 0x49, 0x10,  // .y.`S.I.
                /* 0040 */  0xF5, 0xEF, 0x0F, 0x51, 0x12, 0x1C, 0x4A, 0x08,  // ...Q..J.
                /* 0048 */  0x84, 0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00,  // .$.0/@..
                /* 0050 */  0xC3, 0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31,  // ..l.0-.1
                /* 0058 */  0x24, 0x95, 0x06, 0x4E, 0x09, 0x2C, 0x05, 0x42,  // $..N.,.B
                /* 0060 */  0x42, 0x05, 0x28, 0x17, 0xE0, 0x5B, 0x80, 0x76,  // B.(..[.v
                /* 0068 */  0x44, 0x49, 0x16, 0x60, 0x19, 0x46, 0x04, 0x1E,  // DI.`.F..
                /* 0070 */  0x45, 0x64, 0xA3, 0x71, 0x68, 0xEC, 0x30, 0x2C,  // Ed.qh.0,
                /* 0078 */  0x13, 0x4C, 0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45,  // .L.8...E
                /* 0080 */  0xE0, 0x09, 0x75, 0x2A, 0x40, 0xAE, 0x00, 0x61,  // ..u*@..a
                /* 0088 */  0x02, 0xC4, 0xA3, 0x0A, 0xA3, 0x39, 0x28, 0x22,  // .....9("
                /* 0090 */  0x1A, 0x1A, 0x25, 0x66, 0x4C, 0x04, 0xB6, 0x73,  // ..%fL..s
                /* 0098 */  0x6C, 0x8D, 0xE2, 0x34, 0x0A, 0x17, 0x20, 0x1D,  // l..4.. .
                /* 00A0 */  0x43, 0x23, 0x38, 0xAE, 0x63, 0x30, 0x58, 0x90,  // C#8.c0X.
                /* 00A8 */  0x43, 0x31, 0x44, 0x41, 0x02, 0xAC, 0xA2, 0x91,  // C1DA....
                /* 00B0 */  0x61, 0x84, 0x08, 0x72, 0x7C, 0x81, 0xBA, 0xC4,  // a..r|...
                /* 00B8 */  0x13, 0x88, 0xC7, 0xE4, 0x01, 0x18, 0x21, 0x4C,  // ......!L
                /* 00C0 */  0x8B, 0xB0, 0x82, 0x36, 0x62, 0x02, 0xC3, 0x1E,  // ...6b...
                /* 00C8 */  0x0A, 0xE6, 0x07, 0x20, 0x01, 0x9E, 0x05, 0x58,  // ... ...X
                /* 00D0 */  0x1F, 0x23, 0x21, 0xB0, 0x7B, 0x01, 0xE2, 0x04,  // .#!.{...
                /* 00D8 */  0x68, 0x1E, 0x8D, 0x46, 0x75, 0x9C, 0xC6, 0x88,  // h..Fu...
                /* 00E0 */  0xD2, 0x96, 0x00, 0xC5, 0x23, 0x13, 0x4C, 0x88,  // ....#.L.
                /* 00E8 */  0x28, 0x21, 0x3A, 0xC3, 0x13, 0x5A, 0x28, 0xC3,  // (!:..Z(.
                /* 00F0 */  0x45, 0x89, 0x13, 0x25, 0x70, 0x84, 0xDE, 0x04,  // E..%p...
                /* 00F8 */  0x18, 0x83, 0x20, 0x08, 0x81, 0x43, 0x54, 0x36,  // .. ..CT6
                /* 0100 */  0x48, 0xA1, 0xB6, 0x3F, 0x08, 0x22, 0xCB, 0xC1,  // H..?."..
                /* 0108 */  0x89, 0x80, 0x45, 0x1A, 0x0D, 0xEA, 0x14, 0x90,  // ..E.....
                /* 0110 */  0xE0, 0xA9, 0xC0, 0x27, 0x82, 0x93, 0x3A, 0xAF,  // ...'..:.
                /* 0118 */  0xA3, 0x3A, 0xEB, 0x20, 0xC1, 0x4F, 0xA4, 0xCE,  // .:. .O..
                /* 0120 */  0xE3, 0x00, 0x19, 0x38, 0x9B, 0x9A, 0xD9, 0x75,  // ...8...u
                /* 0128 */  0x3E, 0x80, 0xE0, 0x1A, 0x50, 0xFF, 0xFF, 0x79,  // >...P..y
                /* 0130 */  0x3E, 0x16, 0xB0, 0x61, 0x86, 0xC3, 0x0C, 0xD1,  // >..a....
                /* 0138 */  0x83, 0xF5, 0x04, 0x0E, 0x91, 0x01, 0x7A, 0x62,  // ......zb
                /* 0140 */  0x4F, 0x04, 0x58, 0x87, 0x93, 0xD1, 0x71, 0xA0,  // O.X...q.
                /* 0148 */  0x54, 0x01, 0x66, 0xC7, 0xAD, 0x49, 0x27, 0x38,  // T.f..I'8
                /* 0150 */  0x1E, 0x9F, 0x03, 0x3C, 0x9F, 0x13, 0x4E, 0x60,  // ...<..N`
                /* 0158 */  0xF9, 0x83, 0x40, 0x8D, 0xCC, 0xD0, 0x36, 0x38,  // ..@...68
                /* 0160 */  0x2D, 0x1D, 0x04, 0x7C, 0x00, 0x30, 0x81, 0xC5,  // -..|.0..
                /* 0168 */  0x1E, 0x26, 0xE8, 0x78, 0xC0, 0x7F, 0x00, 0x78,  // .&.x...x
                /* 0170 */  0x3E, 0x88, 0xF0, 0xCE, 0xE0, 0xF9, 0x9A, 0xA0,  // >.......
                /* 0178 */  0xA8, 0xB3, 0x85, 0x9C, 0x8C, 0x07, 0x75, 0xAC,  // ......u.
                /* 0180 */  0xF0, 0x05, 0x01, 0x03, 0x7E, 0xB4, 0x2F, 0x0C,  // ....~./.
                /* 0188 */  0x61, 0x5E, 0x1A, 0xE2, 0x1E, 0xBC, 0xB5, 0x5E,  // a^.....^
                /* 0190 */  0x21, 0x08, 0x81, 0x83, 0x43, 0xE8, 0xAF, 0x61,  // !...C..a
                /* 0198 */  0x51, 0x83, 0xA7, 0x27, 0x0B, 0x7E, 0xA8, 0x60,  // Q..'.~.`
                /* 01A0 */  0xC0, 0x7C, 0x3C, 0xA7, 0xE5, 0xB3, 0x87, 0x87,  // .|<.....
                /* 01A8 */  0x07, 0x7F, 0x26, 0x4F, 0x14, 0xC0, 0x41, 0xE3,  // ..&O..A.
                /* 01B0 */  0x19, 0x41, 0x88, 0xAF, 0x14, 0x6F, 0x14, 0xD8,  // .A...o..
                /* 01B8 */  0xF3, 0x01, 0xBB, 0x53, 0x60, 0x87, 0x0E, 0xFF,  // ...S`...
                /* 01C0 */  0x5A, 0x61, 0x54, 0x5F, 0x25, 0xDE, 0x22, 0x12,  // ZaT_%.".
                /* 01C8 */  0x18, 0x2B, 0xC1, 0xFF, 0x3F, 0x30, 0x6E, 0xEC,  // .+..?0n.
                /* 01D0 */  0xF6, 0x2B, 0x00, 0x21, 0xF8, 0xC1, 0x3C, 0x1B,  // .+.!..<.
                /* 01D8 */  0x3C, 0x85, 0x44, 0x38, 0x2E, 0xA3, 0x1F, 0x50,  // <.D8...P
                /* 01E0 */  0x9F, 0x33, 0x17, 0x44, 0xB4, 0xE3, 0x3A, 0x87,  // .3.D..:.
                /* 01E8 */  0xA3, 0x08, 0x15, 0xE2, 0x2C, 0x0C, 0x14, 0x2E,  // ....,...
                /* 01F0 */  0x58, 0x40, 0xE3, 0x24, 0xB0, 0xC8, 0xC1, 0xA2,  // X@.$....
                /* 01F8 */  0x07, 0xC1, 0x01, 0xCF, 0xE1, 0x90, 0x82, 0x1E,  // ........
                /* 0200 */  0xC4, 0xC9, 0x44, 0x39, 0x8F, 0x63, 0xF2, 0x39,  // ..D9.c.9
                /* 0208 */  0xC5, 0x08, 0xC7, 0xF4, 0x78, 0xF2, 0xDC, 0xE1,  // ....x...
                /* 0210 */  0xFB, 0xC6, 0xE1, 0x9F, 0xD7, 0xD1, 0x3E, 0x85,  // ......>.
                /* 0218 */  0xB0, 0xA1, 0x1F, 0x02, 0xE6, 0x74, 0xE1, 0x21,  // .....t.!
                /* 0220 */  0xF0, 0x01, 0x1C, 0xD0, 0x29, 0x5A, 0xE9, 0xC4,  // ....)Z..
                /* 0228 */  0x90, 0x27, 0x1A, 0x7E, 0x2C, 0xC1, 0x0E, 0x80,  // .'.~,...
                /* 0230 */  0xAB, 0xF2, 0x00, 0xC2, 0xC4, 0x3F, 0x0E, 0x24,  // .....?.$
                /* 0238 */  0xED, 0x95, 0x40, 0x61, 0x7C, 0xC6, 0x01, 0x5C,  // ..@a|..\
                /* 0240 */  0x01, 0x3D, 0x42, 0x80, 0xE7, 0x6C, 0x00, 0x17,  // .=B..l..
                /* 0248 */  0xFB, 0xE4, 0xA3, 0x84, 0x78, 0x7A, 0x88, 0x7E,  // ....xz.~
                /* 0250 */  0x2E, 0x27, 0xF3, 0x08, 0x61, 0x82, 0xFF, 0xFF,  // .'..a...
                /* 0258 */  0x03, 0x0E, 0xEC, 0x2B, 0x8C, 0xB5, 0x5D, 0x70,  // ...+..]p
                /* 0260 */  0xC8, 0x94, 0x9E, 0x6A, 0xDE, 0x6E, 0x8C, 0x72,  // ...j.n.r
                /* 0268 */  0x58, 0x86, 0x79, 0xC0, 0xF1, 0xED, 0xA0, 0x35,  // X.y....5
                /* 0270 */  0x18, 0xDD, 0x6E, 0xD8, 0x89, 0xE4, 0x24, 0x42,  // ..n...$B
                /* 0278 */  0x31, 0xDC, 0x07, 0x89, 0x38, 0xB1, 0xC3, 0x45,  // 1...8..E
                /* 0280 */  0x88, 0xFD, 0xD0, 0x61, 0xBC, 0x07, 0x1C, 0x16,  // ...a....
                /* 0288 */  0xEF, 0x38, 0xA0, 0x83, 0x88, 0x0F, 0x38, 0x00,  // .8....8.
                /* 0290 */  0x3F, 0x4E, 0x07, 0x8F, 0x25, 0xE0, 0x3F, 0x2B,  // ?N..%.?+
                /* 0298 */  0xF0, 0x53, 0x09, 0x18, 0xFE, 0xFF, 0xA7, 0x12,  // .S......
                /* 02A0 */  0xF0, 0x24, 0x7E, 0x10, 0xE8, 0xB4, 0xE3, 0xB4,  // .$~.....
                /* 02A8 */  0x20, 0xB2, 0xB1, 0x58, 0x1F, 0xAA, 0x0C, 0xA1,  //  ..X....
                /* 02B0 */  0x9C, 0x0B, 0x96, 0x47, 0x5C, 0x61, 0x1E, 0x4F,  // ...G\a.O
                /* 02B8 */  0xE4, 0x73, 0x88, 0xFC, 0x52, 0x11, 0xE1, 0x0C,  // .s..R...
                /* 02C0 */  0x8E, 0x21, 0xD2, 0x69, 0xC5, 0x38, 0xB0, 0x57,  // .!.i.8.W
                /* 02C8 */  0x0E, 0xDF, 0x03, 0x9E, 0x2C, 0x78, 0x22, 0x60,  // ....,x"`
                /* 02D0 */  0x1D, 0xE5, 0x78, 0x16, 0x0A, 0x29, 0xA3, 0xD1,  // ..x..)..
                /* 02D8 */  0xA8, 0x3C, 0x08, 0x6B, 0x81, 0x11, 0x9C, 0x41,  // .<.k...A
                /* 02E0 */  0x0C, 0xE8, 0xA0, 0x10, 0x3A, 0x22, 0xE1, 0x94,  // ....:"..
                /* 02E8 */  0x80, 0x68, 0x5A, 0x6F, 0x44, 0xEC, 0xDC, 0xE3,  // .hZoD...
                /* 02F0 */  0x1B, 0x92, 0x09, 0xA6, 0xBA, 0x1D, 0xD1, 0x79,  // .......y
                /* 02F8 */  0xFA, 0x46, 0xC0, 0xEF, 0x29, 0x3E, 0x23, 0x18,  // .F..)>#.
                /* 0300 */  0xDC, 0x0A, 0xEF, 0x1F, 0xA0, 0x19, 0x71, 0x10,  // ......q.
                /* 0308 */  0xDF, 0x18, 0x7C, 0x26, 0xF0, 0x46, 0x4F, 0x04,  // ..|&.FO.
                /* 0310 */  0xA3, 0xE6, 0xD0, 0x84, 0x9A, 0x86, 0xA7, 0xFA,  // ........
                /* 0318 */  0x62, 0x63, 0x02, 0xEB, 0xBA, 0x0C, 0x81, 0x4C,  // bc.....L
                /* 0320 */  0xDF, 0x31, 0x01, 0x14, 0x40, 0xBE, 0x14, 0xF8,  // .1..@...
                /* 0328 */  0xA4, 0xF3, 0x60, 0xC0, 0xC6, 0xF0, 0xB0, 0x63,  // ..`....c
                /* 0330 */  0x34, 0xA3, 0x73, 0xC1, 0x93, 0x47, 0x49, 0x9C,  // 4.s..GI.
                /* 0338 */  0x3C, 0x05, 0xF1, 0xE4, 0x1D, 0x7F, 0xF2, 0xE8,  // <.......
                /* 0340 */  0x3B, 0x85, 0x8F, 0x57, 0x9C, 0xC0, 0x71, 0xC7,  // ;..W..q.
                /* 0348 */  0x4E, 0xAF, 0x20, 0x98, 0xFF, 0xFF, 0x30, 0xD8,  // N. ...0.
                /* 0350 */  0x64, 0x4F, 0xED, 0x51, 0xC1, 0xB3, 0xF0, 0xA5,  // dO.Q....
                /* 0358 */  0x05, 0x37, 0x78, 0xB8, 0xB7, 0x8C, 0x23, 0x0F,  // .7x...#.
                /* 0360 */  0xF3, 0x4C, 0xE5, 0xF3, 0x95, 0xC1, 0x82, 0x84,  // .L......
                /* 0368 */  0x79, 0x5F, 0xC0, 0x01, 0xBD, 0xDF, 0xBD, 0x38,  // y_.....8
                /* 0370 */  0x1C, 0x6E, 0x88, 0xF3, 0x3D, 0xF4, 0x08, 0x3E,  // .n..=..>
                /* 0378 */  0x7E, 0xF8, 0xCC, 0x80, 0x1B, 0x12, 0xBB, 0x06,  // ~.......
                /* 0380 */  0xF0, 0xD1, 0xF8, 0x1A, 0xC0, 0x47, 0xE9, 0x3B,  // .....G.;
                /* 0388 */  0x16, 0xF8, 0x04, 0xDE, 0x03, 0x40, 0x0E, 0x8F,  // .....@..
                /* 0390 */  0x09, 0x3F, 0x2A, 0x7A, 0xCF, 0xF0, 0xB8, 0xF8,  // .?*z....
                /* 0398 */  0x90, 0x7D, 0x45, 0x62, 0xD8, 0xCF, 0x1A, 0xBE,  // .}Eb....
                /* 03A0 */  0x47, 0x9E, 0xE0, 0x2B, 0xC5, 0x2B, 0x1B, 0x06,  // G..+.+..
                /* 03A8 */  0xD6, 0x87, 0x00, 0x0E, 0x6B, 0xB4, 0xB0, 0x87,  // ....k...
                /* 03B0 */  0xFC, 0x92, 0xE2, 0x13, 0x8E, 0x67, 0x66, 0x8C,  // .....gf.
                /* 03B8 */  0xB0, 0x3E, 0x08, 0x38, 0xCC, 0x41, 0x00, 0x34,  // .>.8.A.4
                /* 03C0 */  0x47, 0x36, 0xFC, 0x0D, 0xC0, 0x97, 0x80, 0x20,  // G6..... 
                /* 03C8 */  0x6F, 0x22, 0xA7, 0xFB, 0xE4, 0x63, 0x54, 0x7E,  // o"...cT~
                /* 03D0 */  0x23, 0xE0, 0xE7, 0x11, 0x2C, 0x50, 0x10, 0xDF,  // #...,P..
                /* 03D8 */  0x30, 0x3C, 0xB6, 0x03, 0x89, 0x0D, 0xE7, 0x5A,  // 0<.....Z
                /* 03E0 */  0xC2, 0xFE, 0xFF, 0x77, 0x02, 0x8C, 0x42, 0x9B,  // ...w..B.
                /* 03E8 */  0x3E, 0x35, 0x1A, 0xB5, 0x6A, 0x50, 0xA6, 0x46,  // >5..jP.F
                /* 03F0 */  0x99, 0x06, 0xB5, 0xFA, 0x54, 0x6A, 0xCC, 0x98,  // ....Tj..
                /* 03F8 */  0x89, 0x2B, 0x9F, 0x5F, 0x11, 0x1A, 0xB1, 0x23,  // .+._...#
                /* 0400 */  0x81, 0xD0, 0x98, 0x14, 0x02, 0x71, 0xE8, 0x1F,  // .....q..
                /* 0408 */  0x87, 0x40, 0x2C, 0xF9, 0x1E, 0x26, 0x10, 0x4B,  // .@,..&.K
                /* 0410 */  0xA2, 0x95, 0x91, 0x8B, 0x86, 0x41, 0x04, 0x64,  // .....A.d
                /* 0418 */  0xFD, 0x2A, 0x80, 0x58, 0x1A, 0x10, 0x01, 0xF9,  // .*.X....
                /* 0420 */  0xFF, 0x0F                                       // ..
            })
        }
    }
}

