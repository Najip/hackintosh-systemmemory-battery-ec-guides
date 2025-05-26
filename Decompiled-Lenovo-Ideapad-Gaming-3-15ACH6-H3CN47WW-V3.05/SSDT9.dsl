/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./SSDT9.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000372 (882)
 *     Revision         0x01
 *     Checksum         0xF3
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    /*
     * iASL Warning: There were 7 external control methods found during
     * disassembly, but only 0 were resolved (7 unresolved). Additional
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
    External (_SB_.PCI0.M123, UnknownObj)
    External (_SB_.PCI0.M124, UnknownObj)
    External (_SB_.PCI0.M125, UnknownObj)
    External (_SB_.PCI0.M126, UnknownObj)
    External (M000, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (M011, MethodObj)    // Warning: Unknown method, guessing 3 arguments
    External (M012, MethodObj)    // Warning: Unknown method, guessing 5 arguments
    External (M013, MethodObj)    // Warning: Unknown method, guessing 5 arguments
    External (M049, IntObj)
    External (M084, UnknownObj)
    External (M111, MethodObj)    // Warning: Unknown method, guessing 6 arguments
    External (M114, MethodObj)    // Warning: Unknown method, guessing 4 arguments
    External (M122, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (M128, UnknownObj)
    External (M131, IntObj)

    Scope (\_GPE)
    {
        Name (M127, Zero)
        Method (_L00, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Local7 = Zero
            Local0 = M131 /* External reference */
            If (Local0)
            {
                M131 = M049 /* External reference */
                0x10
                Local0
                M131 = M049 /* External reference */
                0x11
                Local1
                Local1 = (M084 + ((Local0 * 0x0100) + Local1))
                M012 (Local1, 0x0C, Zero, 0x08, M127)
            }

            M127 ^= One
            0x6C = M122 (Local1, M128 = M049 /* External reference */)
            Local2
            If ((Local1 && Local2))
            {
                If (M127)
                {
                    M000 (0x99)
                    M111 (M013 (M122 (0x15, Zero), 0x08, Zero, M111 (M013 (M122 (0x17, Zero), 
                        0x08, Zero, If ((Local2 == 0x02))
                                    {
                                        If ((Local0 || Local1))
                                                {
                                                    M114 (Local0, Local1, Zero, Zero)
                                                    Local7 |= One
                                                } = M011 (M122 (0x10, 0x05), 0x03, Local1) = M011 (M122 (0x10, 
                                                        Zero), 0x05, Local0)
                                        If ((Local0 || Local1))
                                                {
                                                    M114 (Local0, Local1, Zero, Zero)
                                                    Local7 |= 0x02
                                                } = M011 (M122 (0x11, 0x05), 0x03, Local1) = M011 (M122 (0x11, 
                                                        Zero), 0x05, Local0)
                                        If ((Local0 || Local1))
                                                {
                                                    M114 (Local0, Local1, Zero, Zero)
                                                    Local7 |= 0x04
                                                } = M011 (M122 (0x12, 0x05), 0x03, Local1) = M011 (M122 (0x12, 
                                                        Zero), 0x05, Local0)
                                        If ((Local0 || Local1))
                                                {
                                                    M114 (Local0, Local1, Zero, Zero)
                                                    Local7 |= 0x08
                                                } = M011 (M122 (0x13, 0x05), 0x03, Local1) = M011 (M122 (0x13, 
                                                        Zero), 0x05, Local0)
                                        M111 (M013 (M122 (0x16, Zero), 0x08, Zero, M000 (0x9A), Else
                                                {
                                                    M000 (0x9B)
                                                    If ((Local2 == 0x02))
                                                    {
                                                        M111 (M013 (M122 (0x16, Zero), 0x08, One, Sleep (0xC8), If (
                                                            (Local0 || Local1))
                                                                        {
                                                                            M114 (Local0, Local1, One, Zero)
                                                                            Local7 |= One
                                                                        } = M011 (M122 (0x10, 0x05), 0x03, Local1) = M011 (M122 (0x10, 
                                                                                Zero), 0x05, Local0)), If ((Local0 || Local1))
                                                                    {
                                                                        M114 (Local0, Local1, One, Zero)
                                                                        Local7 |= 0x02
                                                                    } = M011 (M122 (0x11, 0x05), 0x03, Local1) = M011 (M122 (0x11, 
                                                                            Zero), 0x05, Local0), If ((Local0 || Local1))
                                                                    {
                                                                        M114 (Local0, Local1, One, Zero)
                                                                        Local7 |= 0x04
                                                                    } = M011 (M122 (0x12, 0x05), 0x03, Local1) = M011 (M122 (0x12, 
                                                                            Zero), 0x05, Local0), If ((Local0 || Local1))
                                                                    {
                                                                        M114 (Local0, Local1, One, Zero)
                                                                        Local7 |= 0x08
                                                                    } = M011 (M122 (0x13, 0x05), 0x03, Local1) = M011 (M122 (0x13, 
                                                                            Zero), 0x05, Local0), M000 (0x9C), M111 (M013 (M122 (0x15, Zero), 0x08, One, M111 (
                                                                            M013 (M122 (0x17, Zero), 0x08, One, If ((Local7 & One))
                                                                            {
                                                                                If (CondRefOf (\_SB.PCI0.M123))
                                                                                {
                                                                                    Notify (\_SB.PCI0.M123, Zero) // Bus Check
                                                                                }
                                                                            }, If ((Local7 & 0x02))
                                                                            {
                                                                                If (CondRefOf (\_SB.PCI0.M124))
                                                                                {
                                                                                    Notify (\_SB.PCI0.M124, Zero) // Bus Check
                                                                                }
                                                                            }), If ((Local7 & 0x04))
                                                                        {
                                                                            If (CondRefOf (\_SB.PCI0.M125))
                                                                            {
                                                                                Notify (\_SB.PCI0.M125, Zero) // Bus Check
                                                                            }
                                                                        }, If ((Local7 & 0x08))
                                                                        {
                                                                            If (CondRefOf (\_SB.PCI0.M126))
                                                                            {
                                                                                Notify (\_SB.PCI0.M126, Zero) // Bus Check
                                                                            }
                                                                        }))))
                                                    }
                                                }))
                                    }))))
                }
            }
        }
    }
}

