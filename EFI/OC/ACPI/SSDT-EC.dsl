/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-EC.aml, Tue Mar 17 18:10:58 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000D7 (215)
 *     Revision         0x02
 *     Checksum         0xD6
 *     OEM ID           "hack"
 *     OEM Table ID     "EC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "EC", 0x00000000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)    // (from opcode)

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "EC000000")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x23, 
                0x03
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
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
}

