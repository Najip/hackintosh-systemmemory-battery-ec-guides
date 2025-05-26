/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250404 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./SSDT7.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000139 (313)
 *     Revision         0x01
 *     Checksum         0x90
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (P010)
        {
            Name (_ADR, 0x00010000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P020)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P080)
        {
            Name (_ADR, 0x00080000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P180)
        {
            Name (_ADR, 0x00180000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P181)
        {
            Name (_ADR, 0x00180001)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P182)
        {
            Name (_ADR, 0x00180002)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P183)
        {
            Name (_ADR, 0x00180003)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P184)
        {
            Name (_ADR, 0x00180004)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P185)
        {
            Name (_ADR, 0x00180005)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P186)
        {
            Name (_ADR, 0x00180006)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P187)
        {
            Name (_ADR, 0x00180007)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }
    }
}

