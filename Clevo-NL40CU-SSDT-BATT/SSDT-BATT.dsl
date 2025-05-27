/*
* This battery hot patch is generate by SSDT-BATT_Auto_Gen,
* which is a python program written by Eric Kwok.
*
* Note: Should be compile with -f option.
* For any support, plese visit https://github.com/the-eric-kwok/SSDT-BATT_Auto_Gen/issues
*
* [BATT] Rename UPBI to XPBI
* Find:    5550424900
* Replace: 5850424900
*
* [BATT] Rename UPBS to XPBS
* Find:    5550425300
* Replace: 5850425300
*
* [BATT] Rename GCMD to XCMD
* Find:    47434D440B
* Replace: 58434D440B
*
* [BATT] Rename CPKG to XPKG
* Find:    43504B470B
* Replace: 58504B470B
*
* [BATT] Rename PK0C to XK0C
* Find:    504B304303
* Replace: 584B304303
*
* [BATT] Rename PK0E to XK0E
* Find:    504B304503
* Replace: 584B304503
*
* [BATT] Rename _Q35 to XQ35
* Find:    5F51333500
* Replace: 5851333500
*
* [BATT] Rename _Q37 to XQ37
* Find:    5F51333700
* Replace: 5851333700
*
*/
DefinitionBlock ("", "SSDT", 2, "ERIC", "BATT", 0x00000000)
{
    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (R1B0, 1, NotSerialized)
        {
            OperationRegion (MEM0, SystemMemory, Arg0, One)
            Field (MEM0, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }
            
            Return (BYTE) /* \RE1B.BYTE */
        }
        
        Method (RDB0, 2, Serialized)
        {
            // RECB or RSMB
            // Arg0 - offset in bytes from zero-based EC
            // Arg1 - size of buffer in bits
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = R1B0 (Arg0)
                Arg0++
                Local0++
            }
            
            Return (TEMP) /* \RECB.TEMP */
        }
        
        Method (W1B0, 2, NotSerialized)
        {
            OperationRegion (MEM0, SystemMemory, Arg0, One)
            Field (MEM0, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }
            
            BYTE = Arg1
        }
        
        Method (WRB0, 3, Serialized)
        {
            // WECB or WSMB
            // Arg0 - offset in bytes from zero-based EC
            // Arg1 - size of buffer in bits
            // Arg2 - data to be written
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            name (TEMP, Buffer (Arg1){})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                W1B0 (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }
    }
    Scope (\_SB.BAT0)
    {
        Method (UPBI, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (^^PCI0.LPCB.EC.BAT0)
                {
                    Local0 = (^^PCI0.LPCB.EC.RDB0 (0xFE700116, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BDC0
                    PBIF [One] = Local0
                    Local0 = (^^PCI0.LPCB.EC.RDB0 (0xFE70011A, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BFC0
                    PBIF [0x02] = Local0
                    BFCC = Local0
                    Local0 = (^^PCI0.LPCB.EC.RDB0 (0xFE700122, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BDV0
                    PBIF [0x04] = Local0
                    Local0 = (^^PCI0.LPCB.EC.RDB0 (0xFE70013A, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BCW0
                    PBIF [0x05] = Local0
                    Local0 = (^^PCI0.LPCB.EC.RDB0 (0xFE70013E, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BCL0
                    PBIF [0x06] = Local0
                    PBIF [0x09] = "BAT"
                    PBIF [0x0A] = "0001"
                    PBIF [0x0B] = "LION"
                    PBIF [0x0C] = "Notebook"
                }
                Else
                {
                    IVBI ()
                }
            }
            Else
            {
                Return(XPBI())
            }
        }
        
        
        Method (UPBS, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (^^PCI0.LPCB.EC.BAT0)
                {
                    Local0 = Zero
                    Local1 = Zero
                    If (^^AC.ACFG)
                    {
                        If (((^^PCI0.LPCB.EC.RDB0 (0xFE700126, 32) & 0x02) == 0x02)) // \_SB.PCI0.LPCB.EC.BST0
                        {
                            Local0 |= 0x02
                            Local1 = (^^PCI0.LPCB.EC.RDB0 (0xFE70012A, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BPR0
                        }
                    }
                    Else
                    {
                        Local0 |= One
                        Local1 = (^^PCI0.LPCB.EC.RDB0 (0xFE70012A, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BPR0
                    }
                    
                    Local7 = (Local1 & 0x8000)
                    If ((Local7 == 0x8000))
                    {
                        Local1 ^= 0xFFFF
                    }
                    
                    Local2 = (^^PCI0.LPCB.EC.RDB0 (0xFE70012E, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BRC0
                    Local3 = (^^PCI0.LPCB.EC.RDB0 (0xFE700132, 32) & 0xFFFF) // \_SB.PCI0.LPCB.EC.BPV0
                    CUNT++
                    If ((CUNT >= 0x10E0))
                    {
                        CUNT = Zero
                        PRM0 = 0x13
                        SSMP = 0xC0
                    }
                    
                    If (Local2)
                    {
                        If ((BMNM >= 0x0C))
                        {
                            If ((BMNM < 0x0F))
                            {
                                If (^^PCI0.LPCB.EC.RCHG)
                                {
                                    If (^^PCI0.LPCB.EC.ACOT)
                                    {
                                        Local2 = ((^^PCI0.LPCB.EC.RDB0 (0xFE70011A, 32) * 0x63) / 0x64) // \_SB.PCI0.LPCB.EC.BFC0
                                    }
                                    Else
                                    {
                                        Local2 = ((Local2 * 0x64) / 0x4F)
                                    }
                                }
                                Else
                                {
                                    Local2 = ((Local2 * 0x64) / 0x59)
                                }
                            }
                            ElseIf (^^PCI0.LPCB.EC.RCHG)
                            {
                                If (^^PCI0.LPCB.EC.ACOT)
                                {
                                    Local2 = ((^^PCI0.LPCB.EC.RDB0 (0xFE70011A, 32) * 0x63) / 0x64) // \_SB.PCI0.LPCB.EC.BFC0
                                }
                                Else
                                {
                                    Local2 = ((Local2 * 0x64) / 0x4A)
                                }
                            }
                            Else
                            {
                                Local2 = ((Local2 * 0x64) / 0x54)
                            }
                        }
                        ElseIf (^^PCI0.LPCB.EC.RCHG)
                        {
                            If (^^PCI0.LPCB.EC.ACOT)
                            {
                                Local2 = ((^^PCI0.LPCB.EC.RDB0 (0xFE70011A, 32) * 0x63) / 0x64) // \_SB.PCI0.LPCB.EC.BFC0
                            }
                            Else
                            {
                                Local2 = ((Local2 * 0x64) / 0x59)
                            }
                        }
                    }
                    
                    If ((PSF0 & 0x0200))
                    {
                        If (BFCC)
                        {
                            Local6 = (BFCC / 0x64)
                            Local5 = (Local6 * 0x03)
                            If ((Local2 < Local5))
                            {
                                Local2 = Local6
                            }
                        }
                    }
                    
                    PBST [Zero] = Local0
                    PBST [One] = Local1
                    PBST [0x02] = Local2
                    PBST [0x03] = Local3
                    If ((BFCC != ^^PCI0.LPCB.EC.RDB0 (0xFE70011A, 32))) // \_SB.PCI0.LPCB.EC.BFC0
                    {
                        Notify (BAT0, 0x81)
                    }
                }
                Else
                {
                    IVBS ()
                }
            }
            Else
            {
                Return(XPBS())
            }
        }
        
        
    }
    Scope (\_SB.WMI)
    {
        Method (GCMD, 3, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (ARGS, Zero)
                If (SizeOf (Arg2))
                {
                    ARGS = Arg2
                }
                
                Local0 = Zero
                If ((ToInteger (Arg1) == One))
                {
                    If (HKDR)
                    {
                        Local0 = EVNT
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x05))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16) & 0x08)) // \_SB.PCI0.LPCB.EC.OEM3
                            {
                                If ((Local1 & 0x02))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x06))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16) & 0x04)) // \_SB.PCI0.LPCB.EC.OEM3
                            {
                                If ((PDO2 & 0x40))
                                {
                                    Local0 = 0x02
                                }
                                ElseIf ((Local1 & One))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x07))
                {
                    If (^^PCI0.LPCB.EC.SLTY)
                    {
                        Local0 = ^^PCI0.LPCB.EC.SLTY
                    }
                    ElseIf ((MPSR && DISB))
                    {
                        Local0 = 0x02
                    }
                    Else
                    {
                        Local0 = One
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x08))
                {
                    Local0 = GHPI ()
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x09))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((Local1 & 0x10))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x0A))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16) & 0x20)) // \_SB.PCI0.LPCB.EC.OEM3
                            {
                                If ((Local1 & 0x08))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x10))
                {
                    Return (Zero)
                }
                
                If ((ToInteger (Arg1) == 0x11))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((Local1 & 0x40))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x12))
                {
                    Name (PFBF, Buffer (0x0100)
                    {
                        0x00
                    })
                    If (PFBA)
                    {
                        OperationRegion (PFMM, SystemMemory, PFBA, 0x0100)
                        Field (PFMM, ByteAcc, NoLock, Preserve)
                        {
                            PFDB,   2048
                        }
                        
                        PFBF = PFDB
                    }
                    
                    Return (PFBF)
                }
                
                If ((ToInteger (Arg1) == 0x32))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Local0 = ^^PCI0.LPCB.EC.RDB0 (0xFE700116, 32)  // \_SB.PCI0.LPCB.EC.BDC0
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x33))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x34))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x38))
                {
                    Local0 = One
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x39))
                {
                    Return (^^PCI0.TMSS.GTMP ())
                }
                
                If ((ToInteger (Arg1) == 0x3B))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x06
                        ^^PCI0.LPCB.EC.FBUF = One
                        ^^PCI0.LPCB.EC.FBF1 = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xB1
                        Local0 = ^^PCI0.LPCB.EC.FBF1
                        Local0 = ((Local0 << 0x08) | ^^PCI0.LPCB.EC.FBUF)
                        Local0 = ((Local0 << 0x08) | ^^PCI0.LPCB.EC.FDAT)
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3C))
                {
                    If (((PSF0 & 0x10) == Zero))
                    {
                        If (^^PCI0.GFX0.PDDS (0x0300))
                        {
                            Local0 = One
                        }
                        Else
                        {
                            Local0 = Zero
                        }
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3D))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                        Local0 = ^^PCI0.LPCB.EC.FBUF
                        ^^PCI0.LPCB.EC.FCMD = Zero
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA2
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        Local1 = ^^PCI0.LPCB.EC.FDAT
                        If ((Local1 & 0x7E))
                        {
                            Local0 = One
                        }
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3F))
                {
                    Local0 = Zero
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x41))
                {
                    ^^PCI0.LPCB.EC.FDAT = ((ARGS >> 0x18) & 0xFF)
                    ^^PCI0.LPCB.EC.FBUF = ((ARGS >> 0x10) & 0xFF)
                    ^^PCI0.LPCB.EC.FBF1 = ((ARGS >> 0x08) & 0xFF)
                    ^^PCI0.LPCB.EC.FCMD = (ARGS & 0xFF)
                    Local0 = ^^PCI0.LPCB.EC.FDAT
                    Local0 |= (^^PCI0.LPCB.EC.FBUF << 0x08)
                    Local0 |= (^^PCI0.LPCB.EC.FBF1 << 0x10)
                    Local0 |= (^^PCI0.LPCB.EC.FBF2 << 0x18)
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x42))
                {
                    Local0 = BKST
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x43))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x45))
                {
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x51))
                {
                    Noop
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x52))
                {
                    Return (PSF1)
                }
                
                If ((ToInteger (Arg1) == 0x60))
                {
                    Return (PSF4)
                }
                
                If ((ToInteger (Arg1) == 0x62))
                {
                    Return (Zero)
                }
                
                If ((ToInteger (Arg1) == 0x63))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FBF2
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FDAT
                            Local0 = ^^PCI0.LPCB.EC.FBF2
                            Local0 = ((Local0 << 0x08) | Local1)
                            Local0 = ((Local0 << 0x08) | Local2)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x64))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local0 = ^^PCI0.LPCB.EC.FDAT
                            Local2 = ^^PCI0.LPCB.EC.FBUF
                            Local3 = ^^PCI0.LPCB.EC.FBF1
                            Local0 = ((Local0 << 0x08) | Local2)
                            Local0 = ((Local0 << 0x08) | Local3)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x6E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local0 = ^^PCI0.LPCB.EC.FDAT
                            Local2 = ^^PCI0.LPCB.EC.FBUF
                            Local3 = ^^PCI0.LPCB.EC.FBF1
                            Local0 = ((Local0 << 0x08) | Local2)
                            Local0 = ((Local0 << 0x08) | Local3)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x6F))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            Local0 = ^^PCI0.LPCB.EC.FBF2
                            Local0 |= (Local0 << 0x08)
                            Local0 = ((Local0 << 0x08) | Local1)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x70))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FBUF
                            Local0 = ^^PCI0.LPCB.EC.FBF1
                            Local0 |= (Local1 << 0x08)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x04
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FDAT
                            Local1 = ^^PCI0.LPCB.EC.FBUF
                            Local1 |= (Local2 << 0x08)
                            Local0 |= (Local1 << 0x10)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x71))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x05
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            Local0 = ^^PCI0.LPCB.EC.FBUF
                            Local0 |= (Local1 << 0x08)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FBUF
                            Local1 = ^^PCI0.LPCB.EC.FBF1
                            Local1 |= (Local2 << 0x08)
                            Local0 |= (Local1 << 0x10)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x73))
                {
                    Local1 = (INDX & 0xFFFF)
                    Local2 = ((INDX >> 0x10) & 0xFFFF)
                    If ((Local2 > 0x02))
                    {
                        Local2 = Zero
                    }
                    
                    If ((Local1 > 0xFF))
                    {
                        Return (Zero)
                    }
                    
                    Local2 = (One << Local2)
                    Local3 = Local2
                    Local3--
                    If (((Local1 + Local3) > 0xFF))
                    {
                        Return (Zero)
                    }
                    
                    Local0 = (Local1 + 0xFE700100)
                    Name (RBUF, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        OperationRegion (RH2M, SystemMemory, Local0, Local2)
                        Switch (ToInteger (Local2))
                        {
                            Case (One)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMB,   8
                                }
                                
                                RBUF = RHMB
                            }
                            Case (0x02)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMW,   16
                                }
                                
                                RBUF = RHMW
                            }
                            Case (0x04)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMD,   32
                                }
                                
                                RBUF = RHMD
                            }
                            
                        }
                    }
                    
                    Return (RBUF)
                }
                
                If ((ToInteger (Arg1) == 0x77))
                {
                    Local0 = (BAEE >> One)
                    Local0 |= (BSCP << 0x08)
                    Local0 |= (BTCP << 0x10)
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x7A))
                {
                    Local0 = (PSF2 & 0xFFFFFFFFBFFFFBFF)
                    If (PSTG ())
                    {
                        Local0 |= 0x0400
                    }
                    
                    If ((OSYS >= 0x07DF))
                    {
                        If ((PPMF & 0x00400000))
                        {
                            If (((OSCP & 0x20) && (OSCP & 0x40)))
                            {
                                Local0 |= 0x40000000
                            }
                        }
                    }
                    
                    Return (Local0)
                }
                
                Return (Ones)
            }
            Else
            {
                Return(XCMD(Arg0, Arg1, Arg2))
            }
        }
        
        
        Method (CPKG, 3, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (ARGP, Buffer (0x0100)
                {
                    0x00
                })
                CreateQWordField (Arg2, Zero, WQW1)
                CreateQWordField (Arg2, 0x08, WQW2)
                CreateQWordField (Arg2, 0x10, WRW1)
                CreateQWordField (Arg2, 0x18, WRW2)
                ARGP = Arg2
                If ((WQW1 & One))
                {
                    If (HKDR)
                    {
                        ARGP [0x20] = EVNT
                    }
                }
                
                If (((WQW1 >> 0x04) & 0x1037))
                {
                    Local7 = Zero
                    If (((WQW1 >> 0x04) & One))
                    {
                        If (((WRW1 >> 0x04) & One))
                        {
                            ARGP [0x24] = 0x05
                        }
                        Else
                        {
                            Local7 |= One
                        }
                    }
                    
                    If (((WQW1 >> 0x05) & One))
                    {
                        If (((WRW1 >> 0x05) & One))
                        {
                            ARGP [0x25] = 0x06
                        }
                        Else
                        {
                            Local7 |= 0x02
                        }
                    }
                    
                    If (((WQW1 >> 0x06) & One))
                    {
                        If (((WRW1 >> 0x06) & One))
                        {
                            ARGP [0x26] = 0x07
                        }
                        Else
                        {
                            Local7 |= 0x04
                        }
                    }
                    
                    If (((WQW1 >> 0x08) & One))
                    {
                        If (((WRW1 >> 0x08) & One))
                        {
                            ARGP [0x28] = 0x09
                        }
                        Else
                        {
                            Local7 |= 0x10
                        }
                    }
                    
                    If (((WQW1 >> 0x09) & One))
                    {
                        If (((WRW1 >> 0x09) & One))
                        {
                            ARGP [0x29] = 0x0A
                        }
                        Else
                        {
                            Local7 |= 0x20
                        }
                    }
                    
                    If (((WQW1 >> 0x10) & One))
                    {
                        If (((WRW1 >> 0x10) & One))
                        {
                            ARGP [0x30] = 0x11
                        }
                        Else
                        {
                            Local7 |= 0x1000
                        }
                    }
                    
                    If (Local7)
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xA1
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FDAT
                                Local2 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16)  // \_SB.PCI0.LPCB.EC.OEM3
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                            
                            If ((Local7 & One))
                            {
                                If ((Local2 & 0x08))
                                {
                                    If ((Local1 & 0x02))
                                    {
                                        ARGP [0x24] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x24] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x24] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x02))
                            {
                                If ((Local2 & 0x04))
                                {
                                    If ((PDO2 & 0x40))
                                    {
                                        ARGP [0x25] = 0x02
                                    }
                                    ElseIf ((Local1 & One))
                                    {
                                        ARGP [0x25] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x25] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x25] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x04))
                            {
                                If ((Local2 & 0x10))
                                {
                                    If ((Local1 & 0x04))
                                    {
                                        ARGP [0x26] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x26] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x26] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x10))
                            {
                                If ((Local1 & 0x10))
                                {
                                    ARGP [0x28] = One
                                }
                                Else
                                {
                                    ARGP [0x28] = Zero
                                }
                            }
                            
                            If ((Local7 & 0x20))
                            {
                                If ((Local2 & 0x20))
                                {
                                    If ((Local1 & 0x08))
                                    {
                                        ARGP [0x29] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x29] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x29] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x1000))
                            {
                                If ((Local1 & 0x40))
                                {
                                    ARGP [0x30] = One
                                }
                                Else
                                {
                                    ARGP [0x30] = Zero
                                }
                            }
                        }
                        Else
                        {
                            If ((Local7 & One))
                            {
                                ARGP [0x24] = Ones
                            }
                            
                            If ((Local7 & 0x02))
                            {
                                ARGP [0x25] = Ones
                            }
                            
                            If ((Local7 & 0x04))
                            {
                                ARGP [0x26] = Ones
                            }
                            
                            If ((Local7 & 0x10))
                            {
                                ARGP [0x28] = Ones
                            }
                            
                            If ((Local7 & 0x20))
                            {
                                ARGP [0x29] = Ones
                            }
                            
                            If ((Local7 & 0x1000))
                            {
                                ARGP [0x30] = Ones
                            }
                        }
                    }
                }
                
                If (((WQW1 >> 0x07) & One))
                {
                    If (((WRW1 >> 0x07) & One))
                    {
                        ARGP [0x27] = 0x08
                    }
                    Else
                    {
                        Local0 = GHPI ()
                        ARGP [0x27] = Local0
                    }
                }
                
                If (((WQW1 >> 0x0F) & One))
                {
                    If (((WRW1 >> 0x0F) & One))
                    {
                        ARGP [0x2F] = 0x10
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.SLFG)
                        {
                            Local0 |= One
                        }
                        
                        If (\_TZ.TZ0.PPFG)
                        {
                            Local0 |= 0x02
                        }
                        
                        ARGP [0x2F] = Local0
                    }
                }
                
                If (((WQW1 >> 0x11) & One))
                {
                    If (((WRW1 >> 0x11) & One))
                    {
                        ARGP [0x31] = 0x12
                    }
                    Else
                    {
                        Name (PFBF, Buffer (0x0100)
                        {
                            0x00
                        })
                        If (PFBA)
                        {
                            OperationRegion (PFMM, SystemMemory, PFBA, 0x0100)
                            Field (PFMM, ByteAcc, NoLock, Preserve)
                            {
                                PFDB,   2048
                            }
                            
                            PFBF = PFDB
                        }
                        
                        Return (PFBF)
                    }
                }
                
                If (((WQW1 >> 0x12) & One))
                {
                    If (((WRW1 >> 0x12) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x32]))
                            {
                                ^^PCI0.LPCB.EC.ECKS |= 0x80
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.ECKS &= 0x7F
                            }
                        }
                    }
                    
                    ARGP [0x32] = 0x13
                }
                
                If (((WQW1 >> 0x1E) & One))
                {
                    If (((WRW1 >> 0x1E) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x3E]))
                            {
                                ^^PCI0.LPCB.EC.FDAT = One
                                P80B = 0xDF
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.FDAT = Zero
                                P80B = 0x5F
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = 0xA4
                        }
                    }
                    
                    ARGP [0x3E] = 0x1F
                }
                
                If (((WQW1 >> 0x1F) & One))
                {
                    If (((WRW1 >> 0x1F) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x3F]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA2
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x3F] = 0x20
                }
                
                If (((WQW1 >> 0x20) & One))
                {
                    If (((WRW1 >> 0x20) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x40]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA3
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x40] = 0x21
                }
                
                If (((WQW1 >> 0x21) & One))
                {
                    If (((WRW1 >> 0x21) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x41]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA1
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x41] = 0x22
                }
                
                If (((WQW1 >> 0x26) & One))
                {
                    If (((WRW1 >> 0x26) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = Zero
                            ^^PCI0.LPCB.EC.FBUF = ToInteger (DerefOf (ARGP [0x47]))
                            ^^PCI0.LPCB.EC.FCMD = 0xCA
                        }
                    }
                    
                    ARGP [0x47] = 0x27
                }
                
                If (((WQW1 >> 0x29) & One))
                {
                    If (((WRW1 >> 0x29) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x4C]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA5
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x4C] = 0x2A
                }
                
                If (((WQW1 >> 0x31) & One))
                {
                    CreateWordField (ARGP, 0x54, DA50)
                    If (((WRW1 >> 0x31) & One))
                    {
                        DA50 = 0x32
                    }
                    Else
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local0 = ^^PCI0.LPCB.EC.RDB0 (0xFE700116, 32)  // \_SB.PCI0.LPCB.EC.BDC0
                        }
                        Else
                        {
                            Local0 = Ones
                        }
                        
                        DA50 = Local0
                    }
                }
                
                If (((WQW1 >> 0x37) & One))
                {
                    If (((WRW1 >> 0x37) & One))
                    {
                        ARGP [0x5D] = 0x38
                    }
                    Else
                    {
                        ARGP [0x5D] = One
                    }
                }
                
                If (((WQW1 >> 0x38) & One))
                {
                    If (((WRW1 >> 0x38) & One))
                    {
                        ARGP [0x5E] = 0x39
                    }
                    Else
                    {
                        ARGP [0x5E] = ^^PCI0.TMSS.GTMP ()
                    }
                }
                
                If (((WQW1 >> 0x3B) & One))
                {
                    If (((WRW1 >> 0x3B) & One))
                    {
                        ARGP [0x61] = 0x3C
                    }
                    Else
                    {
                        Local0 = Zero
                        If (((PSF0 & 0x10) == Zero))
                        {
                            If (^^PCI0.GFX0.PDDS (0x0300))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                        }
                        
                        ARGP [0x61] = Local0
                    }
                }
                
                If (((WQW1 >> 0x3C) & One))
                {
                    If (((WRW1 >> 0x3C) & One))
                    {
                        ARGP [0x62] = 0x3D
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = One
                            ^^PCI0.LPCB.EC.FCMD = 0xCA
                            Local0 = ^^PCI0.LPCB.EC.FBUF
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ARGP [0x62] = Local0
                    }
                }
                
                If (((WQW1 >> 0x3D) & One))
                {
                    If (((WRW1 >> 0x3D) & One))
                    {
                        ARGP [0x63] = 0x3E
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xA2
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((Local1 & 0x7E))
                            {
                                Local0 = One
                            }
                        }
                        
                        ARGP [0x63] = Local0
                    }
                }
                
                If (((WQW1 >> 0x3E) & One))
                {
                    If (((WRW1 >> 0x3E) & One))
                    {
                        ARGP [0x64] = 0x3F
                    }
                    Else
                    {
                        ARGP [0x64] = Zero
                    }
                }
                
                If (((WQW2 >> One) & One))
                {
                    ARGP [0x67] = BKST
                }
                
                If (((WQW2 >> 0x05) & One))
                {
                    CreateDWordField (ARGP, 0x6B, P700)
                    CreateDWordField (ARGP, 0x6F, P701)
                    CreateDWordField (ARGP, 0x73, P702)
                    CreateDWordField (ARGP, 0x77, P703)
                    If (((WRW2 >> 0x05) & One))
                    {
                        P700 = 0x46
                        P701 = Zero
                        P702 = Zero
                        P703 = Zero
                    }
                    Else
                    {
                        HKDR = One
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If ((LKFG & One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x05
                                ^^PCI0.LPCB.EC.FBUF = One
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }
                            
                            If ((PSF4 & 0x04))
                            {
                                ^^PCI0.LPCB.EC.AIRP |= 0x10
                            }
                        }
                        
                        P700 = PSF3
                        P701 = Zero
                        P702 = Zero
                        P703 = Zero
                    }
                }
                
                If (((WQW2 >> 0x07) & One))
                {
                    ^^AC.IGNR = One
                    ARGP [0x7C] = 0x48
                }
                
                If (((WQW2 >> 0x08) & One))
                {
                    Notify (PWRB, 0x80)
                    ARGP [0x7D] = 0x49
                }
                
                If (((WQW2 >> 0x0B) & One))
                {
                    If (((WRW2 >> 0x0B) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x80]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA4
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x80] = 0x4C
                }
                
                If (((WQW2 >> 0x0E) & One))
                {
                    If (((WRW2 >> 0x0E) & One))
                    {
                        Switch (ToInteger (DerefOf (ARGP [0x83])))
                        {
                            Case (Zero)
                            {
                                P80B = 0x4F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 &= 0xFFFFFFFFFFFFFFCF
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            Case (One)
                            {
                                P80B = 0x5F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x10)
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            Case (0x02)
                            {
                                P80B = 0x6F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x20)
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            
                        }
                        
                        If ((NVBB & 0xFFFF))
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                If (^^AC.ACFG)
                                {
                                    Local5 = Zero
                                    Local6 = One
                                }
                                Else
                                {
                                    Local5 = ^^PCI0.LPCB.EC.BBST
                                    If ((Local5 == Zero))
                                    {
                                        Local5 = (((NVBB >> 0x04) & 0xF0) | (NVBB &
                                        0x0F))
                                        Local6 = (NVBB & 0x0F)
                                    }
                                    Else
                                    {
                                        Local6 = (Local5 & 0x0F)
                                    }
                                }
                                
                                ^^PCI0.LPCB.EC.BBST = Local5
                                Notify (^^PCI0.PEG0.PEGP, (Local6 | 0xD0))
                            }
                        }
                    }
                    
                    ARGP [0x83] = 0x4F
                }
                
                If (((WQW2 >> 0x11) & One))
                {
                    CreateDWordField (ARGP, 0x8A, P821)
                    CreateDWordField (ARGP, 0x8E, P822)
                    CreateDWordField (ARGP, 0x92, P823)
                    CreateDWordField (ARGP, 0x96, P824)
                    P821 = PSF1
                    P822 = Zero
                    P823 = Zero
                    P824 = Zero
                }
                
                If (((WQW2 >> 0x14) & One))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.INF2 |= 0x02
                    }
                    
                    ARGP [0x9C] = 0x55
                }
                
                If (((WQW2 >> 0x19) & One))
                {
                    If (((WRW2 >> 0x19) & One))
                    {
                        Switch (ToInteger (DerefOf (ARGP [0xA1])))
                        {
                            Case (Zero)
                            {
                                ^^LID0.WMIF = One
                                Notify (LID0, 0x80)
                            }
                            Case (One)
                            {
                                Notify (SLPB, 0x80)
                            }
                            Case (0x02)
                            {
                                Notify (PWRB, 0x80)
                            }
                            
                        }
                    }
                    
                    ARGP [0xA1] = 0x5A
                }
                
                If (((WQW2 >> 0x1A) & One))
                {
                    If (((WRW2 >> 0x1A) & One))
                    {
                        PRM1 = DerefOf (ARGP [0xA2])
                        PRM0 = 0x07
                        SSMP = 0xC0
                    }
                    
                    ARGP [0xA2] = 0x5B
                }
                
                If (((WQW2 >> 0x1D) & One))
                {
                    If (((WRW2 >> 0x1D) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xA5]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA6
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0xA5] = 0x5E
                }
                
                If (((WQW2 >> 0x21) & One))
                {
                    If (((WRW2 >> 0x21) & One))
                    {
                        ARGP [0xA9] = 0x62
                    }
                    Else
                    {
                        ARGP [0xA9] = Zero
                    }
                }
                
                If (((WQW2 >> 0x22) & One))
                {
                    CreateByteField (ARGP, 0xAA, P990)
                    CreateByteField (ARGP, 0xAB, P991)
                    CreateByteField (ARGP, 0xAC, P992)
                    If (((WRW2 >> 0x22) & One))
                    {
                        P990 = 0x63
                        P991 = Zero
                        P992 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            P991 = ^^PCI0.LPCB.EC.FBF2
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            P990 = ^^PCI0.LPCB.EC.FDAT
                            P992 = ^^PCI0.LPCB.EC.FBF2
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        P990 = Ones
                        P991 = Ones
                        P992 = Ones
                    }
                }
                
                If (((WQW2 >> 0x23) & One))
                {
                    CreateByteField (ARGP, 0xAD, PH00)
                    CreateByteField (ARGP, 0xAE, PH01)
                    CreateByteField (ARGP, 0xAF, PH02)
                    If (((WRW2 >> 0x23) & One))
                    {
                        PH00 = 0x64
                        PH01 = Zero
                        PH02 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PH02 = ^^PCI0.LPCB.EC.FDAT
                            PH01 = ^^PCI0.LPCB.EC.FBUF
                            PH00 = ^^PCI0.LPCB.EC.FBF1
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PH00 = Ones
                        PH01 = Ones
                        PH02 = Ones
                    }
                }
                
                If (((WQW2 >> 0x24) & One))
                {
                    If (((WRW2 >> 0x24) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xB0]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA9
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0xB0] = 0x65
                }
                
                If (((WQW2 >> 0x26) & One))
                {
                    CreateDWordField (ARGP, 0xB2, PH30)
                    If (((WRW2 >> 0x26) & One))
                    {
                        Local2 = ((PH30 >> 0x0C) & 0x0F)
                        If ((Local2 >= 0x0A))
                        {
                            Local2 = Zero
                        }
                        Else
                        {
                            Local2 *= 0x19
                            Local2 = (0xFF - Local2)
                        }
                        
                        Local3 = ((PH30 >> 0x10) & 0xFF)
                        Local4 = ((PH30 >> 0x18) & 0x0F)
                        Local7 = ((PH30 >> 0x1C) & 0x0F)
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (((Local7 >= 0x07) && (Local7 <= 0x0B)))
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local7
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }
                            Else
                            {
                                If ((Local7 == Zero))
                                {
                                    Local0 = Zero
                                    Local0 = (PH30 & 0x07)
                                    Local0 |= ((PH30 >> One) & 0x38)
                                    Local0 |= ((PH30 >> 0x02) & 0x01C0)
                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FBUF = (Local0 >> 0x08)
                                    ^^PCI0.LPCB.EC.FCMD = 0xC2
                                }
                                
                                If ((Local7 == One))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x03
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x02))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x04
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x03))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x06
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FBF1 = Local4
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x04))
                                {
                                    If (Local3)
                                    {
                                        Local0 = 0x0D
                                    }
                                    Else
                                    {
                                        Local0 = 0x0E
                                    }
                                    
                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x0C)){}
                                If ((Local7 == 0x0D))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x02
                                    ^^PCI0.LPCB.EC.FBUF = Local2
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x0E))
                                {
                                    Local1 = ((PH30 >> 0x0E) & 0x1F)
                                    If ((PH30 & 0x2000))
                                    {
                                        Local1 |= 0x20
                                    }
                                    
                                    ^^PCI0.LPCB.EC.FDAT = 0x0C
                                    ^^PCI0.LPCB.EC.FBUF = Local1
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x0F))
                                {
                                    Local6 = Zero
                                    Local3 = (PH30 & 0xFF)
                                    Local2 = ((PH30 >> 0x08) & 0xFF)
                                    Local1 = ((PH30 >> 0x10) & 0xFF)
                                    If ((Local4 < 0x03))
                                    {
                                        Local0 = (Local4 + 0x03)
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x03))
                                    {
                                        Local0 = 0x07
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x04))
                                    {
                                        Local0 = 0x06
                                        Local1 = (PH30 & 0xFF)
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x06))
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = 0x09
                                        ^^PCI0.LPCB.EC.FBUF = Local1
                                        ^^PCI0.LPCB.EC.FBF1 = Local2
                                        ^^PCI0.LPCB.EC.FBF2 = Local3
                                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                                        Local0 = 0x0A
                                        Local6 = 0xCA
                                    }
                                    
                                    If (Local6)
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = Local0
                                        ^^PCI0.LPCB.EC.FBUF = Local1
                                        ^^PCI0.LPCB.EC.FBF1 = Local2
                                        ^^PCI0.LPCB.EC.FBF2 = Local3
                                        ^^PCI0.LPCB.EC.FCMD = Local6
                                    }
                                }
                            }
                        }
                    }
                    
                    PH30 = 0x67
                }
                
                If (((WQW2 >> 0x27) & One))
                {
                    CreateDWordField (ARGP, 0xB6, PH40)
                    If (((WRW2 >> 0x27) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local4 = PH40
                            ^^PCI0.LPCB.EC.FDAT = One
                            ^^PCI0.LPCB.EC.FBUF = (Local4 & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x02
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x08) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x03
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x10) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x04
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x18) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }
                    }
                    
                    PH40 = 0x68
                }
                
                If (((WQW2 >> 0x28) & One))
                {
                    If (((WRW2 >> 0x28) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local4 = DerefOf (ARGP [0xBA])
                            If ((Local4 & One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = One
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                            
                            If ((Local4 & 0x02))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x02
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                            
                            If ((Local4 & 0x04))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x03
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                            
                            If ((Local4 & 0x08))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x04
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                        }
                    }
                    
                    ARGP [0xBA] = 0x69
                }
                
                If (((WQW2 >> 0x0191) & One))
                {
                    CreateWordField (ARGP, 0xBB, PH60)
                    If (((WRW2 >> 0x29) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local0 = ((PH60 >> 0x08) & 0xFF)
                            Local1 = (PH60 & 0xFF)
                            ^^PCI0.LPCB.EC.FDAT = Local0
                            ^^PCI0.LPCB.EC.FBUF = Local1
                            ^^PCI0.LPCB.EC.FCMD = 0xBA
                            P80B = PH60
                        }
                    }
                    
                    PH60 = 0x6A
                }
                
                If (((WQW2 >> 0x2A) & One))
                {
                    CreateDWordField (ARGP, 0xBD, PH70)
                    If (((WRW2 >> 0x2A) & One))
                    {
                        INDX = PH70
                    }
                    
                    PH70 = 0x6B
                }
                
                If (((WQW2 >> 0x2B) & One))
                {
                    If (((WRW2 >> 0x2B) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xC1]))
                            {
                                ^^PCI0.LPCB.EC.AIRP |= 0x80
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.AIRP &= 0x7F
                            }
                        }
                    }
                    
                    ARGP [0xC1] = 0x6C
                }
                
                If (((WQW2 >> 0x2D) & One))
                {
                    CreateByteField (ARGP, 0xC3, PHA0)
                    CreateByteField (ARGP, 0xC4, PHA1)
                    CreateByteField (ARGP, 0xC5, PHA2)
                    If (((WRW2 >> 0x2D) & One))
                    {
                        PHA0 = 0x6E
                        PHA1 = Zero
                        PHA2 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PHA2 = ^^PCI0.LPCB.EC.FDAT
                            PHA1 = ^^PCI0.LPCB.EC.FBUF
                            PHA0 = ^^PCI0.LPCB.EC.FBF1
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PHA0 = Ones
                        PHA1 = Ones
                        PHA2 = Ones
                    }
                }
                
                If (((WQW2 >> 0x2E) & One))
                {
                    CreateByteField (ARGP, 0xC6, PHB0)
                    CreateByteField (ARGP, 0xC7, PHB1)
                    CreateByteField (ARGP, 0xC8, PHB2)
                    If (((WRW2 >> 0x2E) & One))
                    {
                        PHB0 = 0x6F
                        PHB1 = Zero
                        PHB2 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PHB0 = ^^PCI0.LPCB.EC.FDAT
                            PHB1 = ^^PCI0.LPCB.EC.FBF2
                            PHB2 = Zero
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PHB0 = Ones
                        PHB1 = Ones
                        PHB2 = Ones
                    }
                }
                
                If (((WQW2 >> 0x2F) & One))
                {
                    CreateDWordField (ARGP, 0xC9, PHC0)
                    If (((WRW2 >> 0x2F) & One))
                    {
                        PHC0 = 0x70
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x03
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FBUF
                                Local0 = ^^PCI0.LPCB.EC.FBF1
                                Local0 |= (Local1 << 0x08)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = 0x04
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local2 = ^^PCI0.LPCB.EC.FDAT
                                Local1 = ^^PCI0.LPCB.EC.FBUF
                                Local1 |= (Local2 << 0x08)
                                Local0 |= (Local1 << 0x10)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                        }
                        Else
                        {
                            Local0 = Ones
                        }
                        
                        PHC0 = Local0
                    }
                }
                
                If (((WQW2 >> 0x30) & One))
                {
                    CreateDWordField (ARGP, 0xCD, PHD0)
                    If (((WRW2 >> 0x30) & One))
                    {
                        PHD0 = 0x71
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x05
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FDAT
                                Local0 = ^^PCI0.LPCB.EC.FBUF
                                Local0 |= (Local1 << 0x08)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = 0x02
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local2 = ^^PCI0.LPCB.EC.FBUF
                                Local1 = ^^PCI0.LPCB.EC.FBF1
                                Local1 |= (Local2 << 0x08)
                                Local0 |= (Local1 << 0x10)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                        }
                        Else
                        {
                            Local0 = Ones
                        }
                        
                        PHD0 = Local0
                    }
                }
                
                If (((WQW2 >> 0x32) & One))
                {
                    CreateDWordField (ARGP, 0xD2, PHF0)
                    If (((WRW2 >> 0x32) & One))
                    {
                        PHF0 = 0x73
                    }
                    Else
                    {
                        Local1 = (INDX & 0xFFFF)
                        Local2 = ((INDX >> 0x10) & 0xFFFF)
                        If ((Local2 > 0x02))
                        {
                            Local2 = Zero
                        }
                        
                        If ((Local1 > 0xFF))
                        {
                            PHF0 = Zero
                        }
                        Else
                        {
                            Local2 = (One << Local2)
                            Local3 = Local2
                            Local3--
                            If (((Local1 + Local3) > 0xFF))
                            {
                                PHF0 = Zero
                            }
                            Else
                            {
                                Local0 = (Local1 + 0xFE700100)
                                Name (RBUF, Buffer (0x04)
                                {
                                    0x00, 0x00, 0x00, 0x00
                                })
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    OperationRegion (RH2M, SystemMemory, Local0, Local2)
                                    Switch (ToInteger (Local2))
                                    {
                                        Case (One)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMB,   8
                                            }
                                            
                                            RBUF = RHMB
                                        }
                                        Case (0x02)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMW,   16
                                            }
                                            
                                            RBUF = RHMW
                                        }
                                        Case (0x04)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMD,   32
                                            }
                                            
                                            RBUF = RHMD
                                        }
                                        
                                    }
                                    
                                    PHF0 = RBUF
                                }
                            }
                        }
                    }
                }
                
                If (((WQW2 >> 0x33) & One))
                {
                    CreateDWordField (ARGP, 0xD6, PHG0)
                    CreateField (PHG0, Zero, One, SMUT)
                    CreateField (PHG0, One, 0x07, SAUD)
                    If (((WRW2 >> 0x33) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (ToInteger (SMUT))
                            {
                                Local0 = Zero
                            }
                            Else
                            {
                                Local0 = ToInteger (SAUD)
                                If ((Local0 > 0x64))
                                {
                                    Local0 = 0x64
                                }
                            }
                            
                            If (((LKFG & 0x0C) == 0x04)){}
                            Else
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local0
                                ^^PCI0.LPCB.EC.FCMD = 0xC6
                            }
                        }
                    }
                    
                    PHG0 = 0x74
                }
                
                If (((WQW2 >> 0x34) & One))
                {
                    CreateDWordField (ARGP, 0xDA, PHH0)
                    If (((WRW2 >> 0x34) & One))
                    {
                        Local1 = (INDX & 0xFFFF)
                        Local2 = ((INDX >> 0x10) & 0xFFFF)
                        If ((Local2 > 0x02))
                        {
                            Local2 = Zero
                        }
                        
                        If ((Local1 > 0xFF))
                        {
                            PHH0 = Ones
                        }
                        Else
                        {
                            Local2 = (One << Local2)
                            Local3 = Local2
                            Local3--
                            If (((Local1 + Local3) > 0xFF))
                            {
                                PHH0 = Ones
                            }
                            Else
                            {
                                Local0 = (Local1 + 0xFE700100)
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    Name (WBUF, Buffer (0x04)
                                    {
                                        0x00, 0x00, 0x00, 0x00
                                    })
                                    CreateByteField (WBUF, Zero, ARGB)
                                    CreateWordField (WBUF, Zero, ARGW)
                                    CreateDWordField (WBUF, Zero, ARGD)
                                    WBUF = PHH0
                                    If (((Local1 <= 0xD9) && ((Local1 + Local3) >=
                                    0xD9)))
                                    {
                                        Local4 = (0xD9 - Local1)
                                        Local6 = (DerefOf (WBUF [Local4]) & 0x40)
                                        Local7 = (^^PCI0.LPCB.EC.AIRP & 0xBF)
                                        WBUF [Local4] = (Local6 | Local7)
                                    }
                                    
                                    OperationRegion (WH2M, SystemMemory, Local0, Local2)
                                    Switch (ToInteger (Local2))
                                    {
                                        Case (One)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMB,   8
                                            }
                                            
                                            WHMB = ARGB
                                        }
                                        Case (0x02)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMW,   16
                                            }
                                            
                                            WHMW = ARGW
                                        }
                                        Case (0x04)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMD,   32
                                            }
                                            
                                            WHMD = ARGD
                                        }
                                        
                                    }
                                    
                                    If (((Local1 <= 0xF8) && ((Local1 + Local3) >=
                                    0xF8)))
                                    {
                                        Local4 = (0xF8 - Local1)
                                        ^^PCI0.LPCB.EC.FCMD = DerefOf (WBUF [Local4])
                                    }
                                    
                                    PHH0 = 0x75
                                }
                                Else
                                {
                                    PHH0 = Ones
                                }
                            }
                        }
                    }
                    Else
                    {
                        PHH0 = 0x75
                    }
                }
                
                If (((WQW2 >> 0x36) & One))
                {
                    CreateByteField (ARGP, 0xDF, PB90)
                    CreateByteField (ARGP, 0xE0, PB91)
                    CreateByteField (ARGP, 0xE1, PB92)
                    If (((WRW2 >> 0x36) & One))
                    {
                        PB90 = 0x77
                        PB91 = Zero
                        PB92 = Zero
                    }
                    Else
                    {
                        PB90 = (BAEE >> One)
                        PB91 = BSCP
                        PB92 = BTCP
                    }
                }
                
                If (((WQW2 >> 0x39) & One))
                {
                    CreateDWordField (ARGP, 0xE4, PC20)
                    CreateDWordField (ARGP, 0xE8, PC21)
                    CreateDWordField (ARGP, 0xEC, PC22)
                    CreateDWordField (ARGP, 0xF0, PC23)
                    If (((WRW2 >> 0x39) & One))
                    {
                        PC20 = 0x7A
                        PC21 = Zero
                        PC22 = Zero
                        PC23 = Zero
                    }
                    Else
                    {
                        Local0 = (PSF2 & 0xFFFFFFFFBFFFFBFF)
                        If (PSTG ())
                        {
                            Local0 |= 0x0400
                        }
                        
                        If ((OSYS >= 0x07DF))
                        {
                            If ((PPMF & 0x00400000))
                            {
                                If (((OSCP & 0x20) && (OSCP & 0x40)))
                                {
                                    Local0 |= 0x40000000
                                }
                            }
                        }
                        
                        PC20 = Local0
                        PC21 = Zero
                        PC22 = Zero
                        PC23 = Zero
                    }
                }
                
                Return (ARGP)
            }
            Else
            {
                Return(XPKG(Arg0, Arg1, Arg2))
            }
        }
        
        
        Method (PK0C, 3, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (BUFF, Buffer (0x0100)
                {
                    0x00
                })
                CreateWordField (BUFF, Zero, W000)
                CreateWordField (BUFF, 0x02, W001)
                CreateWordField (BUFF, 0x04, W002)
                CreateWordField (BUFF, 0x06, W003)
                CreateWordField (BUFF, 0x08, W004)
                CreateDWordField (BUFF, 0x0A, W005)
                CreateWordField (BUFF, 0x0E, W006)
                CreateByteField (BUFF, 0x10, W007)
                CreateByteField (BUFF, 0x11, W008)
                CreateByteField (BUFF, 0x12, W009)
                CreateByteField (BUFF, 0x13, W010)
                CreateByteField (BUFF, 0x14, W011)
                CreateByteField (BUFF, 0x15, W012)
                CreateByteField (BUFF, 0x16, W013)
                CreateByteField (BUFF, 0x17, W014)
                CreateByteField (BUFF, 0x18, W015)
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    W001 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001D0, 16)  // \_SB.PCI0.LPCB.EC.RPM1
                    W002 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001D2, 16)  // \_SB.PCI0.LPCB.EC.RPM2
                    W003 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001E0, 16)  // \_SB.PCI0.LPCB.EC.RPM3
                    W004 = ^^PCI0.LPCB.EC.RDB0 (0xFE700132, 32)  // \_SB.PCI0.LPCB.EC.BPV0
                    ^^PCI0.LPCB.EC.FDAT = 0x19
                    ^^PCI0.LPCB.EC.FBUF = 0x0A
                    ^^PCI0.LPCB.EC.FBF1 = One
                    ^^PCI0.LPCB.EC.FCMD = 0xB1
                    W005 = ^^PCI0.LPCB.EC.FDAT
                    W005 |= (^^PCI0.LPCB.EC.FBUF << 0x08)
                    W005 |= (^^PCI0.LPCB.EC.FBF1 << 0x10)
                    W005 |= (^^PCI0.LPCB.EC.FBF2 << 0x18)
                    W006 = ^^PCI0.LPCB.EC.RDB0 (0xFE70012A, 32)  // \_SB.PCI0.LPCB.EC.BPR0
                    ^^PCI0.LPCB.EC.FDAT = 0x02
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W008 = ^^PCI0.LPCB.EC.FBF2
                    ^^PCI0.LPCB.EC.FDAT = 0x03
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W007 = ^^PCI0.LPCB.EC.FDAT
                    W009 = ^^PCI0.LPCB.EC.FBF2
                    ^^PCI0.LPCB.EC.FCMD = Zero
                    ^^PCI0.LPCB.EC.FDAT = Zero
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W012 = ^^PCI0.LPCB.EC.FDAT
                    W011 = ^^PCI0.LPCB.EC.FBUF
                    W010 = ^^PCI0.LPCB.EC.FBF1
                    ^^PCI0.LPCB.EC.FCMD = Zero
                    ^^PCI0.LPCB.EC.FDAT = One
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W015 = ^^PCI0.LPCB.EC.FDAT
                    W014 = ^^PCI0.LPCB.EC.FBUF
                    W013 = ^^PCI0.LPCB.EC.FBF1
                    ^^PCI0.LPCB.EC.FCMD = Zero
                }
                
                Return (BUFF)
            }
            Else
            {
                Return(XK0C(Arg0, Arg1, Arg2))
            }
        }
        
        
        Method (PK0E, 3, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (BUFF, Buffer (0x0100)
                {
                    0x00
                })
                CreateByteField (BUFF, 0x02, W002)
                CreateByteField (BUFF, 0x03, W003)
                CreateByteField (BUFF, 0x04, W004)
                CreateByteField (BUFF, 0x05, W005)
                CreateByteField (BUFF, 0x06, W006)
                CreateByteField (BUFF, 0x07, W007)
                CreateByteField (BUFF, 0x08, W008)
                CreateByteField (BUFF, 0x09, W009)
                CreateByteField (BUFF, 0x0A, W00A)
                CreateByteField (BUFF, 0x0B, W00B)
                CreateByteField (BUFF, 0x0C, W00C)
                CreateByteField (BUFF, 0x0D, W00D)
                CreateWordField (BUFF, 0x0E, W101)
                CreateWordField (BUFF, 0x10, W102)
                CreateWordField (BUFF, 0x12, W103)
                CreateWordField (BUFF, 0x14, W104)
                CreateWordField (BUFF, 0x16, W105)
                CreateWordField (BUFF, 0x18, W106)
                CreateWordField (BUFF, 0x1A, W107)
                CreateWordField (BUFF, 0x1C, W108)
                CreateWordField (BUFF, 0x1E, W109)
                BUFF = Arg2
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    ^^PCI0.LPCB.EC.F1T2 = W002
                    ^^PCI0.LPCB.EC.F1D2 = W003
                    ^^PCI0.LPCB.EC.F1T3 = W004
                    ^^PCI0.LPCB.EC.F1D3 = W005
                    ^^PCI0.LPCB.EC.F2T2 = W006
                    ^^PCI0.LPCB.EC.F2D2 = W007
                    ^^PCI0.LPCB.EC.F2T3 = W008
                    ^^PCI0.LPCB.EC.F2D3 = W009
                    ^^PCI0.LPCB.EC.F3T2 = W00A
                    ^^PCI0.LPCB.EC.F3D2 = W00B
                    ^^PCI0.LPCB.EC.F3T3 = W00C
                    ^^PCI0.LPCB.EC.F3D3 = W00D
                    ^^PCI0.LPCB.EC.WRB0 (0xFE700394, 16, W101)  // \_SB.PCI0.LPCB.EC.F1R1
                    ^^PCI0.LPCB.EC.WRB0 (0xFE700396, 16, W102)  // \_SB.PCI0.LPCB.EC.F1R2
                    ^^PCI0.LPCB.EC.WRB0 (0xFE700398, 16, W103)  // \_SB.PCI0.LPCB.EC.F1R3
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003A2, 16, W104)  // \_SB.PCI0.LPCB.EC.F2R1
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003A4, 16, W105)  // \_SB.PCI0.LPCB.EC.F2R2
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003A6, 16, W106)  // \_SB.PCI0.LPCB.EC.F2R3
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003B0, 16, W107)  // \_SB.PCI0.LPCB.EC.F3R1
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003B2, 16, W108)  // \_SB.PCI0.LPCB.EC.F3R2
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003B4, 16, W109)  // \_SB.PCI0.LPCB.EC.F3R3
                }
                
                Return (0x14)
            }
            Else
            {
                Return(XK0E(Arg0, Arg1, Arg2))
            }
        }
        
    }
    Scope (\_SB.DCHU)
    {
        Method (CPKG, 3, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (ARGP, Buffer (0x0100)
                {
                    0x00
                })
                CreateQWordField (Arg2, Zero, WQW1)
                CreateQWordField (Arg2, 0x08, WQW2)
                CreateQWordField (Arg2, 0x10, WRW1)
                CreateQWordField (Arg2, 0x18, WRW2)
                ARGP = DerefOf (Arg2 [Zero])
                If ((WQW1 & One))
                {
                    If (HKDR)
                    {
                        ARGP [0x20] = EVNT
                    }
                }
                
                If (((WQW1 >> 0x04) & 0x1037))
                {
                    Local7 = Zero
                    If (((WQW1 >> 0x04) & One))
                    {
                        If (((WRW1 >> 0x04) & One))
                        {
                            ARGP [0x24] = 0x05
                        }
                        Else
                        {
                            Local7 |= One
                        }
                    }
                    
                    If (((WQW1 >> 0x05) & One))
                    {
                        If (((WRW1 >> 0x05) & One))
                        {
                            ARGP [0x25] = 0x06
                        }
                        Else
                        {
                            Local7 |= 0x02
                        }
                    }
                    
                    If (((WQW1 >> 0x06) & One))
                    {
                        If (((WRW1 >> 0x06) & One))
                        {
                            ARGP [0x26] = 0x07
                        }
                        Else
                        {
                            Local7 |= 0x04
                        }
                    }
                    
                    If (((WQW1 >> 0x08) & One))
                    {
                        If (((WRW1 >> 0x08) & One))
                        {
                            ARGP [0x28] = 0x09
                        }
                        Else
                        {
                            Local7 |= 0x10
                        }
                    }
                    
                    If (((WQW1 >> 0x09) & One))
                    {
                        If (((WRW1 >> 0x09) & One))
                        {
                            ARGP [0x29] = 0x0A
                        }
                        Else
                        {
                            Local7 |= 0x20
                        }
                    }
                    
                    If (((WQW1 >> 0x10) & One))
                    {
                        If (((WRW1 >> 0x10) & One))
                        {
                            ARGP [0x30] = 0x11
                        }
                        Else
                        {
                            Local7 |= 0x1000
                        }
                    }
                    
                    If (Local7)
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xA1
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FDAT
                                Local2 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16)  // \_SB.PCI0.LPCB.EC.OEM3
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                            
                            If ((Local7 & One))
                            {
                                If ((Local2 & 0x08))
                                {
                                    If ((Local1 & 0x02))
                                    {
                                        ARGP [0x24] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x24] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x24] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x02))
                            {
                                If ((Local2 & 0x04))
                                {
                                    If ((PDO2 & 0x40))
                                    {
                                        ARGP [0x25] = 0x02
                                    }
                                    ElseIf ((Local1 & One))
                                    {
                                        ARGP [0x25] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x25] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x25] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x04))
                            {
                                If ((Local2 & 0x10))
                                {
                                    If ((Local1 & 0x04))
                                    {
                                        ARGP [0x26] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x26] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x26] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x10))
                            {
                                If ((Local1 & 0x10))
                                {
                                    ARGP [0x28] = One
                                }
                                Else
                                {
                                    ARGP [0x28] = Zero
                                }
                            }
                            
                            If ((Local7 & 0x20))
                            {
                                If ((Local2 & 0x20))
                                {
                                    If ((Local1 & 0x08))
                                    {
                                        ARGP [0x29] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x29] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x29] = 0x02
                                }
                            }
                            
                            If ((Local7 & 0x1000))
                            {
                                If ((Local1 & 0x40))
                                {
                                    ARGP [0x30] = One
                                }
                                Else
                                {
                                    ARGP [0x30] = Zero
                                }
                            }
                        }
                        Else
                        {
                            If ((Local7 & One))
                            {
                                ARGP [0x24] = Ones
                            }
                            
                            If ((Local7 & 0x02))
                            {
                                ARGP [0x25] = Ones
                            }
                            
                            If ((Local7 & 0x04))
                            {
                                ARGP [0x26] = Ones
                            }
                            
                            If ((Local7 & 0x10))
                            {
                                ARGP [0x28] = Ones
                            }
                            
                            If ((Local7 & 0x20))
                            {
                                ARGP [0x29] = Ones
                            }
                            
                            If ((Local7 & 0x1000))
                            {
                                ARGP [0x30] = Ones
                            }
                        }
                    }
                }
                
                If (((WQW1 >> 0x07) & One))
                {
                    If (((WRW1 >> 0x07) & One))
                    {
                        ARGP [0x27] = 0x08
                    }
                    Else
                    {
                        Local0 = GHPI ()
                        ARGP [0x27] = Local0
                    }
                }
                
                If (((WQW1 >> 0x0F) & One))
                {
                    If (((WRW1 >> 0x0F) & One))
                    {
                        ARGP [0x2F] = 0x10
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.SLFG)
                        {
                            Local0 |= One
                        }
                        
                        If (\_TZ.TZ0.PPFG)
                        {
                            Local0 |= 0x02
                        }
                        
                        ARGP [0x2F] = Local0
                    }
                }
                
                If (((WQW1 >> 0x11) & One))
                {
                    If (((WRW1 >> 0x11) & One))
                    {
                        ARGP [0x31] = 0x12
                    }
                    Else
                    {
                        Name (PFBF, Buffer (0x0100)
                        {
                            0x00
                        })
                        If (PFBA)
                        {
                            OperationRegion (PFMM, SystemMemory, PFBA, 0x0100)
                            Field (PFMM, ByteAcc, NoLock, Preserve)
                            {
                                PFDB,   2048
                            }
                            
                            PFBF = PFDB
                        }
                        
                        Return (PFBF)
                    }
                }
                
                If (((WQW1 >> 0x12) & One))
                {
                    If (((WRW1 >> 0x12) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x32]))
                            {
                                ^^PCI0.LPCB.EC.ECKS |= 0x80
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.ECKS &= 0x7F
                            }
                        }
                    }
                    
                    ARGP [0x32] = 0x13
                }
                
                If (((WQW1 >> 0x1E) & One))
                {
                    If (((WRW1 >> 0x1E) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x3E]))
                            {
                                ^^PCI0.LPCB.EC.FDAT = One
                                P80B = 0xDF
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.FDAT = Zero
                                P80B = 0x5F
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = 0xA4
                        }
                    }
                    
                    ARGP [0x3E] = 0x1F
                }
                
                If (((WQW1 >> 0x1F) & One))
                {
                    If (((WRW1 >> 0x1F) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x3F]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA2
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x3F] = 0x20
                }
                
                If (((WQW1 >> 0x20) & One))
                {
                    If (((WRW1 >> 0x20) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x40]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA3
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x40] = 0x21
                }
                
                If (((WQW1 >> 0x21) & One))
                {
                    If (((WRW1 >> 0x21) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x41]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA1
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x41] = 0x22
                }
                
                If (((WQW1 >> 0x26) & One))
                {
                    If (((WRW1 >> 0x26) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = Zero
                            ^^PCI0.LPCB.EC.FBUF = ToInteger (DerefOf (ARGP [0x47]))
                            ^^PCI0.LPCB.EC.FCMD = 0xCA
                        }
                    }
                    
                    ARGP [0x47] = 0x27
                }
                
                If (((WQW1 >> 0x29) & One))
                {
                    If (((WRW1 >> 0x29) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x4C]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA5
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x4C] = 0x2A
                }
                
                If (((WQW1 >> 0x31) & One))
                {
                    CreateWordField (ARGP, 0x54, DA50)
                    If (((WRW1 >> 0x31) & One))
                    {
                        DA50 = 0x32
                    }
                    Else
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local0 = ^^PCI0.LPCB.EC.RDB0 (0xFE700116, 32)  // \_SB.PCI0.LPCB.EC.BDC0
                        }
                        Else
                        {
                            Local0 = Ones
                        }
                        
                        DA50 = Local0
                    }
                }
                
                If (((WQW1 >> 0x37) & One))
                {
                    If (((WRW1 >> 0x37) & One))
                    {
                        ARGP [0x5D] = 0x38
                    }
                    Else
                    {
                        ARGP [0x5D] = One
                    }
                }
                
                If (((WQW1 >> 0x38) & One))
                {
                    If (((WRW1 >> 0x38) & One))
                    {
                        ARGP [0x5E] = 0x39
                    }
                    Else
                    {
                        ARGP [0x5E] = ^^PCI0.TMSS.GTMP ()
                    }
                }
                
                If (((WQW1 >> 0x3B) & One))
                {
                    If (((WRW1 >> 0x3B) & One))
                    {
                        ARGP [0x61] = 0x3C
                    }
                    Else
                    {
                        Local0 = Zero
                        If (((PSF0 & 0x10) == Zero))
                        {
                            If (^^PCI0.GFX0.PDDS (0x0300))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                        }
                        
                        ARGP [0x61] = Local0
                    }
                }
                
                If (((WQW1 >> 0x3C) & One))
                {
                    If (((WRW1 >> 0x3C) & One))
                    {
                        ARGP [0x62] = 0x3D
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = One
                            ^^PCI0.LPCB.EC.FCMD = 0xCA
                            Local0 = ^^PCI0.LPCB.EC.FBUF
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ARGP [0x62] = Local0
                    }
                }
                
                If (((WQW1 >> 0x3D) & One))
                {
                    If (((WRW1 >> 0x3D) & One))
                    {
                        ARGP [0x63] = 0x3E
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xA2
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((Local1 & 0x7E))
                            {
                                Local0 = One
                            }
                        }
                        
                        ARGP [0x63] = Local0
                    }
                }
                
                If (((WQW1 >> 0x3E) & One))
                {
                    If (((WRW1 >> 0x3E) & One))
                    {
                        ARGP [0x64] = 0x3F
                    }
                    Else
                    {
                        ARGP [0x64] = Zero
                    }
                }
                
                If (((WQW2 >> One) & One))
                {
                    ARGP [0x67] = BKST
                }
                
                If (((WQW2 >> 0x05) & One))
                {
                    CreateDWordField (ARGP, 0x6B, P700)
                    CreateDWordField (ARGP, 0x6F, P701)
                    CreateDWordField (ARGP, 0x73, P702)
                    CreateDWordField (ARGP, 0x77, P703)
                    If (((WRW2 >> 0x05) & One))
                    {
                        P700 = 0x46
                        P701 = Zero
                        P702 = Zero
                        P703 = Zero
                    }
                    Else
                    {
                        HKDR = One
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If ((LKFG & One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x05
                                ^^PCI0.LPCB.EC.FBUF = One
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }
                            
                            If ((PSF4 & 0x04))
                            {
                                ^^PCI0.LPCB.EC.AIRP |= 0x10
                            }
                        }
                        
                        P700 = PSF3
                        P701 = Zero
                        P702 = Zero
                        P703 = Zero
                    }
                }
                
                If (((WQW2 >> 0x07) & One))
                {
                    ^^AC.IGNR = One
                    ARGP [0x7C] = 0x48
                }
                
                If (((WQW2 >> 0x08) & One))
                {
                    Notify (PWRB, 0x80)
                    ARGP [0x7D] = 0x49
                }
                
                If (((WQW2 >> 0x0B) & One))
                {
                    If (((WRW2 >> 0x0B) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x80]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA4
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0x80] = 0x4C
                }
                
                If (((WQW2 >> 0x0E) & One))
                {
                    If (((WRW2 >> 0x0E) & One))
                    {
                        Switch (ToInteger (DerefOf (ARGP [0x83])))
                        {
                            Case (Zero)
                            {
                                P80B = 0x4F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 &= 0xFFFFFFFFFFFFFFCF
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            Case (One)
                            {
                                P80B = 0x5F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x10)
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            Case (0x02)
                            {
                                P80B = 0x6F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x20)
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            
                        }
                        
                        If ((NVBB & 0xFFFF))
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                If (^^AC.ACFG)
                                {
                                    Local5 = Zero
                                    Local6 = One
                                }
                                Else
                                {
                                    Local5 = ^^PCI0.LPCB.EC.BBST
                                    If ((Local5 == Zero))
                                    {
                                        Local5 = (((NVBB >> 0x04) & 0xF0) | (NVBB &
                                        0x0F))
                                        Local6 = (NVBB & 0x0F)
                                    }
                                    Else
                                    {
                                        Local6 = (Local5 & 0x0F)
                                    }
                                }
                                
                                ^^PCI0.LPCB.EC.BBST = Local5
                                Notify (^^PCI0.PEG0.PEGP, (Local6 | 0xD0))
                            }
                        }
                    }
                    
                    ARGP [0x83] = 0x4F
                }
                
                If (((WQW2 >> 0x11) & One))
                {
                    CreateDWordField (ARGP, 0x8A, P821)
                    CreateDWordField (ARGP, 0x8E, P822)
                    CreateDWordField (ARGP, 0x92, P823)
                    CreateDWordField (ARGP, 0x96, P824)
                    P821 = PSF1
                    P822 = Zero
                    P823 = Zero
                    P824 = Zero
                }
                
                If (((WQW2 >> 0x14) & One))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.INF2 |= 0x02
                    }
                    
                    ARGP [0x9C] = 0x55
                }
                
                If (((WQW2 >> 0x19) & One))
                {
                    If (((WRW2 >> 0x19) & One))
                    {
                        Switch (ToInteger (DerefOf (ARGP [0xA1])))
                        {
                            Case (Zero)
                            {
                                ^^LID0.WMIF = One
                                Notify (LID0, 0x80)
                            }
                            Case (One)
                            {
                                Notify (SLPB, 0x80)
                            }
                            Case (0x02)
                            {
                                Notify (PWRB, 0x80)
                            }
                            
                        }
                    }
                    
                    ARGP [0xA1] = 0x5A
                }
                
                If (((WQW2 >> 0x1A) & One))
                {
                    If (((WRW2 >> 0x1A) & One))
                    {
                        PRM1 = DerefOf (ARGP [0xA2])
                        PRM0 = 0x07
                        SSMP = 0xC0
                    }
                    
                    ARGP [0xA2] = 0x5B
                }
                
                If (((WQW2 >> 0x1D) & One))
                {
                    If (((WRW2 >> 0x1D) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xA5]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA6
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0xA5] = 0x5E
                }
                
                If (((WQW2 >> 0x21) & One))
                {
                    If (((WRW2 >> 0x21) & One))
                    {
                        ARGP [0xA9] = 0x62
                    }
                    Else
                    {
                        ARGP [0xA9] = Zero
                    }
                }
                
                If (((WQW2 >> 0x22) & One))
                {
                    CreateByteField (ARGP, 0xAA, P990)
                    CreateByteField (ARGP, 0xAB, P991)
                    CreateByteField (ARGP, 0xAC, P992)
                    If (((WRW2 >> 0x22) & One))
                    {
                        P990 = 0x63
                        P991 = Zero
                        P992 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            P991 = ^^PCI0.LPCB.EC.FBF2
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            P990 = ^^PCI0.LPCB.EC.FDAT
                            P992 = ^^PCI0.LPCB.EC.FBF2
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        P990 = Ones
                        P991 = Ones
                        P992 = Ones
                    }
                }
                
                If (((WQW2 >> 0x23) & One))
                {
                    CreateByteField (ARGP, 0xAD, PH00)
                    CreateByteField (ARGP, 0xAE, PH01)
                    CreateByteField (ARGP, 0xAF, PH02)
                    If (((WRW2 >> 0x23) & One))
                    {
                        PH00 = 0x64
                        PH01 = Zero
                        PH02 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PH02 = ^^PCI0.LPCB.EC.FDAT
                            PH01 = ^^PCI0.LPCB.EC.FBUF
                            PH00 = ^^PCI0.LPCB.EC.FBF1
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PH00 = Ones
                        PH01 = Ones
                        PH02 = Ones
                    }
                }
                
                If (((WQW2 >> 0x24) & One))
                {
                    If (((WRW2 >> 0x24) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xB0]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA9
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }
                    
                    ARGP [0xB0] = 0x65
                }
                
                If (((WQW2 >> 0x26) & One))
                {
                    CreateDWordField (ARGP, 0xB2, PH30)
                    If (((WRW2 >> 0x26) & One))
                    {
                        Local2 = ((PH30 >> 0x0C) & 0x0F)
                        If ((Local2 >= 0x0A))
                        {
                            Local2 = Zero
                        }
                        Else
                        {
                            Local2 *= 0x19
                            Local2 = (0xFF - Local2)
                        }
                        
                        Local3 = ((PH30 >> 0x10) & 0xFF)
                        Local4 = ((PH30 >> 0x18) & 0x0F)
                        Local7 = ((PH30 >> 0x1C) & 0x0F)
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (((Local7 >= 0x07) && (Local7 <= 0x0B)))
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local7
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }
                            Else
                            {
                                If ((Local7 == Zero))
                                {
                                    Local0 = Zero
                                    Local0 = (PH30 & 0x07)
                                    Local0 |= ((PH30 >> One) & 0x38)
                                    Local0 |= ((PH30 >> 0x02) & 0x01C0)
                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FBUF = (Local0 >> 0x08)
                                    ^^PCI0.LPCB.EC.FCMD = 0xC2
                                }
                                
                                If ((Local7 == One))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x03
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x02))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x04
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x03))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x06
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FBF1 = Local4
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x04))
                                {
                                    If (Local3)
                                    {
                                        Local0 = 0x0D
                                    }
                                    Else
                                    {
                                        Local0 = 0x0E
                                    }
                                    
                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x0C)){}
                                If ((Local7 == 0x0D))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x02
                                    ^^PCI0.LPCB.EC.FBUF = Local2
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x0E))
                                {
                                    Local1 = ((PH30 >> 0x0E) & 0x1F)
                                    If ((PH30 & 0x2000))
                                    {
                                        Local1 |= 0x20
                                    }
                                    
                                    ^^PCI0.LPCB.EC.FDAT = 0x0C
                                    ^^PCI0.LPCB.EC.FBUF = Local1
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }
                                
                                If ((Local7 == 0x0F))
                                {
                                    Local6 = Zero
                                    Local3 = (PH30 & 0xFF)
                                    Local2 = ((PH30 >> 0x08) & 0xFF)
                                    Local1 = ((PH30 >> 0x10) & 0xFF)
                                    If ((Local4 < 0x03))
                                    {
                                        Local0 = (Local4 + 0x03)
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x03))
                                    {
                                        Local0 = 0x07
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x04))
                                    {
                                        Local0 = 0x06
                                        Local1 = (PH30 & 0xFF)
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x06))
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = 0x09
                                        ^^PCI0.LPCB.EC.FBUF = Local1
                                        ^^PCI0.LPCB.EC.FBF1 = Local2
                                        ^^PCI0.LPCB.EC.FBF2 = Local3
                                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                                        Local0 = 0x0A
                                        Local6 = 0xCA
                                    }
                                    
                                    If (Local6)
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = Local0
                                        ^^PCI0.LPCB.EC.FBUF = Local1
                                        ^^PCI0.LPCB.EC.FBF1 = Local2
                                        ^^PCI0.LPCB.EC.FBF2 = Local3
                                        ^^PCI0.LPCB.EC.FCMD = Local6
                                    }
                                }
                            }
                        }
                    }
                    
                    PH30 = 0x67
                }
                
                If (((WQW2 >> 0x27) & One))
                {
                    CreateDWordField (ARGP, 0xB6, PH40)
                    If (((WRW2 >> 0x27) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local4 = PH40
                            ^^PCI0.LPCB.EC.FDAT = One
                            ^^PCI0.LPCB.EC.FBUF = (Local4 & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x02
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x08) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x03
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x10) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x04
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x18) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }
                    }
                    
                    PH40 = 0x68
                }
                
                If (((WQW2 >> 0x28) & One))
                {
                    If (((WRW2 >> 0x28) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local4 = DerefOf (ARGP [0xBA])
                            If ((Local4 & One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = One
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                            
                            If ((Local4 & 0x02))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x02
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                            
                            If ((Local4 & 0x04))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x03
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                            
                            If ((Local4 & 0x08))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x04
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                        }
                    }
                    
                    ARGP [0xBA] = 0x69
                }
                
                If (((WQW2 >> 0x0191) & One))
                {
                    CreateWordField (ARGP, 0xBB, PH60)
                    If (((WRW2 >> 0x29) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local0 = ((PH60 >> 0x08) & 0xFF)
                            Local1 = (PH60 & 0xFF)
                            ^^PCI0.LPCB.EC.FDAT = Local0
                            ^^PCI0.LPCB.EC.FBUF = Local1
                            ^^PCI0.LPCB.EC.FCMD = 0xBA
                            P80B = PH60
                        }
                    }
                    
                    PH60 = 0x6A
                }
                
                If (((WQW2 >> 0x2A) & One))
                {
                    CreateDWordField (ARGP, 0xBD, PH70)
                    If (((WRW2 >> 0x2A) & One))
                    {
                        INDX = PH70
                    }
                    
                    PH70 = 0x6B
                }
                
                If (((WQW2 >> 0x2B) & One))
                {
                    If (((WRW2 >> 0x2B) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xC1]))
                            {
                                ^^PCI0.LPCB.EC.AIRP |= 0x80
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.AIRP &= 0x7F
                            }
                        }
                    }
                    
                    ARGP [0xC1] = 0x6C
                }
                
                If (((WQW2 >> 0x2D) & One))
                {
                    CreateByteField (ARGP, 0xC3, PHA0)
                    CreateByteField (ARGP, 0xC4, PHA1)
                    CreateByteField (ARGP, 0xC5, PHA2)
                    If (((WRW2 >> 0x2D) & One))
                    {
                        PHA0 = 0x6E
                        PHA1 = Zero
                        PHA2 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PHA2 = ^^PCI0.LPCB.EC.FDAT
                            PHA1 = ^^PCI0.LPCB.EC.FBUF
                            PHA0 = ^^PCI0.LPCB.EC.FBF1
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PHA0 = Ones
                        PHA1 = Ones
                        PHA2 = Ones
                    }
                }
                
                If (((WQW2 >> 0x2E) & One))
                {
                    CreateByteField (ARGP, 0xC6, PHB0)
                    CreateByteField (ARGP, 0xC7, PHB1)
                    CreateByteField (ARGP, 0xC8, PHB2)
                    If (((WRW2 >> 0x2E) & One))
                    {
                        PHB0 = 0x6F
                        PHB1 = Zero
                        PHB2 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PHB0 = ^^PCI0.LPCB.EC.FDAT
                            PHB1 = ^^PCI0.LPCB.EC.FBF2
                            PHB2 = Zero
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PHB0 = Ones
                        PHB1 = Ones
                        PHB2 = Ones
                    }
                }
                
                If (((WQW2 >> 0x2F) & One))
                {
                    CreateDWordField (ARGP, 0xC9, PHC0)
                    If (((WRW2 >> 0x2F) & One))
                    {
                        PHC0 = 0x70
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x03
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FBUF
                                Local0 = ^^PCI0.LPCB.EC.FBF1
                                Local0 |= (Local1 << 0x08)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = 0x04
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local2 = ^^PCI0.LPCB.EC.FDAT
                                Local1 = ^^PCI0.LPCB.EC.FBUF
                                Local1 |= (Local2 << 0x08)
                                Local0 |= (Local1 << 0x10)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                        }
                        Else
                        {
                            Local0 = Ones
                        }
                        
                        PHC0 = Local0
                    }
                }
                
                If (((WQW2 >> 0x30) & One))
                {
                    CreateDWordField (ARGP, 0xCD, PHD0)
                    If (((WRW2 >> 0x30) & One))
                    {
                        PHD0 = 0x71
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x05
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FDAT
                                Local0 = ^^PCI0.LPCB.EC.FBUF
                                Local0 |= (Local1 << 0x08)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FDAT = 0x02
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local2 = ^^PCI0.LPCB.EC.FBUF
                                Local1 = ^^PCI0.LPCB.EC.FBF1
                                Local1 |= (Local2 << 0x08)
                                Local0 |= (Local1 << 0x10)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                        }
                        Else
                        {
                            Local0 = Ones
                        }
                        
                        PHD0 = Local0
                    }
                }
                
                If (((WQW2 >> 0x32) & One))
                {
                    CreateDWordField (ARGP, 0xD2, PHF0)
                    If (((WRW2 >> 0x32) & One))
                    {
                        PHF0 = 0x73
                    }
                    Else
                    {
                        Local1 = (INDX & 0xFFFF)
                        Local2 = ((INDX >> 0x10) & 0xFFFF)
                        If ((Local2 > 0x02))
                        {
                            Local2 = Zero
                        }
                        
                        If ((Local1 > 0xFF))
                        {
                            PHF0 = Zero
                        }
                        Else
                        {
                            Local2 = (One << Local2)
                            Local3 = Local2
                            Local3--
                            If (((Local1 + Local3) > 0xFF))
                            {
                                PHF0 = Zero
                            }
                            Else
                            {
                                Local0 = (Local1 + 0xFE700100)
                                Name (RBUF, Buffer (0x04)
                                {
                                    0x00, 0x00, 0x00, 0x00
                                })
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    OperationRegion (RH2M, SystemMemory, Local0, Local2)
                                    Switch (ToInteger (Local2))
                                    {
                                        Case (One)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMB,   8
                                            }
                                            
                                            RBUF = RHMB
                                        }
                                        Case (0x02)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMW,   16
                                            }
                                            
                                            RBUF = RHMW
                                        }
                                        Case (0x04)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMD,   32
                                            }
                                            
                                            RBUF = RHMD
                                        }
                                        
                                    }
                                    
                                    PHF0 = RBUF
                                }
                            }
                        }
                    }
                }
                
                If (((WQW2 >> 0x33) & One))
                {
                    CreateDWordField (ARGP, 0xD6, PHG0)
                    CreateField (PHG0, Zero, One, SMUT)
                    CreateField (PHG0, One, 0x07, SAUD)
                    If (((WRW2 >> 0x33) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (ToInteger (SMUT))
                            {
                                Local0 = Zero
                            }
                            Else
                            {
                                Local0 = ToInteger (SAUD)
                                If ((Local0 > 0x64))
                                {
                                    Local0 = 0x64
                                }
                            }
                            
                            If (((LKFG & 0x0C) == 0x04)){}
                            Else
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local0
                                ^^PCI0.LPCB.EC.FCMD = 0xC6
                            }
                        }
                    }
                    
                    PHG0 = 0x74
                }
                
                If (((WQW2 >> 0x34) & One))
                {
                    CreateDWordField (ARGP, 0xDA, PHH0)
                    If (((WRW2 >> 0x34) & One))
                    {
                        Local1 = (INDX & 0xFFFF)
                        Local2 = ((INDX >> 0x10) & 0xFFFF)
                        If ((Local2 > 0x02))
                        {
                            Local2 = Zero
                        }
                        
                        If ((Local1 > 0xFF))
                        {
                            PHH0 = Ones
                        }
                        Else
                        {
                            Local2 = (One << Local2)
                            Local3 = Local2
                            Local3--
                            If (((Local1 + Local3) > 0xFF))
                            {
                                PHH0 = Ones
                            }
                            Else
                            {
                                Local0 = (Local1 + 0xFE700100)
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    Name (WBUF, Buffer (0x04)
                                    {
                                        0x00, 0x00, 0x00, 0x00
                                    })
                                    CreateByteField (WBUF, Zero, ARGB)
                                    CreateWordField (WBUF, Zero, ARGW)
                                    CreateDWordField (WBUF, Zero, ARGD)
                                    WBUF = PHH0
                                    If (((Local1 <= 0xD9) && ((Local1 + Local3) >=
                                    0xD9)))
                                    {
                                        Local4 = (0xD9 - Local1)
                                        Local6 = (DerefOf (WBUF [Local4]) & 0x40)
                                        Local7 = (^^PCI0.LPCB.EC.AIRP & 0xBF)
                                        WBUF [Local4] = (Local6 | Local7)
                                    }
                                    
                                    OperationRegion (WH2M, SystemMemory, Local0, Local2)
                                    Switch (ToInteger (Local2))
                                    {
                                        Case (One)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMB,   8
                                            }
                                            
                                            WHMB = ARGB
                                        }
                                        Case (0x02)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMW,   16
                                            }
                                            
                                            WHMW = ARGW
                                        }
                                        Case (0x04)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMD,   32
                                            }
                                            
                                            WHMD = ARGD
                                        }
                                        
                                    }
                                    
                                    If (((Local1 <= 0xF8) && ((Local1 + Local3) >=
                                    0xF8)))
                                    {
                                        Local4 = (0xF8 - Local1)
                                        ^^PCI0.LPCB.EC.FCMD = DerefOf (WBUF [Local4])
                                    }
                                    
                                    PHH0 = 0x75
                                }
                                Else
                                {
                                    PHH0 = Ones
                                }
                            }
                        }
                    }
                    Else
                    {
                        PHH0 = 0x75
                    }
                }
                
                If (((WQW2 >> 0x36) & One))
                {
                    CreateByteField (ARGP, 0xDF, PB90)
                    CreateByteField (ARGP, 0xE0, PB91)
                    CreateByteField (ARGP, 0xE1, PB92)
                    If (((WRW2 >> 0x36) & One))
                    {
                        PB90 = 0x77
                        PB91 = Zero
                        PB92 = Zero
                    }
                    Else
                    {
                        PB90 = (BAEE >> One)
                        PB91 = BSCP
                        PB92 = BTCP
                    }
                }
                
                If (((WQW2 >> 0x39) & One))
                {
                    CreateDWordField (ARGP, 0xE4, PC20)
                    CreateDWordField (ARGP, 0xE8, PC21)
                    CreateDWordField (ARGP, 0xEC, PC22)
                    CreateDWordField (ARGP, 0xF0, PC23)
                    If (((WRW2 >> 0x39) & One))
                    {
                        PC20 = 0x7A
                        PC21 = Zero
                        PC22 = Zero
                        PC23 = Zero
                    }
                    Else
                    {
                        Local0 = (PSF2 & 0xFFFFFFFFBFFFFBFF)
                        If (PSTG ())
                        {
                            Local0 |= 0x0400
                        }
                        
                        If ((OSYS >= 0x07DF))
                        {
                            If ((PPMF & 0x00400000))
                            {
                                If (((OSCP & 0x20) && (OSCP & 0x40)))
                                {
                                    Local0 |= 0x40000000
                                }
                            }
                        }
                        
                        PC20 = Local0
                        PC21 = Zero
                        PC22 = Zero
                        PC23 = Zero
                    }
                }
                
                Return (ARGP)
            }
            Else
            {
                Return(XPKG(Arg0, Arg1, Arg2))
            }
        }
        
        
        Method (GCMD, 3, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (ARGP, Buffer (0x0100)
                {
                    0x00
                })
                Name (ARGS, Zero)
                ARGP = DerefOf (Arg2 [Zero])
                CreateField (ARGP, Zero, 0x20, BINT)
                ARGS = BINT
                Local0 = Zero
                If ((ToInteger (Arg1) == One))
                {
                    If (HKDR)
                    {
                        Local0 = EVNT
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x04))
                {
                    CreateByteField (ARGP, Zero, ZE00)
                    CreateByteField (ARGP, One, ZE01)
                    CreateByteField (ARGP, 0x02, ZE02)
                    CreateByteField (ARGP, 0x03, ZE03)
                    CreateByteField (ARGP, 0x04, ZE04)
                    CreateByteField (ARGP, 0x05, ZE05)
                    CreateByteField (ARGP, 0x06, ZE06)
                    CreateByteField (ARGP, 0x07, ZE07)
                    CreateByteField (ARGP, 0x08, ZE08)
                    CreateByteField (ARGP, 0x09, ZE09)
                    Name (TM04, Buffer (0x0100)
                    {
                        0x00
                    })
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Switch (ToInteger (ZE00))
                        {
                            Case (One)
                            {
                                ^^PCI0.LPCB.EC.FCMD = Zero
                                ^^PCI0.LPCB.EC.FDAT = Zero
                                ^^PCI0.LPCB.EC.FBUF = Zero
                                ^^PCI0.LPCB.EC.FBF1 = Zero
                                ^^PCI0.LPCB.EC.FBF2 = Zero
                                ^^PCI0.LPCB.EC.FBF3 = Zero
                                If (ZE07)
                                {
                                    Name (CNT1, Zero)
                                    Name (ADR1, Buffer (0x04)
                                    {
                                        0x00
                                    })
                                    CreateByteField (ADR1, Zero, AD00)
                                    CreateByteField (ADR1, One, AD01)
                                    CreateByteField (ADR1, 0x02, AD02)
                                    CreateByteField (ADR1, 0x03, AD03)
                                    CreateWordField (ADR1, Zero, ADW0)
                                    AD01 = ZE01
                                    AD00 = ZE02
                                    CNT1 = Zero
                                    While (ZE07)
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = AD01
                                        ^^PCI0.LPCB.EC.FBUF = AD00
                                        ^^PCI0.LPCB.EC.FBF1 = ZE03
                                        ^^PCI0.LPCB.EC.FCMD = ZE06
                                        If ((ZE03 == 0x23))
                                        {
                                            If ((ZE07 > 0x40))
                                            {
                                                Break
                                            }
                                            
                                            ADW0 += 0x04
                                            TM04 [CNT1] = ^^PCI0.LPCB.EC.FDAT
                                            CNT1++
                                            TM04 [CNT1] = ^^PCI0.LPCB.EC.FBUF
                                            CNT1++
                                            TM04 [CNT1] = ^^PCI0.LPCB.EC.FBF1
                                            CNT1++
                                            TM04 [CNT1] = ^^PCI0.LPCB.EC.FBF2
                                            CNT1++
                                        }
                                        Else
                                        {
                                            If ((ZE07 > 0x80))
                                            {
                                                Break
                                            }
                                            
                                            ADW0 += 0x02
                                            TM04 [CNT1] = ^^PCI0.LPCB.EC.FDAT
                                            CNT1++
                                            TM04 [CNT1] = ^^PCI0.LPCB.EC.FBUF
                                            CNT1++
                                        }
                                        
                                        ZE07--
                                    }
                                }
                                Else
                                {
                                    ^^PCI0.LPCB.EC.FDAT = ZE01
                                    ^^PCI0.LPCB.EC.FBUF = ZE02
                                    ^^PCI0.LPCB.EC.FBF1 = ZE03
                                    ^^PCI0.LPCB.EC.FBF2 = ZE04
                                    ^^PCI0.LPCB.EC.FBF3 = ZE05
                                    ^^PCI0.LPCB.EC.FCMD = ZE06
                                    TM04 [Zero] = ^^PCI0.LPCB.EC.FCMD
                                    TM04 [One] = ^^PCI0.LPCB.EC.FDAT
                                    TM04 [0x02] = ^^PCI0.LPCB.EC.FBUF
                                    TM04 [0x03] = ^^PCI0.LPCB.EC.FBF1
                                    TM04 [0x04] = ^^PCI0.LPCB.EC.FBF2
                                    TM04 [0x05] = ^^PCI0.LPCB.EC.FBF3
                                }
                            }
                            
                        }
                    }
                    
                    Return (TM04)
                }
                
                If ((ToInteger (Arg1) == 0x05))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16) & 0x08)) // \_SB.PCI0.LPCB.EC.OEM3
                            {
                                If ((Local1 & 0x02))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x06))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16) & 0x04)) // \_SB.PCI0.LPCB.EC.OEM3
                            {
                                If ((PDO2 & 0x40))
                                {
                                    Local0 = 0x02
                                }
                                ElseIf ((Local1 & One))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x07))
                {
                    If (^^PCI0.LPCB.EC.SLTY)
                    {
                        Local0 = ^^PCI0.LPCB.EC.SLTY
                    }
                    ElseIf ((MPSR && DISB))
                    {
                        Local0 = 0x02
                    }
                    Else
                    {
                        Local0 = One
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x08))
                {
                    Local0 = GHPI ()
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x09))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((Local1 & 0x10))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x0A))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((^^PCI0.LPCB.EC.RDB0 (0xFE7001CA, 16) & 0x20)) // \_SB.PCI0.LPCB.EC.OEM3
                            {
                                If ((Local1 & 0x08))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x10))
                {
                    Local0 = 0x81
                    If ((PSF1 & 0x40400000))
                    {
                        Local0 |= 0x10
                    }
                    
                    Return ((PSF5 & Local0))
                }
                
                If ((ToInteger (Arg1) == 0x11))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            If ((Local1 & 0x40))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                            
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x12))
                {
                    Name (PFBF, Buffer (0x0100)
                    {
                        0x00
                    })
                    If (PFBA)
                    {
                        OperationRegion (PFMM, SystemMemory, PFBA, 0x0100)
                        Field (PFMM, ByteAcc, NoLock, Preserve)
                        {
                            PFDB,   2048
                        }
                        
                        PFBF = PFDB
                    }
                    
                    Return (PFBF)
                }
                
                If ((ToInteger (Arg1) == 0x32))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Local0 = ^^PCI0.LPCB.EC.RDB0 (0xFE700116, 32)  // \_SB.PCI0.LPCB.EC.BDC0
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x33))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x34))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x38))
                {
                    Local0 = One
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x39))
                {
                    Return (^^PCI0.TMSS.GTMP ())
                }
                
                If ((ToInteger (Arg1) == 0x3B))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x06
                        ^^PCI0.LPCB.EC.FBUF = One
                        ^^PCI0.LPCB.EC.FBF1 = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xB1
                        Local0 = ^^PCI0.LPCB.EC.FBF1
                        Local0 = ((Local0 << 0x08) | ^^PCI0.LPCB.EC.FBUF)
                        Local0 = ((Local0 << 0x08) | ^^PCI0.LPCB.EC.FDAT)
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3C))
                {
                    If (((PSF0 & 0x10) == Zero))
                    {
                        If (^^PCI0.GFX0.PDDS (0x0300))
                        {
                            Local0 = One
                        }
                        Else
                        {
                            Local0 = Zero
                        }
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3D))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                        Local0 = ^^PCI0.LPCB.EC.FBUF
                        ^^PCI0.LPCB.EC.FCMD = Zero
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA2
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        Local1 = ^^PCI0.LPCB.EC.FDAT
                        If ((Local1 & 0x7E))
                        {
                            Local0 = One
                        }
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x3F))
                {
                    Local0 = Zero
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x41))
                {
                    ^^PCI0.LPCB.EC.FDAT = ((ARGS >> 0x18) & 0xFF)
                    ^^PCI0.LPCB.EC.FBUF = ((ARGS >> 0x10) & 0xFF)
                    ^^PCI0.LPCB.EC.FBF1 = ((ARGS >> 0x08) & 0xFF)
                    ^^PCI0.LPCB.EC.FCMD = (ARGS & 0xFF)
                    Local0 = ^^PCI0.LPCB.EC.FDAT
                    Local0 |= (^^PCI0.LPCB.EC.FBUF << 0x08)
                    Local0 |= (^^PCI0.LPCB.EC.FBF1 << 0x10)
                    Local0 |= (^^PCI0.LPCB.EC.FBF2 << 0x18)
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x42))
                {
                    Local0 = BKST
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x43))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x45))
                {
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x51))
                {
                    Noop
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x52))
                {
                    Return (PSF1)
                }
                
                If ((ToInteger (Arg1) == 0x60))
                {
                    Local0 = PSF4
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If ((^^PCI0.LPCB.EC.RINF & 0x10))
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x91
                            ^^PCI0.LPCB.EC.FCMD = 0xD2
                            Local0 |= 0x10
                        }
                        Else
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x91
                            ^^PCI0.LPCB.EC.FCMD = 0xD2
                            Local0 &= 0xFFFFFFFFFFFFFFEF
                        }
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x62))
                {
                    Return (Zero)
                }
                
                If ((ToInteger (Arg1) == 0x63))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FBF2
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FDAT
                            Local0 = ^^PCI0.LPCB.EC.FBF2
                            Local0 = ((Local0 << 0x08) | Local1)
                            Local0 = ((Local0 << 0x08) | Local2)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x64))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local0 = ^^PCI0.LPCB.EC.FDAT
                            Local2 = ^^PCI0.LPCB.EC.FBUF
                            Local3 = ^^PCI0.LPCB.EC.FBF1
                            Local0 = ((Local0 << 0x08) | Local2)
                            Local0 = ((Local0 << 0x08) | Local3)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x6E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local0 = ^^PCI0.LPCB.EC.FDAT
                            Local2 = ^^PCI0.LPCB.EC.FBUF
                            Local3 = ^^PCI0.LPCB.EC.FBF1
                            Local0 = ((Local0 << 0x08) | Local2)
                            Local0 = ((Local0 << 0x08) | Local3)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x6F))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            Local0 = ^^PCI0.LPCB.EC.FBF2
                            Local0 |= (Local0 << 0x08)
                            Local0 = ((Local0 << 0x08) | Local1)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x70))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FBUF
                            Local0 = ^^PCI0.LPCB.EC.FBF1
                            Local0 |= (Local1 << 0x08)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x04
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FDAT
                            Local1 = ^^PCI0.LPCB.EC.FBUF
                            Local1 |= (Local2 << 0x08)
                            Local0 |= (Local1 << 0x10)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x71))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x05
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT
                            Local0 = ^^PCI0.LPCB.EC.FBUF
                            Local0 |= (Local1 << 0x08)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                        
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FBUF
                            Local1 = ^^PCI0.LPCB.EC.FBF1
                            Local1 |= (Local2 << 0x08)
                            Local0 |= (Local1 << 0x10)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }
                    
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x73))
                {
                    Local1 = (INDX & 0xFFFF)
                    Local2 = ((INDX >> 0x10) & 0xFFFF)
                    If ((Local2 > 0x02))
                    {
                        Local2 = Zero
                    }
                    
                    If ((Local1 > 0xFF))
                    {
                        Return (Zero)
                    }
                    
                    Local2 = (One << Local2)
                    Local3 = Local2
                    Local3--
                    If (((Local1 + Local3) > 0xFF))
                    {
                        Return (Zero)
                    }
                    
                    Local0 = (Local1 + 0xFE700100)
                    Name (RBUF, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        OperationRegion (RH2M, SystemMemory, Local0, Local2)
                        Switch (ToInteger (Local2))
                        {
                            Case (One)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMB,   8
                                }
                                
                                RBUF = RHMB
                            }
                            Case (0x02)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMW,   16
                                }
                                
                                RBUF = RHMW
                            }
                            Case (0x04)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMD,   32
                                }
                                
                                RBUF = RHMD
                            }
                            
                        }
                    }
                    
                    Return (RBUF)
                }
                
                If ((ToInteger (Arg1) == 0x77))
                {
                    Local0 = (BAEE >> One)
                    Local0 |= (BSCP << 0x08)
                    Local0 |= (BTCP << 0x10)
                    Return (Local0)
                }
                
                If ((ToInteger (Arg1) == 0x7A))
                {
                    Local0 = (PSF2 & 0xFFFFFFFFBFFFFBFF)
                    If (PSTG ())
                    {
                        Local0 |= 0x0400
                    }
                    
                    If ((OSYS >= 0x07DF))
                    {
                        If ((PPMF & 0x00400000))
                        {
                            If (((OSCP & 0x20) && (OSCP & 0x40)))
                            {
                                Local0 |= 0x40000000
                            }
                        }
                    }
                    
                    Return (Local0)
                }
                
                Return (Ones)
            }
            Else
            {
                Return(XCMD(Arg0, Arg1, Arg2))
            }
        }
        
        
        Method (PK0C, 3, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (BUFF, Buffer (0x0100)
                {
                    0x00
                })
                CreateWordField (BUFF, Zero, W000)
                CreateWordField (BUFF, 0x02, W001)
                CreateWordField (BUFF, 0x04, W002)
                CreateWordField (BUFF, 0x06, W003)
                CreateWordField (BUFF, 0x08, W004)
                CreateDWordField (BUFF, 0x0A, W005)
                CreateWordField (BUFF, 0x0E, W006)
                CreateByteField (BUFF, 0x10, W007)
                CreateByteField (BUFF, 0x11, W008)
                CreateByteField (BUFF, 0x12, W009)
                CreateByteField (BUFF, 0x13, W010)
                CreateByteField (BUFF, 0x14, W011)
                CreateByteField (BUFF, 0x15, W012)
                CreateByteField (BUFF, 0x16, W013)
                CreateByteField (BUFF, 0x17, W014)
                CreateByteField (BUFF, 0x18, W015)
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    W001 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001D0, 16)  // \_SB.PCI0.LPCB.EC.RPM1
                    W002 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001D2, 16)  // \_SB.PCI0.LPCB.EC.RPM2
                    W003 = ^^PCI0.LPCB.EC.RDB0 (0xFE7001E0, 16)  // \_SB.PCI0.LPCB.EC.RPM3
                    W004 = ^^PCI0.LPCB.EC.RDB0 (0xFE700132, 32)  // \_SB.PCI0.LPCB.EC.BPV0
                    ^^PCI0.LPCB.EC.FDAT = 0x19
                    ^^PCI0.LPCB.EC.FBUF = 0x0A
                    ^^PCI0.LPCB.EC.FBF1 = One
                    ^^PCI0.LPCB.EC.FCMD = 0xB1
                    W005 = ^^PCI0.LPCB.EC.FDAT
                    W005 |= (^^PCI0.LPCB.EC.FBUF << 0x08)
                    W005 |= (^^PCI0.LPCB.EC.FBF1 << 0x10)
                    W005 |= (^^PCI0.LPCB.EC.FBF2 << 0x18)
                    W006 = ^^PCI0.LPCB.EC.RDB0 (0xFE70012A, 32)  // \_SB.PCI0.LPCB.EC.BPR0
                    ^^PCI0.LPCB.EC.FDAT = 0x02
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W008 = ^^PCI0.LPCB.EC.FBF2
                    ^^PCI0.LPCB.EC.FDAT = 0x03
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W007 = ^^PCI0.LPCB.EC.FDAT
                    W009 = ^^PCI0.LPCB.EC.FBF2
                    ^^PCI0.LPCB.EC.FCMD = Zero
                    ^^PCI0.LPCB.EC.FDAT = Zero
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W012 = ^^PCI0.LPCB.EC.FDAT
                    W011 = ^^PCI0.LPCB.EC.FBUF
                    W010 = ^^PCI0.LPCB.EC.FBF1
                    ^^PCI0.LPCB.EC.FCMD = Zero
                    ^^PCI0.LPCB.EC.FDAT = One
                    ^^PCI0.LPCB.EC.FCMD = 0xC0
                    W015 = ^^PCI0.LPCB.EC.FDAT
                    W014 = ^^PCI0.LPCB.EC.FBUF
                    W013 = ^^PCI0.LPCB.EC.FBF1
                    ^^PCI0.LPCB.EC.FCMD = Zero
                }
                
                Return (BUFF)
            }
            Else
            {
                Return(XK0C(Arg0, Arg1, Arg2))
            }
        }
        
        
        Method (PK0E, 3, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (BUFF, Buffer (0x0100)
                {
                    0x00
                })
                CreateByteField (BUFF, 0x02, W002)
                CreateByteField (BUFF, 0x03, W003)
                CreateByteField (BUFF, 0x04, W004)
                CreateByteField (BUFF, 0x05, W005)
                CreateByteField (BUFF, 0x06, W006)
                CreateByteField (BUFF, 0x07, W007)
                CreateByteField (BUFF, 0x08, W008)
                CreateByteField (BUFF, 0x09, W009)
                CreateByteField (BUFF, 0x0A, W00A)
                CreateByteField (BUFF, 0x0B, W00B)
                CreateByteField (BUFF, 0x0C, W00C)
                CreateByteField (BUFF, 0x0D, W00D)
                CreateWordField (BUFF, 0x0E, W101)
                CreateWordField (BUFF, 0x10, W102)
                CreateWordField (BUFF, 0x12, W103)
                CreateWordField (BUFF, 0x14, W104)
                CreateWordField (BUFF, 0x16, W105)
                CreateWordField (BUFF, 0x18, W106)
                CreateWordField (BUFF, 0x1A, W107)
                CreateWordField (BUFF, 0x1C, W108)
                CreateWordField (BUFF, 0x1E, W109)
                BUFF = DerefOf (Arg2 [Zero])
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    ^^PCI0.LPCB.EC.F1T2 = W002
                    ^^PCI0.LPCB.EC.F1D2 = W003
                    ^^PCI0.LPCB.EC.F1T3 = W004
                    ^^PCI0.LPCB.EC.F1D3 = W005
                    ^^PCI0.LPCB.EC.F2T2 = W006
                    ^^PCI0.LPCB.EC.F2D2 = W007
                    ^^PCI0.LPCB.EC.F2T3 = W008
                    ^^PCI0.LPCB.EC.F2D3 = W009
                    ^^PCI0.LPCB.EC.F3T2 = W00A
                    ^^PCI0.LPCB.EC.F3D2 = W00B
                    ^^PCI0.LPCB.EC.F3T3 = W00C
                    ^^PCI0.LPCB.EC.F3D3 = W00D
                    ^^PCI0.LPCB.EC.WRB0 (0xFE700394, 16, W101)  // \_SB.PCI0.LPCB.EC.F1R1
                    ^^PCI0.LPCB.EC.WRB0 (0xFE700396, 16, W102)  // \_SB.PCI0.LPCB.EC.F1R2
                    ^^PCI0.LPCB.EC.WRB0 (0xFE700398, 16, W103)  // \_SB.PCI0.LPCB.EC.F1R3
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003A2, 16, W104)  // \_SB.PCI0.LPCB.EC.F2R1
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003A4, 16, W105)  // \_SB.PCI0.LPCB.EC.F2R2
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003A6, 16, W106)  // \_SB.PCI0.LPCB.EC.F2R3
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003B0, 16, W107)  // \_SB.PCI0.LPCB.EC.F3R1
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003B2, 16, W108)  // \_SB.PCI0.LPCB.EC.F3R2
                    ^^PCI0.LPCB.EC.WRB0 (0xFE7003B4, 16, W109)  // \_SB.PCI0.LPCB.EC.F3R3
                }
                
                Return (0x14)
            }
            Else
            {
                Return(XK0E(Arg0, Arg1, Arg2))
            }
        }
        
        
    }
    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (_Q35, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                P80B = 0x35
                If ((RDB0 (0xFE7001CA, 16) & 0x8000)) // \_SB.PCI0.LPCB.EC.OEM3
                {
                    SLFG = One
                    Local0 = 0xDE
                }
                Else
                {
                    SLFG = Zero
                    Local0 = 0xDF
                }
                
                NEVT (Local0, Local0)
                ^^^^AC.ADJP (Zero)
            }
            Else
            {
                Return(XQ35())
            }
        }
        
        
        Method (_Q37, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                P80B = 0x37
                Local0 = RDB0 (0xFE7001CA, 16)  // \_SB.PCI0.LPCB.EC.OEM3
                If ((Local0 & 0x2000))
                {
                    B15C = One
                }
                Else
                {
                    B15C = Zero
                }
                
                If ((NVBB & 0xFFFF))
                {
                    If ((Local0 & 0x2000))
                    {
                        Local1 = (((NVBB >> 0x08) & 0xFF) + (NVBB & 0xFF
                        ))
                        Local1--
                    }
                    Else
                    {
                        Local1 = (NVBB & 0x0F)
                    }
                    
                    BBST = (((NVBB >> 0x04) & 0xF0) | Local1)
                    Notify (^^^PEG0.PEGP, (Local1 | 0xD0))
                }
                
                ^^^^AC.ADJP (Zero)
            }
            Else
            {
                Return(XQ37())
            }
        }
        
        
    }
}
