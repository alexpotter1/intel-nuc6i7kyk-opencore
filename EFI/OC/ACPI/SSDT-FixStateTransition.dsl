/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-FixStateTransition.aml, Tue Mar 17 18:10:58 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000245 (581)
 *     Revision         0x02
 *     Checksum         0xB1
 *     OEM ID           "hack"
 *     OEM Table ID     "ZPTS"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "ZPTS", 0x00000000)
{
    External (_SB_.PCI0.LPCB.SIO1.SIOS, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.SIO1.SIOW, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.SPTS, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.SWAK, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.NPTS, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.NWAK, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)    // (from opcode)
    External (_SB_.TPM_, DeviceObj)    // (from opcode)
    External (OPTS, MethodObj)    // 1 Arguments (from opcode)
    External (OWAK, MethodObj)    // 1 Arguments (from opcode)

    Scope (\)
    {
        Name (SLTP, Zero)
        Method (_TTS, 1, NotSerialized)  // _TTS: Transition To State
        {
            Debug = "Method \\__TTS Called"
            SLTP = Arg0
        }
    }

    Device (_SB.TPM)
    {
        Name (_HID, "MSFT0101")  // _HID: Hardware ID
        Name (XSTA, Zero)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            \_SB.PCI0.LPCB.SIO1.SIOS (Arg0)
            \_SB.PCI0.LPCB.SPTS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
            OPTS (Arg0)
            Debug = "\\_SB nodes put to sleep with \\_PTS"
        }

        If ((0x05 == Arg0))
        {
            \_SB.PCI0.XHC.PMEE = Zero
        }
    }

    Method (_WAK, 1, Serialized)  // _WAK: Wake
    {
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            \_SB.PCI0.NWAK (Arg0)
            \_SB.PCI0.LPCB.SWAK (Arg0)
            \_SB.PCI0.LPCB.SIO1.SIOW (Arg0)
            OWAK (Arg0)
            Debug = "\\_SB nodes woken up with \\_WAK"
        }

        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }
}

