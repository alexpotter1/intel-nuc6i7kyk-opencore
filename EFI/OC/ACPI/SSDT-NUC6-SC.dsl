/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-NUC6-SC.aml, Tue Mar 17 18:10:58 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000EEA (3818)
 *     Revision         0x02
 *     Checksum         0xCD
 *     OEM ID           "hack"
 *     OEM Table ID     "_NUC6-SC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_NUC6-SC", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.HDEF, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XDCI.DVID, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.XHC_, DeviceObj)    // (from opcode)
    External (DVID, UnknownObj)    // Warning: Unknown object
    External (IGPU, DeviceObj)    // Warning: Unknown object
    External (RMDA, IntObj)    // (from opcode)
    External (RMGO, PkgObj)    // (from opcode)

    Device (RMCF)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (AUDL, 0x03)
        Name (FAKH, Zero)
    }

    Scope (_SB.PCI0)
    {
        Scope (IGPU)
        {
            OperationRegion (RMIG, PCI_Config, 0x02, 0x02)
            Field (RMIG, AnyAcc, NoLock, Preserve)
            {
                GDID,   16
            }

            Name (GIDL, Package (0x4E)
            {
                0x0A1E, 
                Zero, 
                Package (0x08)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x03, 0x00, 0x22, 0x0D                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x17)
                    {
                        "Intel HD Graphics 4200"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x12, 0x04, 0x00, 0x00                         
                    }
                }, 

                0x0A16, 
                0x041E, 
                Zero, 
                Package (0x08)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x03, 0x00, 0x22, 0x0D                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x17)
                    {
                        "Intel HD Graphics 4400"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x12, 0x04, 0x00, 0x00                         
                    }
                }, 

                0x0416, 
                Zero, 
                Package (0x08)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x03, 0x00, 0x22, 0x0D                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x17)
                    {
                        "Intel HD Graphics 4600"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x12, 0x04, 0x00, 0x00                         
                    }
                }, 

                0x0412, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x03, 0x00, 0x22, 0x0D                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x17)
                    {
                        "Intel HD Graphics 4600"
                    }
                }, 

                0x0A26, 
                0x0A2E, 
                0x0D22, 
                0x0D26, 
                Zero, 
                Package (0x04)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x03, 0x00, 0x22, 0x0D                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }
                }, 

                0x161E, 
                0x1616, 
                0x1612, 
                0x1622, 
                0x1626, 
                0x162A, 
                0x162B, 
                Zero, 
                Package (0x04)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x16, 0x16                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }
                }, 

                0x191B, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x1B, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 530"
                    }
                }, 

                0x191E, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x1E, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 515"
                    }
                }, 

                0x1916, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x16, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 520"
                    }
                }, 

                0x1912, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x16, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 530"
                    }
                }, 

                0x1926, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x26, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x18)
                    {
                        "Intel Iris Graphics 540"
                    }
                }, 

                0x1927, 
                Zero, 
                Package (0x08)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x26, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x18)
                    {
                        "Intel Iris Graphics 550"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x26, 0x19, 0x00, 0x00                         
                    }
                }, 

                0x193B, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x05, 0x00, 0x3B, 0x19                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x1C)
                    {
                        "Intel Iris Pro Graphics 580"
                    }
                }, 

                0x591E, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x1E, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 615"
                    }
                }, 

                0x5916, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x16, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 620"
                    }
                }, 

                0x5917, 
                Zero, 
                Package (0x08)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x16, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x17)
                    {
                        "Intel UHD Graphics 620"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x16, 0x59, 0x00, 0x00                         
                    }
                }, 

                0x5912, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x12, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 630"
                    }
                }, 

                0x591B, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x1B, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x16)
                    {
                        "Intel HD Graphics 630"
                    }
                }, 

                0x5926, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x26, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x1D)
                    {
                        "Intel Iris Plus Graphics 640"
                    }
                }, 

                0x5927, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x02, 0x00, 0x26, 0x59                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x1D)
                    {
                        "Intel Iris Plus Graphics 650"
                    }
                }, 

                0x3E9B, 
                0x3E92, 
                0x3E91, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x07, 0x00, 0x9B, 0x3E                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x17)
                    {
                        "Intel UHD Graphics 630"
                    }
                }, 

                0x3EA5, 
                Zero, 
                Package (0x06)
                {
                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0xA5, 0x3E                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "model", 
                    Buffer (0x1D)
                    {
                        "Intel Iris Plus Graphics 655"
                    }
                }
            })
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Local0 = Ones
                While (One)
                {
                    If (CondRefOf (\RMGO))
                    {
                        Local1 = RMGO
                        Local0 = Match (Local1, MEQ, GDID, MTR, Zero, Zero)
                        If ((Ones != Local0))
                        {
                            Break
                        }
                    }

                    Local1 = GIDL
                    Local0 = Match (Local1, MEQ, GDID, MTR, Zero, Zero)
                    Break
                }

                If ((Ones == Local0))
                {
                    Return (Package (0x00) {})
                }

                Local0 = DerefOf (Local1 [(Match (Local1, MEQ, Zero, MTR, Zero, (Local0 + One)) + One)])
                If (CondRefOf (\RMDA))
                {
                    Local0 [0x02] = "#hda-gfx"
                }

                Return (Local0)
            }
        }
    }

    Device (_SB.USBX)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x08)
            {
                "kUSBSleepPortCurrentLimit", 
                0x0834, 
                "kUSBSleepPowerSupply", 
                0x13EC, 
                "kUSBWakePortCurrentLimit", 
                0x0834, 
                "kUSBWakePowerSupply", 
                0x13EC
            })
        }
    }

    Method (_SB.PCI0.XHC._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (!Arg2)
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package (0x0E)
        {
            "RM,disable_FakePCIID", 
            One, 
            "subsystem-id", 
            Buffer (0x04)
            {
                 0x70, 0x72, 0x00, 0x00                         
            }, 

            "subsystem-vendor-id", 
            Buffer (0x04)
            {
                 0x86, 0x80, 0x00, 0x00                         
            }, 

            "AAPL,current-available", 
            Buffer (0x04)
            {
                 0x34, 0x08, 0x00, 0x00                         
            }, 

            "AAPL,current-extra", 
            Buffer (0x04)
            {
                 0x98, 0x08, 0x00, 0x00                         
            }, 

            "AAPL,current-extra-in-sleep", 
            Buffer (0x04)
            {
                 0x40, 0x06, 0x00, 0x00                         
            }, 

            "AAPL,max-port-current-in-sleep", 
            Buffer (0x04)
            {
                 0x34, 0x08, 0x00, 0x00                         
            }
        })
    }

    Method (_SB.PCI0.XDCI._STA, 0, NotSerialized)  // _STA: Status
    {
        If ((DVID != 0xFFFF))
        {
            Return (0x0F)
        }
        Else
        {
            Return (Zero)
        }
    }

    Name (_SB.PCI0.HDEF.RMCF, Package (0x02)
    {
        "CodecCommander", 
        Package (0x08)
        {
            "Version", 
            0x00020600, 
            "10ec_0283", 
            Package (0x08)
            {
                "Custom Commands", 
                Package (0x02)
                {
                    Package (0x00) {}, 
                    Package (0x08)
                    {
                        "Command", 
                        Buffer (0x04)
                        {
                             0x01, 0x97, 0x07, 0x25                         
                        }, 

                        "On Init", 
                        ">y", 
                        "On Sleep", 
                        ">n", 
                        "On Wake", 
                        ">y"
                    }
                }, 

                "Send Delay", 
                0x0A, 
                "Sleep Nodes", 
                ">n", 
                "Update Nodes", 
                ">n"
            }, 

            "10ec_0233", 
            Package (0x08)
            {
                "Custom Commands", 
                Package (0x02)
                {
                    Package (0x00) {}, 
                    Package (0x08)
                    {
                        "Command", 
                        Buffer (0x04)
                        {
                             0x01, 0x97, 0x07, 0x25                         
                        }, 

                        "On Init", 
                        ">y", 
                        "On Sleep", 
                        ">n", 
                        "On Wake", 
                        ">y"
                    }
                }, 

                "Send Delay", 
                0x0A, 
                "Sleep Nodes", 
                ">n", 
                "Update Nodes", 
                ">n"
            }, 

            "10ec_0235", 
            Package (0x08)
            {
                "Custom Commands", 
                Package (0x02)
                {
                    Package (0x00) {}, 
                    Package (0x08)
                    {
                        "Command", 
                        Buffer (0x04)
                        {
                             0x01, 0x97, 0x07, 0x25                         
                        }, 

                        "On Init", 
                        ">y", 
                        "On Sleep", 
                        ">n", 
                        "On Wake", 
                        ">y"
                    }
                }, 

                "Send Delay", 
                0x0A, 
                "Sleep Nodes", 
                ">n", 
                "Update Nodes", 
                ">n"
            }
        }
    })
    Method (_SB.PCI0.HDEF._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If ((Ones == \RMCF.AUDL))
        {
            Return (Zero)
        }

        If (!Arg2)
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Local0 = Package (0x0C)
            {
                "alc-layout-id", 
                Buffer (0x04) {}, 
                "layout-id", 
                Buffer (0x04)
                {
                     0x07, 0x00, 0x00, 0x00                         
                }, 

                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }, 

                "RM,disable_FakePCIID", 
                Ones, 
                "no-controller-patch", 
                Buffer (Zero) {}, 
                "PinConfigurations", 
                Buffer (Zero) {}
            }
        CreateDWordField (DerefOf (Local0 [One]), Zero, AUDL)
        AUDL = \RMCF.AUDL
        If (CondRefOf (\RMDA))
        {
            Local0 [0x02] = "#hda-gfx"
        }

        Local0 [0x07] = (One - \RMCF.FAKH)
        Return (Local0)
    }
}

