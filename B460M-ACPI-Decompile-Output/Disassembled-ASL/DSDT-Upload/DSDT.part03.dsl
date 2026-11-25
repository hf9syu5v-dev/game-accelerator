            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1BAD7: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1BAE4: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1BAEF: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1BAFF: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1BB01: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1BB09: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1BB0F: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1BB19: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1BB28: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1BB34: A4 01                                            // ..

                        Case
   1BB36: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1BB39: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1BB45: A4 01                                            // ..

                        Case
   1BB47: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1BB4A: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1BB56: A4 01                                            // ..

                        Case
   1BB58: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1BB5B: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1BB67: A4 01                                            // ..

                        Case
   1BB69: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1BB6C: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1BB78: A4 01                                            // ..

                        Case
   1BB7A: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1BB7D: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1BB89: A4 01                                            // ..

                        Case
   1BB8B: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1BB8E: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1BB9A: A4 01                                            // ..

                        Case
   1BB9C: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1BB9F: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1BBAB: A4 01                                            // ..

                        Case
   1BBAD: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1BBB0: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1BBBC: A4 01                                            // ..

                        Case
   1BBBE: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1BBC1: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1BBCD: A4 01                                            // ..

                        Case
   1BBCF: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1BBD2: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1BBDE: A4 01                                            // ..

                        Case
   1BBE0: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1BBE3: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1BBEF: A4 01                                            // ..

                        Case
   1BBF1: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1BBF4: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1BC00: A4 01                                            // ..

                        Case
   1BC02: A1 33                                            // .3

 (0x24FB8086)
                        {

   1BC04: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1BC10: A4 01                                            // ..

                        Case
   1BC12: A1 23                                            // .#

 (0x25268086)
                        {

   1BC14: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1BC20: A4 01                                            // ..

                        Case
   1BC22: A1 13                                            // ..

 (0x27238086)
                        {

   1BC24: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1BC30: A4 01                                            // ..

                        Default
                        {

   1BC32: A1 03                                            // ..

                            Return (Zero)
                        }


   1BC34: A4 00                                            // ..

                    }
                }

   1BC36: A5                                               // .

                Else
                {

   1BC37: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1BC39: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1BC3B: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1BC43: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1BC49: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1BC52: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1BC60: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1BC6C: A4 01                                            // ..

                        Case
   1BC6E: A1 13                                            // ..

 (0x75608086)
                        {

   1BC70: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1BC7C: A4 01                                            // ..

                        Default
                        {

   1BC7E: A1 03                                            // ..

                            Return (Zero)
                        }


   1BC80: A4 00                                            // ..

                    }
                }

   1BC82: A5                                               // .

                Else
                {

   1BC83: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1BC85: A4 00                                            // ..

            If (WIST ())
            {

   1BC87: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1BC8E: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1BC99: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1BCA9: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1BCB2: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1BCB4: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1BCC4: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1BCCC: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1BCDC: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1BCE5: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1BCF5: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1BCFE: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1BD0E: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP02.PXSX.DCTR */
                        }
                    }
                }


   1BD17: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1BD1D: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1BD22: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1BD26: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1BD36: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1BD38: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1BD44: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1BD46: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1BD54: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1BD56: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1BD64: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1BD66: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP02.PXSX.SPLX */
                }


   1BD70: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1BD75: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1BD7A: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1BD7E: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1BD8E: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1BD90: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1BDA0: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1BDA2: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1BDAC: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1BDAE: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1BDBC: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1BDBE: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1BDCC: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1BDCE: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1BDDA: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1BDDC: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1BDEB: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1BDED: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1BDFC: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1BDFE: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP02.PXSX.WANX */
                }


   1BE09: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1BE0E: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1BE13: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1BE17: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1BE22: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1BE2E: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1BE30: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1BE3E: 88 83                                            // ..

Index (WRDX, One)), One))

   1BE40: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP02.PXSX.WRDX */
                }


   1BE49: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1BE4E: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1BE53: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1BE57: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1BE67: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1BE72: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1BE7F: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1BE81: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1BE8F: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1BE91: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1BEA0: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1BEA2: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1BEB1: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1BEB3: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1BEC2: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1BEC4: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1BED3: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1BED5: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1BEE4: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1BEE6: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1BEF5: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1BEF7: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1BF06: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1BF08: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1BF17: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1BF19: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1BF28: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1BF2A: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP02.PXSX.WRDY */
                }


   1BF34: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1BF39: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1BF3E: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1BF43: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1BF53: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1BF63: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1BF73: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1BF83: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1BF89: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1BF96: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1BF98: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1BFA6: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1BFA8: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1BFB7: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1BFB9: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1BFC8: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1BFCA: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1BFD9: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1BFDB: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1BFEA: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1BFEC: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1BFFB: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1BFFD: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1C00C: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1C00E: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1C01D: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1C01F: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1C02E: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1C030: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1C03F: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1C041: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1C050: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1C052: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1C061: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1C063: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1C072: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1C074: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1C083: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1C085: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1C094: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1C096: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1C0A5: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1C0A7: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1C0B6: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1C0B8: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1C0C7: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1C0C9: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1C0D8: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1C0DA: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1C0E9: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1C0EB: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1C0FA: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1C0FC: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1C10B: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1C10D: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1C11C: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1C11E: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1C12D: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1C12F: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1C13E: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1C140: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1C14F: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1C151: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1C160: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1C162: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1C171: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1C173: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1C182: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1C184: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1C193: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1C195: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1C1A4: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1C1A6: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP02.PXSX.EWRY */
                }


   1C1B0: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1C1B5: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1C1BA: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1C1BE: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1C1CE: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1C1DE: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1C1E7: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1C1F4: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1C1F6: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1C204: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1C206: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1C215: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1C217: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1C226: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1C228: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1C237: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1C239: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1C248: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1C24A: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1C259: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1C25B: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1C26A: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1C26C: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1C27B: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1C27D: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1C28C: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1C28E: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1C29D: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1C29F: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1C2AE: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1C2B0: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1C2BF: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1C2C1: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1C2D0: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1C2D2: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1C2E1: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1C2E3: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1C2F2: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1C2F4: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1C303: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1C305: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1C314: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1C316: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP02.PXSX.WGDY */
                }


   1C320: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1C325: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1C32A: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1C32E: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1C33E: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1C349: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1C356: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1C358: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1C366: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1C368: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1C377: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1C379: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1C388: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1C38A: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1C399: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1C39B: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1C3AA: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1C3AC: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1C3BB: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1C3BD: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1C3CC: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1C3CE: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1C3DD: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1C3DF: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1C3EE: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1C3F0: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1C3FF: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1C401: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP02.PXSX.PPAY */
                }


   1C40B: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1C410: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1C415: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1C419: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1C41F: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1C42B: 88 83                                            // ..

Index (ECKY, One)), One))

   1C42D: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP02.PXSX.ECKY */
                }


   1C436: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1C43B: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1C440: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1C444: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1C44E: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1C458: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1C464: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1C466: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1C474: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1C476: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP02.PXSX.SADX */
                }


   1C480: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1C485: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1C48A: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1C48E: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1C493: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1C499: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1C49E: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1C4A4: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP02.PXSX.GPCX */
                }


   1C4AB: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1C4B0: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1C4BB: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1C4CB: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1C4D4: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1C4D6: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1C4E6: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1C4EE: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1C4FE: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1C507: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1C517: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1C520: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1C530: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP02.PXSX.DCTR */
                        }
                    }
                }


   1C539: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1C53F: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1C546: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1C54C: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1C555: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1C556: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1C55D: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1C55E: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1C565: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1C56D: 08 5F 54 5F 31 00                                // ._T_1.


   1C573: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1C579: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1C57E: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1C58E: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1C592: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1C59D: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1C5A5: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1C5AE: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1C5B6: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1C5B7: 11 03 01 03                                      // ....

                                }


   1C5BB: A5                                               // .

                                Return (
   1C5BC: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1C5BD: 11 03 01 00                                      // ....

                            Case
   1C5C1: A1 0E                                            // ..

 (One)
                            {

   1C5C3: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1C5CB: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1C5D0: A5                                               // .

                    Else
                    {

   1C5D1: A1 06                                            // ..

                        Return (
   1C5D3: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1C5D4: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP03.PXSX))
    {

   1C5D8: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1C5E8: 52 50 30 33 50 58 53 58 00                       // RP03PXSX.

        Scope (_SB.PCI0.RP03.PXSX)
        {

   1C5F1: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1C601: 33 50 58 53 58                                   // 3PXSX

            Name (_DSD, 
   1C606: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1C60B: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1C60E: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1C61E: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1C622: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1C625: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1C635: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1C63A: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1C644: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1C651: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1C65C: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1C66C: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1C66E: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1C676: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1C67C: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1C686: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1C695: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1C6A1: A4 01                                            // ..

                        Case
   1C6A3: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1C6A6: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1C6B2: A4 01                                            // ..

                        Case
   1C6B4: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1C6B7: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1C6C3: A4 01                                            // ..

                        Case
   1C6C5: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1C6C8: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1C6D4: A4 01                                            // ..

                        Case
   1C6D6: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1C6D9: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1C6E5: A4 01                                            // ..

                        Case
   1C6E7: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1C6EA: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1C6F6: A4 01                                            // ..

                        Case
   1C6F8: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1C6FB: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1C707: A4 01                                            // ..

                        Case
   1C709: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1C70C: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1C718: A4 01                                            // ..

                        Case
   1C71A: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1C71D: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1C729: A4 01                                            // ..

                        Case
   1C72B: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1C72E: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1C73A: A4 01                                            // ..

                        Case
   1C73C: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1C73F: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1C74B: A4 01                                            // ..

                        Case
   1C74D: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1C750: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1C75C: A4 01                                            // ..

                        Case
   1C75E: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1C761: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1C76D: A4 01                                            // ..

                        Case
   1C76F: A1 33                                            // .3

 (0x24FB8086)
                        {

   1C771: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1C77D: A4 01                                            // ..

                        Case
   1C77F: A1 23                                            // .#

 (0x25268086)
                        {

   1C781: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1C78D: A4 01                                            // ..

                        Case
   1C78F: A1 13                                            // ..

 (0x27238086)
                        {

   1C791: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1C79D: A4 01                                            // ..

                        Default
                        {

   1C79F: A1 03                                            // ..

                            Return (Zero)
                        }


   1C7A1: A4 00                                            // ..

                    }
                }

   1C7A3: A5                                               // .

                Else
                {

   1C7A4: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1C7A6: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1C7A8: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1C7B0: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1C7B6: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1C7BF: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1C7CD: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1C7D9: A4 01                                            // ..

                        Case
   1C7DB: A1 13                                            // ..

 (0x75608086)
                        {

   1C7DD: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1C7E9: A4 01                                            // ..

                        Default
                        {

   1C7EB: A1 03                                            // ..

                            Return (Zero)
                        }


   1C7ED: A4 00                                            // ..

                    }
                }

   1C7EF: A5                                               // .

                Else
                {

   1C7F0: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1C7F2: A4 00                                            // ..

            If (WIST ())
            {

   1C7F4: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1C7FB: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1C806: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1C816: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1C81F: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1C821: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1C831: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1C839: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1C849: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1C852: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1C862: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1C86B: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1C87B: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP03.PXSX.DCTR */
                        }
                    }
                }


   1C884: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1C88A: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1C88F: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1C893: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1C8A3: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1C8A5: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1C8B1: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1C8B3: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1C8C1: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1C8C3: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1C8D1: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1C8D3: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP03.PXSX.SPLX */
                }


   1C8DD: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1C8E2: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1C8E7: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1C8EB: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1C8FB: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1C8FD: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1C90D: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1C90F: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1C919: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1C91B: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1C929: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1C92B: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1C939: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1C93B: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1C947: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1C949: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1C958: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1C95A: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1C969: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1C96B: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP03.PXSX.WANX */
                }


   1C976: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1C97B: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1C980: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1C984: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1C98F: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1C99B: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1C99D: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1C9AB: 88 83                                            // ..

Index (WRDX, One)), One))

   1C9AD: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP03.PXSX.WRDX */
                }


   1C9B6: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1C9BB: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1C9C0: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1C9C4: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1C9D4: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1C9DF: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1C9EC: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1C9EE: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1C9FC: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1C9FE: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1CA0D: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1CA0F: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1CA1E: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1CA20: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1CA2F: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1CA31: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1CA40: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1CA42: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1CA51: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1CA53: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1CA62: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1CA64: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1CA73: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1CA75: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1CA84: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1CA86: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1CA95: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1CA97: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP03.PXSX.WRDY */
                }


   1CAA1: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1CAA6: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1CAAB: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1CAB0: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1CAC0: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1CAD0: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1CAE0: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1CAF0: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1CAF6: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1CB03: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1CB05: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1CB13: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1CB15: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1CB24: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1CB26: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1CB35: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1CB37: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1CB46: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1CB48: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1CB57: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1CB59: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1CB68: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1CB6A: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1CB79: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1CB7B: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1CB8A: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1CB8C: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1CB9B: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1CB9D: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1CBAC: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1CBAE: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1CBBD: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1CBBF: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1CBCE: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1CBD0: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1CBDF: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1CBE1: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1CBF0: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1CBF2: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1CC01: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1CC03: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1CC12: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1CC14: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1CC23: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1CC25: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1CC34: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1CC36: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1CC45: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1CC47: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1CC56: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1CC58: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1CC67: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1CC69: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1CC78: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1CC7A: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1CC89: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1CC8B: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1CC9A: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1CC9C: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1CCAB: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1CCAD: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1CCBC: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1CCBE: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1CCCD: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1CCCF: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1CCDE: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1CCE0: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1CCEF: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1CCF1: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1CD00: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1CD02: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1CD11: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1CD13: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP03.PXSX.EWRY */
                }


   1CD1D: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1CD22: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1CD27: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1CD2B: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1CD3B: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1CD4B: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1CD54: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1CD61: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1CD63: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1CD71: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1CD73: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1CD82: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1CD84: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1CD93: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1CD95: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1CDA4: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1CDA6: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1CDB5: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1CDB7: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1CDC6: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1CDC8: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1CDD7: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1CDD9: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1CDE8: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1CDEA: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1CDF9: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1CDFB: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1CE0A: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1CE0C: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1CE1B: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1CE1D: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1CE2C: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1CE2E: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1CE3D: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1CE3F: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1CE4E: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1CE50: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1CE5F: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1CE61: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1CE70: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1CE72: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1CE81: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1CE83: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP03.PXSX.WGDY */
                }


   1CE8D: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1CE92: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1CE97: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1CE9B: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1CEAB: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1CEB6: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1CEC3: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1CEC5: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1CED3: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1CED5: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1CEE4: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1CEE6: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1CEF5: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1CEF7: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1CF06: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1CF08: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1CF17: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1CF19: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1CF28: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1CF2A: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1CF39: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1CF3B: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1CF4A: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1CF4C: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1CF5B: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1CF5D: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1CF6C: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1CF6E: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP03.PXSX.PPAY */
                }


   1CF78: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1CF7D: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1CF82: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1CF86: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1CF8C: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1CF98: 88 83                                            // ..

Index (ECKY, One)), One))

   1CF9A: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP03.PXSX.ECKY */
                }


   1CFA3: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1CFA8: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1CFAD: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1CFB1: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1CFBB: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1CFC5: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1CFD1: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1CFD3: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1CFE1: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1CFE3: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP03.PXSX.SADX */
                }


   1CFED: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1CFF2: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1CFF7: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1CFFB: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1D000: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1D006: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1D00B: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1D011: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP03.PXSX.GPCX */
                }


   1D018: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1D01D: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1D028: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1D038: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1D041: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1D043: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1D053: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1D05B: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1D06B: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1D074: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1D084: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1D08D: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1D09D: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP03.PXSX.DCTR */
                        }
                    }
                }


   1D0A6: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1D0AC: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1D0B3: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1D0B9: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1D0C2: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1D0C3: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1D0CA: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1D0CB: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1D0D2: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1D0DA: 08 5F 54 5F 31 00                                // ._T_1.


   1D0E0: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1D0E6: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1D0EB: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1D0FB: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1D0FF: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1D10A: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1D112: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1D11B: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1D123: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1D124: 11 03 01 03                                      // ....

                                }


   1D128: A5                                               // .

                                Return (
   1D129: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1D12A: 11 03 01 00                                      // ....

                            Case
   1D12E: A1 0E                                            // ..

 (One)
                            {

   1D130: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1D138: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1D13D: A5                                               // .

                    Else
                    {

   1D13E: A1 06                                            // ..

                        Return (
   1D140: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1D141: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP04.PXSX))
    {

   1D145: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1D155: 52 50 30 34 50 58 53 58 00                       // RP04PXSX.

        Scope (_SB.PCI0.RP04.PXSX)
        {

   1D15E: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1D16E: 34 50 58 53 58                                   // 4PXSX

            Name (_DSD, 
   1D173: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1D178: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1D17B: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1D18B: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1D18F: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1D192: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1D1A2: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1D1A7: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1D1B1: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1D1BE: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1D1C9: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1D1D9: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1D1DB: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1D1E3: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1D1E9: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1D1F3: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1D202: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1D20E: A4 01                                            // ..

                        Case
   1D210: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1D213: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1D21F: A4 01                                            // ..

                        Case
   1D221: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1D224: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1D230: A4 01                                            // ..

                        Case
   1D232: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1D235: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1D241: A4 01                                            // ..

                        Case
   1D243: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1D246: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1D252: A4 01                                            // ..

                        Case
   1D254: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1D257: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1D263: A4 01                                            // ..

                        Case
   1D265: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1D268: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1D274: A4 01                                            // ..

                        Case
   1D276: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1D279: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1D285: A4 01                                            // ..

                        Case
   1D287: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1D28A: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1D296: A4 01                                            // ..

                        Case
   1D298: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1D29B: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1D2A7: A4 01                                            // ..

                        Case
   1D2A9: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1D2AC: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1D2B8: A4 01                                            // ..

                        Case
   1D2BA: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1D2BD: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1D2C9: A4 01                                            // ..

                        Case
   1D2CB: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1D2CE: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1D2DA: A4 01                                            // ..

                        Case
   1D2DC: A1 33                                            // .3

 (0x24FB8086)
                        {

   1D2DE: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1D2EA: A4 01                                            // ..

                        Case
   1D2EC: A1 23                                            // .#

 (0x25268086)
                        {

   1D2EE: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1D2FA: A4 01                                            // ..

                        Case
   1D2FC: A1 13                                            // ..

 (0x27238086)
                        {

   1D2FE: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1D30A: A4 01                                            // ..

                        Default
                        {

   1D30C: A1 03                                            // ..

                            Return (Zero)
                        }


   1D30E: A4 00                                            // ..

                    }
                }

   1D310: A5                                               // .

                Else
                {

   1D311: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1D313: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1D315: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1D31D: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1D323: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1D32C: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1D33A: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1D346: A4 01                                            // ..

                        Case
   1D348: A1 13                                            // ..

 (0x75608086)
                        {

   1D34A: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1D356: A4 01                                            // ..

                        Default
                        {

   1D358: A1 03                                            // ..

                            Return (Zero)
                        }


   1D35A: A4 00                                            // ..

                    }
                }

   1D35C: A5                                               // .

                Else
                {

   1D35D: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1D35F: A4 00                                            // ..

            If (WIST ())
            {

   1D361: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1D368: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1D373: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1D383: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1D38C: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1D38E: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1D39E: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1D3A6: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1D3B6: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1D3BF: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1D3CF: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1D3D8: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1D3E8: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP04.PXSX.DCTR */
                        }
                    }
                }


   1D3F1: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1D3F7: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1D3FC: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1D400: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1D410: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1D412: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1D41E: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1D420: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1D42E: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1D430: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1D43E: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1D440: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP04.PXSX.SPLX */
                }


   1D44A: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1D44F: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1D454: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1D458: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1D468: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1D46A: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1D47A: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1D47C: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1D486: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1D488: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1D496: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1D498: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1D4A6: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1D4A8: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1D4B4: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1D4B6: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1D4C5: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1D4C7: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1D4D6: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1D4D8: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP04.PXSX.WANX */
                }


   1D4E3: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1D4E8: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1D4ED: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1D4F1: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1D4FC: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1D508: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1D50A: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1D518: 88 83                                            // ..

Index (WRDX, One)), One))

   1D51A: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP04.PXSX.WRDX */
                }


   1D523: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1D528: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1D52D: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1D531: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1D541: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1D54C: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1D559: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1D55B: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1D569: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1D56B: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1D57A: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1D57C: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1D58B: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1D58D: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1D59C: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1D59E: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1D5AD: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1D5AF: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1D5BE: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1D5C0: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1D5CF: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1D5D1: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1D5E0: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1D5E2: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1D5F1: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1D5F3: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1D602: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1D604: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP04.PXSX.WRDY */
                }


   1D60E: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1D613: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1D618: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1D61D: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1D62D: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1D63D: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1D64D: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1D65D: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1D663: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1D670: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1D672: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1D680: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1D682: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1D691: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1D693: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1D6A2: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1D6A4: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1D6B3: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1D6B5: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1D6C4: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1D6C6: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1D6D5: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1D6D7: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1D6E6: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1D6E8: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1D6F7: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1D6F9: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1D708: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1D70A: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1D719: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1D71B: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1D72A: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1D72C: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1D73B: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1D73D: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1D74C: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1D74E: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1D75D: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1D75F: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1D76E: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1D770: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1D77F: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1D781: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1D790: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1D792: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1D7A1: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1D7A3: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1D7B2: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1D7B4: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1D7C3: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1D7C5: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1D7D4: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1D7D6: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1D7E5: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1D7E7: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1D7F6: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1D7F8: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1D807: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1D809: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1D818: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1D81A: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1D829: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1D82B: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1D83A: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1D83C: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1D84B: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1D84D: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1D85C: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1D85E: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1D86D: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1D86F: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1D87E: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1D880: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP04.PXSX.EWRY */
                }


   1D88A: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1D88F: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1D894: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1D898: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1D8A8: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1D8B8: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1D8C1: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1D8CE: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1D8D0: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1D8DE: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1D8E0: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1D8EF: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1D8F1: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1D900: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1D902: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1D911: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1D913: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1D922: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1D924: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1D933: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1D935: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1D944: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1D946: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1D955: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1D957: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1D966: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1D968: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1D977: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1D979: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1D988: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1D98A: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1D999: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1D99B: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1D9AA: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1D9AC: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1D9BB: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1D9BD: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1D9CC: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1D9CE: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1D9DD: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1D9DF: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1D9EE: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1D9F0: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP04.PXSX.WGDY */
                }


   1D9FA: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1D9FF: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1DA04: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1DA08: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1DA18: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1DA23: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1DA30: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1DA32: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1DA40: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1DA42: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1DA51: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1DA53: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1DA62: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1DA64: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1DA73: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1DA75: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1DA84: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1DA86: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1DA95: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1DA97: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1DAA6: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1DAA8: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1DAB7: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1DAB9: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1DAC8: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1DACA: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1DAD9: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1DADB: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP04.PXSX.PPAY */
                }


   1DAE5: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1DAEA: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1DAEF: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1DAF3: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1DAF9: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1DB05: 88 83                                            // ..

Index (ECKY, One)), One))

   1DB07: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP04.PXSX.ECKY */
                }


   1DB10: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1DB15: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1DB1A: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1DB1E: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1DB28: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1DB32: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1DB3E: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1DB40: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1DB4E: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1DB50: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP04.PXSX.SADX */
                }


   1DB5A: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1DB5F: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1DB64: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1DB68: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1DB6D: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1DB73: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1DB78: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1DB7E: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP04.PXSX.GPCX */
                }


   1DB85: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1DB8A: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1DB95: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1DBA5: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1DBAE: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1DBB0: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1DBC0: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1DBC8: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1DBD8: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1DBE1: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1DBF1: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1DBFA: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1DC0A: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP04.PXSX.DCTR */
                        }
                    }
                }


   1DC13: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1DC19: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1DC20: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1DC26: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1DC2F: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1DC30: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1DC37: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1DC38: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1DC3F: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1DC47: 08 5F 54 5F 31 00                                // ._T_1.


   1DC4D: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1DC53: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1DC58: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1DC68: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1DC6C: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1DC77: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1DC7F: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1DC88: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1DC90: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1DC91: 11 03 01 03                                      // ....

                                }


   1DC95: A5                                               // .

                                Return (
   1DC96: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1DC97: 11 03 01 00                                      // ....

                            Case
   1DC9B: A1 0E                                            // ..

 (One)
                            {

   1DC9D: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1DCA5: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1DCAA: A5                                               // .

                    Else
                    {

   1DCAB: A1 06                                            // ..

                        Return (
   1DCAD: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1DCAE: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP05.PXSX))
    {

   1DCB2: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1DCC2: 52 50 30 35 50 58 53 58 00                       // RP05PXSX.

        Scope (_SB.PCI0.RP05.PXSX)
        {

   1DCCB: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1DCDB: 35 50 58 53 58                                   // 5PXSX

            Name (_DSD, 
   1DCE0: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1DCE5: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1DCE8: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1DCF8: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1DCFC: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1DCFF: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1DD0F: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1DD14: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1DD1E: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1DD2B: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1DD36: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1DD46: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1DD48: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1DD50: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1DD56: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1DD60: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1DD6F: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1DD7B: A4 01                                            // ..

                        Case
   1DD7D: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1DD80: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1DD8C: A4 01                                            // ..

                        Case
   1DD8E: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1DD91: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1DD9D: A4 01                                            // ..

                        Case
   1DD9F: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1DDA2: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1DDAE: A4 01                                            // ..

                        Case
   1DDB0: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1DDB3: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1DDBF: A4 01                                            // ..

                        Case
   1DDC1: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1DDC4: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1DDD0: A4 01                                            // ..

                        Case
   1DDD2: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1DDD5: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1DDE1: A4 01                                            // ..

                        Case
   1DDE3: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1DDE6: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1DDF2: A4 01                                            // ..

                        Case
   1DDF4: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1DDF7: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1DE03: A4 01                                            // ..

                        Case
   1DE05: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1DE08: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1DE14: A4 01                                            // ..

                        Case
   1DE16: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1DE19: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1DE25: A4 01                                            // ..

                        Case
   1DE27: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1DE2A: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1DE36: A4 01                                            // ..

                        Case
   1DE38: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1DE3B: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1DE47: A4 01                                            // ..

                        Case
   1DE49: A1 33                                            // .3

 (0x24FB8086)
                        {

   1DE4B: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1DE57: A4 01                                            // ..

                        Case
   1DE59: A1 23                                            // .#

 (0x25268086)
                        {

   1DE5B: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1DE67: A4 01                                            // ..

                        Case
   1DE69: A1 13                                            // ..

 (0x27238086)
                        {

   1DE6B: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1DE77: A4 01                                            // ..

                        Default
                        {

   1DE79: A1 03                                            // ..

                            Return (Zero)
                        }


   1DE7B: A4 00                                            // ..

                    }
                }

   1DE7D: A5                                               // .

                Else
                {

   1DE7E: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1DE80: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1DE82: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1DE8A: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1DE90: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1DE99: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1DEA7: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1DEB3: A4 01                                            // ..

                        Case
   1DEB5: A1 13                                            // ..

 (0x75608086)
                        {

   1DEB7: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1DEC3: A4 01                                            // ..

                        Default
                        {

   1DEC5: A1 03                                            // ..

                            Return (Zero)
                        }


   1DEC7: A4 00                                            // ..

                    }
                }

   1DEC9: A5                                               // .

                Else
                {

   1DECA: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1DECC: A4 00                                            // ..

            If (WIST ())
            {

   1DECE: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1DED5: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1DEE0: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1DEF0: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1DEF9: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1DEFB: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1DF0B: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1DF13: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1DF23: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1DF2C: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1DF3C: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1DF45: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1DF55: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP05.PXSX.DCTR */
                        }
                    }
                }


   1DF5E: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1DF64: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1DF69: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1DF6D: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1DF7D: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1DF7F: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1DF8B: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1DF8D: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1DF9B: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1DF9D: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1DFAB: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1DFAD: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP05.PXSX.SPLX */
                }


   1DFB7: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1DFBC: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1DFC1: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1DFC5: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1DFD5: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1DFD7: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1DFE7: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1DFE9: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1DFF3: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1DFF5: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1E003: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1E005: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1E013: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1E015: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1E021: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1E023: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1E032: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1E034: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1E043: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1E045: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP05.PXSX.WANX */
                }


   1E050: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1E055: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1E05A: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1E05E: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1E069: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1E075: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1E077: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1E085: 88 83                                            // ..

Index (WRDX, One)), One))

   1E087: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP05.PXSX.WRDX */
                }


   1E090: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1E095: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1E09A: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1E09E: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1E0AE: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1E0B9: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1E0C6: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1E0C8: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1E0D6: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1E0D8: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1E0E7: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1E0E9: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1E0F8: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1E0FA: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1E109: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1E10B: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1E11A: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1E11C: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1E12B: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1E12D: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1E13C: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1E13E: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1E14D: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1E14F: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1E15E: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1E160: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1E16F: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1E171: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP05.PXSX.WRDY */
                }


   1E17B: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1E180: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1E185: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1E18A: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1E19A: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1E1AA: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1E1BA: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1E1CA: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1E1D0: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1E1DD: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1E1DF: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1E1ED: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1E1EF: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1E1FE: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1E200: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1E20F: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1E211: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1E220: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1E222: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1E231: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1E233: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1E242: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1E244: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1E253: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1E255: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1E264: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1E266: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1E275: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1E277: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1E286: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1E288: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1E297: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1E299: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1E2A8: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1E2AA: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1E2B9: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1E2BB: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1E2CA: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1E2CC: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1E2DB: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1E2DD: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1E2EC: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1E2EE: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1E2FD: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1E2FF: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1E30E: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1E310: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1E31F: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1E321: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1E330: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1E332: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1E341: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1E343: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1E352: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1E354: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1E363: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1E365: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1E374: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1E376: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1E385: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1E387: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1E396: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1E398: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1E3A7: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1E3A9: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1E3B8: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1E3BA: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1E3C9: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1E3CB: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1E3DA: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1E3DC: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1E3EB: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1E3ED: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP05.PXSX.EWRY */
                }


   1E3F7: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1E3FC: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1E401: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1E405: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1E415: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1E425: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1E42E: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1E43B: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1E43D: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1E44B: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1E44D: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1E45C: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1E45E: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1E46D: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1E46F: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1E47E: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1E480: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1E48F: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1E491: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1E4A0: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1E4A2: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1E4B1: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1E4B3: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1E4C2: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1E4C4: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1E4D3: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1E4D5: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1E4E4: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1E4E6: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1E4F5: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1E4F7: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1E506: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1E508: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1E517: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1E519: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1E528: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1E52A: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1E539: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1E53B: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1E54A: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1E54C: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1E55B: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1E55D: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP05.PXSX.WGDY */
                }


   1E567: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1E56C: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1E571: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1E575: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1E585: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1E590: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1E59D: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1E59F: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1E5AD: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1E5AF: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1E5BE: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1E5C0: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1E5CF: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1E5D1: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1E5E0: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1E5E2: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1E5F1: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1E5F3: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1E602: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1E604: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1E613: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1E615: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1E624: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1E626: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1E635: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1E637: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1E646: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1E648: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP05.PXSX.PPAY */
                }


   1E652: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1E657: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1E65C: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1E660: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1E666: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1E672: 88 83                                            // ..

Index (ECKY, One)), One))

   1E674: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP05.PXSX.ECKY */
                }


   1E67D: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1E682: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1E687: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1E68B: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1E695: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1E69F: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1E6AB: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1E6AD: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1E6BB: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1E6BD: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP05.PXSX.SADX */
                }


   1E6C7: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1E6CC: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1E6D1: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1E6D5: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1E6DA: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1E6E0: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1E6E5: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1E6EB: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP05.PXSX.GPCX */
                }


   1E6F2: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1E6F7: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1E702: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1E712: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1E71B: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1E71D: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1E72D: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1E735: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1E745: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1E74E: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1E75E: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1E767: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1E777: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP05.PXSX.DCTR */
                        }
                    }
                }


   1E780: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1E786: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1E78D: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1E793: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1E79C: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1E79D: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1E7A4: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1E7A5: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1E7AC: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1E7B4: 08 5F 54 5F 31 00                                // ._T_1.


   1E7BA: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1E7C0: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1E7C5: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1E7D5: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1E7D9: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1E7E4: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1E7EC: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1E7F5: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1E7FD: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1E7FE: 11 03 01 03                                      // ....

                                }


   1E802: A5                                               // .

                                Return (
   1E803: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1E804: 11 03 01 00                                      // ....

                            Case
   1E808: A1 0E                                            // ..

 (One)
                            {

   1E80A: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1E812: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1E817: A5                                               // .

                    Else
                    {

   1E818: A1 06                                            // ..

                        Return (
   1E81A: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1E81B: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP06.PXSX))
    {

   1E81F: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1E82F: 52 50 30 36 50 58 53 58 00                       // RP06PXSX.

        Scope (_SB.PCI0.RP06.PXSX)
        {

   1E838: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1E848: 36 50 58 53 58                                   // 6PXSX

            Name (_DSD, 
   1E84D: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1E852: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1E855: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1E865: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1E869: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1E86C: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1E87C: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1E881: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1E88B: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1E898: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1E8A3: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1E8B3: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1E8B5: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1E8BD: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1E8C3: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1E8CD: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1E8DC: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1E8E8: A4 01                                            // ..

                        Case
   1E8EA: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1E8ED: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1E8F9: A4 01                                            // ..

                        Case
   1E8FB: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1E8FE: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1E90A: A4 01                                            // ..

                        Case
   1E90C: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1E90F: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1E91B: A4 01                                            // ..

                        Case
   1E91D: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1E920: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1E92C: A4 01                                            // ..

                        Case
   1E92E: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1E931: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1E93D: A4 01                                            // ..

                        Case
   1E93F: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1E942: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1E94E: A4 01                                            // ..

                        Case
   1E950: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1E953: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1E95F: A4 01                                            // ..

                        Case
   1E961: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1E964: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1E970: A4 01                                            // ..

                        Case
   1E972: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1E975: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1E981: A4 01                                            // ..

                        Case
   1E983: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1E986: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1E992: A4 01                                            // ..

                        Case
   1E994: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1E997: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1E9A3: A4 01                                            // ..

                        Case
   1E9A5: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1E9A8: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1E9B4: A4 01                                            // ..

                        Case
   1E9B6: A1 33                                            // .3

 (0x24FB8086)
                        {

   1E9B8: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1E9C4: A4 01                                            // ..

                        Case
   1E9C6: A1 23                                            // .#

 (0x25268086)
                        {

   1E9C8: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1E9D4: A4 01                                            // ..

                        Case
   1E9D6: A1 13                                            // ..

 (0x27238086)
                        {

   1E9D8: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1E9E4: A4 01                                            // ..

                        Default
                        {

   1E9E6: A1 03                                            // ..

                            Return (Zero)
                        }


   1E9E8: A4 00                                            // ..

                    }
                }

   1E9EA: A5                                               // .

                Else
                {

   1E9EB: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1E9ED: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1E9EF: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1E9F7: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1E9FD: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1EA06: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1EA14: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1EA20: A4 01                                            // ..

                        Case
   1EA22: A1 13                                            // ..

 (0x75608086)
                        {

   1EA24: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1EA30: A4 01                                            // ..

                        Default
                        {

   1EA32: A1 03                                            // ..

                            Return (Zero)
                        }


   1EA34: A4 00                                            // ..

                    }
                }

   1EA36: A5                                               // .

                Else
                {

   1EA37: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1EA39: A4 00                                            // ..

            If (WIST ())
            {

   1EA3B: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1EA42: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1EA4D: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1EA5D: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1EA66: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1EA68: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1EA78: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1EA80: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1EA90: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1EA99: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1EAA9: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1EAB2: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1EAC2: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP06.PXSX.DCTR */
                        }
                    }
                }


   1EACB: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1EAD1: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1EAD6: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1EADA: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1EAEA: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1EAEC: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1EAF8: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1EAFA: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1EB08: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1EB0A: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1EB18: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1EB1A: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP06.PXSX.SPLX */
                }


   1EB24: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1EB29: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1EB2E: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1EB32: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1EB42: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1EB44: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1EB54: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1EB56: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1EB60: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1EB62: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1EB70: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1EB72: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1EB80: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1EB82: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1EB8E: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1EB90: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1EB9F: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1EBA1: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1EBB0: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1EBB2: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP06.PXSX.WANX */
                }


   1EBBD: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1EBC2: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1EBC7: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1EBCB: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1EBD6: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1EBE2: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1EBE4: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1EBF2: 88 83                                            // ..

Index (WRDX, One)), One))

   1EBF4: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP06.PXSX.WRDX */
                }


   1EBFD: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1EC02: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1EC07: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1EC0B: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1EC1B: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1EC26: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1EC33: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1EC35: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1EC43: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1EC45: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1EC54: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1EC56: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1EC65: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1EC67: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1EC76: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1EC78: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1EC87: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1EC89: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1EC98: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1EC9A: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1ECA9: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1ECAB: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1ECBA: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1ECBC: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1ECCB: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1ECCD: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1ECDC: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1ECDE: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP06.PXSX.WRDY */
                }


   1ECE8: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1ECED: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1ECF2: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1ECF7: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1ED07: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1ED17: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1ED27: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1ED37: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1ED3D: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1ED4A: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1ED4C: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1ED5A: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1ED5C: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1ED6B: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1ED6D: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1ED7C: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1ED7E: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1ED8D: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1ED8F: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1ED9E: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1EDA0: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1EDAF: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1EDB1: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1EDC0: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1EDC2: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1EDD1: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1EDD3: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1EDE2: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1EDE4: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1EDF3: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1EDF5: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1EE04: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1EE06: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1EE15: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1EE17: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1EE26: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1EE28: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1EE37: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1EE39: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1EE48: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1EE4A: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1EE59: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1EE5B: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1EE6A: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1EE6C: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1EE7B: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1EE7D: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1EE8C: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1EE8E: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1EE9D: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1EE9F: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1EEAE: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1EEB0: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1EEBF: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1EEC1: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1EED0: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1EED2: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1EEE1: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1EEE3: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1EEF2: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1EEF4: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1EF03: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1EF05: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1EF14: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1EF16: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1EF25: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1EF27: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1EF36: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1EF38: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1EF47: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1EF49: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1EF58: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1EF5A: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP06.PXSX.EWRY */
                }


   1EF64: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1EF69: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1EF6E: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1EF72: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1EF82: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1EF92: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1EF9B: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1EFA8: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1EFAA: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1EFB8: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1EFBA: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1EFC9: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1EFCB: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1EFDA: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1EFDC: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1EFEB: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1EFED: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1EFFC: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1EFFE: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1F00D: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1F00F: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1F01E: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1F020: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1F02F: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1F031: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1F040: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1F042: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1F051: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1F053: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1F062: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1F064: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1F073: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1F075: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1F084: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1F086: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1F095: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1F097: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1F0A6: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1F0A8: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1F0B7: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1F0B9: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1F0C8: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1F0CA: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP06.PXSX.WGDY */
                }


   1F0D4: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1F0D9: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1F0DE: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1F0E2: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1F0F2: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1F0FD: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1F10A: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1F10C: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1F11A: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1F11C: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1F12B: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1F12D: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1F13C: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1F13E: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1F14D: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1F14F: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1F15E: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1F160: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1F16F: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1F171: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1F180: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1F182: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1F191: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1F193: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1F1A2: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1F1A4: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1F1B3: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1F1B5: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP06.PXSX.PPAY */
                }


   1F1BF: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1F1C4: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1F1C9: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1F1CD: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1F1D3: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1F1DF: 88 83                                            // ..

Index (ECKY, One)), One))

   1F1E1: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP06.PXSX.ECKY */
                }


   1F1EA: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1F1EF: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1F1F4: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1F1F8: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1F202: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1F20C: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1F218: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1F21A: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1F228: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1F22A: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP06.PXSX.SADX */
                }


   1F234: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1F239: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1F23E: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1F242: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1F247: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1F24D: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1F252: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1F258: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP06.PXSX.GPCX */
                }


   1F25F: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1F264: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1F26F: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1F27F: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1F288: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1F28A: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1F29A: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1F2A2: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1F2B2: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1F2BB: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1F2CB: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1F2D4: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1F2E4: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP06.PXSX.DCTR */
                        }
                    }
                }


   1F2ED: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1F2F3: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1F2FA: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1F300: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1F309: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1F30A: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1F311: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1F312: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1F319: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1F321: 08 5F 54 5F 31 00                                // ._T_1.


   1F327: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1F32D: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1F332: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1F342: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1F346: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1F351: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1F359: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1F362: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1F36A: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1F36B: 11 03 01 03                                      // ....

                                }


   1F36F: A5                                               // .

                                Return (
   1F370: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1F371: 11 03 01 00                                      // ....

                            Case
   1F375: A1 0E                                            // ..

 (One)
                            {

   1F377: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1F37F: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1F384: A5                                               // .

                    Else
                    {

   1F385: A1 06                                            // ..

                        Return (
   1F387: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1F388: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP07.PXSX))
    {

   1F38C: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1F39C: 52 50 30 37 50 58 53 58 00                       // RP07PXSX.

        Scope (_SB.PCI0.RP07.PXSX)
        {

   1F3A5: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1F3B5: 37 50 58 53 58                                   // 7PXSX

            Name (_DSD, 
   1F3BA: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1F3BF: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1F3C2: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1F3D2: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1F3D6: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1F3D9: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1F3E9: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1F3EE: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1F3F8: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1F405: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1F410: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1F420: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1F422: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1F42A: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1F430: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1F43A: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1F449: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1F455: A4 01                                            // ..

                        Case
   1F457: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1F45A: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1F466: A4 01                                            // ..

                        Case
   1F468: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1F46B: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1F477: A4 01                                            // ..

                        Case
   1F479: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1F47C: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1F488: A4 01                                            // ..

                        Case
   1F48A: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1F48D: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1F499: A4 01                                            // ..

                        Case
   1F49B: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1F49E: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1F4AA: A4 01                                            // ..

                        Case
   1F4AC: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1F4AF: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1F4BB: A4 01                                            // ..

                        Case
   1F4BD: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1F4C0: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1F4CC: A4 01                                            // ..

                        Case
   1F4CE: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1F4D1: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1F4DD: A4 01                                            // ..

                        Case
   1F4DF: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1F4E2: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1F4EE: A4 01                                            // ..

                        Case
   1F4F0: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1F4F3: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1F4FF: A4 01                                            // ..

                        Case
   1F501: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1F504: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1F510: A4 01                                            // ..

                        Case
   1F512: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1F515: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1F521: A4 01                                            // ..

                        Case
   1F523: A1 33                                            // .3

 (0x24FB8086)
                        {

   1F525: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1F531: A4 01                                            // ..

                        Case
   1F533: A1 23                                            // .#

 (0x25268086)
                        {

   1F535: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1F541: A4 01                                            // ..

                        Case
   1F543: A1 13                                            // ..

 (0x27238086)
                        {

   1F545: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1F551: A4 01                                            // ..

                        Default
                        {

   1F553: A1 03                                            // ..

                            Return (Zero)
                        }


   1F555: A4 00                                            // ..

                    }
                }

   1F557: A5                                               // .

                Else
                {

   1F558: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1F55A: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1F55C: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1F564: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1F56A: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1F573: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1F581: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1F58D: A4 01                                            // ..

                        Case
   1F58F: A1 13                                            // ..

 (0x75608086)
                        {

   1F591: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1F59D: A4 01                                            // ..

                        Default
                        {

   1F59F: A1 03                                            // ..

                            Return (Zero)
                        }


   1F5A1: A4 00                                            // ..

                    }
                }

   1F5A3: A5                                               // .

                Else
                {

   1F5A4: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1F5A6: A4 00                                            // ..

            If (WIST ())
            {

   1F5A8: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1F5AF: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1F5BA: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1F5CA: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1F5D3: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1F5D5: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1F5E5: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1F5ED: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1F5FD: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1F606: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1F616: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1F61F: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1F62F: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP07.PXSX.DCTR */
                        }
                    }
                }


   1F638: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1F63E: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1F643: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1F647: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1F657: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1F659: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1F665: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1F667: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1F675: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1F677: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1F685: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1F687: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP07.PXSX.SPLX */
                }


   1F691: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1F696: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1F69B: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1F69F: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1F6AF: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1F6B1: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1F6C1: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1F6C3: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1F6CD: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1F6CF: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1F6DD: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1F6DF: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1F6ED: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1F6EF: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1F6FB: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1F6FD: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1F70C: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1F70E: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1F71D: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1F71F: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP07.PXSX.WANX */
                }


   1F72A: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1F72F: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1F734: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1F738: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1F743: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1F74F: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1F751: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1F75F: 88 83                                            // ..

Index (WRDX, One)), One))

   1F761: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP07.PXSX.WRDX */
                }


   1F76A: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1F76F: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1F774: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1F778: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1F788: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1F793: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1F7A0: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1F7A2: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1F7B0: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1F7B2: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1F7C1: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1F7C3: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1F7D2: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1F7D4: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1F7E3: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1F7E5: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1F7F4: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1F7F6: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1F805: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1F807: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1F816: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1F818: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1F827: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1F829: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1F838: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1F83A: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1F849: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1F84B: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP07.PXSX.WRDY */
                }


   1F855: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1F85A: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1F85F: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1F864: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1F874: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1F884: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1F894: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1F8A4: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1F8AA: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1F8B7: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1F8B9: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1F8C7: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1F8C9: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1F8D8: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1F8DA: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1F8E9: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1F8EB: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1F8FA: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1F8FC: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1F90B: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1F90D: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1F91C: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1F91E: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1F92D: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1F92F: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1F93E: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1F940: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1F94F: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1F951: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1F960: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1F962: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1F971: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1F973: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1F982: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1F984: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1F993: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1F995: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1F9A4: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1F9A6: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1F9B5: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1F9B7: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1F9C6: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1F9C8: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1F9D7: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1F9D9: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1F9E8: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1F9EA: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1F9F9: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1F9FB: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1FA0A: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1FA0C: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1FA1B: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1FA1D: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1FA2C: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1FA2E: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1FA3D: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1FA3F: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1FA4E: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1FA50: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1FA5F: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1FA61: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1FA70: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1FA72: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1FA81: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1FA83: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1FA92: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1FA94: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1FAA3: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1FAA5: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1FAB4: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1FAB6: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1FAC5: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1FAC7: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP07.PXSX.EWRY */
                }


   1FAD1: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1FAD6: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1FADB: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1FADF: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1FAEF: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1FAFF: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1FB08: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1FB15: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1FB17: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1FB25: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1FB27: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1FB36: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1FB38: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1FB47: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1FB49: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1FB58: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1FB5A: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1FB69: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1FB6B: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1FB7A: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1FB7C: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1FB8B: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1FB8D: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1FB9C: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1FB9E: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1FBAD: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1FBAF: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1FBBE: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1FBC0: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1FBCF: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1FBD1: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1FBE0: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1FBE2: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1FBF1: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1FBF3: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1FC02: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1FC04: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1FC13: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1FC15: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1FC24: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1FC26: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1FC35: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1FC37: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP07.PXSX.WGDY */
                }


   1FC41: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1FC46: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1FC4B: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   1FC4F: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1FC5F: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1FC6A: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1FC77: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1FC79: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1FC87: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1FC89: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1FC98: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1FC9A: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1FCA9: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1FCAB: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1FCBA: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1FCBC: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1FCCB: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1FCCD: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1FCDC: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1FCDE: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1FCED: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1FCEF: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1FCFE: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1FD00: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1FD0F: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1FD11: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1FD20: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1FD22: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP07.PXSX.PPAY */
                }


   1FD2C: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1FD31: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1FD36: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1FD3A: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1FD40: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1FD4C: 88 83                                            // ..

Index (ECKY, One)), One))

   1FD4E: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP07.PXSX.ECKY */
                }


   1FD57: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1FD5C: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1FD61: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1FD65: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1FD6F: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1FD79: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1FD85: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1FD87: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1FD95: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1FD97: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP07.PXSX.SADX */
                }


   1FDA1: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1FDA6: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1FDAB: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1FDAF: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1FDB4: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1FDBA: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1FDBF: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1FDC5: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP07.PXSX.GPCX */
                }


   1FDCC: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1FDD1: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1FDDC: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1FDEC: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1FDF5: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1FDF7: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1FE07: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1FE0F: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1FE1F: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1FE28: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1FE38: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1FE41: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1FE51: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP07.PXSX.DCTR */
                        }
                    }
                }


   1FE5A: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1FE60: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1FE67: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1FE6D: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1FE76: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1FE77: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1FE7E: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1FE7F: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1FE86: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1FE8E: 08 5F 54 5F 31 00                                // ._T_1.


   1FE94: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1FE9A: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1FE9F: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1FEAF: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1FEB3: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1FEBE: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1FEC6: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1FECF: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1FED7: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1FED8: 11 03 01 03                                      // ....

                                }


   1FEDC: A5                                               // .

                                Return (
   1FEDD: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1FEDE: 11 03 01 00                                      // ....

                            Case
   1FEE2: A1 0E                                            // ..

 (One)
                            {

   1FEE4: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1FEEC: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1FEF1: A5                                               // .

                    Else
                    {

   1FEF2: A1 06                                            // ..

                        Return (
   1FEF4: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1FEF5: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP08.PXSX))
    {

   1FEF9: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1FF09: 52 50 30 38 50 58 53 58 00                       // RP08PXSX.

        Scope (_SB.PCI0.RP08.PXSX)
        {

   1FF12: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1FF22: 38 50 58 53 58                                   // 8PXSX

            Name (_DSD, 
   1FF27: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1FF2C: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1FF2F: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1FF3F: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1FF43: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1FF46: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1FF56: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1FF5B: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1FF65: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1FF72: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1FF7D: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1FF8D: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1FF8F: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1FF97: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1FF9D: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1FFA7: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1FFB6: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1FFC2: A4 01                                            // ..

                        Case
   1FFC4: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1FFC7: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1FFD3: A4 01                                            // ..

                        Case
   1FFD5: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1FFD8: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1FFE4: A4 01                                            // ..

                        Case
   1FFE6: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1FFE9: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1FFF5: A4 01                                            // ..

                        Case
   1FFF7: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1FFFA: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   20006: A4 01                                            // ..

                        Case
   20008: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   2000B: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   20017: A4 01                                            // ..

                        Case
   20019: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   2001C: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   20028: A4 01                                            // ..

                        Case
   2002A: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   2002D: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   20039: A4 01                                            // ..

                        Case
   2003B: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   2003E: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   2004A: A4 01                                            // ..

                        Case
   2004C: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   2004F: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   2005B: A4 01                                            // ..

                        Case
   2005D: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   20060: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   2006C: A4 01                                            // ..

                        Case
   2006E: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   20071: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   2007D: A4 01                                            // ..

                        Case
   2007F: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   20082: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   2008E: A4 01                                            // ..

                        Case
   20090: A1 33                                            // .3

 (0x24FB8086)
                        {

   20092: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   2009E: A4 01                                            // ..

                        Case
   200A0: A1 23                                            // .#

 (0x25268086)
                        {

   200A2: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   200AE: A4 01                                            // ..

                        Case
   200B0: A1 13                                            // ..

 (0x27238086)
                        {

   200B2: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   200BE: A4 01                                            // ..

                        Default
                        {

   200C0: A1 03                                            // ..

                            Return (Zero)
                        }


   200C2: A4 00                                            // ..

                    }
                }

   200C4: A5                                               // .

                Else
                {

   200C5: A1 03                                            // ..

                    Return (Zero)
                }
            }


   200C7: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   200C9: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   200D1: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   200D7: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   200E0: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   200EE: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   200FA: A4 01                                            // ..

                        Case
   200FC: A1 13                                            // ..

 (0x75608086)
                        {

   200FE: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   2010A: A4 01                                            // ..

                        Default
                        {

   2010C: A1 03                                            // ..

                            Return (Zero)
                        }


   2010E: A4 00                                            // ..

                    }
                }

   20110: A5                                               // .

                Else
                {

   20111: A1 03                                            // ..

                    Return (Zero)
                }
            }


   20113: A4 00                                            // ..

            If (WIST ())
            {

   20115: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   2011C: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   20127: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   20137: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   20140: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   20142: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   20152: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   2015A: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   2016A: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   20173: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   20183: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   2018C: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   2019C: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP08.PXSX.DCTR */
                        }
                    }
                }


   201A5: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   201AB: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   201B0: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   201B4: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   201C4: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   201C6: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   201D2: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   201D4: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   201E2: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   201E4: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   201F2: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   201F4: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP08.PXSX.SPLX */
                }


   201FE: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   20203: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   20208: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   2020C: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   2021C: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   2021E: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   2022E: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   20230: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   2023A: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   2023C: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   2024A: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   2024C: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   2025A: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   2025C: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   20268: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   2026A: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   20279: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   2027B: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   2028A: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   2028C: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP08.PXSX.WANX */
                }


   20297: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   2029C: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   202A1: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   202A5: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   202B0: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   202BC: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   202BE: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   202CC: 88 83                                            // ..

Index (WRDX, One)), One))

   202CE: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP08.PXSX.WRDX */
                }


   202D7: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   202DC: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   202E1: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   202E5: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   202F5: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   20300: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   2030D: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   2030F: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   2031D: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   2031F: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   2032E: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   20330: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   2033F: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   20341: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   20350: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   20352: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   20361: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   20363: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   20372: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   20374: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   20383: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   20385: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   20394: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   20396: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   203A5: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   203A7: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   203B6: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   203B8: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP08.PXSX.WRDY */
                }


   203C2: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   203C7: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   203CC: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   203D1: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   203E1: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   203F1: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   20401: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   20411: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   20417: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   20424: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   20426: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   20434: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   20436: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   20445: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   20447: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   20456: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   20458: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   20467: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   20469: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   20478: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   2047A: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   20489: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   2048B: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   2049A: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   2049C: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   204AB: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   204AD: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   204BC: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   204BE: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   204CD: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   204CF: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   204DE: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   204E0: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   204EF: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   204F1: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   20500: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   20502: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   20511: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   20513: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   20522: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   20524: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   20533: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   20535: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   20544: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   20546: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   20555: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   20557: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   20566: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   20568: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   20577: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   20579: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   20588: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   2058A: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   20599: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   2059B: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   205AA: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   205AC: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   205BB: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   205BD: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   205CC: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   205CE: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   205DD: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   205DF: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   205EE: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   205F0: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   205FF: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   20601: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   20610: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   20612: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   20621: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   20623: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   20632: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   20634: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP08.PXSX.EWRY */
                }


   2063E: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   20643: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   20648: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   2064C: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   2065C: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   2066C: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   20675: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   20682: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   20684: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   20692: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   20694: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   206A3: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   206A5: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   206B4: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   206B6: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   206C5: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   206C7: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   206D6: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   206D8: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   206E7: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   206E9: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   206F8: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   206FA: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   20709: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   2070B: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   2071A: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   2071C: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   2072B: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   2072D: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   2073C: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   2073E: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   2074D: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   2074F: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   2075E: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   20760: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   2076F: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   20771: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   20780: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   20782: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   20791: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   20793: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   207A2: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   207A4: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP08.PXSX.WGDY */
                }


   207AE: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   207B3: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   207B8: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   207BC: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   207CC: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   207D7: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   207E4: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   207E6: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   207F4: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   207F6: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   20805: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   20807: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   20816: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   20818: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   20827: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   20829: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   20838: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   2083A: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   20849: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   2084B: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   2085A: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   2085C: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   2086B: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   2086D: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   2087C: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   2087E: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   2088D: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   2088F: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP08.PXSX.PPAY */
                }


   20899: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   2089E: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   208A3: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   208A7: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   208AD: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   208B9: 88 83                                            // ..

Index (ECKY, One)), One))

   208BB: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP08.PXSX.ECKY */
                }


   208C4: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   208C9: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   208CE: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   208D2: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   208DC: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   208E6: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   208F2: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   208F4: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   20902: 88 83                                            // ..

Index (SADX, 0x02)), One))

   20904: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP08.PXSX.SADX */
                }


   2090E: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   20913: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   20918: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   2091C: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   20921: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   20927: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   2092C: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   20932: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP08.PXSX.GPCX */
                }


   20939: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   2093E: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   20949: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   20959: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   20962: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   20964: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   20974: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   2097C: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   2098C: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   20995: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   209A5: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   209AE: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   209BE: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP08.PXSX.DCTR */
                        }
                    }
                }


   209C7: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   209CD: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   209D4: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   209DA: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   209E3: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   209E4: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   209EB: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   209EC: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   209F3: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   209FB: 08 5F 54 5F 31 00                                // ._T_1.


   20A01: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   20A07: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   20A0C: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   20A1C: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   20A20: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   20A2B: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   20A33: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   20A3C: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   20A44: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   20A45: 11 03 01 03                                      // ....

                                }


   20A49: A5                                               // .

                                Return (
   20A4A: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   20A4B: 11 03 01 00                                      // ....

                            Case
   20A4F: A1 0E                                            // ..

 (One)
                            {

   20A51: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   20A59: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   20A5E: A5                                               // .

                    Else
                    {

   20A5F: A1 06                                            // ..

                        Return (
   20A61: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   20A62: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP09.PXSX))
    {

   20A66: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   20A76: 52 50 30 39 50 58 53 58 00                       // RP09PXSX.

        Scope (_SB.PCI0.RP09.PXSX)
        {

   20A7F: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   20A8F: 39 50 58 53 58                                   // 9PXSX

            Name (_DSD, 
   20A94: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   20A99: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   20A9C: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   20AAC: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   20AB0: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   20AB3: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   20AC3: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   20AC8: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   20AD2: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   20ADF: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   20AEA: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   20AFA: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   20AFC: 14 49 13 57 49 53 54 08                          // .I.WIST.


   20B04: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   20B0A: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   20B14: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   20B23: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   20B2F: A4 01                                            // ..

                        Case
   20B31: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   20B34: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   20B40: A4 01                                            // ..

                        Case
   20B42: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   20B45: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   20B51: A4 01                                            // ..

                        Case
   20B53: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   20B56: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   20B62: A4 01                                            // ..

                        Case
   20B64: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   20B67: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   20B73: A4 01                                            // ..

                        Case
   20B75: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   20B78: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   20B84: A4 01                                            // ..

                        Case
   20B86: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   20B89: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   20B95: A4 01                                            // ..

                        Case
   20B97: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   20B9A: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   20BA6: A4 01                                            // ..

                        Case
   20BA8: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   20BAB: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   20BB7: A4 01                                            // ..

                        Case
   20BB9: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   20BBC: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   20BC8: A4 01                                            // ..

                        Case
   20BCA: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   20BCD: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   20BD9: A4 01                                            // ..

                        Case
   20BDB: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   20BDE: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   20BEA: A4 01                                            // ..

                        Case
   20BEC: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   20BEF: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   20BFB: A4 01                                            // ..

                        Case
   20BFD: A1 33                                            // .3

 (0x24FB8086)
                        {

   20BFF: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   20C0B: A4 01                                            // ..

                        Case
   20C0D: A1 23                                            // .#

 (0x25268086)
                        {

   20C0F: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   20C1B: A4 01                                            // ..

                        Case
   20C1D: A1 13                                            // ..

 (0x27238086)
                        {

   20C1F: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   20C2B: A4 01                                            // ..

                        Default
                        {

   20C2D: A1 03                                            // ..

                            Return (Zero)
                        }


   20C2F: A4 00                                            // ..

                    }
                }

   20C31: A5                                               // .

                Else
                {

   20C32: A1 03                                            // ..

                    Return (Zero)
                }
            }


   20C34: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   20C36: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   20C3E: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   20C44: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   20C4D: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   20C5B: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   20C67: A4 01                                            // ..

                        Case
   20C69: A1 13                                            // ..

 (0x75608086)
                        {

   20C6B: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   20C77: A4 01                                            // ..

                        Default
                        {

   20C79: A1 03                                            // ..

                            Return (Zero)
                        }


   20C7B: A4 00                                            // ..

                    }
                }

   20C7D: A5                                               // .

                Else
                {

   20C7E: A1 03                                            // ..

                    Return (Zero)
                }
            }


   20C80: A4 00                                            // ..

            If (WIST ())
            {

   20C82: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   20C89: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   20C94: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   20CA4: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   20CAD: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   20CAF: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   20CBF: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   20CC7: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   20CD7: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   20CE0: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   20CF0: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   20CF9: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   20D09: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP09.PXSX.DCTR */
                        }
                    }
                }


   20D12: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   20D18: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   20D1D: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   20D21: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   20D31: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   20D33: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   20D3F: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   20D41: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   20D4F: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   20D51: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   20D5F: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   20D61: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP09.PXSX.SPLX */
                }


   20D6B: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   20D70: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   20D75: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   20D79: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   20D89: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   20D8B: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   20D9B: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   20D9D: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   20DA7: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   20DA9: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   20DB7: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   20DB9: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   20DC7: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   20DC9: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   20DD5: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   20DD7: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   20DE6: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   20DE8: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   20DF7: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   20DF9: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP09.PXSX.WANX */
                }


   20E04: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   20E09: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   20E0E: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   20E12: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   20E1D: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   20E29: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   20E2B: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   20E39: 88 83                                            // ..

Index (WRDX, One)), One))

   20E3B: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP09.PXSX.WRDX */
                }


   20E44: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   20E49: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   20E4E: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   20E52: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   20E62: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   20E6D: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   20E7A: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   20E7C: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   20E8A: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   20E8C: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   20E9B: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   20E9D: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   20EAC: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   20EAE: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   20EBD: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   20EBF: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   20ECE: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   20ED0: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   20EDF: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   20EE1: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   20EF0: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   20EF2: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   20F01: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   20F03: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   20F12: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   20F14: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   20F23: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   20F25: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP09.PXSX.WRDY */
                }


   20F2F: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   20F34: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   20F39: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   20F3E: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   20F4E: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   20F5E: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   20F6E: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   20F7E: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   20F84: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   20F91: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   20F93: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   20FA1: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   20FA3: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   20FB2: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   20FB4: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   20FC3: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   20FC5: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   20FD4: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   20FD6: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   20FE5: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   20FE7: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   20FF6: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   20FF8: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   21007: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   21009: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   21018: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   2101A: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   21029: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   2102B: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   2103A: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   2103C: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   2104B: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   2104D: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   2105C: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   2105E: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   2106D: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   2106F: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   2107E: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   21080: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   2108F: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   21091: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   210A0: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   210A2: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   210B1: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   210B3: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   210C2: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   210C4: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   210D3: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   210D5: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   210E4: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   210E6: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   210F5: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   210F7: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   21106: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   21108: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   21117: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   21119: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   21128: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   2112A: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   21139: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   2113B: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   2114A: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   2114C: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   2115B: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   2115D: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   2116C: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   2116E: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   2117D: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   2117F: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   2118E: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   21190: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   2119F: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   211A1: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP09.PXSX.EWRY */
                }


   211AB: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   211B0: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   211B5: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   211B9: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   211C9: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   211D9: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   211E2: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   211EF: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   211F1: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   211FF: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   21201: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   21210: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   21212: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   21221: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   21223: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   21232: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   21234: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   21243: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   21245: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   21254: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   21256: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   21265: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   21267: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   21276: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   21278: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   21287: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   21289: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   21298: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   2129A: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   212A9: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   212AB: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   212BA: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   212BC: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   212CB: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   212CD: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   212DC: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   212DE: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   212ED: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   212EF: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   212FE: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   21300: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   2130F: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   21311: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP09.PXSX.WGDY */
                }


   2131B: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   21320: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   21325: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   21329: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   21339: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   21344: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   21351: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   21353: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   21361: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   21363: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   21372: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   21374: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   21383: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   21385: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   21394: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   21396: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   213A5: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   213A7: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   213B6: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   213B8: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   213C7: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   213C9: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   213D8: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   213DA: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   213E9: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   213EB: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   213FA: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   213FC: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP09.PXSX.PPAY */
                }


   21406: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   2140B: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   21410: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   21414: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   2141A: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   21426: 88 83                                            // ..

Index (ECKY, One)), One))

   21428: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP09.PXSX.ECKY */
                }


   21431: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   21436: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   2143B: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   2143F: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   21449: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   21453: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   2145F: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   21461: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   2146F: 88 83                                            // ..

Index (SADX, 0x02)), One))

   21471: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP09.PXSX.SADX */
                }


   2147B: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   21480: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   21485: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   21489: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   2148E: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   21494: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   21499: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   2149F: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP09.PXSX.GPCX */
                }


   214A6: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   214AB: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   214B6: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   214C6: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   214CF: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   214D1: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   214E1: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   214E9: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   214F9: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   21502: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   21512: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   2151B: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   2152B: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP09.PXSX.DCTR */
                        }
                    }
                }


   21534: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   2153A: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   21541: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   21547: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   21550: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   21551: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   21558: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   21559: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   21560: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   21568: 08 5F 54 5F 31 00                                // ._T_1.


   2156E: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   21574: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   21579: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   21589: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   2158D: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   21598: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   215A0: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   215A9: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   215B1: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   215B2: 11 03 01 03                                      // ....

                                }


   215B6: A5                                               // .

                                Return (
   215B7: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   215B8: 11 03 01 00                                      // ....

                            Case
   215BC: A1 0E                                            // ..

 (One)
                            {

   215BE: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   215C6: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   215CB: A5                                               // .

                    Else
                    {

   215CC: A1 06                                            // ..

                        Return (
   215CE: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   215CF: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP10.PXSX))
    {

   215D3: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   215E3: 52 50 31 30 50 58 53 58 00                       // RP10PXSX.

        Scope (_SB.PCI0.RP10.PXSX)
        {

   215EC: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   215FC: 30 50 58 53 58                                   // 0PXSX

            Name (_DSD, 
   21601: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   21606: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   21609: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   21619: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   2161D: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   21620: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   21630: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   21635: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   2163F: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   2164C: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   21657: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   21667: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   21669: 14 49 13 57 49 53 54 08                          // .I.WIST.


   21671: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   21677: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   21681: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   21690: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   2169C: A4 01                                            // ..

                        Case
   2169E: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   216A1: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   216AD: A4 01                                            // ..

                        Case
   216AF: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   216B2: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   216BE: A4 01                                            // ..

                        Case
   216C0: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   216C3: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   216CF: A4 01                                            // ..

                        Case
   216D1: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   216D4: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   216E0: A4 01                                            // ..

                        Case
   216E2: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   216E5: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   216F1: A4 01                                            // ..

                        Case
   216F3: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   216F6: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   21702: A4 01                                            // ..

                        Case
   21704: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   21707: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   21713: A4 01                                            // ..

                        Case
   21715: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   21718: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   21724: A4 01                                            // ..

                        Case
   21726: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   21729: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   21735: A4 01                                            // ..

                        Case
   21737: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   2173A: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   21746: A4 01                                            // ..

                        Case
   21748: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   2174B: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   21757: A4 01                                            // ..

                        Case
   21759: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   2175C: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   21768: A4 01                                            // ..

                        Case
   2176A: A1 33                                            // .3

 (0x24FB8086)
                        {

   2176C: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   21778: A4 01                                            // ..

                        Case
   2177A: A1 23                                            // .#

 (0x25268086)
                        {

   2177C: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   21788: A4 01                                            // ..

                        Case
   2178A: A1 13                                            // ..

 (0x27238086)
                        {

   2178C: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   21798: A4 01                                            // ..

                        Default
                        {

   2179A: A1 03                                            // ..

                            Return (Zero)
                        }


   2179C: A4 00                                            // ..

                    }
                }

   2179E: A5                                               // .

                Else
                {

   2179F: A1 03                                            // ..

                    Return (Zero)
                }
            }


   217A1: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   217A3: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   217AB: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   217B1: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   217BA: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   217C8: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   217D4: A4 01                                            // ..

                        Case
   217D6: A1 13                                            // ..

 (0x75608086)
                        {

   217D8: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   217E4: A4 01                                            // ..

                        Default
                        {

   217E6: A1 03                                            // ..

                            Return (Zero)
                        }


   217E8: A4 00                                            // ..

                    }
                }

   217EA: A5                                               // .

                Else
                {

   217EB: A1 03                                            // ..

                    Return (Zero)
                }
            }


   217ED: A4 00                                            // ..

            If (WIST ())
            {

   217EF: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   217F6: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   21801: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   21811: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   2181A: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   2181C: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   2182C: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   21834: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   21844: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   2184D: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   2185D: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   21866: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   21876: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP10.PXSX.DCTR */
                        }
                    }
                }


   2187F: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   21885: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   2188A: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   2188E: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   2189E: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   218A0: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   218AC: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   218AE: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   218BC: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   218BE: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   218CC: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   218CE: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP10.PXSX.SPLX */
                }


   218D8: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   218DD: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   218E2: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   218E6: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   218F6: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   218F8: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   21908: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   2190A: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   21914: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   21916: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   21924: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   21926: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   21934: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   21936: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   21942: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   21944: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   21953: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   21955: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   21964: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   21966: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP10.PXSX.WANX */
                }


   21971: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   21976: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   2197B: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   2197F: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   2198A: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   21996: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   21998: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   219A6: 88 83                                            // ..

Index (WRDX, One)), One))

   219A8: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP10.PXSX.WRDX */
                }


   219B1: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   219B6: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   219BB: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   219BF: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   219CF: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   219DA: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   219E7: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   219E9: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   219F7: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   219F9: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   21A08: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   21A0A: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   21A19: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   21A1B: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   21A2A: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   21A2C: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   21A3B: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   21A3D: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   21A4C: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   21A4E: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   21A5D: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   21A5F: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   21A6E: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   21A70: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   21A7F: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   21A81: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   21A90: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   21A92: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP10.PXSX.WRDY */
                }


   21A9C: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   21AA1: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   21AA6: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   21AAB: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   21ABB: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   21ACB: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   21ADB: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   21AEB: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   21AF1: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   21AFE: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   21B00: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   21B0E: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   21B10: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   21B1F: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   21B21: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   21B30: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   21B32: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   21B41: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   21B43: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   21B52: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   21B54: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   21B63: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   21B65: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   21B74: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   21B76: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   21B85: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   21B87: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   21B96: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   21B98: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   21BA7: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   21BA9: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   21BB8: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   21BBA: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   21BC9: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   21BCB: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   21BDA: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   21BDC: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   21BEB: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   21BED: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   21BFC: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   21BFE: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   21C0D: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   21C0F: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   21C1E: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   21C20: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   21C2F: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   21C31: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   21C40: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   21C42: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   21C51: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   21C53: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   21C62: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   21C64: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   21C73: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   21C75: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   21C84: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   21C86: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   21C95: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   21C97: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   21CA6: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   21CA8: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   21CB7: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   21CB9: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   21CC8: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   21CCA: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   21CD9: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   21CDB: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   21CEA: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   21CEC: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   21CFB: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   21CFD: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   21D0C: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   21D0E: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP10.PXSX.EWRY */
                }


   21D18: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   21D1D: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   21D22: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   21D26: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   21D36: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   21D46: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   21D4F: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   21D5C: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   21D5E: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   21D6C: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   21D6E: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   21D7D: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   21D7F: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   21D8E: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   21D90: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   21D9F: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   21DA1: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   21DB0: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   21DB2: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   21DC1: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   21DC3: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   21DD2: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   21DD4: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   21DE3: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   21DE5: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   21DF4: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   21DF6: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   21E05: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   21E07: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   21E16: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   21E18: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   21E27: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   21E29: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   21E38: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   21E3A: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   21E49: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   21E4B: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   21E5A: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   21E5C: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   21E6B: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   21E6D: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   21E7C: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   21E7E: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP10.PXSX.WGDY */
                }


   21E88: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   21E8D: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   21E92: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   21E96: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   21EA6: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   21EB1: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   21EBE: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   21EC0: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   21ECE: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   21ED0: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   21EDF: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   21EE1: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   21EF0: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   21EF2: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   21F01: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   21F03: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   21F12: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   21F14: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   21F23: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   21F25: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   21F34: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   21F36: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   21F45: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   21F47: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   21F56: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   21F58: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   21F67: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   21F69: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP10.PXSX.PPAY */
                }


   21F73: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   21F78: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   21F7D: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   21F81: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   21F87: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   21F93: 88 83                                            // ..

Index (ECKY, One)), One))

   21F95: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP10.PXSX.ECKY */
                }


   21F9E: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   21FA3: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   21FA8: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   21FAC: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   21FB6: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   21FC0: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   21FCC: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   21FCE: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   21FDC: 88 83                                            // ..

Index (SADX, 0x02)), One))

   21FDE: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP10.PXSX.SADX */
                }


   21FE8: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   21FED: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   21FF2: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   21FF6: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   21FFB: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   22001: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   22006: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   2200C: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP10.PXSX.GPCX */
                }


   22013: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   22018: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   22023: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   22033: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   2203C: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   2203E: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   2204E: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   22056: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   22066: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   2206F: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   2207F: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   22088: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   22098: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP10.PXSX.DCTR */
                        }
                    }
                }


   220A1: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   220A7: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   220AE: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   220B4: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   220BD: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   220BE: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   220C5: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   220C6: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   220CD: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   220D5: 08 5F 54 5F 31 00                                // ._T_1.


   220DB: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   220E1: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   220E6: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   220F6: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   220FA: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   22105: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   2210D: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   22116: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   2211E: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   2211F: 11 03 01 03                                      // ....

                                }


   22123: A5                                               // .

                                Return (
   22124: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   22125: 11 03 01 00                                      // ....

                            Case
   22129: A1 0E                                            // ..

 (One)
                            {

   2212B: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   22133: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   22138: A5                                               // .

                    Else
                    {

   22139: A1 06                                            // ..

                        Return (
   2213B: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   2213C: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP11.PXSX))
    {

   22140: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   22150: 52 50 31 31 50 58 53 58 00                       // RP11PXSX.

        Scope (_SB.PCI0.RP11.PXSX)
        {

   22159: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   22169: 31 50 58 53 58                                   // 1PXSX

            Name (_DSD, 
   2216E: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   22173: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   22176: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   22186: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   2218A: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   2218D: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   2219D: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   221A2: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   221AC: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   221B9: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   221C4: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   221D4: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   221D6: 14 49 13 57 49 53 54 08                          // .I.WIST.


   221DE: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   221E4: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   221EE: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   221FD: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   22209: A4 01                                            // ..

                        Case
   2220B: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   2220E: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   2221A: A4 01                                            // ..

                        Case
   2221C: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   2221F: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   2222B: A4 01                                            // ..

                        Case
   2222D: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   22230: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   2223C: A4 01                                            // ..

                        Case
   2223E: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   22241: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   2224D: A4 01                                            // ..

                        Case
   2224F: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   22252: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   2225E: A4 01                                            // ..

                        Case
   22260: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   22263: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   2226F: A4 01                                            // ..

                        Case
   22271: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   22274: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   22280: A4 01                                            // ..

                        Case
   22282: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   22285: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   22291: A4 01                                            // ..

                        Case
   22293: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   22296: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   222A2: A4 01                                            // ..

                        Case
   222A4: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   222A7: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   222B3: A4 01                                            // ..

                        Case
   222B5: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   222B8: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   222C4: A4 01                                            // ..

                        Case
   222C6: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   222C9: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   222D5: A4 01                                            // ..

                        Case
   222D7: A1 33                                            // .3

 (0x24FB8086)
                        {

   222D9: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   222E5: A4 01                                            // ..

                        Case
   222E7: A1 23                                            // .#

 (0x25268086)
                        {

   222E9: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   222F5: A4 01                                            // ..

                        Case
   222F7: A1 13                                            // ..

 (0x27238086)
                        {

   222F9: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   22305: A4 01                                            // ..

                        Default
                        {

   22307: A1 03                                            // ..

                            Return (Zero)
                        }


   22309: A4 00                                            // ..

                    }
                }

   2230B: A5                                               // .

                Else
                {

   2230C: A1 03                                            // ..

                    Return (Zero)
                }
            }


   2230E: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   22310: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   22318: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   2231E: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   22327: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   22335: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   22341: A4 01                                            // ..

                        Case
   22343: A1 13                                            // ..

 (0x75608086)
                        {

   22345: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   22351: A4 01                                            // ..

                        Default
                        {

   22353: A1 03                                            // ..

                            Return (Zero)
                        }


   22355: A4 00                                            // ..

                    }
                }

   22357: A5                                               // .

                Else
                {

   22358: A1 03                                            // ..

                    Return (Zero)
                }
            }


   2235A: A4 00                                            // ..

            If (WIST ())
            {

   2235C: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   22363: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   2236E: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   2237E: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   22387: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   22389: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   22399: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   223A1: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   223B1: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   223BA: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   223CA: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   223D3: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   223E3: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP11.PXSX.DCTR */
                        }
                    }
                }


   223EC: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   223F2: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   223F7: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   223FB: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   2240B: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   2240D: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   22419: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   2241B: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   22429: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   2242B: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   22439: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   2243B: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP11.PXSX.SPLX */
                }


   22445: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   2244A: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   2244F: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   22453: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   22463: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   22465: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   22475: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   22477: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   22481: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   22483: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   22491: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   22493: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   224A1: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   224A3: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   224AF: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   224B1: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   224C0: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   224C2: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   224D1: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   224D3: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP11.PXSX.WANX */
                }


   224DE: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   224E3: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   224E8: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   224EC: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   224F7: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   22503: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   22505: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   22513: 88 83                                            // ..

Index (WRDX, One)), One))

   22515: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP11.PXSX.WRDX */
                }


   2251E: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   22523: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   22528: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   2252C: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   2253C: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   22547: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   22554: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   22556: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   22564: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   22566: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   22575: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   22577: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   22586: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   22588: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   22597: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   22599: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   225A8: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   225AA: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   225B9: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   225BB: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   225CA: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   225CC: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   225DB: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   225DD: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   225EC: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   225EE: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   225FD: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   225FF: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP11.PXSX.WRDY */
                }


   22609: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   2260E: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   22613: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   22618: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   22628: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   22638: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   22648: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   22658: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   2265E: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   2266B: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   2266D: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   2267B: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   2267D: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   2268C: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   2268E: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   2269D: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   2269F: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   226AE: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   226B0: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   226BF: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   226C1: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   226D0: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   226D2: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   226E1: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   226E3: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   226F2: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   226F4: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   22703: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   22705: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   22714: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   22716: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   22725: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   22727: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   22736: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   22738: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   22747: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   22749: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   22758: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   2275A: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   22769: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   2276B: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   2277A: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   2277C: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   2278B: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   2278D: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   2279C: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   2279E: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   227AD: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   227AF: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   227BE: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   227C0: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   227CF: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   227D1: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   227E0: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   227E2: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   227F1: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   227F3: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   22802: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   22804: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   22813: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   22815: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   22824: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   22826: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   22835: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   22837: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   22846: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   22848: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   22857: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   22859: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   22868: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   2286A: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   22879: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   2287B: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP11.PXSX.EWRY */
                }


   22885: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   2288A: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   2288F: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   22893: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   228A3: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   228B3: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   228BC: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   228C9: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   228CB: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   228D9: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   228DB: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   228EA: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   228EC: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   228FB: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   228FD: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   2290C: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   2290E: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   2291D: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   2291F: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   2292E: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   22930: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   2293F: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   22941: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   22950: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   22952: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   22961: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   22963: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   22972: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   22974: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   22983: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   22985: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   22994: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   22996: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   229A5: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   229A7: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   229B6: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   229B8: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   229C7: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   229C9: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   229D8: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   229DA: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   229E9: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   229EB: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP11.PXSX.WGDY */
                }


   229F5: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   229FA: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   229FF: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   22A03: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   22A13: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   22A1E: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   22A2B: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   22A2D: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   22A3B: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   22A3D: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   22A4C: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   22A4E: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   22A5D: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   22A5F: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   22A6E: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   22A70: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   22A7F: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   22A81: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   22A90: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   22A92: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   22AA1: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   22AA3: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   22AB2: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   22AB4: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   22AC3: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   22AC5: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   22AD4: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   22AD6: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP11.PXSX.PPAY */
                }


   22AE0: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   22AE5: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   22AEA: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   22AEE: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   22AF4: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   22B00: 88 83                                            // ..

Index (ECKY, One)), One))

   22B02: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP11.PXSX.ECKY */
                }


   22B0B: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   22B10: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   22B15: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   22B19: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   22B23: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   22B2D: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   22B39: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   22B3B: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   22B49: 88 83                                            // ..

Index (SADX, 0x02)), One))

   22B4B: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP11.PXSX.SADX */
                }


   22B55: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   22B5A: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   22B5F: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   22B63: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   22B68: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   22B6E: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   22B73: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   22B79: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP11.PXSX.GPCX */
                }


   22B80: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   22B85: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   22B90: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   22BA0: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   22BA9: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   22BAB: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   22BBB: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   22BC3: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   22BD3: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   22BDC: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   22BEC: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   22BF5: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   22C05: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP11.PXSX.DCTR */
                        }
                    }
                }


   22C0E: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   22C14: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   22C1B: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   22C21: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   22C2A: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   22C2B: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   22C32: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   22C33: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   22C3A: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   22C42: 08 5F 54 5F 31 00                                // ._T_1.


   22C48: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   22C4E: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   22C53: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   22C63: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   22C67: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   22C72: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   22C7A: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   22C83: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   22C8B: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   22C8C: 11 03 01 03                                      // ....

                                }


   22C90: A5                                               // .

                                Return (
   22C91: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   22C92: 11 03 01 00                                      // ....

                            Case
   22C96: A1 0E                                            // ..

 (One)
                            {

   22C98: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   22CA0: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   22CA5: A5                                               // .

                    Else
                    {

   22CA6: A1 06                                            // ..

                        Return (
   22CA8: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   22CA9: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP12.PXSX))
    {

   22CAD: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   22CBD: 52 50 31 32 50 58 53 58 00                       // RP12PXSX.

        Scope (_SB.PCI0.RP12.PXSX)
        {

   22CC6: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   22CD6: 32 50 58 53 58                                   // 2PXSX

            Name (_DSD, 
   22CDB: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   22CE0: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   22CE3: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   22CF3: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   22CF7: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   22CFA: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   22D0A: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   22D0F: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   22D19: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   22D26: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   22D31: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   22D41: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   22D43: 14 49 13 57 49 53 54 08                          // .I.WIST.


   22D4B: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   22D51: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   22D5B: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   22D6A: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   22D76: A4 01                                            // ..

                        Case
   22D78: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   22D7B: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   22D87: A4 01                                            // ..

                        Case
   22D89: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   22D8C: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   22D98: A4 01                                            // ..

                        Case
   22D9A: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   22D9D: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   22DA9: A4 01                                            // ..

                        Case
   22DAB: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   22DAE: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   22DBA: A4 01                                            // ..

                        Case
   22DBC: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   22DBF: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   22DCB: A4 01                                            // ..

                        Case
   22DCD: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   22DD0: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   22DDC: A4 01                                            // ..

                        Case
   22DDE: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   22DE1: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   22DED: A4 01                                            // ..

                        Case
   22DEF: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   22DF2: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   22DFE: A4 01                                            // ..

                        Case
   22E00: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   22E03: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   22E0F: A4 01                                            // ..

                        Case
   22E11: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   22E14: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   22E20: A4 01                                            // ..

                        Case
   22E22: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   22E25: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   22E31: A4 01                                            // ..

                        Case
   22E33: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   22E36: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   22E42: A4 01                                            // ..

                        Case
   22E44: A1 33                                            // .3

 (0x24FB8086)
                        {

   22E46: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   22E52: A4 01                                            // ..

                        Case
   22E54: A1 23                                            // .#

 (0x25268086)
                        {

   22E56: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   22E62: A4 01                                            // ..

                        Case
   22E64: A1 13                                            // ..

 (0x27238086)
                        {

   22E66: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   22E72: A4 01                                            // ..

                        Default
                        {

   22E74: A1 03                                            // ..

                            Return (Zero)
                        }


   22E76: A4 00                                            // ..

                    }
                }

   22E78: A5                                               // .

                Else
                {

   22E79: A1 03                                            // ..

                    Return (Zero)
                }
            }


   22E7B: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   22E7D: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   22E85: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   22E8B: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   22E94: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   22EA2: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   22EAE: A4 01                                            // ..

                        Case
   22EB0: A1 13                                            // ..

 (0x75608086)
                        {

   22EB2: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   22EBE: A4 01                                            // ..

                        Default
                        {

   22EC0: A1 03                                            // ..

                            Return (Zero)
                        }


   22EC2: A4 00                                            // ..

                    }
                }

   22EC4: A5                                               // .

                Else
                {

   22EC5: A1 03                                            // ..

                    Return (Zero)
                }
            }


   22EC7: A4 00                                            // ..

            If (WIST ())
            {

   22EC9: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   22ED0: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   22EDB: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   22EEB: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   22EF4: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   22EF6: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   22F06: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   22F0E: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   22F1E: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   22F27: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   22F37: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   22F40: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   22F50: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP12.PXSX.DCTR */
                        }
                    }
                }


   22F59: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   22F5F: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   22F64: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   22F68: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   22F78: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   22F7A: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   22F86: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   22F88: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   22F96: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   22F98: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   22FA6: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   22FA8: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP12.PXSX.SPLX */
                }


   22FB2: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   22FB7: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   22FBC: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   22FC0: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   22FD0: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   22FD2: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   22FE2: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   22FE4: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   22FEE: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   22FF0: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   22FFE: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   23000: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   2300E: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   23010: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   2301C: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   2301E: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   2302D: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   2302F: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   2303E: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   23040: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP12.PXSX.WANX */
                }


   2304B: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   23050: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   23055: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   23059: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   23064: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   23070: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   23072: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   23080: 88 83                                            // ..

Index (WRDX, One)), One))

   23082: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP12.PXSX.WRDX */
                }


   2308B: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   23090: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   23095: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23099: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   230A9: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   230B4: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   230C1: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   230C3: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   230D1: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   230D3: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   230E2: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   230E4: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   230F3: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   230F5: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   23104: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   23106: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   23115: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   23117: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   23126: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   23128: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   23137: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   23139: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   23148: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   2314A: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   23159: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   2315B: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   2316A: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   2316C: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP12.PXSX.WRDY */
                }


   23176: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   2317B: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   23180: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23185: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   23195: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   231A5: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   231B5: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   231C5: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   231CB: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   231D8: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   231DA: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   231E8: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   231EA: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   231F9: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   231FB: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   2320A: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   2320C: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   2321B: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   2321D: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   2322C: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   2322E: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   2323D: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   2323F: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   2324E: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   23250: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   2325F: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   23261: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   23270: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   23272: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   23281: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   23283: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   23292: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   23294: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   232A3: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   232A5: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   232B4: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   232B6: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   232C5: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   232C7: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   232D6: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   232D8: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   232E7: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   232E9: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   232F8: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   232FA: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   23309: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   2330B: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   2331A: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   2331C: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   2332B: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   2332D: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   2333C: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   2333E: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   2334D: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   2334F: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   2335E: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   23360: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   2336F: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   23371: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   23380: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   23382: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   23391: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   23393: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   233A2: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   233A4: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   233B3: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   233B5: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   233C4: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   233C6: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   233D5: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   233D7: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   233E6: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   233E8: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP12.PXSX.EWRY */
                }


   233F2: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   233F7: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   233FC: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23400: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   23410: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   23420: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   23429: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   23436: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   23438: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   23446: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   23448: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   23457: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   23459: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   23468: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   2346A: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   23479: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   2347B: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   2348A: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   2348C: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   2349B: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   2349D: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   234AC: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   234AE: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   234BD: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   234BF: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   234CE: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   234D0: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   234DF: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   234E1: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   234F0: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   234F2: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   23501: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   23503: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   23512: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   23514: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   23523: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   23525: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   23534: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   23536: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   23545: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   23547: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   23556: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   23558: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP12.PXSX.WGDY */
                }


   23562: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   23567: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   2356C: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23570: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   23580: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   2358B: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   23598: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   2359A: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   235A8: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   235AA: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   235B9: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   235BB: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   235CA: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   235CC: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   235DB: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   235DD: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   235EC: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   235EE: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   235FD: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   235FF: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   2360E: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   23610: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   2361F: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   23621: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   23630: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   23632: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   23641: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   23643: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP12.PXSX.PPAY */
                }


   2364D: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   23652: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   23657: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   2365B: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   23661: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   2366D: 88 83                                            // ..

Index (ECKY, One)), One))

   2366F: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP12.PXSX.ECKY */
                }


   23678: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   2367D: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   23682: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   23686: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   23690: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   2369A: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   236A6: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   236A8: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   236B6: 88 83                                            // ..

Index (SADX, 0x02)), One))

   236B8: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP12.PXSX.SADX */
                }


   236C2: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   236C7: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   236CC: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   236D0: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   236D5: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   236DB: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   236E0: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   236E6: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP12.PXSX.GPCX */
                }


   236ED: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   236F2: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   236FD: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   2370D: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   23716: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   23718: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   23728: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   23730: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   23740: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   23749: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   23759: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   23762: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   23772: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP12.PXSX.DCTR */
                        }
                    }
                }


   2377B: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   23781: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   23788: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   2378E: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   23797: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   23798: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   2379F: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   237A0: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   237A7: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   237AF: 08 5F 54 5F 31 00                                // ._T_1.


   237B5: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   237BB: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   237C0: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   237D0: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   237D4: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   237DF: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   237E7: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   237F0: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   237F8: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   237F9: 11 03 01 03                                      // ....

                                }


   237FD: A5                                               // .

                                Return (
   237FE: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   237FF: 11 03 01 00                                      // ....

                            Case
   23803: A1 0E                                            // ..

 (One)
                            {

   23805: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   2380D: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   23812: A5                                               // .

                    Else
                    {

   23813: A1 06                                            // ..

                        Return (
   23815: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   23816: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP13.PXSX))
    {

   2381A: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   2382A: 52 50 31 33 50 58 53 58 00                       // RP13PXSX.

        Scope (_SB.PCI0.RP13.PXSX)
        {

   23833: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   23843: 33 50 58 53 58                                   // 3PXSX

            Name (_DSD, 
   23848: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   2384D: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   23850: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   23860: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   23864: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   23867: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   23877: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   2387C: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   23886: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   23893: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   2389E: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   238AE: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   238B0: 14 49 13 57 49 53 54 08                          // .I.WIST.


   238B8: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   238BE: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   238C8: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   238D7: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   238E3: A4 01                                            // ..

                        Case
   238E5: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   238E8: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   238F4: A4 01                                            // ..

                        Case
   238F6: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   238F9: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   23905: A4 01                                            // ..

                        Case
   23907: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   2390A: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   23916: A4 01                                            // ..

                        Case
   23918: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   2391B: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   23927: A4 01                                            // ..

                        Case
   23929: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   2392C: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   23938: A4 01                                            // ..

                        Case
   2393A: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   2393D: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   23949: A4 01                                            // ..

                        Case
   2394B: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   2394E: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   2395A: A4 01                                            // ..

                        Case
   2395C: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   2395F: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   2396B: A4 01                                            // ..

                        Case
   2396D: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   23970: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   2397C: A4 01                                            // ..

                        Case
   2397E: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   23981: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   2398D: A4 01                                            // ..

                        Case
   2398F: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   23992: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   2399E: A4 01                                            // ..

                        Case
   239A0: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   239A3: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   239AF: A4 01                                            // ..

                        Case
   239B1: A1 33                                            // .3

 (0x24FB8086)
                        {

   239B3: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   239BF: A4 01                                            // ..

                        Case
   239C1: A1 23                                            // .#

 (0x25268086)
                        {

   239C3: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   239CF: A4 01                                            // ..

                        Case
   239D1: A1 13                                            // ..

 (0x27238086)
                        {

   239D3: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   239DF: A4 01                                            // ..

                        Default
                        {

   239E1: A1 03                                            // ..

                            Return (Zero)
                        }


   239E3: A4 00                                            // ..

                    }
                }

   239E5: A5                                               // .

                Else
                {

   239E6: A1 03                                            // ..

                    Return (Zero)
                }
            }


   239E8: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   239EA: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   239F2: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   239F8: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   23A01: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   23A0F: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   23A1B: A4 01                                            // ..

                        Case
   23A1D: A1 13                                            // ..

 (0x75608086)
                        {

   23A1F: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   23A2B: A4 01                                            // ..

                        Default
                        {

   23A2D: A1 03                                            // ..

                            Return (Zero)
                        }


   23A2F: A4 00                                            // ..

                    }
                }

   23A31: A5                                               // .

                Else
                {

   23A32: A1 03                                            // ..

                    Return (Zero)
                }
            }


   23A34: A4 00                                            // ..

            If (WIST ())
            {

   23A36: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   23A3D: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   23A48: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   23A58: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   23A61: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   23A63: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   23A73: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   23A7B: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   23A8B: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   23A94: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   23AA4: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   23AAD: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   23ABD: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP13.PXSX.DCTR */
                        }
                    }
                }


   23AC6: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   23ACC: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   23AD1: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   23AD5: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   23AE5: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   23AE7: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   23AF3: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   23AF5: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   23B03: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   23B05: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   23B13: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   23B15: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP13.PXSX.SPLX */
                }


   23B1F: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   23B24: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   23B29: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   23B2D: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   23B3D: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   23B3F: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   23B4F: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   23B51: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   23B5B: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   23B5D: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   23B6B: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   23B6D: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   23B7B: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   23B7D: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   23B89: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   23B8B: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   23B9A: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   23B9C: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   23BAB: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   23BAD: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP13.PXSX.WANX */
                }


   23BB8: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   23BBD: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   23BC2: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   23BC6: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   23BD1: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   23BDD: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   23BDF: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   23BED: 88 83                                            // ..

Index (WRDX, One)), One))

   23BEF: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP13.PXSX.WRDX */
                }


   23BF8: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   23BFD: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   23C02: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23C06: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   23C16: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   23C21: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   23C2E: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   23C30: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   23C3E: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   23C40: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   23C4F: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   23C51: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   23C60: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   23C62: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   23C71: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   23C73: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   23C82: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   23C84: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   23C93: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   23C95: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   23CA4: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   23CA6: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   23CB5: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   23CB7: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   23CC6: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   23CC8: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   23CD7: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   23CD9: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP13.PXSX.WRDY */
                }


   23CE3: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   23CE8: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   23CED: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23CF2: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   23D02: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   23D12: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   23D22: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   23D32: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   23D38: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   23D45: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   23D47: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   23D55: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   23D57: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   23D66: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   23D68: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   23D77: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   23D79: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   23D88: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   23D8A: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   23D99: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   23D9B: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   23DAA: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   23DAC: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   23DBB: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   23DBD: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   23DCC: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   23DCE: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   23DDD: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   23DDF: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   23DEE: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   23DF0: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   23DFF: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   23E01: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   23E10: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   23E12: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   23E21: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   23E23: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   23E32: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   23E34: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   23E43: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   23E45: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   23E54: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   23E56: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   23E65: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   23E67: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   23E76: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   23E78: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   23E87: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   23E89: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   23E98: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   23E9A: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   23EA9: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   23EAB: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   23EBA: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   23EBC: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   23ECB: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   23ECD: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   23EDC: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   23EDE: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   23EED: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   23EEF: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   23EFE: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   23F00: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   23F0F: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   23F11: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   23F20: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   23F22: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   23F31: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   23F33: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   23F42: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   23F44: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   23F53: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   23F55: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP13.PXSX.EWRY */
                }


   23F5F: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   23F64: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   23F69: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   23F6D: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   23F7D: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   23F8D: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   23F96: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   23FA3: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   23FA5: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   23FB3: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   23FB5: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   23FC4: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   23FC6: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   23FD5: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   23FD7: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   23FE6: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   23FE8: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   23FF7: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   23FF9: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   24008: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   2400A: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   24019: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   2401B: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   2402A: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   2402C: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   2403B: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   2403D: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   2404C: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   2404E: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   2405D: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   2405F: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   2406E: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   24070: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   2407F: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   24081: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   24090: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   24092: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   240A1: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   240A3: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   240B2: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   240B4: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   240C3: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   240C5: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP13.PXSX.WGDY */
                }


   240CF: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   240D4: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   240D9: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   240DD: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   240ED: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   240F8: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   24105: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   24107: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   24115: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   24117: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   24126: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   24128: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   24137: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   24139: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   24148: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   2414A: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   24159: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   2415B: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   2416A: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   2416C: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   2417B: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   2417D: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   2418C: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   2418E: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   2419D: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   2419F: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   241AE: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   241B0: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP13.PXSX.PPAY */
                }


   241BA: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   241BF: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   241C4: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   241C8: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   241CE: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   241DA: 88 83                                            // ..

Index (ECKY, One)), One))

   241DC: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP13.PXSX.ECKY */
                }


   241E5: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   241EA: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   241EF: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   241F3: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   241FD: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   24207: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   24213: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   24215: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   24223: 88 83                                            // ..

Index (SADX, 0x02)), One))

   24225: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP13.PXSX.SADX */
                }


   2422F: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   24234: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   24239: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   2423D: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   24242: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   24248: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   2424D: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   24253: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP13.PXSX.GPCX */
                }


   2425A: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   2425F: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   2426A: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   2427A: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   24283: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   24285: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   24295: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   2429D: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   242AD: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   242B6: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   242C6: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   242CF: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   242DF: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP13.PXSX.DCTR */
                        }
                    }
                }


   242E8: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   242EE: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   242F5: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   242FB: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   24304: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   24305: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   2430C: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   2430D: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   24314: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   2431C: 08 5F 54 5F 31 00                                // ._T_1.


   24322: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   24328: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   2432D: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   2433D: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   24341: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   2434C: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   24354: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   2435D: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   24365: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   24366: 11 03 01 03                                      // ....

                                }


   2436A: A5                                               // .

                                Return (
   2436B: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   2436C: 11 03 01 00                                      // ....

                            Case
   24370: A1 0E                                            // ..

 (One)
                            {

   24372: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   2437A: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   2437F: A5                                               // .

                    Else
                    {

   24380: A1 06                                            // ..

                        Return (
   24382: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   24383: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP14.PXSX))
    {

   24387: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   24397: 52 50 31 34 50 58 53 58 00                       // RP14PXSX.

        Scope (_SB.PCI0.RP14.PXSX)
        {

   243A0: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   243B0: 34 50 58 53 58                                   // 4PXSX

            Name (_DSD, 
   243B5: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   243BA: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   243BD: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   243CD: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   243D1: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   243D4: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   243E4: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   243E9: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   243F3: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   24400: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   2440B: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   2441B: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   2441D: 14 49 13 57 49 53 54 08                          // .I.WIST.


   24425: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   2442B: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   24435: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   24444: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   24450: A4 01                                            // ..

                        Case
   24452: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   24455: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   24461: A4 01                                            // ..

                        Case
   24463: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   24466: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   24472: A4 01                                            // ..

                        Case
   24474: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   24477: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   24483: A4 01                                            // ..

                        Case
   24485: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   24488: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   24494: A4 01                                            // ..

                        Case
   24496: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   24499: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   244A5: A4 01                                            // ..

                        Case
   244A7: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   244AA: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   244B6: A4 01                                            // ..

                        Case
   244B8: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   244BB: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   244C7: A4 01                                            // ..

                        Case
   244C9: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   244CC: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   244D8: A4 01                                            // ..

                        Case
   244DA: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   244DD: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   244E9: A4 01                                            // ..

                        Case
   244EB: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   244EE: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   244FA: A4 01                                            // ..

                        Case
   244FC: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   244FF: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   2450B: A4 01                                            // ..

                        Case
   2450D: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   24510: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   2451C: A4 01                                            // ..

                        Case
   2451E: A1 33                                            // .3

 (0x24FB8086)
                        {

   24520: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   2452C: A4 01                                            // ..

                        Case
   2452E: A1 23                                            // .#

 (0x25268086)
                        {

   24530: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   2453C: A4 01                                            // ..

                        Case
   2453E: A1 13                                            // ..

 (0x27238086)
                        {

   24540: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   2454C: A4 01                                            // ..

                        Default
                        {

   2454E: A1 03                                            // ..

                            Return (Zero)
                        }


   24550: A4 00                                            // ..

                    }
                }

   24552: A5                                               // .

                Else
                {

   24553: A1 03                                            // ..

                    Return (Zero)
                }
            }


   24555: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   24557: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   2455F: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   24565: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   2456E: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   2457C: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   24588: A4 01                                            // ..

                        Case
   2458A: A1 13                                            // ..

 (0x75608086)
                        {

   2458C: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   24598: A4 01                                            // ..

                        Default
                        {

   2459A: A1 03                                            // ..

                            Return (Zero)
                        }


   2459C: A4 00                                            // ..

                    }
                }

   2459E: A5                                               // .

                Else
                {

   2459F: A1 03                                            // ..

                    Return (Zero)
                }
            }


   245A1: A4 00                                            // ..

            If (WIST ())
            {

   245A3: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   245AA: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   245B5: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   245C5: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   245CE: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   245D0: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   245E0: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   245E8: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   245F8: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   24601: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   24611: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   2461A: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   2462A: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP14.PXSX.DCTR */
                        }
                    }
                }


   24633: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   24639: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   2463E: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   24642: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   24652: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   24654: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   24660: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   24662: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   24670: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   24672: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   24680: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   24682: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP14.PXSX.SPLX */
                }


   2468C: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   24691: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   24696: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   2469A: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   246AA: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   246AC: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   246BC: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   246BE: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   246C8: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   246CA: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   246D8: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   246DA: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   246E8: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   246EA: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   246F6: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   246F8: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   24707: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   24709: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   24718: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   2471A: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP14.PXSX.WANX */
                }


   24725: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   2472A: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   2472F: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   24733: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   2473E: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   2474A: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   2474C: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   2475A: 88 83                                            // ..

Index (WRDX, One)), One))

   2475C: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP14.PXSX.WRDX */
                }


   24765: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   2476A: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   2476F: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   24773: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   24783: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   2478E: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   2479B: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   2479D: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   247AB: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   247AD: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   247BC: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   247BE: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   247CD: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   247CF: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   247DE: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   247E0: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   247EF: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   247F1: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   24800: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   24802: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   24811: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   24813: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   24822: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   24824: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   24833: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   24835: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   24844: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   24846: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP14.PXSX.WRDY */
                }


   24850: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   24855: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   2485A: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   2485F: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   2486F: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   2487F: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   2488F: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   2489F: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   248A5: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   248B2: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   248B4: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   248C2: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   248C4: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   248D3: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   248D5: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   248E4: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   248E6: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   248F5: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   248F7: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   24906: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   24908: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   24917: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   24919: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   24928: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   2492A: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   24939: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   2493B: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   2494A: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   2494C: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   2495B: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   2495D: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   2496C: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   2496E: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   2497D: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   2497F: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   2498E: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   24990: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   2499F: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   249A1: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   249B0: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   249B2: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   249C1: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   249C3: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   249D2: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   249D4: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   249E3: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   249E5: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   249F4: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   249F6: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   24A05: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   24A07: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   24A16: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   24A18: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   24A27: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   24A29: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   24A38: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   24A3A: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   24A49: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   24A4B: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   24A5A: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   24A5C: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   24A6B: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   24A6D: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   24A7C: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   24A7E: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   24A8D: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   24A8F: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   24A9E: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   24AA0: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   24AAF: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   24AB1: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   24AC0: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   24AC2: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP14.PXSX.EWRY */
                }


   24ACC: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   24AD1: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   24AD6: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   24ADA: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   24AEA: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   24AFA: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   24B03: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   24B10: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   24B12: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   24B20: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   24B22: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   24B31: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   24B33: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   24B42: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   24B44: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   24B53: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   24B55: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   24B64: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   24B66: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   24B75: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   24B77: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   24B86: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   24B88: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   24B97: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   24B99: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   24BA8: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   24BAA: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   24BB9: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   24BBB: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   24BCA: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   24BCC: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   24BDB: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   24BDD: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   24BEC: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   24BEE: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   24BFD: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   24BFF: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   24C0E: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   24C10: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   24C1F: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   24C21: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   24C30: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   24C32: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP14.PXSX.WGDY */
                }


   24C3C: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   24C41: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   24C46: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   24C4A: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   24C5A: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   24C65: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   24C72: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   24C74: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   24C82: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   24C84: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   24C93: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   24C95: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   24CA4: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   24CA6: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   24CB5: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   24CB7: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   24CC6: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   24CC8: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   24CD7: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   24CD9: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   24CE8: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   24CEA: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   24CF9: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   24CFB: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   24D0A: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   24D0C: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   24D1B: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   24D1D: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP14.PXSX.PPAY */
                }


   24D27: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   24D2C: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   24D31: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   24D35: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   24D3B: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   24D47: 88 83                                            // ..

Index (ECKY, One)), One))

   24D49: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP14.PXSX.ECKY */
                }


   24D52: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   24D57: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   24D5C: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   24D60: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   24D6A: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   24D74: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   24D80: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   24D82: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   24D90: 88 83                                            // ..

Index (SADX, 0x02)), One))

   24D92: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP14.PXSX.SADX */
                }


   24D9C: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   24DA1: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   24DA6: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   24DAA: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   24DAF: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   24DB5: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   24DBA: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   24DC0: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP14.PXSX.GPCX */
                }


   24DC7: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   24DCC: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   24DD7: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   24DE7: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   24DF0: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   24DF2: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   24E02: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   24E0A: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   24E1A: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   24E23: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   24E33: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   24E3C: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   24E4C: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP14.PXSX.DCTR */
                        }
                    }
                }


   24E55: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   24E5B: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   24E62: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   24E68: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   24E71: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   24E72: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   24E79: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   24E7A: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   24E81: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   24E89: 08 5F 54 5F 31 00                                // ._T_1.


   24E8F: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   24E95: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   24E9A: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   24EAA: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   24EAE: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   24EB9: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   24EC1: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   24ECA: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   24ED2: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   24ED3: 11 03 01 03                                      // ....

                                }


   24ED7: A5                                               // .

                                Return (
   24ED8: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   24ED9: 11 03 01 00                                      // ....

                            Case
   24EDD: A1 0E                                            // ..

 (One)
                            {

   24EDF: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   24EE7: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   24EEC: A5                                               // .

                    Else
                    {

   24EED: A1 06                                            // ..

                        Return (
   24EEF: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   24EF0: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP15.PXSX))
    {

   24EF4: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   24F04: 52 50 31 35 50 58 53 58 00                       // RP15PXSX.

        Scope (_SB.PCI0.RP15.PXSX)
        {

   24F0D: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   24F1D: 35 50 58 53 58                                   // 5PXSX

            Name (_DSD, 
   24F22: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   24F27: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   24F2A: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   24F3A: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   24F3E: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   24F41: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   24F51: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   24F56: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   24F60: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   24F6D: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   24F78: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   24F88: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   24F8A: 14 49 13 57 49 53 54 08                          // .I.WIST.


   24F92: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   24F98: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   24FA2: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   24FB1: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   24FBD: A4 01                                            // ..

                        Case
   24FBF: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   24FC2: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   24FCE: A4 01                                            // ..

                        Case
   24FD0: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   24FD3: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   24FDF: A4 01                                            // ..

                        Case
   24FE1: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   24FE4: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   24FF0: A4 01                                            // ..

                        Case
   24FF2: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   24FF5: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   25001: A4 01                                            // ..

                        Case
   25003: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   25006: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   25012: A4 01                                            // ..

                        Case
   25014: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   25017: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   25023: A4 01                                            // ..

                        Case
   25025: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   25028: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   25034: A4 01                                            // ..

                        Case
   25036: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   25039: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   25045: A4 01                                            // ..

                        Case
   25047: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   2504A: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   25056: A4 01                                            // ..

                        Case
   25058: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   2505B: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   25067: A4 01                                            // ..

                        Case
   25069: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   2506C: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   25078: A4 01                                            // ..

                        Case
   2507A: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   2507D: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   25089: A4 01                                            // ..

                        Case
   2508B: A1 33                                            // .3

 (0x24FB8086)
                        {

   2508D: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   25099: A4 01                                            // ..

                        Case
   2509B: A1 23                                            // .#

 (0x25268086)
                        {

   2509D: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   250A9: A4 01                                            // ..

                        Case
   250AB: A1 13                                            // ..

 (0x27238086)
                        {

   250AD: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   250B9: A4 01                                            // ..

                        Default
                        {

   250BB: A1 03                                            // ..

                            Return (Zero)
                        }


   250BD: A4 00                                            // ..

                    }
                }

   250BF: A5                                               // .

                Else
                {

   250C0: A1 03                                            // ..

                    Return (Zero)
                }
            }


   250C2: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   250C4: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   250CC: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   250D2: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   250DB: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   250E9: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   250F5: A4 01                                            // ..

                        Case
   250F7: A1 13                                            // ..

 (0x75608086)
                        {

   250F9: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   25105: A4 01                                            // ..

                        Default
                        {

   25107: A1 03                                            // ..

                            Return (Zero)
                        }


   25109: A4 00                                            // ..

                    }
                }

   2510B: A5                                               // .

                Else
                {

   2510C: A1 03                                            // ..

                    Return (Zero)
                }
            }


   2510E: A4 00                                            // ..

            If (WIST ())
            {

   25110: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   25117: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   25122: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   25132: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   2513B: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   2513D: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   2514D: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   25155: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   25165: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   2516E: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   2517E: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   25187: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   25197: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP15.PXSX.DCTR */
                        }
                    }
                }


   251A0: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   251A6: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   251AB: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   251AF: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   251BF: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   251C1: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   251CD: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   251CF: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   251DD: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   251DF: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   251ED: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   251EF: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP15.PXSX.SPLX */
                }


   251F9: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   251FE: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   25203: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   25207: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   25217: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   25219: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   25229: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   2522B: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   25235: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   25237: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   25245: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   25247: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   25255: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   25257: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   25263: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   25265: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   25274: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   25276: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   25285: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   25287: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP15.PXSX.WANX */
                }


   25292: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   25297: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   2529C: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   252A0: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   252AB: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   252B7: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   252B9: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   252C7: 88 83                                            // ..

Index (WRDX, One)), One))

   252C9: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP15.PXSX.WRDX */
                }


   252D2: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   252D7: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   252DC: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   252E0: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   252F0: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   252FB: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   25308: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   2530A: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   25318: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   2531A: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   25329: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   2532B: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   2533A: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   2533C: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   2534B: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   2534D: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   2535C: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   2535E: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   2536D: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   2536F: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   2537E: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   25380: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   2538F: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   25391: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   253A0: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   253A2: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   253B1: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   253B3: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP15.PXSX.WRDY */
                }


   253BD: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   253C2: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   253C7: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   253CC: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   253DC: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   253EC: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   253FC: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   2540C: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   25412: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   2541F: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   25421: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   2542F: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   25431: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   25440: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   25442: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   25451: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   25453: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   25462: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   25464: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   25473: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   25475: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   25484: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   25486: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   25495: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   25497: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   254A6: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   254A8: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   254B7: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   254B9: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   254C8: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   254CA: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   254D9: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   254DB: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   254EA: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   254EC: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   254FB: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   254FD: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   2550C: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   2550E: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   2551D: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   2551F: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   2552E: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   25530: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   2553F: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   25541: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   25550: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   25552: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   25561: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   25563: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   25572: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   25574: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   25583: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   25585: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   25594: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   25596: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   255A5: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   255A7: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   255B6: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   255B8: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   255C7: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   255C9: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   255D8: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   255DA: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   255E9: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   255EB: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   255FA: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   255FC: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   2560B: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   2560D: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   2561C: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   2561E: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   2562D: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   2562F: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP15.PXSX.EWRY */
                }


   25639: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   2563E: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   25643: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   25647: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   25657: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   25667: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   25670: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   2567D: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   2567F: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   2568D: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   2568F: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   2569E: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   256A0: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   256AF: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   256B1: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   256C0: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   256C2: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   256D1: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   256D3: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   256E2: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   256E4: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   256F3: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   256F5: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   25704: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   25706: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   25715: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   25717: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   25726: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   25728: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   25737: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   25739: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   25748: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   2574A: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   25759: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   2575B: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   2576A: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   2576C: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   2577B: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   2577D: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   2578C: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   2578E: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   2579D: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   2579F: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP15.PXSX.WGDY */
                }


   257A9: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   257AE: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   257B3: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   257B7: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   257C7: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   257D2: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   257DF: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   257E1: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   257EF: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   257F1: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   25800: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   25802: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   25811: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   25813: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   25822: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   25824: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   25833: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   25835: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   25844: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   25846: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   25855: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   25857: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   25866: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   25868: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   25877: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   25879: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   25888: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   2588A: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP15.PXSX.PPAY */
                }


   25894: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   25899: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   2589E: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   258A2: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   258A8: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   258B4: 88 83                                            // ..

Index (ECKY, One)), One))

   258B6: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP15.PXSX.ECKY */
                }


   258BF: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   258C4: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   258C9: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   258CD: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   258D7: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   258E1: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   258ED: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   258EF: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   258FD: 88 83                                            // ..

Index (SADX, 0x02)), One))

   258FF: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP15.PXSX.SADX */
                }


   25909: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   2590E: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   25913: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   25917: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   2591C: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   25922: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   25927: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   2592D: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP15.PXSX.GPCX */
                }


   25934: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   25939: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   25944: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   25954: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   2595D: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   2595F: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   2596F: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   25977: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   25987: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   25990: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   259A0: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   259A9: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   259B9: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP15.PXSX.DCTR */
                        }
                    }
                }


   259C2: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   259C8: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   259CF: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   259D5: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   259DE: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   259DF: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   259E6: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   259E7: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   259EE: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   259F6: 08 5F 54 5F 31 00                                // ._T_1.


   259FC: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   25A02: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   25A07: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   25A17: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   25A1B: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   25A26: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   25A2E: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   25A37: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   25A3F: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   25A40: 11 03 01 03                                      // ....

                                }


   25A44: A5                                               // .

                                Return (
   25A45: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   25A46: 11 03 01 00                                      // ....

                            Case
   25A4A: A1 0E                                            // ..

 (One)
                            {

   25A4C: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   25A54: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   25A59: A5                                               // .

                    Else
                    {

   25A5A: A1 06                                            // ..

                        Return (
   25A5C: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   25A5D: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP16.PXSX))
    {

   25A61: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   25A71: 52 50 31 36 50 58 53 58 00                       // RP16PXSX.

        Scope (_SB.PCI0.RP16.PXSX)
        {

   25A7A: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   25A8A: 36 50 58 53 58                                   // 6PXSX

            Name (_DSD, 
   25A8F: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   25A94: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   25A97: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   25AA7: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   25AAB: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   25AAE: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   25ABE: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   25AC3: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   25ACD: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   25ADA: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   25AE5: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   25AF5: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   25AF7: 14 49 13 57 49 53 54 08                          // .I.WIST.


   25AFF: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   25B05: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   25B0F: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   25B1E: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   25B2A: A4 01                                            // ..

                        Case
   25B2C: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   25B2F: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   25B3B: A4 01                                            // ..

                        Case
   25B3D: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   25B40: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   25B4C: A4 01                                            // ..

                        Case
   25B4E: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   25B51: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   25B5D: A4 01                                            // ..

                        Case
   25B5F: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   25B62: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   25B6E: A4 01                                            // ..

                        Case
   25B70: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   25B73: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   25B7F: A4 01                                            // ..

                        Case
   25B81: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   25B84: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   25B90: A4 01                                            // ..

                        Case
   25B92: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   25B95: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   25BA1: A4 01                                            // ..

                        Case
   25BA3: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   25BA6: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   25BB2: A4 01                                            // ..

                        Case
   25BB4: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   25BB7: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   25BC3: A4 01                                            // ..

                        Case
   25BC5: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   25BC8: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   25BD4: A4 01                                            // ..

                        Case
   25BD6: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   25BD9: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   25BE5: A4 01                                            // ..

                        Case
   25BE7: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   25BEA: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   25BF6: A4 01                                            // ..

                        Case
   25BF8: A1 33                                            // .3

 (0x24FB8086)
                        {

   25BFA: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   25C06: A4 01                                            // ..

                        Case
   25C08: A1 23                                            // .#

 (0x25268086)
                        {

   25C0A: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   25C16: A4 01                                            // ..

                        Case
   25C18: A1 13                                            // ..

 (0x27238086)
                        {

   25C1A: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   25C26: A4 01                                            // ..

                        Default
                        {

   25C28: A1 03                                            // ..

                            Return (Zero)
                        }


   25C2A: A4 00                                            // ..

                    }
                }

   25C2C: A5                                               // .

                Else
                {

   25C2D: A1 03                                            // ..

                    Return (Zero)
                }
            }


   25C2F: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   25C31: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   25C39: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   25C3F: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   25C48: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   25C56: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   25C62: A4 01                                            // ..

                        Case
   25C64: A1 13                                            // ..

 (0x75608086)
                        {

   25C66: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   25C72: A4 01                                            // ..

                        Default
                        {

   25C74: A1 03                                            // ..

                            Return (Zero)
                        }


   25C76: A4 00                                            // ..

                    }
                }

   25C78: A5                                               // .

                Else
                {

   25C79: A1 03                                            // ..

                    Return (Zero)
                }
            }


   25C7B: A4 00                                            // ..

            If (WIST ())
            {

   25C7D: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   25C84: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   25C8F: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   25C9F: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   25CA8: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   25CAA: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   25CBA: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   25CC2: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   25CD2: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   25CDB: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   25CEB: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   25CF4: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   25D04: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP16.PXSX.DCTR */
                        }
                    }
                }


   25D0D: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   25D13: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   25D18: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   25D1C: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   25D2C: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   25D2E: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   25D3A: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   25D3C: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   25D4A: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   25D4C: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   25D5A: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   25D5C: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP16.PXSX.SPLX */
                }


   25D66: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   25D6B: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   25D70: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   25D74: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   25D84: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   25D86: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   25D96: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   25D98: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   25DA2: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   25DA4: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   25DB2: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   25DB4: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   25DC2: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   25DC4: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   25DD0: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   25DD2: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   25DE1: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   25DE3: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   25DF2: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   25DF4: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP16.PXSX.WANX */
                }


   25DFF: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   25E04: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   25E09: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   25E0D: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   25E18: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   25E24: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   25E26: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   25E34: 88 83                                            // ..

Index (WRDX, One)), One))

   25E36: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP16.PXSX.WRDX */
                }


   25E3F: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   25E44: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   25E49: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   25E4D: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   25E5D: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   25E68: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   25E75: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   25E77: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   25E85: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   25E87: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   25E96: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   25E98: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   25EA7: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   25EA9: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   25EB8: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   25EBA: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   25EC9: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   25ECB: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   25EDA: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   25EDC: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   25EEB: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   25EED: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   25EFC: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   25EFE: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   25F0D: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   25F0F: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   25F1E: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   25F20: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP16.PXSX.WRDY */
                }


   25F2A: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   25F2F: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   25F34: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   25F39: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   25F49: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   25F59: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   25F69: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   25F79: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   25F7F: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   25F8C: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   25F8E: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   25F9C: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   25F9E: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   25FAD: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   25FAF: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   25FBE: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   25FC0: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   25FCF: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   25FD1: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   25FE0: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   25FE2: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   25FF1: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   25FF3: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   26002: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   26004: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   26013: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   26015: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   26024: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   26026: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   26035: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   26037: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   26046: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   26048: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   26057: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   26059: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   26068: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   2606A: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   26079: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   2607B: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   2608A: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   2608C: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   2609B: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   2609D: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   260AC: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   260AE: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   260BD: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   260BF: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   260CE: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   260D0: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   260DF: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   260E1: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   260F0: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   260F2: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   26101: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   26103: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   26112: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   26114: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   26123: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   26125: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   26134: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   26136: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   26145: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   26147: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   26156: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   26158: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   26167: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   26169: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   26178: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   2617A: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   26189: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   2618B: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   2619A: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   2619C: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP16.PXSX.EWRY */
                }


   261A6: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   261AB: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   261B0: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   261B4: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   261C4: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   261D4: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   261DD: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   261EA: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   261EC: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   261FA: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   261FC: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   2620B: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   2620D: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   2621C: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   2621E: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   2622D: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   2622F: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   2623E: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   26240: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   2624F: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   26251: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   26260: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   26262: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   26271: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   26273: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   26282: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   26284: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   26293: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   26295: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   262A4: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   262A6: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   262B5: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   262B7: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   262C6: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   262C8: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   262D7: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   262D9: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   262E8: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   262EA: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   262F9: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   262FB: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   2630A: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   2630C: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP16.PXSX.WGDY */
                }


   26316: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   2631B: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   26320: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   26324: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   26334: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   2633F: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   2634C: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   2634E: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   2635C: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   2635E: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   2636D: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   2636F: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   2637E: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   26380: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   2638F: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   26391: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   263A0: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   263A2: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   263B1: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   263B3: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   263C2: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   263C4: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   263D3: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   263D5: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   263E4: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   263E6: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   263F5: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   263F7: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP16.PXSX.PPAY */
                }


   26401: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   26406: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   2640B: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   2640F: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   26415: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   26421: 88 83                                            // ..

Index (ECKY, One)), One))

   26423: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP16.PXSX.ECKY */
                }


   2642C: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   26431: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   26436: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   2643A: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   26444: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   2644E: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   2645A: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   2645C: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   2646A: 88 83                                            // ..

Index (SADX, 0x02)), One))

   2646C: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP16.PXSX.SADX */
                }


   26476: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   2647B: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   26480: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   26484: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   26489: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   2648F: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   26494: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   2649A: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP16.PXSX.GPCX */
                }


   264A1: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   264A6: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   264B1: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   264C1: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   264CA: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   264CC: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   264DC: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   264E4: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   264F4: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   264FD: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   2650D: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   26516: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   26526: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP16.PXSX.DCTR */
                        }
                    }
                }


   2652F: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   26535: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   2653C: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   26542: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   2654B: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   2654C: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   26553: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   26554: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   2655B: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   26563: 08 5F 54 5F 31 00                                // ._T_1.


   26569: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   2656F: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   26574: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   26584: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   26588: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   26593: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   2659B: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   265A4: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   265AC: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   265AD: 11 03 01 03                                      // ....

                                }


   265B1: A5                                               // .

                                Return (
   265B2: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   265B3: 11 03 01 00                                      // ....

                            Case
   265B7: A1 0E                                            // ..

 (One)
                            {

   265B9: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   265C1: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   265C6: A5                                               // .

                    Else
                    {

   265C7: A1 06                                            // ..

                        Return (
   265C9: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   265CA: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP17.PXSX))
    {

   265CE: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   265DE: 52 50 31 37 50 58 53 58 00                       // RP17PXSX.

        Scope (_SB.PCI0.RP17.PXSX)
        {

   265E7: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   265F7: 37 50 58 53 58                                   // 7PXSX

            Name (_DSD, 
   265FC: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   26601: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   26604: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   26614: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   26618: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   2661B: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   2662B: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   26630: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   2663A: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   26647: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   26652: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   26662: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   26664: 14 49 13 57 49 53 54 08                          // .I.WIST.


   2666C: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   26672: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   2667C: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   2668B: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   26697: A4 01                                            // ..

                        Case
   26699: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   2669C: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   266A8: A4 01                                            // ..

                        Case
   266AA: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   266AD: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   266B9: A4 01                                            // ..

                        Case
   266BB: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   266BE: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   266CA: A4 01                                            // ..

                        Case
   266CC: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   266CF: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   266DB: A4 01                                            // ..

                        Case
   266DD: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   266E0: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   266EC: A4 01                                            // ..

                        Case
   266EE: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   266F1: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   266FD: A4 01                                            // ..

                        Case
   266FF: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   26702: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   2670E: A4 01                                            // ..

                        Case
   26710: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   26713: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   2671F: A4 01                                            // ..

                        Case
   26721: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   26724: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   26730: A4 01                                            // ..

                        Case
   26732: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   26735: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   26741: A4 01                                            // ..

                        Case
   26743: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   26746: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   26752: A4 01                                            // ..

                        Case
   26754: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   26757: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   26763: A4 01                                            // ..

                        Case
   26765: A1 33                                            // .3

 (0x24FB8086)
                        {

   26767: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   26773: A4 01                                            // ..

                        Case
   26775: A1 23                                            // .#

 (0x25268086)
                        {

   26777: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   26783: A4 01                                            // ..

                        Case
   26785: A1 13                                            // ..

 (0x27238086)
                        {

   26787: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   26793: A4 01                                            // ..

                        Default
                        {

   26795: A1 03                                            // ..

                            Return (Zero)
                        }


   26797: A4 00                                            // ..

                    }
                }

   26799: A5                                               // .

                Else
                {

   2679A: A1 03                                            // ..

                    Return (Zero)
                }
            }


   2679C: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   2679E: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   267A6: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   267AC: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   267B5: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   267C3: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   267CF: A4 01                                            // ..

                        Case
   267D1: A1 13                                            // ..

 (0x75608086)
                        {

   267D3: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   267DF: A4 01                                            // ..

                        Default
                        {

   267E1: A1 03                                            // ..

                            Return (Zero)
                        }


   267E3: A4 00                                            // ..

                    }
                }

   267E5: A5                                               // .

                Else
                {

   267E6: A1 03                                            // ..

                    Return (Zero)
                }
            }


   267E8: A4 00                                            // ..

            If (WIST ())
            {

   267EA: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   267F1: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   267FC: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   2680C: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   26815: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   26817: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   26827: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   2682F: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   2683F: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   26848: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   26858: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   26861: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   26871: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP17.PXSX.DCTR */
                        }
                    }
                }


   2687A: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   26880: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   26885: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   26889: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   26899: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   2689B: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   268A7: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   268A9: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   268B7: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   268B9: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   268C7: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   268C9: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP17.PXSX.SPLX */
                }


   268D3: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   268D8: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   268DD: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   268E1: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   268F1: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   268F3: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   26903: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   26905: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   2690F: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   26911: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   2691F: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   26921: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   2692F: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   26931: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   2693D: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   2693F: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   2694E: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   26950: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   2695F: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   26961: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP17.PXSX.WANX */
                }


   2696C: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   26971: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   26976: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   2697A: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   26985: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   26991: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   26993: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   269A1: 88 83                                            // ..

Index (WRDX, One)), One))

   269A3: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP17.PXSX.WRDX */
                }


   269AC: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   269B1: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   269B6: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   269BA: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   269CA: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   269D5: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   269E2: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   269E4: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   269F2: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   269F4: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   26A03: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   26A05: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   26A14: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   26A16: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   26A25: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   26A27: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   26A36: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   26A38: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   26A47: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   26A49: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   26A58: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   26A5A: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   26A69: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   26A6B: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   26A7A: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   26A7C: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   26A8B: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   26A8D: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP17.PXSX.WRDY */
                }


   26A97: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   26A9C: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   26AA1: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   26AA6: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   26AB6: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   26AC6: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   26AD6: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   26AE6: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   26AEC: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   26AF9: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   26AFB: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   26B09: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   26B0B: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   26B1A: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   26B1C: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   26B2B: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   26B2D: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   26B3C: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   26B3E: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   26B4D: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   26B4F: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   26B5E: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   26B60: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   26B6F: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   26B71: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   26B80: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   26B82: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   26B91: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   26B93: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   26BA2: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   26BA4: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   26BB3: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   26BB5: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   26BC4: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   26BC6: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   26BD5: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   26BD7: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   26BE6: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   26BE8: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   26BF7: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   26BF9: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   26C08: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   26C0A: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   26C19: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   26C1B: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   26C2A: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   26C2C: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   26C3B: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   26C3D: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   26C4C: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   26C4E: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   26C5D: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   26C5F: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   26C6E: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   26C70: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   26C7F: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   26C81: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   26C90: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   26C92: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   26CA1: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   26CA3: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   26CB2: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   26CB4: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   26CC3: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   26CC5: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   26CD4: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   26CD6: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   26CE5: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   26CE7: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   26CF6: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   26CF8: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   26D07: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   26D09: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP17.PXSX.EWRY */
                }


   26D13: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   26D18: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   26D1D: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   26D21: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   26D31: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   26D41: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   26D4A: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   26D57: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   26D59: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   26D67: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   26D69: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   26D78: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   26D7A: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   26D89: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   26D8B: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   26D9A: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   26D9C: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   26DAB: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   26DAD: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   26DBC: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   26DBE: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   26DCD: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   26DCF: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   26DDE: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   26DE0: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   26DEF: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   26DF1: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   26E00: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   26E02: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   26E11: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   26E13: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   26E22: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   26E24: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   26E33: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   26E35: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   26E44: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   26E46: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   26E55: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   26E57: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   26E66: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   26E68: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   26E77: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   26E79: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP17.PXSX.WGDY */
                }


   26E83: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   26E88: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   26E8D: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   26E91: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   26EA1: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   26EAC: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   26EB9: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   26EBB: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   26EC9: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   26ECB: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   26EDA: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   26EDC: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   26EEB: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   26EED: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   26EFC: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   26EFE: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   26F0D: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   26F0F: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   26F1E: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   26F20: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   26F2F: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   26F31: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   26F40: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   26F42: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   26F51: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   26F53: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   26F62: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   26F64: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP17.PXSX.PPAY */
                }


   26F6E: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   26F73: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   26F78: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   26F7C: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   26F82: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   26F8E: 88 83                                            // ..

Index (ECKY, One)), One))

   26F90: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP17.PXSX.ECKY */
                }


   26F99: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   26F9E: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   26FA3: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   26FA7: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   26FB1: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   26FBB: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   26FC7: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   26FC9: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   26FD7: 88 83                                            // ..

Index (SADX, 0x02)), One))

   26FD9: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP17.PXSX.SADX */
                }


   26FE3: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   26FE8: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   26FED: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   26FF1: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   26FF6: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   26FFC: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   27001: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   27007: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP17.PXSX.GPCX */
                }


   2700E: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   27013: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   2701E: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   2702E: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   27037: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   27039: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   27049: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   27051: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   27061: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   2706A: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   2707A: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   27083: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   27093: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP17.PXSX.DCTR */
                        }
                    }
                }


   2709C: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   270A2: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   270A9: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   270AF: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   270B8: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   270B9: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   270C0: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   270C1: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   270C8: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   270D0: 08 5F 54 5F 31 00                                // ._T_1.


   270D6: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   270DC: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   270E1: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   270F1: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   270F5: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   27100: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   27108: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   27111: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   27119: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   2711A: 11 03 01 03                                      // ....

                                }


   2711E: A5                                               // .

                                Return (
   2711F: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   27120: 11 03 01 00                                      // ....

                            Case
   27124: A1 0E                                            // ..

 (One)
                            {

   27126: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   2712E: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   27133: A5                                               // .

                    Else
                    {

   27134: A1 06                                            // ..

                        Return (
   27136: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   27137: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP18.PXSX))
    {

   2713B: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   2714B: 52 50 31 38 50 58 53 58 00                       // RP18PXSX.

        Scope (_SB.PCI0.RP18.PXSX)
        {

   27154: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   27164: 38 50 58 53 58                                   // 8PXSX

            Name (_DSD, 
   27169: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   2716E: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   27171: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   27181: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   27185: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   27188: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   27198: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   2719D: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   271A7: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   271B4: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   271BF: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   271CF: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   271D1: 14 49 13 57 49 53 54 08                          // .I.WIST.


   271D9: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   271DF: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   271E9: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   271F8: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   27204: A4 01                                            // ..

                        Case
   27206: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   27209: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   27215: A4 01                                            // ..

                        Case
   27217: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   2721A: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   27226: A4 01                                            // ..

                        Case
   27228: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   2722B: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   27237: A4 01                                            // ..

                        Case
   27239: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   2723C: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   27248: A4 01                                            // ..

                        Case
   2724A: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   2724D: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   27259: A4 01                                            // ..

                        Case
   2725B: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   2725E: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   2726A: A4 01                                            // ..

                        Case
   2726C: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   2726F: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   2727B: A4 01                                            // ..

                        Case
   2727D: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   27280: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   2728C: A4 01                                            // ..

                        Case
   2728E: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   27291: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   2729D: A4 01                                            // ..

                        Case
   2729F: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   272A2: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   272AE: A4 01                                            // ..

                        Case
   272B0: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   272B3: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   272BF: A4 01                                            // ..

                        Case
   272C1: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   272C4: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   272D0: A4 01                                            // ..

                        Case
   272D2: A1 33                                            // .3

 (0x24FB8086)
                        {

   272D4: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   272E0: A4 01                                            // ..

                        Case
   272E2: A1 23                                            // .#

 (0x25268086)
                        {

   272E4: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   272F0: A4 01                                            // ..

                        Case
   272F2: A1 13                                            // ..

 (0x27238086)
                        {

   272F4: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   27300: A4 01                                            // ..

                        Default
                        {

   27302: A1 03                                            // ..

                            Return (Zero)
                        }


   27304: A4 00                                            // ..

                    }
                }

   27306: A5                                               // .

                Else
                {

   27307: A1 03                                            // ..

                    Return (Zero)
                }
            }


   27309: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   2730B: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   27313: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   27319: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   27322: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   27330: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   2733C: A4 01                                            // ..

                        Case
   2733E: A1 13                                            // ..

 (0x75608086)
                        {

   27340: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   2734C: A4 01                                            // ..

                        Default
                        {

   2734E: A1 03                                            // ..

                            Return (Zero)
                        }


   27350: A4 00                                            // ..

                    }
                }

   27352: A5                                               // .

                Else
                {

   27353: A1 03                                            // ..

                    Return (Zero)
                }
            }


   27355: A4 00                                            // ..

            If (WIST ())
            {

   27357: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   2735E: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   27369: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   27379: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   27382: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   27384: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   27394: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   2739C: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   273AC: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   273B5: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   273C5: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   273CE: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   273DE: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP18.PXSX.DCTR */
                        }
                    }
                }


   273E7: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   273ED: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   273F2: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   273F6: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   27406: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   27408: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   27414: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   27416: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   27424: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   27426: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   27434: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   27436: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP18.PXSX.SPLX */
                }


   27440: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   27445: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   2744A: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   2744E: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   2745E: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   27460: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   27470: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   27472: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   2747C: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   2747E: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   2748C: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   2748E: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   2749C: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   2749E: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   274AA: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   274AC: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   274BB: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   274BD: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   274CC: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   274CE: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP18.PXSX.WANX */
                }


   274D9: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   274DE: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   274E3: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   274E7: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   274F2: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   274FE: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   27500: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   2750E: 88 83                                            // ..

Index (WRDX, One)), One))

   27510: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP18.PXSX.WRDX */
                }


   27519: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   2751E: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   27523: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   27527: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   27537: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   27542: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   2754F: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   27551: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   2755F: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   27561: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   27570: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   27572: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   27581: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   27583: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   27592: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   27594: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   275A3: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   275A5: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   275B4: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   275B6: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   275C5: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   275C7: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   275D6: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   275D8: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   275E7: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   275E9: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   275F8: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   275FA: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP18.PXSX.WRDY */
                }


   27604: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   27609: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   2760E: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   27613: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   27623: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   27633: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   27643: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   27653: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   27659: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   27666: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   27668: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   27676: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   27678: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   27687: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   27689: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   27698: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   2769A: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   276A9: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   276AB: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   276BA: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   276BC: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   276CB: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   276CD: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   276DC: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   276DE: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   276ED: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   276EF: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   276FE: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   27700: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   2770F: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   27711: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   27720: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   27722: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   27731: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   27733: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   27742: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   27744: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   27753: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   27755: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   27764: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   27766: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   27775: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   27777: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   27786: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   27788: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   27797: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   27799: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   277A8: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   277AA: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   277B9: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   277BB: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   277CA: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   277CC: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   277DB: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   277DD: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   277EC: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   277EE: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   277FD: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   277FF: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   2780E: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   27810: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   2781F: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   27821: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   27830: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   27832: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   27841: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   27843: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   27852: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   27854: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   27863: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   27865: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   27874: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   27876: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP18.PXSX.EWRY */
                }


   27880: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   27885: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   2788A: 12 2C 02 00                                      // .,..

                    Package (0x13)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   2788E: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   2789E: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   278AE: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   278B7: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   278C4: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   278C6: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   278D4: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   278D6: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   278E5: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   278E7: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   278F6: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   278F8: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   27907: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   27909: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   27918: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   2791A: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   27929: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   2792B: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   2793A: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   2793C: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   2794B: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   2794D: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   2795C: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   2795E: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   2796D: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   2796F: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   2797E: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   27980: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   2798F: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   27991: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   279A0: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   279A2: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   279B1: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   279B3: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   279C2: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   279C4: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   279D3: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   279D5: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   279E4: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   279E6: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP18.PXSX.WGDY */
                }


   279F0: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   279F5: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   279FA: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   279FE: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   27A0E: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   27A19: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   27A26: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   27A28: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   27A36: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   27A38: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   27A47: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   27A49: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   27A58: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   27A5A: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   27A69: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   27A6B: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   27A7A: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   27A7C: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   27A8B: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   27A8D: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   27A9C: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   27A9E: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   27AAD: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   27AAF: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   27ABE: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   27AC0: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   27ACF: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   27AD1: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP18.PXSX.PPAY */
                }


   27ADB: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   27AE0: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   27AE5: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   27AE9: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   27AEF: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   27AFB: 88 83                                            // ..

Index (ECKY, One)), One))

   27AFD: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP18.PXSX.ECKY */
                }


   27B06: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   27B0B: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   27B10: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   27B14: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   27B1E: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   27B28: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   27B34: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   27B36: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   27B44: 88 83                                            // ..

Index (SADX, 0x02)), One))

   27B46: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP18.PXSX.SADX */
                }


   27B50: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   27B55: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   27B5A: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   27B5E: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   27B63: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   27B69: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   27B6E: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   27B74: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP18.PXSX.GPCX */
                }


   27B7B: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   27B80: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   27B8B: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   27B9B: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   27BA4: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   27BA6: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   27BB6: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   27BBE: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   27BCE: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   27BD7: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   27BE7: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   27BF0: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   27C00: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP18.PXSX.DCTR */
                        }
                    }
                }


   27C09: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   27C0F: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   27C16: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   27C1C: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   27C25: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   27C26: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   27C2D: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   27C2E: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   27C35: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   27C3D: 08 5F 54 5F 31 00                                // ._T_1.


   27C43: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   27C49: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   27C4E: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   27C5E: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   27C62: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   27C6D: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   27C75: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   27C7E: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   27C86: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   27C87: 11 03 01 03                                      // ....

                                }


   27C8B: A5                                               // .

                                Return (
   27C8C: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   27C8D: 11 03 01 00                                      // ....

                            Case
   27C91: A1 0E                                            // ..

 (One)
                            {

   27C93: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   27C9B: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   27CA0: A5                                               // .

                    Else
                    {

   27CA1: A1 06                                            // ..

                        Return (
   27CA3: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   27CA4: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP19.PXSX))
    {

   27CA8: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   27CB8: 52 50 31 39 50 58 53 58 00                       // RP19PXSX.

        Scope (_SB.PCI0.RP19.PXSX)
        {

   27CC1: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // .C./._SB_PCI0RP1
   27CD1: 39 50 58 53 58                                   // 9PXSX

            Name (_DSD, 
   27CD6: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   27CDB: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   27CDE: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   27CEE: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   27CF2: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   27CF5: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   27D05: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   27D0A: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   27D14: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   27D21: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   27D2C: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   27D3C: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   27D3E: 14 49 13 57 49 53 54 08                          // .I.WIST.


   27D46: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   27D4C: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   27D56: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   27D65: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   27D71: A4 01                                            // ..

                        Case
   27D73: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   27D76: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   27D82: A4 01                                            // ..

                        Case
   27D84: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   27D87: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   27D93: A4 01                                            // ..

                        Case
   27D95: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   27D98: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   27DA4: A4 01                                            // ..

                        Case
   27DA6: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   27DA9: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   27DB5: A4 01                                            // ..

                        Case
   27DB7: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   27DBA: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   27DC6: A4 01                                            // ..

                        Case
   27DC8: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   27DCB: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   27DD7: A4 01                                            // ..

                        Case
   27DD9: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   27DDC: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   27DE8: A4 01                                            // ..

                        Case
   27DEA: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   27DED: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   27DF9: A4 01                                            // ..

                        Case
   27DFB: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   27DFE: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   27E0A: A4 01                                            // ..

                        Case
   27E0C: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   27E0F: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   27E1B: A4 01                                            // ..

                        Case
   27E1D: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   27E20: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   27E2C: A4 01                                            // ..

                        Case
   27E2E: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   27E31: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   27E3D: A4 01                                            // ..

                        Case
   27E3F: A1 33                                            // .3

 (0x24FB8086)
                        {

   27E41: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   27E4D: A4 01                                            // ..

                        Case
   27E4F: A1 23                                            // .#

 (0x25268086)
                        {

   27E51: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   27E5D: A4 01                                            // ..

                        Case
   27E5F: A1 13                                            // ..

 (0x27238086)
                        {

   27E61: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   27E6D: A4 01                                            // ..

                        Default
                        {

   27E6F: A1 03                                            // ..

                            Return (Zero)
                        }


   27E71: A4 00                                            // ..

                    }
                }

   27E73: A5                                               // .

                Else
                {

   27E74: A1 03                                            // ..

                    Return (Zero)
                }
            }


   27E76: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   27E78: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   27E80: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   27E86: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   27E8F: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   27E9D: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   27EA9: A4 01                                            // ..

                        Case
   27EAB: A1 13                                            // ..

 (0x75608086)
                        {

   27EAD: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   27EB9: A4 01                                            // ..

                        Default
                        {

   27EBB: A1 03                                            // ..

                            Return (Zero)
                        }


   27EBD: A4 00                                            // ..

                    }
                }

   27EBF: A5                                               // .

                Else
                {

   27EC0: A1 03                                            // ..

                    Return (Zero)
                }
            }


   27EC2: A4 00                                            // ..

            If (WIST ())
            {

   27EC4: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   27ECB: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   27ED6: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   27EE6: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   27EEF: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   27EF1: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   27F01: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   27F09: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   27F19: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   27F22: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   27F32: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   27F3B: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   27F4B: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP19.PXSX.DCTR */
                        }
                    }
                }


   27F54: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   27F5A: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   27F5F: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   27F63: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   27F73: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   27F75: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   27F81: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   27F83: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   27F91: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   27F93: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   27FA1: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   27FA3: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP19.PXSX.SPLX */
                }


   27FAD: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   27FB2: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   27FB7: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   27FBB: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   27FCB: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   27FCD: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   27FDD: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   27FDF: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   27FE9: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   27FEB: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   27FF9: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   27FFB: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   28009: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   2800B: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   28017: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   28019: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   28028: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   2802A: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   28039: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   2803B: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP19.PXSX.WANX */
                }


   28046: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   2804B: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   28050: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   28054: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   2805F: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   2806B: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   2806D: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   2807B: 88 83                                            // ..

Index (WRDX, One)), One))

   2807D: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP19.PXSX.WRDX */
                }


   28086: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   2808B: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   28090: 12 1E 02 00                                      // ....

                    Package (0x0C)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   28094: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   280A4: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   280AF: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   280BC: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   280BE: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   280CC: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   280CE: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   280DD: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   280DF: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   280EE: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   280F0: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   280FF: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   28101: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   28110: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   28112: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   28121: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   28123: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   28132: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   28134: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   28143: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   28145: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   28154: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   28156: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   28165: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   28167: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP19.PXSX.WRDY */
                }


   28171: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   28176: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   2817B: 12 4A 04 02 00                                   // .J...

                    Package (0x21)
                    {
                        0x07, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80, 
                        0x80
                    }
                })

   28180: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   28190: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   281A0: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   281B0: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   281C0: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   281C6: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   281D3: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   281D5: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   281E3: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   281E5: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   281F4: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   281F6: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   28205: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   28207: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   28216: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   28218: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   28227: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   28229: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   28238: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   2823A: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   28249: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   2824B: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   2825A: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   2825C: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   2826B: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   2826D: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   2827C: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   2827E: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   2828D: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   2828F: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   2829E: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   282A0: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   282AF: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   282B1: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   282C0: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   282C2: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   282D1: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   282D3: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   282E2: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   282E4: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   282F3: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   282F5: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   28304: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   28306: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   28315: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   28317: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   28326: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   28328: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   28337: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   28339: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   28348: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   2834A: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   28359: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   2835B: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   2836A: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
