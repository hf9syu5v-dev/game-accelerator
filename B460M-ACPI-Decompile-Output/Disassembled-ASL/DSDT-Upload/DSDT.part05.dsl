                            })
                        }

   34793: 11 03 01 03                                      // ....

                        Else
                        {

   34797: A1 06                                            // ..

                            Return (
   34799: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   3479A: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   3479E: A0 44 0E 93 6A 01                                // .D..j.

                        Name (BUF, 
   347A4: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                        Store (L0M0, 
   347A9: 11 03 0A 10 70 4C 30 4D 30                       // ....pL0M0

Index (BUF, Zero))
                        Store (L0M1, 
   347B2: 88 42 55 46 5F 00 00 70 4C 30 4D 31              // .BUF_..pL0M1

Index (BUF, One))
                        Store (L0M2, 
   347BE: 88 42 55 46 5F 01 00 70 4C 30 4D 32              // .BUF_..pL0M2

Index (BUF, 0x02))
                        Store (L0M3, 
   347CA: 88 42 55 46 5F 0A 02 00 70 4C 30 4D 33           // .BUF_...pL0M3

Index (BUF, 0x03))
                        Store (L0M4, 
   347D7: 88 42 55 46 5F 0A 03 00 70 4C 30 4D 34           // .BUF_...pL0M4

Index (BUF, 0x04))
                        Store (L0M5, 
   347E4: 88 42 55 46 5F 0A 04 00 70 4C 30 4D 35           // .BUF_...pL0M5

Index (BUF, 0x05))
                        Store (L0M6, 
   347F1: 88 42 55 46 5F 0A 05 00 70 4C 30 4D 36           // .BUF_...pL0M6

Index (BUF, 0x06))
                        Store (L0M7, 
   347FE: 88 42 55 46 5F 0A 06 00 70 4C 30 4D 37           // .BUF_...pL0M7

Index (BUF, 0x07))
                        Store (L0M8, 
   3480B: 88 42 55 46 5F 0A 07 00 70 4C 30 4D 38           // .BUF_...pL0M8

Index (BUF, 0x08))
                        Store (L0M9, 
   34818: 88 42 55 46 5F 0A 08 00 70 4C 30 4D 39           // .BUF_...pL0M9

Index (BUF, 0x09))
                        Store (L0MA, 
   34825: 88 42 55 46 5F 0A 09 00 70 4C 30 4D 41           // .BUF_...pL0MA

Index (BUF, 0x0A))
                        Store (L0MB, 
   34832: 88 42 55 46 5F 0A 0A 00 70 4C 30 4D 42           // .BUF_...pL0MB

Index (BUF, 0x0B))
                        Store (L0MC, 
   3483F: 88 42 55 46 5F 0A 0B 00 70 4C 30 4D 43           // .BUF_...pL0MC

Index (BUF, 0x0C))
                        Store (L0MD, 
   3484C: 88 42 55 46 5F 0A 0C 00 70 4C 30 4D 44           // .BUF_...pL0MD

Index (BUF, 0x0D))
                        Store (L0ME, 
   34859: 88 42 55 46 5F 0A 0D 00 70 4C 30 4D 45           // .BUF_...pL0ME

Index (BUF, 0x0E))
                        Store (L0MF, 
   34866: 88 42 55 46 5F 0A 0E 00 70 4C 30 4D 46           // .BUF_...pL0MF

Index (BUF, 0x0F))

   34873: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                        Return (
   3487B: A4                                               // .

ToString (BUF, Ones))
                    }
                }


   3487C: 9C 42 55 46 5F FF 00                             // .BUF_..

                If (LEqual (Arg0, 
   34883: A0 46 1E 93 68                                   // .F..h

ToUUID ("5815c5c8-c47d-477b-9a8d-76173176414b") /* Unknown UUID */))
                {

   34888: 11 13 0A 10 C8 C5 15 58 7D C4 7B 47 9A 8D 76 17  // .......X}.{G..v.
   34898: 31 76 41 4B                                      // 1vAK

                    If (LEqual (Arg2, Zero))
                    {

   3489C: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   348A1: A0 09 93 69 00                                   // ...i.

                            Return (
   348A6: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   348A7: 11 03 01 03                                      // ....

                        Else
                        {

   348AB: A1 06                                            // ..

                            Return (
   348AD: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   348AE: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   348B2: A0 42 1B 93 6A 01                                // .B..j.

                        Name (DSMB, 
   348B8: 08 44 53 4D 42                                   // .DSMB

Buffer (0x34){})

   348BD: 11 03 0A 34                                      // ...4

                        CreateDWordField (DSMB, Zero, I2CC)

   348C1: 8A 44 53 4D 42 00 49 32 43 43                    // .DSMB.I2CC

                        CreateDWordField (DSMB, 0x04, DEV0)

   348CB: 8A 44 53 4D 42 0A 04 44 45 56 30                 // .DSMB..DEV0

                        CreateDWordField (DSMB, 0x08, DEV1)

   348D6: 8A 44 53 4D 42 0A 08 44 45 56 31                 // .DSMB..DEV1

                        CreateDWordField (DSMB, 0x0C, DEV2)

   348E1: 8A 44 53 4D 42 0A 0C 44 45 56 32                 // .DSMB..DEV2

                        CreateDWordField (DSMB, 0x10, DEV3)

   348EC: 8A 44 53 4D 42 0A 10 44 45 56 33                 // .DSMB..DEV3

                        CreateDWordField (DSMB, 0x14, DEV4)

   348F7: 8A 44 53 4D 42 0A 14 44 45 56 34                 // .DSMB..DEV4

                        CreateDWordField (DSMB, 0x18, DEV5)

   34902: 8A 44 53 4D 42 0A 18 44 45 56 35                 // .DSMB..DEV5

                        CreateDWordField (DSMB, 0x1C, DEV6)

   3490D: 8A 44 53 4D 42 0A 1C 44 45 56 36                 // .DSMB..DEV6

                        CreateDWordField (DSMB, 0x20, DEV7)

   34918: 8A 44 53 4D 42 0A 20 44 45 56 37                 // .DSMB. DEV7

                        CreateDWordField (DSMB, 0x24, DEV8)

   34923: 8A 44 53 4D 42 0A 24 44 45 56 38                 // .DSMB.$DEV8

                        CreateDWordField (DSMB, 0x28, DEV9)

   3492E: 8A 44 53 4D 42 0A 28 44 45 56 39                 // .DSMB.(DEV9

                        CreateDWordField (DSMB, 0x2C, DEVA)

   34939: 8A 44 53 4D 42 0A 2C 44 45 56 41                 // .DSMB.,DEVA

                        CreateDWordField (DSMB, 0x30, DEVB)
                        Store (L0DI, I2CC) /* \_SB_.PCI0.LNK0._DSM.I2CC */
                        Store (DSMI (L0D0, L0A0, Zero, L0BS), DEV0) /* \_SB_.PCI0.LNK0._DSM.DEV0 */
                        Store (DSMI (L0D1, L0A1, Zero, L0BS), DEV1) /* \_SB_.PCI0.LNK0._DSM.DEV1 */
                        Store (DSMI (L0D2, L0A2, Zero, L0BS), DEV2) /* \_SB_.PCI0.LNK0._DSM.DEV2 */
                        Store (DSMI (L0D3, L0A3, Zero, L0BS), DEV3) /* \_SB_.PCI0.LNK0._DSM.DEV3 */
                        Store (DSMI (L0D4, L0A4, Zero, L0BS), DEV4) /* \_SB_.PCI0.LNK0._DSM.DEV4 */
                        Store (DSMI (L0D5, L0A5, Zero, L0BS), DEV5) /* \_SB_.PCI0.LNK0._DSM.DEV5 */
                        Store (DSMI (L0D6, L0A6, Zero, L0BS), DEV6) /* \_SB_.PCI0.LNK0._DSM.DEV6 */
                        Store (DSMI (L0D7, L0A7, Zero, L0BS), DEV7) /* \_SB_.PCI0.LNK0._DSM.DEV7 */
                        Store (DSMI (L0D8, L0A8, Zero, L0BS), DEV8) /* \_SB_.PCI0.LNK0._DSM.DEV8 */
                        Store (DSMI (L0D9, L0A9, Zero, L0BS), DEV9) /* \_SB_.PCI0.LNK0._DSM.DEV9 */
                        Store (DSMI (L0DA, L0AA, Zero, L0BS), DEVA) /* \_SB_.PCI0.LNK0._DSM.DEVA */
                        Store (DSMI (L0DB, L0AB, Zero, L0BS), DEVB) /* \_SB_.PCI0.LNK0._DSM.DEVB */

   34944: 8A 44 53 4D 42 0A 30 44 45 56 42 70 4C 30 44 49  // .DSMB.0DEVBpL0DI
   34954: 49 32 43 43 70 44 53 4D 49 4C 30 44 30 4C 30 41  // I2CCpDSMIL0D0L0A
   34964: 30 00 4C 30 42 53 44 45 56 30 70 44 53 4D 49 4C  // 0.L0BSDEV0pDSMIL
   34974: 30 44 31 4C 30 41 31 00 4C 30 42 53 44 45 56 31  // 0D1L0A1.L0BSDEV1
   34984: 70 44 53 4D 49 4C 30 44 32 4C 30 41 32 00 4C 30  // pDSMIL0D2L0A2.L0
   34994: 42 53 44 45 56 32 70 44 53 4D 49 4C 30 44 33 4C  // BSDEV2pDSMIL0D3L
   349A4: 30 41 33 00 4C 30 42 53 44 45 56 33 70 44 53 4D  // 0A3.L0BSDEV3pDSM
   349B4: 49 4C 30 44 34 4C 30 41 34 00 4C 30 42 53 44 45  // IL0D4L0A4.L0BSDE
   349C4: 56 34 70 44 53 4D 49 4C 30 44 35 4C 30 41 35 00  // V4pDSMIL0D5L0A5.
   349D4: 4C 30 42 53 44 45 56 35 70 44 53 4D 49 4C 30 44  // L0BSDEV5pDSMIL0D
   349E4: 36 4C 30 41 36 00 4C 30 42 53 44 45 56 36 70 44  // 6L0A6.L0BSDEV6pD
   349F4: 53 4D 49 4C 30 44 37 4C 30 41 37 00 4C 30 42 53  // SMIL0D7L0A7.L0BS
   34A04: 44 45 56 37 70 44 53 4D 49 4C 30 44 38 4C 30 41  // DEV7pDSMIL0D8L0A
   34A14: 38 00 4C 30 42 53 44 45 56 38 70 44 53 4D 49 4C  // 8.L0BSDEV8pDSMIL
   34A24: 30 44 39 4C 30 41 39 00 4C 30 42 53 44 45 56 39  // 0D9L0A9.L0BSDEV9
   34A34: 70 44 53 4D 49 4C 30 44 41 4C 30 41 41 00 4C 30  // pDSMIL0DAL0AA.L0
   34A44: 42 53 44 45 56 41 70 44 53 4D 49 4C 30 44 42 4C  // BSDEVApDSMIL0DBL
   34A54: 30 41 42 00 4C 30 42 53 44 45 56 42              // 0AB.L0BSDEVB

                        Return (DSMB) /* \_SB_.PCI0.LNK0._DSM.DSMB */
                    }


   34A60: A4 44 53 4D 42                                   // .DSMB

                    Return (
   34A65: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   34A66: 11 03 01 00                                      // ....

                If (LEqual (Arg0, 
   34A6A: A0 48 1E 93 68                                   // .H..h

ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881") /* Unknown UUID */))
                {

   34A6F: 11 13 0A 10 49 75 25 26 71 92 A4 4C BB 43 C4 89  // ....Iu%&q..L.C..
   34A7F: 9D 5A 48 81                                      // .ZH.

                    If (LEqual (Arg2, Zero))
                    {

   34A83: A0 0B 93 6A 00                                   // ...j.

                        Return (
   34A88: A4                                               // .

Buffer (0x02)
                        {
                             0xFF, 0x1F                                       // ..
                        })
                    }


   34A89: 11 05 0A 02 FF 1F                                // ......

                    If (LEqual (Arg2, One))
                    {

   34A8F: A0 09 93 6A 01                                   // ...j.

                        Return (L0DI) /* \L0DI */
                    }


   34A94: A4 4C 30 44 49                                   // .L0DI

                    If (LEqual (Arg2, 0x02))
                    {

   34A99: A0 23 93 6A 0A 02                                // .#.j..

                        If (LGreater (L0DI, Zero))
                        {

   34A9F: A0 19 94 4C 30 44 49 00                          // ...L0DI.

                            Return (DSMI (L0D0, L0A0, Zero, L0BS))
                        }

   34AA7: A4 44 53 4D 49 4C 30 44 30 4C 30 41 30 00 4C 30  // .DSMIL0D0L0A0.L0
   34AB7: 42 53                                            // BS

                        Else
                        {

   34AB9: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34ABB: A4 00                                            // ..

                    If (LEqual (Arg2, 0x03))
                    {

   34ABD: A0 23 93 6A 0A 03                                // .#.j..

                        If (LGreater (L0DI, One))
                        {

   34AC3: A0 19 94 4C 30 44 49 01                          // ...L0DI.

                            Return (DSMI (L0D1, L0A1, Zero, L0BS))
                        }

   34ACB: A4 44 53 4D 49 4C 30 44 31 4C 30 41 31 00 4C 30  // .DSMIL0D1L0A1.L0
   34ADB: 42 53                                            // BS

                        Else
                        {

   34ADD: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34ADF: A4 00                                            // ..

                    If (LEqual (Arg2, 0x04))
                    {

   34AE1: A0 24 93 6A 0A 04                                // .$.j..

                        If (LGreater (L0DI, 0x02))
                        {

   34AE7: A0 1A 94 4C 30 44 49 0A 02                       // ...L0DI..

                            Return (DSMI (L0D2, L0A2, Zero, L0BS))
                        }

   34AF0: A4 44 53 4D 49 4C 30 44 32 4C 30 41 32 00 4C 30  // .DSMIL0D2L0A2.L0
   34B00: 42 53                                            // BS

                        Else
                        {

   34B02: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34B04: A4 00                                            // ..

                    If (LEqual (Arg2, 0x05))
                    {

   34B06: A0 24 93 6A 0A 05                                // .$.j..

                        If (LGreater (L0DI, 0x03))
                        {

   34B0C: A0 1A 94 4C 30 44 49 0A 03                       // ...L0DI..

                            Return (DSMI (L0D3, L0A3, Zero, L0BS))
                        }

   34B15: A4 44 53 4D 49 4C 30 44 33 4C 30 41 33 00 4C 30  // .DSMIL0D3L0A3.L0
   34B25: 42 53                                            // BS

                        Else
                        {

   34B27: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34B29: A4 00                                            // ..

                    If (LEqual (Arg2, 0x06))
                    {

   34B2B: A0 24 93 6A 0A 06                                // .$.j..

                        If (LGreater (L0DI, 0x04))
                        {

   34B31: A0 1A 94 4C 30 44 49 0A 04                       // ...L0DI..

                            Return (DSMI (L0D4, L0A4, Zero, L0BS))
                        }

   34B3A: A4 44 53 4D 49 4C 30 44 34 4C 30 41 34 00 4C 30  // .DSMIL0D4L0A4.L0
   34B4A: 42 53                                            // BS

                        Else
                        {

   34B4C: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34B4E: A4 00                                            // ..

                    If (LEqual (Arg2, 0x07))
                    {

   34B50: A0 24 93 6A 0A 07                                // .$.j..

                        If (LGreater (L0DI, 0x05))
                        {

   34B56: A0 1A 94 4C 30 44 49 0A 05                       // ...L0DI..

                            Return (DSMI (L0D5, L0A5, Zero, L0BS))
                        }

   34B5F: A4 44 53 4D 49 4C 30 44 35 4C 30 41 35 00 4C 30  // .DSMIL0D5L0A5.L0
   34B6F: 42 53                                            // BS

                        Else
                        {

   34B71: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34B73: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   34B75: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L0DI, 0x06))
                        {

   34B7B: A0 1A 94 4C 30 44 49 0A 06                       // ...L0DI..

                            Return (DSMI (L0D6, L0A6, Zero, L0BS))
                        }

   34B84: A4 44 53 4D 49 4C 30 44 36 4C 30 41 36 00 4C 30  // .DSMIL0D6L0A6.L0
   34B94: 42 53                                            // BS

                        Else
                        {

   34B96: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34B98: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   34B9A: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L0DI, 0x07))
                        {

   34BA0: A0 1A 94 4C 30 44 49 0A 07                       // ...L0DI..

                            Return (DSMI (L0D7, L0A7, Zero, L0BS))
                        }

   34BA9: A4 44 53 4D 49 4C 30 44 37 4C 30 41 37 00 4C 30  // .DSMIL0D7L0A7.L0
   34BB9: 42 53                                            // BS

                        Else
                        {

   34BBB: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34BBD: A4 00                                            // ..

                    If (LEqual (Arg2, 0x09))
                    {

   34BBF: A0 24 93 6A 0A 09                                // .$.j..

                        If (LGreater (L0DI, 0x08))
                        {

   34BC5: A0 1A 94 4C 30 44 49 0A 08                       // ...L0DI..

                            Return (DSMI (L0D8, L0A8, Zero, L0BS))
                        }

   34BCE: A4 44 53 4D 49 4C 30 44 38 4C 30 41 38 00 4C 30  // .DSMIL0D8L0A8.L0
   34BDE: 42 53                                            // BS

                        Else
                        {

   34BE0: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34BE2: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0A))
                    {

   34BE4: A0 24 93 6A 0A 0A                                // .$.j..

                        If (LGreater (L0DI, 0x09))
                        {

   34BEA: A0 1A 94 4C 30 44 49 0A 09                       // ...L0DI..

                            Return (DSMI (L0D9, L0A9, Zero, L0BS))
                        }

   34BF3: A4 44 53 4D 49 4C 30 44 39 4C 30 41 39 00 4C 30  // .DSMIL0D9L0A9.L0
   34C03: 42 53                                            // BS

                        Else
                        {

   34C05: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34C07: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0B))
                    {

   34C09: A0 24 93 6A 0A 0B                                // .$.j..

                        If (LGreater (L0DI, 0x0A))
                        {

   34C0F: A0 1A 94 4C 30 44 49 0A 0A                       // ...L0DI..

                            Return (DSMI (L0DA, L0AA, Zero, L0BS))
                        }

   34C18: A4 44 53 4D 49 4C 30 44 41 4C 30 41 41 00 4C 30  // .DSMIL0DAL0AA.L0
   34C28: 42 53                                            // BS

                        Else
                        {

   34C2A: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   34C2C: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0C))
                    {

   34C2E: A0 24 93 6A 0A 0C                                // .$.j..

                        If (LGreater (L0DI, 0x0B))
                        {

   34C34: A0 1A 94 4C 30 44 49 0A 0B                       // ...L0DI..

                            Return (DSMI (L0DB, L0AB, Zero, L0BS))
                        }

   34C3D: A4 44 53 4D 49 4C 30 44 42 4C 30 41 42 00 4C 30  // .DSMIL0DBL0AB.L0
   34C4D: 42 53                                            // BS

                        Else
                        {

   34C4F: A1 03                                            // ..

                            Return (Zero)
                        }
                    }
                }


   34C51: A4 00                                            // ..

                Return (
   34C53: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }


   34C54: 11 03 01 00                                      // ....

        Device (LNK1)
        {

   34C58: 5B 82 4B 97 4C 4E 4B 31                          // [.K.LNK1

            Name (_ADR, Zero)  // _ADR: Address

   34C60: 08 5F 41 44 52 00                                // ._ADR.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   34C66: 14 13 5F 53 54 41 00                             // .._STA.

                If (L1EN)
                {

   34C6D: A0 08 4C 31 45 4E                                // ..L1EN

                    Return (0x0F)
                }

   34C73: A4 0A 0F                                         // ...

                Else
                {

   34C76: A1 03                                            // ..

                    Return (Zero)
                }
            }


   34C78: A4 00                                            // ..

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {

   34C7A: 14 1F 5F 44 45 50 00                             // .._DEP.

                If (L1EN)
                {

   34C81: A0 0E 4C 31 45 4E                                // ..L1EN

                    Return (CDEP (L1CL))
                }

   34C87: A4 43 44 45 50 4C 31 43 4C                       // .CDEPL1CL

                Else
                {

   34C90: A1 09                                            // ..

                    Return (
   34C92: A4                                               // .

Package (0x01)
                    {
                        PCI0, 
                    })
                }
            }


   34C93: 12 06 01 50 43 49 30                             // ...PCI0

            Name (_UID, One)  // _UID: Unique ID

   34C9A: 08 5F 55 49 44 01                                // ._UID.

            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {

   34CA0: 14 0C 5F 48 49 44 00                             // .._HID.

                Return (HCID (One))
            }


   34CA7: A4 48 43 49 44 01                                // .HCID.

            Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
            {

   34CAD: 14 0C 5F 43 49 44 00                             // .._CID.

                Return (HCID (One))
            }


   34CB4: A4 48 43 49 44 01                                // .HCID.

            Method (_DDN, 0, NotSerialized)  // _DDN: DOS Device Name
            {

   34CBA: 14 46 0E 5F 44 44 4E 00                          // .F._DDN.

                Name (BUF, 
   34CC2: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                Store (L1M0, 
   34CC7: 11 03 0A 10 70 4C 31 4D 30                       // ....pL1M0

Index (BUF, Zero))
                Store (L1M1, 
   34CD0: 88 42 55 46 5F 00 00 70 4C 31 4D 31              // .BUF_..pL1M1

Index (BUF, One))
                Store (L1M2, 
   34CDC: 88 42 55 46 5F 01 00 70 4C 31 4D 32              // .BUF_..pL1M2

Index (BUF, 0x02))
                Store (L1M3, 
   34CE8: 88 42 55 46 5F 0A 02 00 70 4C 31 4D 33           // .BUF_...pL1M3

Index (BUF, 0x03))
                Store (L1M4, 
   34CF5: 88 42 55 46 5F 0A 03 00 70 4C 31 4D 34           // .BUF_...pL1M4

Index (BUF, 0x04))
                Store (L1M5, 
   34D02: 88 42 55 46 5F 0A 04 00 70 4C 31 4D 35           // .BUF_...pL1M5

Index (BUF, 0x05))
                Store (L1M6, 
   34D0F: 88 42 55 46 5F 0A 05 00 70 4C 31 4D 36           // .BUF_...pL1M6

Index (BUF, 0x06))
                Store (L1M7, 
   34D1C: 88 42 55 46 5F 0A 06 00 70 4C 31 4D 37           // .BUF_...pL1M7

Index (BUF, 0x07))
                Store (L1M8, 
   34D29: 88 42 55 46 5F 0A 07 00 70 4C 31 4D 38           // .BUF_...pL1M8

Index (BUF, 0x08))
                Store (L1M9, 
   34D36: 88 42 55 46 5F 0A 08 00 70 4C 31 4D 39           // .BUF_...pL1M9

Index (BUF, 0x09))
                Store (L1MA, 
   34D43: 88 42 55 46 5F 0A 09 00 70 4C 31 4D 41           // .BUF_...pL1MA

Index (BUF, 0x0A))
                Store (L1MB, 
   34D50: 88 42 55 46 5F 0A 0A 00 70 4C 31 4D 42           // .BUF_...pL1MB

Index (BUF, 0x0B))
                Store (L1MC, 
   34D5D: 88 42 55 46 5F 0A 0B 00 70 4C 31 4D 43           // .BUF_...pL1MC

Index (BUF, 0x0C))
                Store (L1MD, 
   34D6A: 88 42 55 46 5F 0A 0C 00 70 4C 31 4D 44           // .BUF_...pL1MD

Index (BUF, 0x0D))
                Store (L1ME, 
   34D77: 88 42 55 46 5F 0A 0D 00 70 4C 31 4D 45           // .BUF_...pL1ME

Index (BUF, 0x0E))
                Store (L1MF, 
   34D84: 88 42 55 46 5F 0A 0E 00 70 4C 31 4D 46           // .BUF_...pL1MF

Index (BUF, 0x0F))

   34D91: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                Return (
   34D99: A4                                               // .

ToString (BUF, Ones))
            }


   34D9A: 9C 42 55 46 5F FF 00                             // .BUF_..

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {

   34DA1: 14 48 08 5F 50 4C 44 08                          // .H._PLD.

                Name (PLDB, 
   34DA9: 08 50 4C 44 42                                   // .PLDB

Package (0x03)
                {

   34DAE: 12 43 04 03                                      // .C..

                    Buffer (0x14)
                    {
                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x69, 0x0E, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // i.......
                        /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                    }, 


   34DB2: 11 17 0A 14 82 00 00 00 00 00 00 00 69 0E 00 00  // ............i...
   34DC2: 03 00 00 00 FF FF FF FF                          // ........

                    ToUUID ("59af1a1f-aba4-4bb8-81ef-55938e9bc53a") /* Unknown UUID */, 

   34DCA: 11 13 0A 10 1F 1A AF 59 A4 AB B8 4B 81 EF 55 93  // .......Y...K..U.
   34DDA: 8E 9B C5 3A                                      // ...:

                    Buffer (0x10)
                    {
                        /* 0000 */  0xE1, 0x41, 0xD6, 0x16, 0xC8, 0x00, 0xC8, 0x00,  // .A......
                        /* 0008 */  0x14, 0x00, 0x70, 0x01, 0x7E, 0x04, 0x28, 0x00   // ..p.~.(.
                    }
                })

   34DDE: 11 13 0A 10 E1 41 D6 16 C8 00 C8 00 14 00 70 01  // .....A........p.
   34DEE: 7E 04 28 00                                      // ~.(.

                CreateByteField (DerefOf (
   34DF2: 8C 83                                            // ..

Index (PLDB, Zero)), 0x08, BPOS)

   34DF4: 88 50 4C 44 42 00 00 0A 08 42 50 4F 53           // .PLDB....BPOS

                CreateField (DerefOf (
   34E01: 5B 13 83                                         // [..

Index (PLDB, Zero)), 0x73, 0x04, RPOS)
                Store (L1PL, BPOS) /* \_SB_.PCI0.LNK1._PLD.BPOS */
                Store (L1DG, RPOS) /* \_SB_.PCI0.LNK1._PLD.RPOS */

   34E04: 88 50 4C 44 42 00 00 0A 73 0A 04 52 50 4F 53 70  // .PLDB...s..RPOSp
   34E14: 4C 31 50 4C 42 50 4F 53 70 4C 31 44 47 52 50 4F  // L1PLBPOSpL1DGRPO
   34E24: 53                                               // S

                Return (PLDB) /* \_SB_.PCI0.LNK1._PLD.PLDB */
            }


   34E25: A4 50 4C 44 42                                   // .PLDB

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Store (
   34E2A: 14 47 17 5F 43 52 53 00 70                       // .G._CRS.p

Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }, Local0)

   34E33: 11 05 0A 02 79 00 60                             // ....y.`

                If (LGreater (L1DI, Zero))
                {
                    Store (IICB (L1A0, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34E3A: A0 1C 94 4C 31 44 49 00 70 49 49 43 42 4C 31 41  // ...L1DI.pIICBL1A
   34E4A: 30 4C 31 42 53 61 84 60 61 62                    // 0L1BSa.`ab

                    Store (Local2, Local0)
                }


   34E54: 70 62 60                                         // pb`

                If (LGreater (L1DI, One))
                {
                    Store (IICB (L1A1, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34E57: A0 1C 94 4C 31 44 49 01 70 49 49 43 42 4C 31 41  // ...L1DI.pIICBL1A
   34E67: 31 4C 31 42 53 61 84 60 61 62                    // 1L1BSa.`ab

                    Store (Local2, Local0)
                }


   34E71: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x02))
                {
                    Store (IICB (L1A2, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34E74: A0 1D 94 4C 31 44 49 0A 02 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34E84: 41 32 4C 31 42 53 61 84 60 61 62                 // A2L1BSa.`ab

                    Store (Local2, Local0)
                }


   34E8F: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x03))
                {
                    Store (IICB (L1A3, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34E92: A0 1D 94 4C 31 44 49 0A 03 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34EA2: 41 33 4C 31 42 53 61 84 60 61 62                 // A3L1BSa.`ab

                    Store (Local2, Local0)
                }


   34EAD: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x04))
                {
                    Store (IICB (L1A4, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34EB0: A0 1D 94 4C 31 44 49 0A 04 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34EC0: 41 34 4C 31 42 53 61 84 60 61 62                 // A4L1BSa.`ab

                    Store (Local2, Local0)
                }


   34ECB: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x05))
                {
                    Store (IICB (L1A5, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34ECE: A0 1D 94 4C 31 44 49 0A 05 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34EDE: 41 35 4C 31 42 53 61 84 60 61 62                 // A5L1BSa.`ab

                    Store (Local2, Local0)
                }


   34EE9: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x06))
                {
                    Store (IICB (L1A6, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34EEC: A0 1D 94 4C 31 44 49 0A 06 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34EFC: 41 36 4C 31 42 53 61 84 60 61 62                 // A6L1BSa.`ab

                    Store (Local2, Local0)
                }


   34F07: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x07))
                {
                    Store (IICB (L1A7, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34F0A: A0 1D 94 4C 31 44 49 0A 07 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34F1A: 41 37 4C 31 42 53 61 84 60 61 62                 // A7L1BSa.`ab

                    Store (Local2, Local0)
                }


   34F25: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x08))
                {
                    Store (IICB (L1A8, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34F28: A0 1D 94 4C 31 44 49 0A 08 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34F38: 41 38 4C 31 42 53 61 84 60 61 62                 // A8L1BSa.`ab

                    Store (Local2, Local0)
                }


   34F43: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x09))
                {
                    Store (IICB (L1A9, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34F46: A0 1D 94 4C 31 44 49 0A 09 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34F56: 41 39 4C 31 42 53 61 84 60 61 62                 // A9L1BSa.`ab

                    Store (Local2, Local0)
                }


   34F61: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x0A))
                {
                    Store (IICB (L1AA, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34F64: A0 1D 94 4C 31 44 49 0A 0A 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34F74: 41 41 4C 31 42 53 61 84 60 61 62                 // AAL1BSa.`ab

                    Store (Local2, Local0)
                }


   34F7F: 70 62 60                                         // pb`

                If (LGreater (L1DI, 0x0B))
                {
                    Store (IICB (L1AB, L1BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   34F82: A0 1D 94 4C 31 44 49 0A 0B 70 49 49 43 42 4C 31  // ...L1DI..pIICBL1
   34F92: 41 42 4C 31 42 53 61 84 60 61 62                 // ABL1BSa.`ab

                    Store (Local2, Local0)
                }


   34F9D: 70 62 60                                         // pb`

                Return (Local0)
            }


   34FA0: A4 60                                            // .`

            Method (SSDB, 0, NotSerialized)
            {

   34FA2: 14 41 14 53 53 44 42 00                          // .A.SSDB.

                Name (PAR, 
   34FAA: 08 50 41 52 5F                                   // .PAR_

Buffer (0x6C)
                {
                    /* 0000 */  0x00, 0x00, 0x69, 0x56, 0x39, 0x8A, 0xF7, 0x11,  // ..iV9...
                    /* 0008 */  0xA9, 0x4E, 0x9C, 0x7D, 0x20, 0xEE, 0x0A, 0xB5,  // .N.} ...
                    /* 0010 */  0xCA, 0x40, 0xA3, 0x00, 0x00, 0x00, 0x00, 0x00,  // .@......
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0050 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0068 */  0x00, 0x00, 0x00, 0x00                           // ....
                })
                Store (L1DV, 
   34FAF: 11 40 07 0A 6C 00 00 69 56 39 8A F7 11 A9 4E 9C  // .@..l..iV9....N.
   34FBF: 7D 20 EE 0A B5 CA 40 A3 00 00 00 00 00 00 00 00  // } ....@.........
   34FCF: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   34FDF: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   34FEF: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   34FFF: 00 00 00 00 00 0A 00 00 00 00 01 00 00 00 00 00  // ................
   3500F: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   3501F: 00 70 4C 31 44 56                                // .pL1DV

Index (PAR, Zero))
                Store (L1CV, 
   35025: 88 50 41 52 5F 00 00 70 4C 31 43 56              // .PAR_..pL1CV

Index (PAR, One))
                Store (CDIV, 
   35031: 88 50 41 52 5F 01 00 70 43 44 49 56              // .PAR_..pCDIV

Index (PAR, 0x18))
                Store (L1LU, 
   3503D: 88 50 41 52 5F 0A 18 00 70 4C 31 4C 55           // .PAR_...pL1LU

Index (PAR, 0x1C))
                Store (L1NL, 
   3504A: 88 50 41 52 5F 0A 1C 00 70 4C 31 4E 4C           // .PAR_...pL1NL

Index (PAR, 0x1D))
                Store (L1EE, 
   35057: 88 50 41 52 5F 0A 1D 00 70 4C 31 45 45           // .PAR_...pL1EE

Index (PAR, 0x4E))
                Store (L1VC, 
   35064: 88 50 41 52 5F 0A 4E 00 70 4C 31 56 43           // .PAR_.N.pL1VC

Index (PAR, 0x4F))
                Store (L1FS, 
   35071: 88 50 41 52 5F 0A 4F 00 70 4C 31 46 53           // .PAR_.O.pL1FS

Index (PAR, 0x52))
                Store (L1LE, 
   3507E: 88 50 41 52 5F 0A 52 00 70 4C 31 4C 45           // .PAR_.R.pL1LE

Index (PAR, 0x53))
                Store (CDEG (L1DG), 
   3508B: 88 50 41 52 5F 0A 53 00 70 43 44 45 47 4C 31 44  // .PAR_.S.pCDEGL1D
   3509B: 47                                               // G

Index (PAR, 0x54))

   3509C: 88 50 41 52 5F 0A 54 00                          // .PAR_.T.

                CreateDWordField (PAR, 0x56, DAT)
                Store (L1CK, DAT) /* \_SB_.PCI0.LNK1.SSDB.DAT_ */
                Store (L1CL, 
   350A4: 8A 50 41 52 5F 0A 56 44 41 54 5F 70 4C 31 43 4B  // .PAR_.VDAT_pL1CK
   350B4: 44 41 54 5F 70 4C 31 43 4C                       // DAT_pL1CL

Index (PAR, 0x5A))
                Store (L1PP, 
   350BD: 88 50 41 52 5F 0A 5A 00 70 4C 31 50 50           // .PAR_.Z.pL1PP

Index (PAR, 0x5F))
                Store (L1VR, 
   350CA: 88 50 41 52 5F 0A 5F 00 70 4C 31 56 52           // .PAR_._.pL1VR

Index (PAR, 0x60))

   350D7: 88 50 41 52 5F 0A 60 00                          // .PAR_.`.

                Return (PAR) /* \_SB_.PCI0.LNK1.SSDB.PAR_ */
            }


   350DF: A4 50 41 52 5F                                   // .PAR_

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   350E4: 14 40 4F 5F 44 53 4D 04                          // .@O_DSM.

                If (LEqual (Arg0, 
   350EC: A0 43 11 93 68                                   // .C..h

ToUUID ("822ace8f-2814-4174-a56b-5f029fe079ee") /* Unknown UUID */))
                {

   350F1: 11 13 0A 10 8F CE 2A 82 14 28 74 41 A5 6B 5F 02  // ......*..(tA.k_.
   35101: 9F E0 79 EE                                      // ..y.

                    If (LEqual (Arg2, Zero))
                    {

   35105: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   3510A: A0 09 93 69 00                                   // ...i.

                            Return (
   3510F: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   35110: 11 03 01 03                                      // ....

                        Else
                        {

   35114: A1 06                                            // ..

                            Return (
   35116: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   35117: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   3511B: A0 44 0E 93 6A 01                                // .D..j.

                        Name (BUF, 
   35121: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                        Store (L1M0, 
   35126: 11 03 0A 10 70 4C 31 4D 30                       // ....pL1M0

Index (BUF, Zero))
                        Store (L1M1, 
   3512F: 88 42 55 46 5F 00 00 70 4C 31 4D 31              // .BUF_..pL1M1

Index (BUF, One))
                        Store (L1M2, 
   3513B: 88 42 55 46 5F 01 00 70 4C 31 4D 32              // .BUF_..pL1M2

Index (BUF, 0x02))
                        Store (L1M3, 
   35147: 88 42 55 46 5F 0A 02 00 70 4C 31 4D 33           // .BUF_...pL1M3

Index (BUF, 0x03))
                        Store (L1M4, 
   35154: 88 42 55 46 5F 0A 03 00 70 4C 31 4D 34           // .BUF_...pL1M4

Index (BUF, 0x04))
                        Store (L1M5, 
   35161: 88 42 55 46 5F 0A 04 00 70 4C 31 4D 35           // .BUF_...pL1M5

Index (BUF, 0x05))
                        Store (L1M6, 
   3516E: 88 42 55 46 5F 0A 05 00 70 4C 31 4D 36           // .BUF_...pL1M6

Index (BUF, 0x06))
                        Store (L1M7, 
   3517B: 88 42 55 46 5F 0A 06 00 70 4C 31 4D 37           // .BUF_...pL1M7

Index (BUF, 0x07))
                        Store (L1M8, 
   35188: 88 42 55 46 5F 0A 07 00 70 4C 31 4D 38           // .BUF_...pL1M8

Index (BUF, 0x08))
                        Store (L1M9, 
   35195: 88 42 55 46 5F 0A 08 00 70 4C 31 4D 39           // .BUF_...pL1M9

Index (BUF, 0x09))
                        Store (L1MA, 
   351A2: 88 42 55 46 5F 0A 09 00 70 4C 31 4D 41           // .BUF_...pL1MA

Index (BUF, 0x0A))
                        Store (L1MB, 
   351AF: 88 42 55 46 5F 0A 0A 00 70 4C 31 4D 42           // .BUF_...pL1MB

Index (BUF, 0x0B))
                        Store (L1MC, 
   351BC: 88 42 55 46 5F 0A 0B 00 70 4C 31 4D 43           // .BUF_...pL1MC

Index (BUF, 0x0C))
                        Store (L1MD, 
   351C9: 88 42 55 46 5F 0A 0C 00 70 4C 31 4D 44           // .BUF_...pL1MD

Index (BUF, 0x0D))
                        Store (L1ME, 
   351D6: 88 42 55 46 5F 0A 0D 00 70 4C 31 4D 45           // .BUF_...pL1ME

Index (BUF, 0x0E))
                        Store (L1MF, 
   351E3: 88 42 55 46 5F 0A 0E 00 70 4C 31 4D 46           // .BUF_...pL1MF

Index (BUF, 0x0F))

   351F0: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                        Return (
   351F8: A4                                               // .

ToString (BUF, Ones))
                    }
                }


   351F9: 9C 42 55 46 5F FF 00                             // .BUF_..

                If (LEqual (Arg0, 
   35200: A0 46 1E 93 68                                   // .F..h

ToUUID ("5815c5c8-c47d-477b-9a8d-76173176414b") /* Unknown UUID */))
                {

   35205: 11 13 0A 10 C8 C5 15 58 7D C4 7B 47 9A 8D 76 17  // .......X}.{G..v.
   35215: 31 76 41 4B                                      // 1vAK

                    If (LEqual (Arg2, Zero))
                    {

   35219: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   3521E: A0 09 93 69 00                                   // ...i.

                            Return (
   35223: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   35224: 11 03 01 03                                      // ....

                        Else
                        {

   35228: A1 06                                            // ..

                            Return (
   3522A: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   3522B: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   3522F: A0 42 1B 93 6A 01                                // .B..j.

                        Name (DSMB, 
   35235: 08 44 53 4D 42                                   // .DSMB

Buffer (0x34){})

   3523A: 11 03 0A 34                                      // ...4

                        CreateDWordField (DSMB, Zero, I2CC)

   3523E: 8A 44 53 4D 42 00 49 32 43 43                    // .DSMB.I2CC

                        CreateDWordField (DSMB, 0x04, DEV0)

   35248: 8A 44 53 4D 42 0A 04 44 45 56 30                 // .DSMB..DEV0

                        CreateDWordField (DSMB, 0x08, DEV1)

   35253: 8A 44 53 4D 42 0A 08 44 45 56 31                 // .DSMB..DEV1

                        CreateDWordField (DSMB, 0x0C, DEV2)

   3525E: 8A 44 53 4D 42 0A 0C 44 45 56 32                 // .DSMB..DEV2

                        CreateDWordField (DSMB, 0x10, DEV3)

   35269: 8A 44 53 4D 42 0A 10 44 45 56 33                 // .DSMB..DEV3

                        CreateDWordField (DSMB, 0x14, DEV4)

   35274: 8A 44 53 4D 42 0A 14 44 45 56 34                 // .DSMB..DEV4

                        CreateDWordField (DSMB, 0x18, DEV5)

   3527F: 8A 44 53 4D 42 0A 18 44 45 56 35                 // .DSMB..DEV5

                        CreateDWordField (DSMB, 0x1C, DEV6)

   3528A: 8A 44 53 4D 42 0A 1C 44 45 56 36                 // .DSMB..DEV6

                        CreateDWordField (DSMB, 0x20, DEV7)

   35295: 8A 44 53 4D 42 0A 20 44 45 56 37                 // .DSMB. DEV7

                        CreateDWordField (DSMB, 0x24, DEV8)

   352A0: 8A 44 53 4D 42 0A 24 44 45 56 38                 // .DSMB.$DEV8

                        CreateDWordField (DSMB, 0x28, DEV9)

   352AB: 8A 44 53 4D 42 0A 28 44 45 56 39                 // .DSMB.(DEV9

                        CreateDWordField (DSMB, 0x2C, DEVA)

   352B6: 8A 44 53 4D 42 0A 2C 44 45 56 41                 // .DSMB.,DEVA

                        CreateDWordField (DSMB, 0x30, DEVB)
                        Store (L1DI, I2CC) /* \_SB_.PCI0.LNK1._DSM.I2CC */
                        Store (DSMI (L1D0, L1A0, Zero, L1BS), DEV0) /* \_SB_.PCI0.LNK1._DSM.DEV0 */
                        Store (DSMI (L1D1, L1A1, Zero, L1BS), DEV1) /* \_SB_.PCI0.LNK1._DSM.DEV1 */
                        Store (DSMI (L1D2, L1A2, Zero, L1BS), DEV2) /* \_SB_.PCI0.LNK1._DSM.DEV2 */
                        Store (DSMI (L1D3, L1A3, Zero, L1BS), DEV3) /* \_SB_.PCI0.LNK1._DSM.DEV3 */
                        Store (DSMI (L1D4, L1A4, Zero, L1BS), DEV4) /* \_SB_.PCI0.LNK1._DSM.DEV4 */
                        Store (DSMI (L1D5, L1A5, Zero, L1BS), DEV5) /* \_SB_.PCI0.LNK1._DSM.DEV5 */
                        Store (DSMI (L1D6, L1A6, Zero, L1BS), DEV6) /* \_SB_.PCI0.LNK1._DSM.DEV6 */
                        Store (DSMI (L1D7, L1A7, Zero, L1BS), DEV7) /* \_SB_.PCI0.LNK1._DSM.DEV7 */
                        Store (DSMI (L1D8, L1A8, Zero, L1BS), DEV8) /* \_SB_.PCI0.LNK1._DSM.DEV8 */
                        Store (DSMI (L1D9, L1A9, Zero, L1BS), DEV9) /* \_SB_.PCI0.LNK1._DSM.DEV9 */
                        Store (DSMI (L1DA, L1AA, Zero, L1BS), DEVA) /* \_SB_.PCI0.LNK1._DSM.DEVA */
                        Store (DSMI (L1DB, L1AB, Zero, L1BS), DEVB) /* \_SB_.PCI0.LNK1._DSM.DEVB */

   352C1: 8A 44 53 4D 42 0A 30 44 45 56 42 70 4C 31 44 49  // .DSMB.0DEVBpL1DI
   352D1: 49 32 43 43 70 44 53 4D 49 4C 31 44 30 4C 31 41  // I2CCpDSMIL1D0L1A
   352E1: 30 00 4C 31 42 53 44 45 56 30 70 44 53 4D 49 4C  // 0.L1BSDEV0pDSMIL
   352F1: 31 44 31 4C 31 41 31 00 4C 31 42 53 44 45 56 31  // 1D1L1A1.L1BSDEV1
   35301: 70 44 53 4D 49 4C 31 44 32 4C 31 41 32 00 4C 31  // pDSMIL1D2L1A2.L1
   35311: 42 53 44 45 56 32 70 44 53 4D 49 4C 31 44 33 4C  // BSDEV2pDSMIL1D3L
   35321: 31 41 33 00 4C 31 42 53 44 45 56 33 70 44 53 4D  // 1A3.L1BSDEV3pDSM
   35331: 49 4C 31 44 34 4C 31 41 34 00 4C 31 42 53 44 45  // IL1D4L1A4.L1BSDE
   35341: 56 34 70 44 53 4D 49 4C 31 44 35 4C 31 41 35 00  // V4pDSMIL1D5L1A5.
   35351: 4C 31 42 53 44 45 56 35 70 44 53 4D 49 4C 31 44  // L1BSDEV5pDSMIL1D
   35361: 36 4C 31 41 36 00 4C 31 42 53 44 45 56 36 70 44  // 6L1A6.L1BSDEV6pD
   35371: 53 4D 49 4C 31 44 37 4C 31 41 37 00 4C 31 42 53  // SMIL1D7L1A7.L1BS
   35381: 44 45 56 37 70 44 53 4D 49 4C 31 44 38 4C 31 41  // DEV7pDSMIL1D8L1A
   35391: 38 00 4C 31 42 53 44 45 56 38 70 44 53 4D 49 4C  // 8.L1BSDEV8pDSMIL
   353A1: 31 44 39 4C 31 41 39 00 4C 31 42 53 44 45 56 39  // 1D9L1A9.L1BSDEV9
   353B1: 70 44 53 4D 49 4C 31 44 41 4C 31 41 41 00 4C 31  // pDSMIL1DAL1AA.L1
   353C1: 42 53 44 45 56 41 70 44 53 4D 49 4C 31 44 42 4C  // BSDEVApDSMIL1DBL
   353D1: 31 41 42 00 4C 31 42 53 44 45 56 42              // 1AB.L1BSDEVB

                        Return (DSMB) /* \_SB_.PCI0.LNK1._DSM.DSMB */
                    }


   353DD: A4 44 53 4D 42                                   // .DSMB

                    Return (
   353E2: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   353E3: 11 03 01 00                                      // ....

                If (LEqual (Arg0, 
   353E7: A0 48 1E 93 68                                   // .H..h

ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881") /* Unknown UUID */))
                {

   353EC: 11 13 0A 10 49 75 25 26 71 92 A4 4C BB 43 C4 89  // ....Iu%&q..L.C..
   353FC: 9D 5A 48 81                                      // .ZH.

                    If (LEqual (Arg2, Zero))
                    {

   35400: A0 0B 93 6A 00                                   // ...j.

                        Return (
   35405: A4                                               // .

Buffer (0x02)
                        {
                             0xFF, 0x1F                                       // ..
                        })
                    }


   35406: 11 05 0A 02 FF 1F                                // ......

                    If (LEqual (Arg2, One))
                    {

   3540C: A0 09 93 6A 01                                   // ...j.

                        Return (L1DI) /* \L1DI */
                    }


   35411: A4 4C 31 44 49                                   // .L1DI

                    If (LEqual (Arg2, 0x02))
                    {

   35416: A0 23 93 6A 0A 02                                // .#.j..

                        If (LGreater (L1DI, Zero))
                        {

   3541C: A0 19 94 4C 31 44 49 00                          // ...L1DI.

                            Return (DSMI (L1D0, L1A0, Zero, L1BS))
                        }

   35424: A4 44 53 4D 49 4C 31 44 30 4C 31 41 30 00 4C 31  // .DSMIL1D0L1A0.L1
   35434: 42 53                                            // BS

                        Else
                        {

   35436: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35438: A4 00                                            // ..

                    If (LEqual (Arg2, 0x03))
                    {

   3543A: A0 23 93 6A 0A 03                                // .#.j..

                        If (LGreater (L1DI, One))
                        {

   35440: A0 19 94 4C 31 44 49 01                          // ...L1DI.

                            Return (DSMI (L1D1, L1A1, Zero, L1BS))
                        }

   35448: A4 44 53 4D 49 4C 31 44 31 4C 31 41 31 00 4C 31  // .DSMIL1D1L1A1.L1
   35458: 42 53                                            // BS

                        Else
                        {

   3545A: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   3545C: A4 00                                            // ..

                    If (LEqual (Arg2, 0x04))
                    {

   3545E: A0 24 93 6A 0A 04                                // .$.j..

                        If (LGreater (L1DI, 0x02))
                        {

   35464: A0 1A 94 4C 31 44 49 0A 02                       // ...L1DI..

                            Return (DSMI (L1D2, L1A2, Zero, L1BS))
                        }

   3546D: A4 44 53 4D 49 4C 31 44 32 4C 31 41 32 00 4C 31  // .DSMIL1D2L1A2.L1
   3547D: 42 53                                            // BS

                        Else
                        {

   3547F: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35481: A4 00                                            // ..

                    If (LEqual (Arg2, 0x05))
                    {

   35483: A0 24 93 6A 0A 05                                // .$.j..

                        If (LGreater (L1DI, 0x03))
                        {

   35489: A0 1A 94 4C 31 44 49 0A 03                       // ...L1DI..

                            Return (DSMI (L1D3, L1A3, Zero, L1BS))
                        }

   35492: A4 44 53 4D 49 4C 31 44 33 4C 31 41 33 00 4C 31  // .DSMIL1D3L1A3.L1
   354A2: 42 53                                            // BS

                        Else
                        {

   354A4: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   354A6: A4 00                                            // ..

                    If (LEqual (Arg2, 0x06))
                    {

   354A8: A0 24 93 6A 0A 06                                // .$.j..

                        If (LGreater (L1DI, 0x04))
                        {

   354AE: A0 1A 94 4C 31 44 49 0A 04                       // ...L1DI..

                            Return (DSMI (L1D4, L1A4, Zero, L1BS))
                        }

   354B7: A4 44 53 4D 49 4C 31 44 34 4C 31 41 34 00 4C 31  // .DSMIL1D4L1A4.L1
   354C7: 42 53                                            // BS

                        Else
                        {

   354C9: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   354CB: A4 00                                            // ..

                    If (LEqual (Arg2, 0x07))
                    {

   354CD: A0 24 93 6A 0A 07                                // .$.j..

                        If (LGreater (L1DI, 0x05))
                        {

   354D3: A0 1A 94 4C 31 44 49 0A 05                       // ...L1DI..

                            Return (DSMI (L1D5, L1A5, Zero, L1BS))
                        }

   354DC: A4 44 53 4D 49 4C 31 44 35 4C 31 41 35 00 4C 31  // .DSMIL1D5L1A5.L1
   354EC: 42 53                                            // BS

                        Else
                        {

   354EE: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   354F0: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   354F2: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L1DI, 0x06))
                        {

   354F8: A0 1A 94 4C 31 44 49 0A 06                       // ...L1DI..

                            Return (DSMI (L1D6, L1A6, Zero, L1BS))
                        }

   35501: A4 44 53 4D 49 4C 31 44 36 4C 31 41 36 00 4C 31  // .DSMIL1D6L1A6.L1
   35511: 42 53                                            // BS

                        Else
                        {

   35513: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35515: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   35517: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L1DI, 0x07))
                        {

   3551D: A0 1A 94 4C 31 44 49 0A 07                       // ...L1DI..

                            Return (DSMI (L1D7, L1A7, Zero, L1BS))
                        }

   35526: A4 44 53 4D 49 4C 31 44 37 4C 31 41 37 00 4C 31  // .DSMIL1D7L1A7.L1
   35536: 42 53                                            // BS

                        Else
                        {

   35538: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   3553A: A4 00                                            // ..

                    If (LEqual (Arg2, 0x09))
                    {

   3553C: A0 24 93 6A 0A 09                                // .$.j..

                        If (LGreater (L1DI, 0x08))
                        {

   35542: A0 1A 94 4C 31 44 49 0A 08                       // ...L1DI..

                            Return (DSMI (L1D8, L1A8, Zero, L1BS))
                        }

   3554B: A4 44 53 4D 49 4C 31 44 38 4C 31 41 38 00 4C 31  // .DSMIL1D8L1A8.L1
   3555B: 42 53                                            // BS

                        Else
                        {

   3555D: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   3555F: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0A))
                    {

   35561: A0 24 93 6A 0A 0A                                // .$.j..

                        If (LGreater (L1DI, 0x09))
                        {

   35567: A0 1A 94 4C 31 44 49 0A 09                       // ...L1DI..

                            Return (DSMI (L1D9, L1A9, Zero, L1BS))
                        }

   35570: A4 44 53 4D 49 4C 31 44 39 4C 31 41 39 00 4C 31  // .DSMIL1D9L1A9.L1
   35580: 42 53                                            // BS

                        Else
                        {

   35582: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35584: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0B))
                    {

   35586: A0 24 93 6A 0A 0B                                // .$.j..

                        If (LGreater (L1DI, 0x0A))
                        {

   3558C: A0 1A 94 4C 31 44 49 0A 0A                       // ...L1DI..

                            Return (DSMI (L1DA, L1AA, Zero, L1BS))
                        }

   35595: A4 44 53 4D 49 4C 31 44 41 4C 31 41 41 00 4C 31  // .DSMIL1DAL1AA.L1
   355A5: 42 53                                            // BS

                        Else
                        {

   355A7: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   355A9: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0C))
                    {

   355AB: A0 24 93 6A 0A 0C                                // .$.j..

                        If (LGreater (L1DI, 0x0B))
                        {

   355B1: A0 1A 94 4C 31 44 49 0A 0B                       // ...L1DI..

                            Return (DSMI (L1DB, L1AB, Zero, L1BS))
                        }

   355BA: A4 44 53 4D 49 4C 31 44 42 4C 31 41 42 00 4C 31  // .DSMIL1DBL1AB.L1
   355CA: 42 53                                            // BS

                        Else
                        {

   355CC: A1 03                                            // ..

                            Return (Zero)
                        }
                    }
                }


   355CE: A4 00                                            // ..

                Return (
   355D0: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }


   355D1: 11 03 01 00                                      // ....

        Device (LNK2)
        {

   355D5: 5B 82 4E 97 4C 4E 4B 32                          // [.N.LNK2

            Name (_ADR, Zero)  // _ADR: Address

   355DD: 08 5F 41 44 52 00                                // ._ADR.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   355E3: 14 13 5F 53 54 41 00                             // .._STA.

                If (L2EN)
                {

   355EA: A0 08 4C 32 45 4E                                // ..L2EN

                    Return (0x0F)
                }

   355F0: A4 0A 0F                                         // ...

                Else
                {

   355F3: A1 03                                            // ..

                    Return (Zero)
                }
            }


   355F5: A4 00                                            // ..

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {

   355F7: 14 1F 5F 44 45 50 00                             // .._DEP.

                If (L2EN)
                {

   355FE: A0 0E 4C 32 45 4E                                // ..L2EN

                    Return (CDEP (L2CL))
                }

   35604: A4 43 44 45 50 4C 32 43 4C                       // .CDEPL2CL

                Else
                {

   3560D: A1 09                                            // ..

                    Return (
   3560F: A4                                               // .

Package (0x01)
                    {
                        PCI0, 
                    })
                }
            }


   35610: 12 06 01 50 43 49 30                             // ...PCI0

            Name (_UID, 0x02)  // _UID: Unique ID

   35617: 08 5F 55 49 44 0A 02                             // ._UID..

            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {

   3561E: 14 0D 5F 48 49 44 00                             // .._HID.

                Return (HCID (0x02))
            }


   35625: A4 48 43 49 44 0A 02                             // .HCID..

            Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
            {

   3562C: 14 0D 5F 43 49 44 00                             // .._CID.

                Return (HCID (0x02))
            }


   35633: A4 48 43 49 44 0A 02                             // .HCID..

            Method (_DDN, 0, NotSerialized)  // _DDN: DOS Device Name
            {

   3563A: 14 46 0E 5F 44 44 4E 00                          // .F._DDN.

                Name (BUF, 
   35642: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                Store (L2M0, 
   35647: 11 03 0A 10 70 4C 32 4D 30                       // ....pL2M0

Index (BUF, Zero))
                Store (L2M1, 
   35650: 88 42 55 46 5F 00 00 70 4C 32 4D 31              // .BUF_..pL2M1

Index (BUF, One))
                Store (L2M2, 
   3565C: 88 42 55 46 5F 01 00 70 4C 32 4D 32              // .BUF_..pL2M2

Index (BUF, 0x02))
                Store (L2M3, 
   35668: 88 42 55 46 5F 0A 02 00 70 4C 32 4D 33           // .BUF_...pL2M3

Index (BUF, 0x03))
                Store (L2M4, 
   35675: 88 42 55 46 5F 0A 03 00 70 4C 32 4D 34           // .BUF_...pL2M4

Index (BUF, 0x04))
                Store (L2M5, 
   35682: 88 42 55 46 5F 0A 04 00 70 4C 32 4D 35           // .BUF_...pL2M5

Index (BUF, 0x05))
                Store (L2M6, 
   3568F: 88 42 55 46 5F 0A 05 00 70 4C 32 4D 36           // .BUF_...pL2M6

Index (BUF, 0x06))
                Store (L2M7, 
   3569C: 88 42 55 46 5F 0A 06 00 70 4C 32 4D 37           // .BUF_...pL2M7

Index (BUF, 0x07))
                Store (L2M8, 
   356A9: 88 42 55 46 5F 0A 07 00 70 4C 32 4D 38           // .BUF_...pL2M8

Index (BUF, 0x08))
                Store (L2M9, 
   356B6: 88 42 55 46 5F 0A 08 00 70 4C 32 4D 39           // .BUF_...pL2M9

Index (BUF, 0x09))
                Store (L2MA, 
   356C3: 88 42 55 46 5F 0A 09 00 70 4C 32 4D 41           // .BUF_...pL2MA

Index (BUF, 0x0A))
                Store (L2MB, 
   356D0: 88 42 55 46 5F 0A 0A 00 70 4C 32 4D 42           // .BUF_...pL2MB

Index (BUF, 0x0B))
                Store (L2MC, 
   356DD: 88 42 55 46 5F 0A 0B 00 70 4C 32 4D 43           // .BUF_...pL2MC

Index (BUF, 0x0C))
                Store (L2MD, 
   356EA: 88 42 55 46 5F 0A 0C 00 70 4C 32 4D 44           // .BUF_...pL2MD

Index (BUF, 0x0D))
                Store (L2ME, 
   356F7: 88 42 55 46 5F 0A 0D 00 70 4C 32 4D 45           // .BUF_...pL2ME

Index (BUF, 0x0E))
                Store (L2MF, 
   35704: 88 42 55 46 5F 0A 0E 00 70 4C 32 4D 46           // .BUF_...pL2MF

Index (BUF, 0x0F))

   35711: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                Return (
   35719: A4                                               // .

ToString (BUF, Ones))
            }


   3571A: 9C 42 55 46 5F FF 00                             // .BUF_..

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {

   35721: 14 48 08 5F 50 4C 44 08                          // .H._PLD.

                Name (PLDB, 
   35729: 08 50 4C 44 42                                   // .PLDB

Package (0x03)
                {

   3572E: 12 43 04 03                                      // .C..

                    Buffer (0x14)
                    {
                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x69, 0x0E, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // i.......
                        /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                    }, 


   35732: 11 17 0A 14 82 00 00 00 00 00 00 00 69 0E 00 00  // ............i...
   35742: 03 00 00 00 FF FF FF FF                          // ........

                    ToUUID ("59af1a1f-aba4-4bb8-81ef-55938e9bc53a") /* Unknown UUID */, 

   3574A: 11 13 0A 10 1F 1A AF 59 A4 AB B8 4B 81 EF 55 93  // .......Y...K..U.
   3575A: 8E 9B C5 3A                                      // ...:

                    Buffer (0x10)
                    {
                        /* 0000 */  0xE1, 0x41, 0xD6, 0x16, 0xC8, 0x00, 0xC8, 0x00,  // .A......
                        /* 0008 */  0x14, 0x00, 0x70, 0x01, 0x7E, 0x04, 0x28, 0x00   // ..p.~.(.
                    }
                })

   3575E: 11 13 0A 10 E1 41 D6 16 C8 00 C8 00 14 00 70 01  // .....A........p.
   3576E: 7E 04 28 00                                      // ~.(.

                CreateByteField (DerefOf (
   35772: 8C 83                                            // ..

Index (PLDB, Zero)), 0x08, BPOS)

   35774: 88 50 4C 44 42 00 00 0A 08 42 50 4F 53           // .PLDB....BPOS

                CreateField (DerefOf (
   35781: 5B 13 83                                         // [..

Index (PLDB, Zero)), 0x73, 0x04, RPOS)
                Store (L2PL, BPOS) /* \_SB_.PCI0.LNK2._PLD.BPOS */
                Store (L2DG, RPOS) /* \_SB_.PCI0.LNK2._PLD.RPOS */

   35784: 88 50 4C 44 42 00 00 0A 73 0A 04 52 50 4F 53 70  // .PLDB...s..RPOSp
   35794: 4C 32 50 4C 42 50 4F 53 70 4C 32 44 47 52 50 4F  // L2PLBPOSpL2DGRPO
   357A4: 53                                               // S

                Return (PLDB) /* \_SB_.PCI0.LNK2._PLD.PLDB */
            }


   357A5: A4 50 4C 44 42                                   // .PLDB

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Store (
   357AA: 14 47 17 5F 43 52 53 00 70                       // .G._CRS.p

Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }, Local0)

   357B3: 11 05 0A 02 79 00 60                             // ....y.`

                If (LGreater (L2DI, Zero))
                {
                    Store (IICB (L2A0, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   357BA: A0 1C 94 4C 32 44 49 00 70 49 49 43 42 4C 32 41  // ...L2DI.pIICBL2A
   357CA: 30 4C 32 42 53 61 84 60 61 62                    // 0L2BSa.`ab

                    Store (Local2, Local0)
                }


   357D4: 70 62 60                                         // pb`

                If (LGreater (L2DI, One))
                {
                    Store (IICB (L2A1, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   357D7: A0 1C 94 4C 32 44 49 01 70 49 49 43 42 4C 32 41  // ...L2DI.pIICBL2A
   357E7: 31 4C 32 42 53 61 84 60 61 62                    // 1L2BSa.`ab

                    Store (Local2, Local0)
                }


   357F1: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x02))
                {
                    Store (IICB (L2A2, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   357F4: A0 1D 94 4C 32 44 49 0A 02 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   35804: 41 32 4C 32 42 53 61 84 60 61 62                 // A2L2BSa.`ab

                    Store (Local2, Local0)
                }


   3580F: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x03))
                {
                    Store (IICB (L2A3, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   35812: A0 1D 94 4C 32 44 49 0A 03 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   35822: 41 33 4C 32 42 53 61 84 60 61 62                 // A3L2BSa.`ab

                    Store (Local2, Local0)
                }


   3582D: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x04))
                {
                    Store (IICB (L2A4, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   35830: A0 1D 94 4C 32 44 49 0A 04 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   35840: 41 34 4C 32 42 53 61 84 60 61 62                 // A4L2BSa.`ab

                    Store (Local2, Local0)
                }


   3584B: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x05))
                {
                    Store (IICB (L2A5, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   3584E: A0 1D 94 4C 32 44 49 0A 05 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   3585E: 41 35 4C 32 42 53 61 84 60 61 62                 // A5L2BSa.`ab

                    Store (Local2, Local0)
                }


   35869: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x06))
                {
                    Store (IICB (L2A6, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   3586C: A0 1D 94 4C 32 44 49 0A 06 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   3587C: 41 36 4C 32 42 53 61 84 60 61 62                 // A6L2BSa.`ab

                    Store (Local2, Local0)
                }


   35887: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x07))
                {
                    Store (IICB (L2A7, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   3588A: A0 1D 94 4C 32 44 49 0A 07 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   3589A: 41 37 4C 32 42 53 61 84 60 61 62                 // A7L2BSa.`ab

                    Store (Local2, Local0)
                }


   358A5: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x08))
                {
                    Store (IICB (L2A8, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   358A8: A0 1D 94 4C 32 44 49 0A 08 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   358B8: 41 38 4C 32 42 53 61 84 60 61 62                 // A8L2BSa.`ab

                    Store (Local2, Local0)
                }


   358C3: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x09))
                {
                    Store (IICB (L2A9, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   358C6: A0 1D 94 4C 32 44 49 0A 09 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   358D6: 41 39 4C 32 42 53 61 84 60 61 62                 // A9L2BSa.`ab

                    Store (Local2, Local0)
                }


   358E1: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x0A))
                {
                    Store (IICB (L2AA, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   358E4: A0 1D 94 4C 32 44 49 0A 0A 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   358F4: 41 41 4C 32 42 53 61 84 60 61 62                 // AAL2BSa.`ab

                    Store (Local2, Local0)
                }


   358FF: 70 62 60                                         // pb`

                If (LGreater (L2DI, 0x0B))
                {
                    Store (IICB (L2AB, L2BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   35902: A0 1D 94 4C 32 44 49 0A 0B 70 49 49 43 42 4C 32  // ...L2DI..pIICBL2
   35912: 41 42 4C 32 42 53 61 84 60 61 62                 // ABL2BSa.`ab

                    Store (Local2, Local0)
                }


   3591D: 70 62 60                                         // pb`

                Return (Local0)
            }


   35920: A4 60                                            // .`

            Method (SSDB, 0, NotSerialized)
            {

   35922: 14 41 14 53 53 44 42 00                          // .A.SSDB.

                Name (PAR, 
   3592A: 08 50 41 52 5F                                   // .PAR_

Buffer (0x6C)
                {
                    /* 0000 */  0x00, 0x00, 0x69, 0x56, 0x39, 0x8A, 0xF7, 0x11,  // ..iV9...
                    /* 0008 */  0xA9, 0x4E, 0x9C, 0x7D, 0x20, 0xEE, 0x0A, 0xB5,  // .N.} ...
                    /* 0010 */  0xCA, 0x40, 0xA3, 0x00, 0x00, 0x00, 0x00, 0x00,  // .@......
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0050 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0068 */  0x00, 0x00, 0x00, 0x00                           // ....
                })
                Store (L2DV, 
   3592F: 11 40 07 0A 6C 00 00 69 56 39 8A F7 11 A9 4E 9C  // .@..l..iV9....N.
   3593F: 7D 20 EE 0A B5 CA 40 A3 00 00 00 00 00 00 00 00  // } ....@.........
   3594F: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   3595F: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   3596F: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   3597F: 00 00 00 00 00 0A 00 00 00 00 01 00 00 00 00 00  // ................
   3598F: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   3599F: 00 70 4C 32 44 56                                // .pL2DV

Index (PAR, Zero))
                Store (L2CV, 
   359A5: 88 50 41 52 5F 00 00 70 4C 32 43 56              // .PAR_..pL2CV

Index (PAR, One))
                Store (CDIV, 
   359B1: 88 50 41 52 5F 01 00 70 43 44 49 56              // .PAR_..pCDIV

Index (PAR, 0x18))
                Store (L2LU, 
   359BD: 88 50 41 52 5F 0A 18 00 70 4C 32 4C 55           // .PAR_...pL2LU

Index (PAR, 0x1C))
                Store (L2NL, 
   359CA: 88 50 41 52 5F 0A 1C 00 70 4C 32 4E 4C           // .PAR_...pL2NL

Index (PAR, 0x1D))
                Store (L2EE, 
   359D7: 88 50 41 52 5F 0A 1D 00 70 4C 32 45 45           // .PAR_...pL2EE

Index (PAR, 0x4E))
                Store (L2VC, 
   359E4: 88 50 41 52 5F 0A 4E 00 70 4C 32 56 43           // .PAR_.N.pL2VC

Index (PAR, 0x4F))
                Store (L2FS, 
   359F1: 88 50 41 52 5F 0A 4F 00 70 4C 32 46 53           // .PAR_.O.pL2FS

Index (PAR, 0x52))
                Store (L2LE, 
   359FE: 88 50 41 52 5F 0A 52 00 70 4C 32 4C 45           // .PAR_.R.pL2LE

Index (PAR, 0x53))
                Store (CDEG (L2DG), 
   35A0B: 88 50 41 52 5F 0A 53 00 70 43 44 45 47 4C 32 44  // .PAR_.S.pCDEGL2D
   35A1B: 47                                               // G

Index (PAR, 0x54))

   35A1C: 88 50 41 52 5F 0A 54 00                          // .PAR_.T.

                CreateDWordField (PAR, 0x56, DAT)
                Store (L2CK, DAT) /* \_SB_.PCI0.LNK2.SSDB.DAT_ */
                Store (L2CL, 
   35A24: 8A 50 41 52 5F 0A 56 44 41 54 5F 70 4C 32 43 4B  // .PAR_.VDAT_pL2CK
   35A34: 44 41 54 5F 70 4C 32 43 4C                       // DAT_pL2CL

Index (PAR, 0x5A))
                Store (L2PP, 
   35A3D: 88 50 41 52 5F 0A 5A 00 70 4C 32 50 50           // .PAR_.Z.pL2PP

Index (PAR, 0x5F))
                Store (L2VR, 
   35A4A: 88 50 41 52 5F 0A 5F 00 70 4C 32 56 52           // .PAR_._.pL2VR

Index (PAR, 0x60))

   35A57: 88 50 41 52 5F 0A 60 00                          // .PAR_.`.

                Return (PAR) /* \_SB_.PCI0.LNK2.SSDB.PAR_ */
            }


   35A5F: A4 50 41 52 5F                                   // .PAR_

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   35A64: 14 40 4F 5F 44 53 4D 04                          // .@O_DSM.

                If (LEqual (Arg0, 
   35A6C: A0 43 11 93 68                                   // .C..h

ToUUID ("822ace8f-2814-4174-a56b-5f029fe079ee") /* Unknown UUID */))
                {

   35A71: 11 13 0A 10 8F CE 2A 82 14 28 74 41 A5 6B 5F 02  // ......*..(tA.k_.
   35A81: 9F E0 79 EE                                      // ..y.

                    If (LEqual (Arg2, Zero))
                    {

   35A85: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   35A8A: A0 09 93 69 00                                   // ...i.

                            Return (
   35A8F: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   35A90: 11 03 01 03                                      // ....

                        Else
                        {

   35A94: A1 06                                            // ..

                            Return (
   35A96: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   35A97: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   35A9B: A0 44 0E 93 6A 01                                // .D..j.

                        Name (BUF, 
   35AA1: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                        Store (L2M0, 
   35AA6: 11 03 0A 10 70 4C 32 4D 30                       // ....pL2M0

Index (BUF, Zero))
                        Store (L2M1, 
   35AAF: 88 42 55 46 5F 00 00 70 4C 32 4D 31              // .BUF_..pL2M1

Index (BUF, One))
                        Store (L2M2, 
   35ABB: 88 42 55 46 5F 01 00 70 4C 32 4D 32              // .BUF_..pL2M2

Index (BUF, 0x02))
                        Store (L2M3, 
   35AC7: 88 42 55 46 5F 0A 02 00 70 4C 32 4D 33           // .BUF_...pL2M3

Index (BUF, 0x03))
                        Store (L2M4, 
   35AD4: 88 42 55 46 5F 0A 03 00 70 4C 32 4D 34           // .BUF_...pL2M4

Index (BUF, 0x04))
                        Store (L2M5, 
   35AE1: 88 42 55 46 5F 0A 04 00 70 4C 32 4D 35           // .BUF_...pL2M5

Index (BUF, 0x05))
                        Store (L2M6, 
   35AEE: 88 42 55 46 5F 0A 05 00 70 4C 32 4D 36           // .BUF_...pL2M6

Index (BUF, 0x06))
                        Store (L2M7, 
   35AFB: 88 42 55 46 5F 0A 06 00 70 4C 32 4D 37           // .BUF_...pL2M7

Index (BUF, 0x07))
                        Store (L2M8, 
   35B08: 88 42 55 46 5F 0A 07 00 70 4C 32 4D 38           // .BUF_...pL2M8

Index (BUF, 0x08))
                        Store (L2M9, 
   35B15: 88 42 55 46 5F 0A 08 00 70 4C 32 4D 39           // .BUF_...pL2M9

Index (BUF, 0x09))
                        Store (L2MA, 
   35B22: 88 42 55 46 5F 0A 09 00 70 4C 32 4D 41           // .BUF_...pL2MA

Index (BUF, 0x0A))
                        Store (L2MB, 
   35B2F: 88 42 55 46 5F 0A 0A 00 70 4C 32 4D 42           // .BUF_...pL2MB

Index (BUF, 0x0B))
                        Store (L2MC, 
   35B3C: 88 42 55 46 5F 0A 0B 00 70 4C 32 4D 43           // .BUF_...pL2MC

Index (BUF, 0x0C))
                        Store (L2MD, 
   35B49: 88 42 55 46 5F 0A 0C 00 70 4C 32 4D 44           // .BUF_...pL2MD

Index (BUF, 0x0D))
                        Store (L2ME, 
   35B56: 88 42 55 46 5F 0A 0D 00 70 4C 32 4D 45           // .BUF_...pL2ME

Index (BUF, 0x0E))
                        Store (L2MF, 
   35B63: 88 42 55 46 5F 0A 0E 00 70 4C 32 4D 46           // .BUF_...pL2MF

Index (BUF, 0x0F))

   35B70: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                        Return (
   35B78: A4                                               // .

ToString (BUF, Ones))
                    }
                }


   35B79: 9C 42 55 46 5F FF 00                             // .BUF_..

                If (LEqual (Arg0, 
   35B80: A0 46 1E 93 68                                   // .F..h

ToUUID ("5815c5c8-c47d-477b-9a8d-76173176414b") /* Unknown UUID */))
                {

   35B85: 11 13 0A 10 C8 C5 15 58 7D C4 7B 47 9A 8D 76 17  // .......X}.{G..v.
   35B95: 31 76 41 4B                                      // 1vAK

                    If (LEqual (Arg2, Zero))
                    {

   35B99: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   35B9E: A0 09 93 69 00                                   // ...i.

                            Return (
   35BA3: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   35BA4: 11 03 01 03                                      // ....

                        Else
                        {

   35BA8: A1 06                                            // ..

                            Return (
   35BAA: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   35BAB: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   35BAF: A0 42 1B 93 6A 01                                // .B..j.

                        Name (DSMB, 
   35BB5: 08 44 53 4D 42                                   // .DSMB

Buffer (0x34){})

   35BBA: 11 03 0A 34                                      // ...4

                        CreateDWordField (DSMB, Zero, I2CC)

   35BBE: 8A 44 53 4D 42 00 49 32 43 43                    // .DSMB.I2CC

                        CreateDWordField (DSMB, 0x04, DEV0)

   35BC8: 8A 44 53 4D 42 0A 04 44 45 56 30                 // .DSMB..DEV0

                        CreateDWordField (DSMB, 0x08, DEV1)

   35BD3: 8A 44 53 4D 42 0A 08 44 45 56 31                 // .DSMB..DEV1

                        CreateDWordField (DSMB, 0x0C, DEV2)

   35BDE: 8A 44 53 4D 42 0A 0C 44 45 56 32                 // .DSMB..DEV2

                        CreateDWordField (DSMB, 0x10, DEV3)

   35BE9: 8A 44 53 4D 42 0A 10 44 45 56 33                 // .DSMB..DEV3

                        CreateDWordField (DSMB, 0x14, DEV4)

   35BF4: 8A 44 53 4D 42 0A 14 44 45 56 34                 // .DSMB..DEV4

                        CreateDWordField (DSMB, 0x18, DEV5)

   35BFF: 8A 44 53 4D 42 0A 18 44 45 56 35                 // .DSMB..DEV5

                        CreateDWordField (DSMB, 0x1C, DEV6)

   35C0A: 8A 44 53 4D 42 0A 1C 44 45 56 36                 // .DSMB..DEV6

                        CreateDWordField (DSMB, 0x20, DEV7)

   35C15: 8A 44 53 4D 42 0A 20 44 45 56 37                 // .DSMB. DEV7

                        CreateDWordField (DSMB, 0x24, DEV8)

   35C20: 8A 44 53 4D 42 0A 24 44 45 56 38                 // .DSMB.$DEV8

                        CreateDWordField (DSMB, 0x28, DEV9)

   35C2B: 8A 44 53 4D 42 0A 28 44 45 56 39                 // .DSMB.(DEV9

                        CreateDWordField (DSMB, 0x2C, DEVA)

   35C36: 8A 44 53 4D 42 0A 2C 44 45 56 41                 // .DSMB.,DEVA

                        CreateDWordField (DSMB, 0x30, DEVB)
                        Store (L2DI, I2CC) /* \_SB_.PCI0.LNK2._DSM.I2CC */
                        Store (DSMI (L2D0, L2A0, Zero, L2BS), DEV0) /* \_SB_.PCI0.LNK2._DSM.DEV0 */
                        Store (DSMI (L2D1, L2A1, Zero, L2BS), DEV1) /* \_SB_.PCI0.LNK2._DSM.DEV1 */
                        Store (DSMI (L2D2, L2A2, Zero, L2BS), DEV2) /* \_SB_.PCI0.LNK2._DSM.DEV2 */
                        Store (DSMI (L2D3, L2A3, Zero, L2BS), DEV3) /* \_SB_.PCI0.LNK2._DSM.DEV3 */
                        Store (DSMI (L2D4, L2A4, Zero, L2BS), DEV4) /* \_SB_.PCI0.LNK2._DSM.DEV4 */
                        Store (DSMI (L2D5, L2A5, Zero, L2BS), DEV5) /* \_SB_.PCI0.LNK2._DSM.DEV5 */
                        Store (DSMI (L2D6, L2A6, Zero, L2BS), DEV6) /* \_SB_.PCI0.LNK2._DSM.DEV6 */
                        Store (DSMI (L2D7, L2A7, Zero, L2BS), DEV7) /* \_SB_.PCI0.LNK2._DSM.DEV7 */
                        Store (DSMI (L2D8, L2A8, Zero, L2BS), DEV8) /* \_SB_.PCI0.LNK2._DSM.DEV8 */
                        Store (DSMI (L2D9, L2A9, Zero, L2BS), DEV9) /* \_SB_.PCI0.LNK2._DSM.DEV9 */
                        Store (DSMI (L2DA, L2AA, Zero, L2BS), DEVA) /* \_SB_.PCI0.LNK2._DSM.DEVA */
                        Store (DSMI (L2DB, L2AB, Zero, L2BS), DEVB) /* \_SB_.PCI0.LNK2._DSM.DEVB */

   35C41: 8A 44 53 4D 42 0A 30 44 45 56 42 70 4C 32 44 49  // .DSMB.0DEVBpL2DI
   35C51: 49 32 43 43 70 44 53 4D 49 4C 32 44 30 4C 32 41  // I2CCpDSMIL2D0L2A
   35C61: 30 00 4C 32 42 53 44 45 56 30 70 44 53 4D 49 4C  // 0.L2BSDEV0pDSMIL
   35C71: 32 44 31 4C 32 41 31 00 4C 32 42 53 44 45 56 31  // 2D1L2A1.L2BSDEV1
   35C81: 70 44 53 4D 49 4C 32 44 32 4C 32 41 32 00 4C 32  // pDSMIL2D2L2A2.L2
   35C91: 42 53 44 45 56 32 70 44 53 4D 49 4C 32 44 33 4C  // BSDEV2pDSMIL2D3L
   35CA1: 32 41 33 00 4C 32 42 53 44 45 56 33 70 44 53 4D  // 2A3.L2BSDEV3pDSM
   35CB1: 49 4C 32 44 34 4C 32 41 34 00 4C 32 42 53 44 45  // IL2D4L2A4.L2BSDE
   35CC1: 56 34 70 44 53 4D 49 4C 32 44 35 4C 32 41 35 00  // V4pDSMIL2D5L2A5.
   35CD1: 4C 32 42 53 44 45 56 35 70 44 53 4D 49 4C 32 44  // L2BSDEV5pDSMIL2D
   35CE1: 36 4C 32 41 36 00 4C 32 42 53 44 45 56 36 70 44  // 6L2A6.L2BSDEV6pD
   35CF1: 53 4D 49 4C 32 44 37 4C 32 41 37 00 4C 32 42 53  // SMIL2D7L2A7.L2BS
   35D01: 44 45 56 37 70 44 53 4D 49 4C 32 44 38 4C 32 41  // DEV7pDSMIL2D8L2A
   35D11: 38 00 4C 32 42 53 44 45 56 38 70 44 53 4D 49 4C  // 8.L2BSDEV8pDSMIL
   35D21: 32 44 39 4C 32 41 39 00 4C 32 42 53 44 45 56 39  // 2D9L2A9.L2BSDEV9
   35D31: 70 44 53 4D 49 4C 32 44 41 4C 32 41 41 00 4C 32  // pDSMIL2DAL2AA.L2
   35D41: 42 53 44 45 56 41 70 44 53 4D 49 4C 32 44 42 4C  // BSDEVApDSMIL2DBL
   35D51: 32 41 42 00 4C 32 42 53 44 45 56 42              // 2AB.L2BSDEVB

                        Return (DSMB) /* \_SB_.PCI0.LNK2._DSM.DSMB */
                    }


   35D5D: A4 44 53 4D 42                                   // .DSMB

                    Return (
   35D62: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   35D63: 11 03 01 00                                      // ....

                If (LEqual (Arg0, 
   35D67: A0 48 1E 93 68                                   // .H..h

ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881") /* Unknown UUID */))
                {

   35D6C: 11 13 0A 10 49 75 25 26 71 92 A4 4C BB 43 C4 89  // ....Iu%&q..L.C..
   35D7C: 9D 5A 48 81                                      // .ZH.

                    If (LEqual (Arg2, Zero))
                    {

   35D80: A0 0B 93 6A 00                                   // ...j.

                        Return (
   35D85: A4                                               // .

Buffer (0x02)
                        {
                             0xFF, 0x1F                                       // ..
                        })
                    }


   35D86: 11 05 0A 02 FF 1F                                // ......

                    If (LEqual (Arg2, One))
                    {

   35D8C: A0 09 93 6A 01                                   // ...j.

                        Return (L2DI) /* \L2DI */
                    }


   35D91: A4 4C 32 44 49                                   // .L2DI

                    If (LEqual (Arg2, 0x02))
                    {

   35D96: A0 23 93 6A 0A 02                                // .#.j..

                        If (LGreater (L2DI, Zero))
                        {

   35D9C: A0 19 94 4C 32 44 49 00                          // ...L2DI.

                            Return (DSMI (L2D0, L2A0, Zero, L2BS))
                        }

   35DA4: A4 44 53 4D 49 4C 32 44 30 4C 32 41 30 00 4C 32  // .DSMIL2D0L2A0.L2
   35DB4: 42 53                                            // BS

                        Else
                        {

   35DB6: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35DB8: A4 00                                            // ..

                    If (LEqual (Arg2, 0x03))
                    {

   35DBA: A0 23 93 6A 0A 03                                // .#.j..

                        If (LGreater (L2DI, One))
                        {

   35DC0: A0 19 94 4C 32 44 49 01                          // ...L2DI.

                            Return (DSMI (L2D1, L2A1, Zero, L2BS))
                        }

   35DC8: A4 44 53 4D 49 4C 32 44 31 4C 32 41 31 00 4C 32  // .DSMIL2D1L2A1.L2
   35DD8: 42 53                                            // BS

                        Else
                        {

   35DDA: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35DDC: A4 00                                            // ..

                    If (LEqual (Arg2, 0x04))
                    {

   35DDE: A0 24 93 6A 0A 04                                // .$.j..

                        If (LGreater (L2DI, 0x02))
                        {

   35DE4: A0 1A 94 4C 32 44 49 0A 02                       // ...L2DI..

                            Return (DSMI (L2D2, L2A2, Zero, L2BS))
                        }

   35DED: A4 44 53 4D 49 4C 32 44 32 4C 32 41 32 00 4C 32  // .DSMIL2D2L2A2.L2
   35DFD: 42 53                                            // BS

                        Else
                        {

   35DFF: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35E01: A4 00                                            // ..

                    If (LEqual (Arg2, 0x05))
                    {

   35E03: A0 24 93 6A 0A 05                                // .$.j..

                        If (LGreater (L2DI, 0x03))
                        {

   35E09: A0 1A 94 4C 32 44 49 0A 03                       // ...L2DI..

                            Return (DSMI (L2D3, L2A3, Zero, L2BS))
                        }

   35E12: A4 44 53 4D 49 4C 32 44 33 4C 32 41 33 00 4C 32  // .DSMIL2D3L2A3.L2
   35E22: 42 53                                            // BS

                        Else
                        {

   35E24: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35E26: A4 00                                            // ..

                    If (LEqual (Arg2, 0x06))
                    {

   35E28: A0 24 93 6A 0A 06                                // .$.j..

                        If (LGreater (L2DI, 0x04))
                        {

   35E2E: A0 1A 94 4C 32 44 49 0A 04                       // ...L2DI..

                            Return (DSMI (L2D4, L2A4, Zero, L2BS))
                        }

   35E37: A4 44 53 4D 49 4C 32 44 34 4C 32 41 34 00 4C 32  // .DSMIL2D4L2A4.L2
   35E47: 42 53                                            // BS

                        Else
                        {

   35E49: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35E4B: A4 00                                            // ..

                    If (LEqual (Arg2, 0x07))
                    {

   35E4D: A0 24 93 6A 0A 07                                // .$.j..

                        If (LGreater (L2DI, 0x05))
                        {

   35E53: A0 1A 94 4C 32 44 49 0A 05                       // ...L2DI..

                            Return (DSMI (L2D5, L2A5, Zero, L2BS))
                        }

   35E5C: A4 44 53 4D 49 4C 32 44 35 4C 32 41 35 00 4C 32  // .DSMIL2D5L2A5.L2
   35E6C: 42 53                                            // BS

                        Else
                        {

   35E6E: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35E70: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   35E72: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L2DI, 0x06))
                        {

   35E78: A0 1A 94 4C 32 44 49 0A 06                       // ...L2DI..

                            Return (DSMI (L2D6, L2A6, Zero, L2BS))
                        }

   35E81: A4 44 53 4D 49 4C 32 44 36 4C 32 41 36 00 4C 32  // .DSMIL2D6L2A6.L2
   35E91: 42 53                                            // BS

                        Else
                        {

   35E93: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35E95: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   35E97: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L2DI, 0x07))
                        {

   35E9D: A0 1A 94 4C 32 44 49 0A 07                       // ...L2DI..

                            Return (DSMI (L2D7, L2A7, Zero, L2BS))
                        }

   35EA6: A4 44 53 4D 49 4C 32 44 37 4C 32 41 37 00 4C 32  // .DSMIL2D7L2A7.L2
   35EB6: 42 53                                            // BS

                        Else
                        {

   35EB8: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35EBA: A4 00                                            // ..

                    If (LEqual (Arg2, 0x09))
                    {

   35EBC: A0 24 93 6A 0A 09                                // .$.j..

                        If (LGreater (L2DI, 0x08))
                        {

   35EC2: A0 1A 94 4C 32 44 49 0A 08                       // ...L2DI..

                            Return (DSMI (L2D8, L2A8, Zero, L2BS))
                        }

   35ECB: A4 44 53 4D 49 4C 32 44 38 4C 32 41 38 00 4C 32  // .DSMIL2D8L2A8.L2
   35EDB: 42 53                                            // BS

                        Else
                        {

   35EDD: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35EDF: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0A))
                    {

   35EE1: A0 24 93 6A 0A 0A                                // .$.j..

                        If (LGreater (L2DI, 0x09))
                        {

   35EE7: A0 1A 94 4C 32 44 49 0A 09                       // ...L2DI..

                            Return (DSMI (L2D9, L2A9, Zero, L2BS))
                        }

   35EF0: A4 44 53 4D 49 4C 32 44 39 4C 32 41 39 00 4C 32  // .DSMIL2D9L2A9.L2
   35F00: 42 53                                            // BS

                        Else
                        {

   35F02: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35F04: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0B))
                    {

   35F06: A0 24 93 6A 0A 0B                                // .$.j..

                        If (LGreater (L2DI, 0x0A))
                        {

   35F0C: A0 1A 94 4C 32 44 49 0A 0A                       // ...L2DI..

                            Return (DSMI (L2DA, L2AA, Zero, L2BS))
                        }

   35F15: A4 44 53 4D 49 4C 32 44 41 4C 32 41 41 00 4C 32  // .DSMIL2DAL2AA.L2
   35F25: 42 53                                            // BS

                        Else
                        {

   35F27: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   35F29: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0C))
                    {

   35F2B: A0 24 93 6A 0A 0C                                // .$.j..

                        If (LGreater (L2DI, 0x0B))
                        {

   35F31: A0 1A 94 4C 32 44 49 0A 0B                       // ...L2DI..

                            Return (DSMI (L2DB, L2AB, Zero, L2BS))
                        }

   35F3A: A4 44 53 4D 49 4C 32 44 42 4C 32 41 42 00 4C 32  // .DSMIL2DBL2AB.L2
   35F4A: 42 53                                            // BS

                        Else
                        {

   35F4C: A1 03                                            // ..

                            Return (Zero)
                        }
                    }
                }


   35F4E: A4 00                                            // ..

                Return (
   35F50: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }


   35F51: 11 03 01 00                                      // ....

        Device (LNK3)
        {

   35F55: 5B 82 4E 97 4C 4E 4B 33                          // [.N.LNK3

            Name (_ADR, Zero)  // _ADR: Address

   35F5D: 08 5F 41 44 52 00                                // ._ADR.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   35F63: 14 13 5F 53 54 41 00                             // .._STA.

                If (L3EN)
                {

   35F6A: A0 08 4C 33 45 4E                                // ..L3EN

                    Return (0x0F)
                }

   35F70: A4 0A 0F                                         // ...

                Else
                {

   35F73: A1 03                                            // ..

                    Return (Zero)
                }
            }


   35F75: A4 00                                            // ..

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {

   35F77: 14 1F 5F 44 45 50 00                             // .._DEP.

                If (L3EN)
                {

   35F7E: A0 0E 4C 33 45 4E                                // ..L3EN

                    Return (CDEP (L3CL))
                }

   35F84: A4 43 44 45 50 4C 33 43 4C                       // .CDEPL3CL

                Else
                {

   35F8D: A1 09                                            // ..

                    Return (
   35F8F: A4                                               // .

Package (0x01)
                    {
                        PCI0, 
                    })
                }
            }


   35F90: 12 06 01 50 43 49 30                             // ...PCI0

            Name (_UID, 0x03)  // _UID: Unique ID

   35F97: 08 5F 55 49 44 0A 03                             // ._UID..

            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {

   35F9E: 14 0D 5F 48 49 44 00                             // .._HID.

                Return (HCID (0x03))
            }


   35FA5: A4 48 43 49 44 0A 03                             // .HCID..

            Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
            {

   35FAC: 14 0D 5F 43 49 44 00                             // .._CID.

                Return (HCID (0x03))
            }


   35FB3: A4 48 43 49 44 0A 03                             // .HCID..

            Method (_DDN, 0, NotSerialized)  // _DDN: DOS Device Name
            {

   35FBA: 14 46 0E 5F 44 44 4E 00                          // .F._DDN.

                Name (BUF, 
   35FC2: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                Store (L3M0, 
   35FC7: 11 03 0A 10 70 4C 33 4D 30                       // ....pL3M0

Index (BUF, Zero))
                Store (L3M1, 
   35FD0: 88 42 55 46 5F 00 00 70 4C 33 4D 31              // .BUF_..pL3M1

Index (BUF, One))
                Store (L3M2, 
   35FDC: 88 42 55 46 5F 01 00 70 4C 33 4D 32              // .BUF_..pL3M2

Index (BUF, 0x02))
                Store (L3M3, 
   35FE8: 88 42 55 46 5F 0A 02 00 70 4C 33 4D 33           // .BUF_...pL3M3

Index (BUF, 0x03))
                Store (L3M4, 
   35FF5: 88 42 55 46 5F 0A 03 00 70 4C 33 4D 34           // .BUF_...pL3M4

Index (BUF, 0x04))
                Store (L3M5, 
   36002: 88 42 55 46 5F 0A 04 00 70 4C 33 4D 35           // .BUF_...pL3M5

Index (BUF, 0x05))
                Store (L3M6, 
   3600F: 88 42 55 46 5F 0A 05 00 70 4C 33 4D 36           // .BUF_...pL3M6

Index (BUF, 0x06))
                Store (L3M7, 
   3601C: 88 42 55 46 5F 0A 06 00 70 4C 33 4D 37           // .BUF_...pL3M7

Index (BUF, 0x07))
                Store (L3M8, 
   36029: 88 42 55 46 5F 0A 07 00 70 4C 33 4D 38           // .BUF_...pL3M8

Index (BUF, 0x08))
                Store (L3M9, 
   36036: 88 42 55 46 5F 0A 08 00 70 4C 33 4D 39           // .BUF_...pL3M9

Index (BUF, 0x09))
                Store (L3MA, 
   36043: 88 42 55 46 5F 0A 09 00 70 4C 33 4D 41           // .BUF_...pL3MA

Index (BUF, 0x0A))
                Store (L3MB, 
   36050: 88 42 55 46 5F 0A 0A 00 70 4C 33 4D 42           // .BUF_...pL3MB

Index (BUF, 0x0B))
                Store (L3MC, 
   3605D: 88 42 55 46 5F 0A 0B 00 70 4C 33 4D 43           // .BUF_...pL3MC

Index (BUF, 0x0C))
                Store (L3MD, 
   3606A: 88 42 55 46 5F 0A 0C 00 70 4C 33 4D 44           // .BUF_...pL3MD

Index (BUF, 0x0D))
                Store (L3ME, 
   36077: 88 42 55 46 5F 0A 0D 00 70 4C 33 4D 45           // .BUF_...pL3ME

Index (BUF, 0x0E))
                Store (L3MF, 
   36084: 88 42 55 46 5F 0A 0E 00 70 4C 33 4D 46           // .BUF_...pL3MF

Index (BUF, 0x0F))

   36091: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                Return (
   36099: A4                                               // .

ToString (BUF, Ones))
            }


   3609A: 9C 42 55 46 5F FF 00                             // .BUF_..

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {

   360A1: 14 48 08 5F 50 4C 44 08                          // .H._PLD.

                Name (PLDB, 
   360A9: 08 50 4C 44 42                                   // .PLDB

Package (0x03)
                {

   360AE: 12 43 04 03                                      // .C..

                    Buffer (0x14)
                    {
                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x69, 0x0E, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // i.......
                        /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                    }, 


   360B2: 11 17 0A 14 82 00 00 00 00 00 00 00 69 0E 00 00  // ............i...
   360C2: 03 00 00 00 FF FF FF FF                          // ........

                    ToUUID ("59af1a1f-aba4-4bb8-81ef-55938e9bc53a") /* Unknown UUID */, 

   360CA: 11 13 0A 10 1F 1A AF 59 A4 AB B8 4B 81 EF 55 93  // .......Y...K..U.
   360DA: 8E 9B C5 3A                                      // ...:

                    Buffer (0x10)
                    {
                        /* 0000 */  0xE1, 0x41, 0xD6, 0x16, 0xC8, 0x00, 0xC8, 0x00,  // .A......
                        /* 0008 */  0x14, 0x00, 0x70, 0x01, 0x7E, 0x04, 0x28, 0x00   // ..p.~.(.
                    }
                })

   360DE: 11 13 0A 10 E1 41 D6 16 C8 00 C8 00 14 00 70 01  // .....A........p.
   360EE: 7E 04 28 00                                      // ~.(.

                CreateByteField (DerefOf (
   360F2: 8C 83                                            // ..

Index (PLDB, Zero)), 0x08, BPOS)

   360F4: 88 50 4C 44 42 00 00 0A 08 42 50 4F 53           // .PLDB....BPOS

                CreateField (DerefOf (
   36101: 5B 13 83                                         // [..

Index (PLDB, Zero)), 0x73, 0x04, RPOS)
                Store (L3PL, BPOS) /* \_SB_.PCI0.LNK3._PLD.BPOS */
                Store (L3DG, RPOS) /* \_SB_.PCI0.LNK3._PLD.RPOS */

   36104: 88 50 4C 44 42 00 00 0A 73 0A 04 52 50 4F 53 70  // .PLDB...s..RPOSp
   36114: 4C 33 50 4C 42 50 4F 53 70 4C 33 44 47 52 50 4F  // L3PLBPOSpL3DGRPO
   36124: 53                                               // S

                Return (PLDB) /* \_SB_.PCI0.LNK3._PLD.PLDB */
            }


   36125: A4 50 4C 44 42                                   // .PLDB

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Store (
   3612A: 14 47 17 5F 43 52 53 00 70                       // .G._CRS.p

Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }, Local0)

   36133: 11 05 0A 02 79 00 60                             // ....y.`

                If (LGreater (L3DI, Zero))
                {
                    Store (IICB (L3A0, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   3613A: A0 1C 94 4C 33 44 49 00 70 49 49 43 42 4C 33 41  // ...L3DI.pIICBL3A
   3614A: 30 4C 33 42 53 61 84 60 61 62                    // 0L3BSa.`ab

                    Store (Local2, Local0)
                }


   36154: 70 62 60                                         // pb`

                If (LGreater (L3DI, One))
                {
                    Store (IICB (L3A1, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36157: A0 1C 94 4C 33 44 49 01 70 49 49 43 42 4C 33 41  // ...L3DI.pIICBL3A
   36167: 31 4C 33 42 53 61 84 60 61 62                    // 1L3BSa.`ab

                    Store (Local2, Local0)
                }


   36171: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x02))
                {
                    Store (IICB (L3A2, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36174: A0 1D 94 4C 33 44 49 0A 02 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   36184: 41 32 4C 33 42 53 61 84 60 61 62                 // A2L3BSa.`ab

                    Store (Local2, Local0)
                }


   3618F: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x03))
                {
                    Store (IICB (L3A3, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36192: A0 1D 94 4C 33 44 49 0A 03 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   361A2: 41 33 4C 33 42 53 61 84 60 61 62                 // A3L3BSa.`ab

                    Store (Local2, Local0)
                }


   361AD: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x04))
                {
                    Store (IICB (L3A4, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   361B0: A0 1D 94 4C 33 44 49 0A 04 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   361C0: 41 34 4C 33 42 53 61 84 60 61 62                 // A4L3BSa.`ab

                    Store (Local2, Local0)
                }


   361CB: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x05))
                {
                    Store (IICB (L3A5, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   361CE: A0 1D 94 4C 33 44 49 0A 05 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   361DE: 41 35 4C 33 42 53 61 84 60 61 62                 // A5L3BSa.`ab

                    Store (Local2, Local0)
                }


   361E9: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x06))
                {
                    Store (IICB (L3A6, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   361EC: A0 1D 94 4C 33 44 49 0A 06 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   361FC: 41 36 4C 33 42 53 61 84 60 61 62                 // A6L3BSa.`ab

                    Store (Local2, Local0)
                }


   36207: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x07))
                {
                    Store (IICB (L3A7, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   3620A: A0 1D 94 4C 33 44 49 0A 07 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   3621A: 41 37 4C 33 42 53 61 84 60 61 62                 // A7L3BSa.`ab

                    Store (Local2, Local0)
                }


   36225: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x08))
                {
                    Store (IICB (L3A8, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36228: A0 1D 94 4C 33 44 49 0A 08 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   36238: 41 38 4C 33 42 53 61 84 60 61 62                 // A8L3BSa.`ab

                    Store (Local2, Local0)
                }


   36243: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x09))
                {
                    Store (IICB (L3A9, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36246: A0 1D 94 4C 33 44 49 0A 09 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   36256: 41 39 4C 33 42 53 61 84 60 61 62                 // A9L3BSa.`ab

                    Store (Local2, Local0)
                }


   36261: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x0A))
                {
                    Store (IICB (L3AA, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36264: A0 1D 94 4C 33 44 49 0A 0A 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   36274: 41 41 4C 33 42 53 61 84 60 61 62                 // AAL3BSa.`ab

                    Store (Local2, Local0)
                }


   3627F: 70 62 60                                         // pb`

                If (LGreater (L3DI, 0x0B))
                {
                    Store (IICB (L3AB, L3BS), Local1)
                    ConcatenateResTemplate (Local0, Local1, Local2)

   36282: A0 1D 94 4C 33 44 49 0A 0B 70 49 49 43 42 4C 33  // ...L3DI..pIICBL3
   36292: 41 42 4C 33 42 53 61 84 60 61 62                 // ABL3BSa.`ab

                    Store (Local2, Local0)
                }


   3629D: 70 62 60                                         // pb`

                Return (Local0)
            }


   362A0: A4 60                                            // .`

            Method (SSDB, 0, NotSerialized)
            {

   362A2: 14 41 14 53 53 44 42 00                          // .A.SSDB.

                Name (PAR, 
   362AA: 08 50 41 52 5F                                   // .PAR_

Buffer (0x6C)
                {
                    /* 0000 */  0x00, 0x00, 0x69, 0x56, 0x39, 0x8A, 0xF7, 0x11,  // ..iV9...
                    /* 0008 */  0xA9, 0x4E, 0x9C, 0x7D, 0x20, 0xEE, 0x0A, 0xB5,  // .N.} ...
                    /* 0010 */  0xCA, 0x40, 0xA3, 0x00, 0x00, 0x00, 0x00, 0x00,  // .@......
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0050 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0068 */  0x00, 0x00, 0x00, 0x00                           // ....
                })
                Store (L3DV, 
   362AF: 11 40 07 0A 6C 00 00 69 56 39 8A F7 11 A9 4E 9C  // .@..l..iV9....N.
   362BF: 7D 20 EE 0A B5 CA 40 A3 00 00 00 00 00 00 00 00  // } ....@.........
   362CF: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   362DF: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   362EF: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   362FF: 00 00 00 00 00 0A 00 00 00 00 01 00 00 00 00 00  // ................
   3630F: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   3631F: 00 70 4C 33 44 56                                // .pL3DV

Index (PAR, Zero))
                Store (L3CV, 
   36325: 88 50 41 52 5F 00 00 70 4C 33 43 56              // .PAR_..pL3CV

Index (PAR, One))
                Store (CDIV, 
   36331: 88 50 41 52 5F 01 00 70 43 44 49 56              // .PAR_..pCDIV

Index (PAR, 0x18))
                Store (L3LU, 
   3633D: 88 50 41 52 5F 0A 18 00 70 4C 33 4C 55           // .PAR_...pL3LU

Index (PAR, 0x1C))
                Store (L3NL, 
   3634A: 88 50 41 52 5F 0A 1C 00 70 4C 33 4E 4C           // .PAR_...pL3NL

Index (PAR, 0x1D))
                Store (L3EE, 
   36357: 88 50 41 52 5F 0A 1D 00 70 4C 33 45 45           // .PAR_...pL3EE

Index (PAR, 0x4E))
                Store (L3VC, 
   36364: 88 50 41 52 5F 0A 4E 00 70 4C 33 56 43           // .PAR_.N.pL3VC

Index (PAR, 0x4F))
                Store (L3FS, 
   36371: 88 50 41 52 5F 0A 4F 00 70 4C 33 46 53           // .PAR_.O.pL3FS

Index (PAR, 0x52))
                Store (L3LE, 
   3637E: 88 50 41 52 5F 0A 52 00 70 4C 33 4C 45           // .PAR_.R.pL3LE

Index (PAR, 0x53))
                Store (CDEG (L3DG), 
   3638B: 88 50 41 52 5F 0A 53 00 70 43 44 45 47 4C 33 44  // .PAR_.S.pCDEGL3D
   3639B: 47                                               // G

Index (PAR, 0x54))

   3639C: 88 50 41 52 5F 0A 54 00                          // .PAR_.T.

                CreateDWordField (PAR, 0x56, DAT)
                Store (L3CK, DAT) /* \_SB_.PCI0.LNK3.SSDB.DAT_ */
                Store (L3CL, 
   363A4: 8A 50 41 52 5F 0A 56 44 41 54 5F 70 4C 33 43 4B  // .PAR_.VDAT_pL3CK
   363B4: 44 41 54 5F 70 4C 33 43 4C                       // DAT_pL3CL

Index (PAR, 0x5A))
                Store (L3PP, 
   363BD: 88 50 41 52 5F 0A 5A 00 70 4C 33 50 50           // .PAR_.Z.pL3PP

Index (PAR, 0x5F))
                Store (L3VR, 
   363CA: 88 50 41 52 5F 0A 5F 00 70 4C 33 56 52           // .PAR_._.pL3VR

Index (PAR, 0x60))

   363D7: 88 50 41 52 5F 0A 60 00                          // .PAR_.`.

                Return (PAR) /* \_SB_.PCI0.LNK3.SSDB.PAR_ */
            }


   363DF: A4 50 41 52 5F                                   // .PAR_

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   363E4: 14 40 4F 5F 44 53 4D 04                          // .@O_DSM.

                If (LEqual (Arg0, 
   363EC: A0 43 11 93 68                                   // .C..h

ToUUID ("822ace8f-2814-4174-a56b-5f029fe079ee") /* Unknown UUID */))
                {

   363F1: 11 13 0A 10 8F CE 2A 82 14 28 74 41 A5 6B 5F 02  // ......*..(tA.k_.
   36401: 9F E0 79 EE                                      // ..y.

                    If (LEqual (Arg2, Zero))
                    {

   36405: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   3640A: A0 09 93 69 00                                   // ...i.

                            Return (
   3640F: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   36410: 11 03 01 03                                      // ....

                        Else
                        {

   36414: A1 06                                            // ..

                            Return (
   36416: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   36417: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   3641B: A0 44 0E 93 6A 01                                // .D..j.

                        Name (BUF, 
   36421: 08 42 55 46 5F                                   // .BUF_

Buffer (0x10){})
                        Store (L3M0, 
   36426: 11 03 0A 10 70 4C 33 4D 30                       // ....pL3M0

Index (BUF, Zero))
                        Store (L3M1, 
   3642F: 88 42 55 46 5F 00 00 70 4C 33 4D 31              // .BUF_..pL3M1

Index (BUF, One))
                        Store (L3M2, 
   3643B: 88 42 55 46 5F 01 00 70 4C 33 4D 32              // .BUF_..pL3M2

Index (BUF, 0x02))
                        Store (L3M3, 
   36447: 88 42 55 46 5F 0A 02 00 70 4C 33 4D 33           // .BUF_...pL3M3

Index (BUF, 0x03))
                        Store (L3M4, 
   36454: 88 42 55 46 5F 0A 03 00 70 4C 33 4D 34           // .BUF_...pL3M4

Index (BUF, 0x04))
                        Store (L3M5, 
   36461: 88 42 55 46 5F 0A 04 00 70 4C 33 4D 35           // .BUF_...pL3M5

Index (BUF, 0x05))
                        Store (L3M6, 
   3646E: 88 42 55 46 5F 0A 05 00 70 4C 33 4D 36           // .BUF_...pL3M6

Index (BUF, 0x06))
                        Store (L3M7, 
   3647B: 88 42 55 46 5F 0A 06 00 70 4C 33 4D 37           // .BUF_...pL3M7

Index (BUF, 0x07))
                        Store (L3M8, 
   36488: 88 42 55 46 5F 0A 07 00 70 4C 33 4D 38           // .BUF_...pL3M8

Index (BUF, 0x08))
                        Store (L3M9, 
   36495: 88 42 55 46 5F 0A 08 00 70 4C 33 4D 39           // .BUF_...pL3M9

Index (BUF, 0x09))
                        Store (L3MA, 
   364A2: 88 42 55 46 5F 0A 09 00 70 4C 33 4D 41           // .BUF_...pL3MA

Index (BUF, 0x0A))
                        Store (L3MB, 
   364AF: 88 42 55 46 5F 0A 0A 00 70 4C 33 4D 42           // .BUF_...pL3MB

Index (BUF, 0x0B))
                        Store (L3MC, 
   364BC: 88 42 55 46 5F 0A 0B 00 70 4C 33 4D 43           // .BUF_...pL3MC

Index (BUF, 0x0C))
                        Store (L3MD, 
   364C9: 88 42 55 46 5F 0A 0C 00 70 4C 33 4D 44           // .BUF_...pL3MD

Index (BUF, 0x0D))
                        Store (L3ME, 
   364D6: 88 42 55 46 5F 0A 0D 00 70 4C 33 4D 45           // .BUF_...pL3ME

Index (BUF, 0x0E))
                        Store (L3MF, 
   364E3: 88 42 55 46 5F 0A 0E 00 70 4C 33 4D 46           // .BUF_...pL3MF

Index (BUF, 0x0F))

   364F0: 88 42 55 46 5F 0A 0F 00                          // .BUF_...

                        Return (
   364F8: A4                                               // .

ToString (BUF, Ones))
                    }
                }


   364F9: 9C 42 55 46 5F FF 00                             // .BUF_..

                If (LEqual (Arg0, 
   36500: A0 46 1E 93 68                                   // .F..h

ToUUID ("5815c5c8-c47d-477b-9a8d-76173176414b") /* Unknown UUID */))
                {

   36505: 11 13 0A 10 C8 C5 15 58 7D C4 7B 47 9A 8D 76 17  // .......X}.{G..v.
   36515: 31 76 41 4B                                      // 1vAK

                    If (LEqual (Arg2, Zero))
                    {

   36519: A0 15 93 6A 00                                   // ...j.

                        If (LEqual (Arg1, Zero))
                        {

   3651E: A0 09 93 69 00                                   // ...i.

                            Return (
   36523: A4                                               // .

Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

   36524: 11 03 01 03                                      // ....

                        Else
                        {

   36528: A1 06                                            // ..

                            Return (
   3652A: A4                                               // .

Buffer (One)
                            {
                                 0x01                                             // .
                            })
                        }
                    }


   3652B: 11 03 01 01                                      // ....

                    If (LEqual (Arg2, One))
                    {

   3652F: A0 42 1B 93 6A 01                                // .B..j.

                        Name (DSMB, 
   36535: 08 44 53 4D 42                                   // .DSMB

Buffer (0x34){})

   3653A: 11 03 0A 34                                      // ...4

                        CreateDWordField (DSMB, Zero, I2CC)

   3653E: 8A 44 53 4D 42 00 49 32 43 43                    // .DSMB.I2CC

                        CreateDWordField (DSMB, 0x04, DEV0)

   36548: 8A 44 53 4D 42 0A 04 44 45 56 30                 // .DSMB..DEV0

                        CreateDWordField (DSMB, 0x08, DEV1)

   36553: 8A 44 53 4D 42 0A 08 44 45 56 31                 // .DSMB..DEV1

                        CreateDWordField (DSMB, 0x0C, DEV2)

   3655E: 8A 44 53 4D 42 0A 0C 44 45 56 32                 // .DSMB..DEV2

                        CreateDWordField (DSMB, 0x10, DEV3)

   36569: 8A 44 53 4D 42 0A 10 44 45 56 33                 // .DSMB..DEV3

                        CreateDWordField (DSMB, 0x14, DEV4)

   36574: 8A 44 53 4D 42 0A 14 44 45 56 34                 // .DSMB..DEV4

                        CreateDWordField (DSMB, 0x18, DEV5)

   3657F: 8A 44 53 4D 42 0A 18 44 45 56 35                 // .DSMB..DEV5

                        CreateDWordField (DSMB, 0x1C, DEV6)

   3658A: 8A 44 53 4D 42 0A 1C 44 45 56 36                 // .DSMB..DEV6

                        CreateDWordField (DSMB, 0x20, DEV7)

   36595: 8A 44 53 4D 42 0A 20 44 45 56 37                 // .DSMB. DEV7

                        CreateDWordField (DSMB, 0x24, DEV8)

   365A0: 8A 44 53 4D 42 0A 24 44 45 56 38                 // .DSMB.$DEV8

                        CreateDWordField (DSMB, 0x28, DEV9)

   365AB: 8A 44 53 4D 42 0A 28 44 45 56 39                 // .DSMB.(DEV9

                        CreateDWordField (DSMB, 0x2C, DEVA)

   365B6: 8A 44 53 4D 42 0A 2C 44 45 56 41                 // .DSMB.,DEVA

                        CreateDWordField (DSMB, 0x30, DEVB)
                        Store (L3DI, I2CC) /* \_SB_.PCI0.LNK3._DSM.I2CC */
                        Store (DSMI (L3D0, L3A0, Zero, L3BS), DEV0) /* \_SB_.PCI0.LNK3._DSM.DEV0 */
                        Store (DSMI (L3D1, L3A1, Zero, L3BS), DEV1) /* \_SB_.PCI0.LNK3._DSM.DEV1 */
                        Store (DSMI (L3D2, L3A2, Zero, L3BS), DEV2) /* \_SB_.PCI0.LNK3._DSM.DEV2 */
                        Store (DSMI (L3D3, L3A3, Zero, L3BS), DEV3) /* \_SB_.PCI0.LNK3._DSM.DEV3 */
                        Store (DSMI (L3D4, L3A4, Zero, L3BS), DEV4) /* \_SB_.PCI0.LNK3._DSM.DEV4 */
                        Store (DSMI (L3D5, L3A5, Zero, L3BS), DEV5) /* \_SB_.PCI0.LNK3._DSM.DEV5 */
                        Store (DSMI (L3D6, L3A6, Zero, L3BS), DEV6) /* \_SB_.PCI0.LNK3._DSM.DEV6 */
                        Store (DSMI (L3D7, L3A7, Zero, L3BS), DEV7) /* \_SB_.PCI0.LNK3._DSM.DEV7 */
                        Store (DSMI (L3D8, L3A8, Zero, L3BS), DEV8) /* \_SB_.PCI0.LNK3._DSM.DEV8 */
                        Store (DSMI (L3D9, L3A9, Zero, L3BS), DEV9) /* \_SB_.PCI0.LNK3._DSM.DEV9 */
                        Store (DSMI (L3DA, L3AA, Zero, L3BS), DEVA) /* \_SB_.PCI0.LNK3._DSM.DEVA */
                        Store (DSMI (L3DB, L3AB, Zero, L3BS), DEVB) /* \_SB_.PCI0.LNK3._DSM.DEVB */

   365C1: 8A 44 53 4D 42 0A 30 44 45 56 42 70 4C 33 44 49  // .DSMB.0DEVBpL3DI
   365D1: 49 32 43 43 70 44 53 4D 49 4C 33 44 30 4C 33 41  // I2CCpDSMIL3D0L3A
   365E1: 30 00 4C 33 42 53 44 45 56 30 70 44 53 4D 49 4C  // 0.L3BSDEV0pDSMIL
   365F1: 33 44 31 4C 33 41 31 00 4C 33 42 53 44 45 56 31  // 3D1L3A1.L3BSDEV1
   36601: 70 44 53 4D 49 4C 33 44 32 4C 33 41 32 00 4C 33  // pDSMIL3D2L3A2.L3
   36611: 42 53 44 45 56 32 70 44 53 4D 49 4C 33 44 33 4C  // BSDEV2pDSMIL3D3L
   36621: 33 41 33 00 4C 33 42 53 44 45 56 33 70 44 53 4D  // 3A3.L3BSDEV3pDSM
   36631: 49 4C 33 44 34 4C 33 41 34 00 4C 33 42 53 44 45  // IL3D4L3A4.L3BSDE
   36641: 56 34 70 44 53 4D 49 4C 33 44 35 4C 33 41 35 00  // V4pDSMIL3D5L3A5.
   36651: 4C 33 42 53 44 45 56 35 70 44 53 4D 49 4C 33 44  // L3BSDEV5pDSMIL3D
   36661: 36 4C 33 41 36 00 4C 33 42 53 44 45 56 36 70 44  // 6L3A6.L3BSDEV6pD
   36671: 53 4D 49 4C 33 44 37 4C 33 41 37 00 4C 33 42 53  // SMIL3D7L3A7.L3BS
   36681: 44 45 56 37 70 44 53 4D 49 4C 33 44 38 4C 33 41  // DEV7pDSMIL3D8L3A
   36691: 38 00 4C 33 42 53 44 45 56 38 70 44 53 4D 49 4C  // 8.L3BSDEV8pDSMIL
   366A1: 33 44 39 4C 33 41 39 00 4C 33 42 53 44 45 56 39  // 3D9L3A9.L3BSDEV9
   366B1: 70 44 53 4D 49 4C 33 44 41 4C 33 41 41 00 4C 33  // pDSMIL3DAL3AA.L3
   366C1: 42 53 44 45 56 41 70 44 53 4D 49 4C 33 44 42 4C  // BSDEVApDSMIL3DBL
   366D1: 33 41 42 00 4C 33 42 53 44 45 56 42              // 3AB.L3BSDEVB

                        Return (DSMB) /* \_SB_.PCI0.LNK3._DSM.DSMB */
                    }


   366DD: A4 44 53 4D 42                                   // .DSMB

                    Return (
   366E2: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   366E3: 11 03 01 00                                      // ....

                If (LEqual (Arg0, 
   366E7: A0 48 1E 93 68                                   // .H..h

ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881") /* Unknown UUID */))
                {

   366EC: 11 13 0A 10 49 75 25 26 71 92 A4 4C BB 43 C4 89  // ....Iu%&q..L.C..
   366FC: 9D 5A 48 81                                      // .ZH.

                    If (LEqual (Arg2, Zero))
                    {

   36700: A0 0B 93 6A 00                                   // ...j.

                        Return (
   36705: A4                                               // .

Buffer (0x02)
                        {
                             0xFF, 0x1F                                       // ..
                        })
                    }


   36706: 11 05 0A 02 FF 1F                                // ......

                    If (LEqual (Arg2, One))
                    {

   3670C: A0 09 93 6A 01                                   // ...j.

                        Return (L3DI) /* \L3DI */
                    }


   36711: A4 4C 33 44 49                                   // .L3DI

                    If (LEqual (Arg2, 0x02))
                    {

   36716: A0 23 93 6A 0A 02                                // .#.j..

                        If (LGreater (L3DI, Zero))
                        {

   3671C: A0 19 94 4C 33 44 49 00                          // ...L3DI.

                            Return (DSMI (L3D0, L3A0, Zero, L3BS))
                        }

   36724: A4 44 53 4D 49 4C 33 44 30 4C 33 41 30 00 4C 33  // .DSMIL3D0L3A0.L3
   36734: 42 53                                            // BS

                        Else
                        {

   36736: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   36738: A4 00                                            // ..

                    If (LEqual (Arg2, 0x03))
                    {

   3673A: A0 23 93 6A 0A 03                                // .#.j..

                        If (LGreater (L3DI, One))
                        {

   36740: A0 19 94 4C 33 44 49 01                          // ...L3DI.

                            Return (DSMI (L3D1, L3A1, Zero, L3BS))
                        }

   36748: A4 44 53 4D 49 4C 33 44 31 4C 33 41 31 00 4C 33  // .DSMIL3D1L3A1.L3
   36758: 42 53                                            // BS

                        Else
                        {

   3675A: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   3675C: A4 00                                            // ..

                    If (LEqual (Arg2, 0x04))
                    {

   3675E: A0 24 93 6A 0A 04                                // .$.j..

                        If (LGreater (L3DI, 0x02))
                        {

   36764: A0 1A 94 4C 33 44 49 0A 02                       // ...L3DI..

                            Return (DSMI (L3D2, L3A2, Zero, L3BS))
                        }

   3676D: A4 44 53 4D 49 4C 33 44 32 4C 33 41 32 00 4C 33  // .DSMIL3D2L3A2.L3
   3677D: 42 53                                            // BS

                        Else
                        {

   3677F: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   36781: A4 00                                            // ..

                    If (LEqual (Arg2, 0x05))
                    {

   36783: A0 24 93 6A 0A 05                                // .$.j..

                        If (LGreater (L3DI, 0x03))
                        {

   36789: A0 1A 94 4C 33 44 49 0A 03                       // ...L3DI..

                            Return (DSMI (L3D3, L3A3, Zero, L3BS))
                        }

   36792: A4 44 53 4D 49 4C 33 44 33 4C 33 41 33 00 4C 33  // .DSMIL3D3L3A3.L3
   367A2: 42 53                                            // BS

                        Else
                        {

   367A4: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   367A6: A4 00                                            // ..

                    If (LEqual (Arg2, 0x06))
                    {

   367A8: A0 24 93 6A 0A 06                                // .$.j..

                        If (LGreater (L3DI, 0x04))
                        {

   367AE: A0 1A 94 4C 33 44 49 0A 04                       // ...L3DI..

                            Return (DSMI (L3D4, L3A4, Zero, L3BS))
                        }

   367B7: A4 44 53 4D 49 4C 33 44 34 4C 33 41 34 00 4C 33  // .DSMIL3D4L3A4.L3
   367C7: 42 53                                            // BS

                        Else
                        {

   367C9: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   367CB: A4 00                                            // ..

                    If (LEqual (Arg2, 0x07))
                    {

   367CD: A0 24 93 6A 0A 07                                // .$.j..

                        If (LGreater (L3DI, 0x05))
                        {

   367D3: A0 1A 94 4C 33 44 49 0A 05                       // ...L3DI..

                            Return (DSMI (L3D5, L3A5, Zero, L3BS))
                        }

   367DC: A4 44 53 4D 49 4C 33 44 35 4C 33 41 35 00 4C 33  // .DSMIL3D5L3A5.L3
   367EC: 42 53                                            // BS

                        Else
                        {

   367EE: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   367F0: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   367F2: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L3DI, 0x06))
                        {

   367F8: A0 1A 94 4C 33 44 49 0A 06                       // ...L3DI..

                            Return (DSMI (L3D6, L3A6, Zero, L3BS))
                        }

   36801: A4 44 53 4D 49 4C 33 44 36 4C 33 41 36 00 4C 33  // .DSMIL3D6L3A6.L3
   36811: 42 53                                            // BS

                        Else
                        {

   36813: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   36815: A4 00                                            // ..

                    If (LEqual (Arg2, 0x08))
                    {

   36817: A0 24 93 6A 0A 08                                // .$.j..

                        If (LGreater (L3DI, 0x07))
                        {

   3681D: A0 1A 94 4C 33 44 49 0A 07                       // ...L3DI..

                            Return (DSMI (L3D7, L3A7, Zero, L3BS))
                        }

   36826: A4 44 53 4D 49 4C 33 44 37 4C 33 41 37 00 4C 33  // .DSMIL3D7L3A7.L3
   36836: 42 53                                            // BS

                        Else
                        {

   36838: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   3683A: A4 00                                            // ..

                    If (LEqual (Arg2, 0x09))
                    {

   3683C: A0 24 93 6A 0A 09                                // .$.j..

                        If (LGreater (L3DI, 0x08))
                        {

   36842: A0 1A 94 4C 33 44 49 0A 08                       // ...L3DI..

                            Return (DSMI (L3D8, L3A8, Zero, L3BS))
                        }

   3684B: A4 44 53 4D 49 4C 33 44 38 4C 33 41 38 00 4C 33  // .DSMIL3D8L3A8.L3
   3685B: 42 53                                            // BS

                        Else
                        {

   3685D: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   3685F: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0A))
                    {

   36861: A0 24 93 6A 0A 0A                                // .$.j..

                        If (LGreater (L3DI, 0x09))
                        {

   36867: A0 1A 94 4C 33 44 49 0A 09                       // ...L3DI..

                            Return (DSMI (L3D9, L3A9, Zero, L3BS))
                        }

   36870: A4 44 53 4D 49 4C 33 44 39 4C 33 41 39 00 4C 33  // .DSMIL3D9L3A9.L3
   36880: 42 53                                            // BS

                        Else
                        {

   36882: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   36884: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0B))
                    {

   36886: A0 24 93 6A 0A 0B                                // .$.j..

                        If (LGreater (L3DI, 0x0A))
                        {

   3688C: A0 1A 94 4C 33 44 49 0A 0A                       // ...L3DI..

                            Return (DSMI (L3DA, L3AA, Zero, L3BS))
                        }

   36895: A4 44 53 4D 49 4C 33 44 41 4C 33 41 41 00 4C 33  // .DSMIL3DAL3AA.L3
   368A5: 42 53                                            // BS

                        Else
                        {

   368A7: A1 03                                            // ..

                            Return (Zero)
                        }
                    }


   368A9: A4 00                                            // ..

                    If (LEqual (Arg2, 0x0C))
                    {

   368AB: A0 24 93 6A 0A 0C                                // .$.j..

                        If (LGreater (L3DI, 0x0B))
                        {

   368B1: A0 1A 94 4C 33 44 49 0A 0B                       // ...L3DI..

                            Return (DSMI (L3DB, L3AB, Zero, L3BS))
                        }

   368BA: A4 44 53 4D 49 4C 33 44 42 4C 33 41 42 00 4C 33  // .DSMIL3DBL3AB.L3
   368CA: 42 53                                            // BS

                        Else
                        {

   368CC: A1 03                                            // ..

                            Return (Zero)
                        }
                    }
                }


   368CE: A4 00                                            // ..

                Return (
   368D0: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }


   368D1: 11 03 01 00                                      // ....

    Scope (_SB.PCI0.I2C2)
    {

   368D5: 10 43 29 2F 03 5F 53 42 5F 50 43 49 30 49 32 43  // .C)/._SB_PCI0I2C
   368E5: 32                                               // 2

        Device (CAM0)
        {

   368E6: 5B 82 41 28 43 41 4D 30                          // [.A(CAM0

            Name (_ADR, Zero)  // _ADR: Address

   368EE: 08 5F 41 44 52 00                                // ._ADR.

            Name (_HID, "INT3471")  // _HID: Hardware ID

   368F4: 08 5F 48 49 44 0D 49 4E 54 33 34 37 31 00        // ._HID.INT3471.

            Name (_CID, "INT3471")  // _CID: Compatible ID

   36902: 08 5F 43 49 44 0D 49 4E 54 33 34 37 31 00        // ._CID.INT3471.

            Name (_DDN, "IMX135-CRDG2")  // _DDN: DOS Device Name

   36910: 08 5F 44 44 4E 0D 49 4D 58 31 33 35 2D 43 52 44  // ._DDN.IMX135-CRD
   36920: 47 32 00                                         // G2.

            Name (_UID, "0")  // _UID: Unique ID

   36923: 08 5F 55 49 44 0D 30 00                          // ._UID.0.

            Name (_DEP, 
   3692B: 08 5F 44 45 50                                   // ._DEP

Package (0x01)  // _DEP: Dependencies
            {
                PMIC, 
            })

   36930: 12 06 01 50 4D 49 43                             // ...PMIC

            Name (_PLD, 
   36937: 08 5F 50 4C 44                                   // ._PLD

Package (0x01)  // _PLD: Physical Location of Device
            {

   3693C: 12 1A 01                                         // ...

                ToPLD (
                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x1,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "BACK",
                    PLD_VerticalPosition   = "CENTER",
                    PLD_HorizontalPosition = "RIGHT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x1,
                    PLD_EjectRequired      = 0x1,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0,
                    PLD_VerticalOffset     = 0xFFFF,
                    PLD_HorizontalOffset   = 0xFFFF)

            })

   3693F: 11 17 0A 14 82 00 00 00 00 00 00 00 69 0E 00 00  // ............i...
   3694F: 03 00 00 00 FF FF FF FF                          // ........

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {

   36957: 14 4E 0D 5F 43 52 53 00                          // .N._CRS.

                Name (SBUF, 
   3695F: 08 53 42 55 46                                   // .SBUF

Buffer (0xC8)
                {
                    /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x10, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // ..\_SB.P
                    /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x32,  // CI0.I2C2
                    /* 0020 */  0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02,  // ........
                    /* 0028 */  0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06,  // ........
                    /* 0030 */  0x00, 0x0E, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // ...\_SB.
                    /* 0038 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43,  // PCI0.I2C
                    /* 0040 */  0x32, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01,  // 2.......
                    /* 0048 */  0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A,  // ........
                    /* 0050 */  0x06, 0x00, 0x50, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ..P.\_SB
                    /* 0058 */  0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32,  // .PCI0.I2
                    /* 0060 */  0x43, 0x32, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00,  // C2......
                    /* 0068 */  0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80,  // ........
                    /* 0070 */  0x1A, 0x06, 0x00, 0x51, 0x00, 0x5C, 0x5F, 0x53,  // ...Q.\_S
                    /* 0078 */  0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49,  // B.PCI0.I
                    /* 0080 */  0x32, 0x43, 0x32, 0x00, 0x8E, 0x1E, 0x00, 0x01,  // 2C2.....
                    /* 0088 */  0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00,  // ........
                    /* 0090 */  0x80, 0x1A, 0x06, 0x00, 0x52, 0x00, 0x5C, 0x5F,  // ....R.\_
                    /* 0098 */  0x53, 0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E,  // SB.PCI0.
                    /* 00A0 */  0x49, 0x32, 0x43, 0x32, 0x00, 0x8E, 0x1E, 0x00,  // I2C2....
                    /* 00A8 */  0x01, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x06,  // ........
                    /* 00B0 */  0x00, 0x80, 0x1A, 0x06, 0x00, 0x53, 0x00, 0x5C,  // .....S.\
                    /* 00B8 */  0x5F, 0x53, 0x42, 0x2E, 0x50, 0x43, 0x49, 0x30,  // _SB.PCI0
                    /* 00C0 */  0x2E, 0x49, 0x32, 0x43, 0x32, 0x00, 0x79, 0x00   // .I2C2.y.
                })

   36964: 11 4C 0C 0A C8 8E 1E 00 01 00 01 02 00 00 01 06  // .L..............
   36974: 00 80 1A 06 00 10 00 5C 5F 53 42 2E 50 43 49 30  // .......\_SB.PCI0
   36984: 2E 49 32 43 32 00 8E 1E 00 01 00 01 02 00 00 01  // .I2C2...........
   36994: 06 00 80 1A 06 00 0E 00 5C 5F 53 42 2E 50 43 49  // ........\_SB.PCI
   369A4: 30 2E 49 32 43 32 00 8E 1E 00 01 00 01 02 00 00  // 0.I2C2..........
   369B4: 01 06 00 80 1A 06 00 50 00 5C 5F 53 42 2E 50 43  // .......P.\_SB.PC
   369C4: 49 30 2E 49 32 43 32 00 8E 1E 00 01 00 01 02 00  // I0.I2C2.........
   369D4: 00 01 06 00 80 1A 06 00 51 00 5C 5F 53 42 2E 50  // ........Q.\_SB.P
   369E4: 43 49 30 2E 49 32 43 32 00 8E 1E 00 01 00 01 02  // CI0.I2C2........
   369F4: 00 00 01 06 00 80 1A 06 00 52 00 5C 5F 53 42 2E  // .........R.\_SB.
   36A04: 50 43 49 30 2E 49 32 43 32 00 8E 1E 00 01 00 01  // PCI0.I2C2.......
   36A14: 02 00 00 01 06 00 80 1A 06 00 53 00 5C 5F 53 42  // ..........S.\_SB
   36A24: 2E 50 43 49 30 2E 49 32 43 32 00 79 00           // .PCI0.I2C2.y.

                Return (SBUF) /* \_SB_.PCI0.I2C2.CAM0._CRS.SBUF */
            }


   36A31: A4 53 42 55 46                                   // .SBUF

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   36A36: 14 15 5F 53 54 41 00                             // .._STA.

                If (LEqual (SCSS, One))
                {

   36A3D: A0 0A 93 53 43 53 53 01                          // ...SCSS.

                    Return (0x0F)
                }

   36A45: A4 0A 0F                                         // ...

                Else
                {

   36A48: A1 03                                            // ..

                    Return (Zero)
                }
            }


   36A4A: A4 00                                            // ..

            Method (SSDB, 0, NotSerialized)
            {

   36A4C: 14 42 08 53 53 44 42 00                          // .B.SSDB.

                Name (PAR, 
   36A54: 08 50 41 52 5F                                   // .PAR_

Buffer (0x6C)
                {
                    /* 0000 */  0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // .P......
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x03,  // ........
                    /* 0050 */  0x09, 0x00, 0x02, 0x01, 0x00, 0x01, 0x00, 0x36,  // .......6
                    /* 0058 */  0x6E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // n.......
                    /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0068 */  0x00, 0x00, 0x00, 0x00                           // ....
                })

   36A59: 11 40 07 0A 6C 00 50 00 00 00 00 00 00 00 00 00  // .@..l.P.........
   36A69: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   36A79: 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   36A89: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   36A99: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   36AA9: 00 00 00 08 03 09 00 02 01 00 01 00 36 6E 01 00  // ............6n..
   36AB9: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   36AC9: 00                                               // .

                Return (PAR) /* \_SB_.PCI0.I2C2.CAM0.SSDB.PAR_ */
            }


   36ACA: A4 50 41 52 5F                                   // .PAR_

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   36ACF: 14 49 09 5F 44 53 4D 04                          // .I._DSM.

                If (LEqual (Arg0, 
   36AD7: A0 23 93 68                                      // .#.h

ToUUID ("822ace8f-2814-4174-a56b-5f029fe079ee") /* Unknown UUID */))
                {

   36ADB: 11 13 0A 10 8F CE 2A 82 14 28 74 41 A5 6B 5F 02  // ......*..(tA.k_.
   36AEB: 9F E0 79 EE                                      // ..y.

                    Return ("13P2BAD33")
                }


   36AEF: A4 0D 31 33 50 32 42 41 44 33 33 00              // ..13P2BAD33.

                If (LEqual (Arg0, 
   36AFB: A0 48 06 93 68                                   // .H..h

ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881") /* Unknown UUID */))
                {

   36B00: 11 13 0A 10 49 75 25 26 71 92 A4 4C BB 43 C4 89  // ....Iu%&q..L.C..
   36B10: 9D 5A 48 81                                      // .ZH.

                    If (LEqual (Arg2, One))
                    {

   36B14: A0 07 93 6A 01                                   // ...j.

                        Return (0x06)
                    }


   36B19: A4 0A 06                                         // ...

                    If (LEqual (Arg2, 0x02))
                    {

   36B1C: A0 0B 93 6A 0A 02                                // ...j..

                        Return (0x02001000)
                    }


   36B22: A4 0C 00 10 00 02                                // ......

                    If (LEqual (Arg2, 0x03))
                    {

   36B28: A0 0B 93 6A 0A 03                                // ...j..

                        Return (0x02000E01)
                    }


   36B2E: A4 0C 01 0E 00 02                                // ......

                    If (LEqual (Arg2, 0x04))
                    {

   36B34: A0 0B 93 6A 0A 04                                // ...j..

                        Return (0x02005002)
                    }


   36B3A: A4 0C 02 50 00 02                                // ...P..

                    If (LEqual (Arg2, 0x05))
                    {

   36B40: A0 0B 93 6A 0A 05                                // ...j..

                        Return (0x02005103)
                    }


   36B46: A4 0C 03 51 00 02                                // ...Q..

                    If (LEqual (Arg2, 0x06))
                    {

   36B4C: A0 0B 93 6A 0A 06                                // ...j..

                        Return (0x02005204)
                    }


   36B52: A4 0C 04 52 00 02                                // ...R..

                    If (LEqual (Arg2, 0x07))
                    {

   36B58: A0 0B 93 6A 0A 07                                // ...j..

                        Return (0x02005305)
                    }
                }


   36B5E: A4 0C 05 53 00 02                                // ...S..

                Return (
   36B64: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }


   36B65: 11 03 01 00                                      // ....

    Scope (_SB.PCI0.I2C2)
    {

   36B69: 10 45 13 2F 03 5F 53 42 5F 50 43 49 30 49 32 43  // .E./._SB_PCI0I2C
   36B79: 32                                               // 2

        Device (PMIC)
        {

   36B7A: 5B 82 43 12 50 4D 49 43                          // [.C.PMIC

            Name (_ADR, Zero)  // _ADR: Address

   36B82: 08 5F 41 44 52 00                                // ._ADR.

            Name (_HID, "INT346F")  // _HID: Hardware ID

   36B88: 08 5F 48 49 44 0D 49 4E 54 33 34 36 46 00        // ._HID.INT346F.

            Name (_CID, "INT346F")  // _CID: Compatible ID

   36B96: 08 5F 43 49 44 0D 49 4E 54 33 34 36 46 00        // ._CID.INT346F.

            Name (_DDN, "PMIC-CRDG2")  // _DDN: DOS Device Name

   36BA4: 08 5F 44 44 4E 0D 50 4D 49 43 2D 43 52 44 47 32  // ._DDN.PMIC-CRDG2
   36BB4: 00                                               // .

            Name (_UID, "0")  // _UID: Unique ID

   36BB5: 08 5F 55 49 44 0D 30 00                          // ._UID.0.

            Name (_PLD, 
   36BBD: 08 5F 50 4C 44                                   // ._PLD

Package (0x01)  // _PLD: Physical Location of Device
            {

   36BC2: 12 1A 01                                         // ...

                ToPLD (
                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x1,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "CENTER",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x1,
                    PLD_EjectRequired      = 0x1,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0,
                    PLD_VerticalOffset     = 0xFFFF,
                    PLD_HorizontalOffset   = 0xFFFF)

            })

   36BC5: 11 17 0A 14 82 00 00 00 00 00 00 00 21 0D 00 00  // ............!...
   36BD5: 03 00 00 00 FF FF FF FF                          // ........

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {

   36BDD: 14 37 5F 43 52 53 00                             // .7_CRS.

                Name (SBUF, 
   36BE4: 08 53 42 55 46                                   // .SBUF

Buffer (0x23)
                {
                    /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x4C, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // L.\_SB.P
                    /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x32,  // CI0.I2C2
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })

   36BE9: 11 26 0A 23 8E 1E 00 01 00 01 02 00 00 01 06 00  // .&.#............
   36BF9: 80 1A 06 00 4C 00 5C 5F 53 42 2E 50 43 49 30 2E  // ....L.\_SB.PCI0.
   36C09: 49 32 43 32 00 79 00                             // I2C2.y.

                Return (SBUF) /* \_SB_.PCI0.I2C2.PMIC._CRS.SBUF */
            }


   36C10: A4 53 42 55 46                                   // .SBUF

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   36C15: 14 15 5F 53 54 41 00                             // .._STA.

                If (LEqual (SCSS, One))
                {

   36C1C: A0 0A 93 53 43 53 53 01                          // ...SCSS.

                    Return (0x0F)
                }

   36C24: A4 0A 0F                                         // ...

                Else
                {

   36C27: A1 03                                            // ..

                    Return (Zero)
                }
            }


   36C29: A4 00                                            // ..

            Method (CLDB, 0, NotSerialized)
            {

   36C2B: 14 34 43 4C 44 42 00                             // .4CLDB.

                Name (PAR, 
   36C32: 08 50 41 52 5F                                   // .PAR_

Buffer (0x20)
                {
                    /* 0000 */  0x00, 0x02, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00,  // ...P....
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                })

   36C37: 11 23 0A 20 00 02 00 50 00 00 00 00 00 00 00 00  // .#. ...P........
   36C47: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   36C57: 00 00 00 00                                      // ....

                Return (PAR) /* \_SB_.PCI0.I2C2.PMIC.CLDB.PAR_ */
            }


   36C5B: A4 50 41 52 5F                                   // .PAR_

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   36C60: 14 3E 5F 44 53 4D 04                             // .>_DSM.

                If (LEqual (Arg0, 
   36C67: A0 32 93 68                                      // .2.h

ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881") /* Unknown UUID */))
                {

   36C6B: 11 13 0A 10 49 75 25 26 71 92 A4 4C BB 43 C4 89  // ....Iu%&q..L.C..
   36C7B: 9D 5A 48 81                                      // .ZH.

                    If (LEqual (Arg2, Zero))
                    {

   36C7F: A0 07 93 6A 00                                   // ...j.

                        Return (0x07)
                    }


   36C84: A4 0A 07                                         // ...

                    If (LEqual (Arg2, One))
                    {

   36C87: A0 06 93 6A 01                                   // ...j.

                        Return (One)
                    }


   36C8C: A4 01                                            // ..

                    If (LEqual (Arg2, 0x02))
                    {

   36C8E: A0 0B 93 6A 0A 02                                // ...j..

                        Return (0x02004C0B)
                    }
                }


   36C94: A4 0C 0B 4C 00 02                                // ...L..

                Return (
   36C9A: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }


   36C9B: 11 03 01 00                                      // ....

    Scope (_SB.PCI0)
    {

   36C9F: 10 4C 5A 2E 5F 53 42 5F 50 43 49 30              // .LZ._SB_PCI0

        Name (HIDG, 
   36CAB: 08 48 49 44 47                                   // .HIDG

ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */)

   36CB0: 11 13 0A 10 F7 F6 DF 3C 67 42 55 45 AD 05 B3 0A  // .......<gBUE....
   36CC0: 3D 89 38 DE                                      // =.8.

        Name (TP7G, 
   36CC4: 08 54 50 37 47                                   // .TP7G

ToUUID ("ef87eb82-f951-46da-84ec-14871ac6f84b") /* Unknown UUID */)

   36CC9: 11 13 0A 10 82 EB 87 EF 51 F9 DA 46 84 EC 14 87  // ........Q..F....
   36CD9: 1A C6 F8 4B                                      // ...K

        Method (HIDD, 5, Serialized)
        {

   36CDD: 14 29 48 49 44 44 0D                             // .)HIDD.

            If (LEqual (Arg0, HIDG))
            {

   36CE4: A0 1D 93 68 48 49 44 47                          // ...hHIDG

                If (LEqual (Arg2, Zero))
                {

   36CEC: A0 0E 93 6A 00                                   // ...j.

                    If (LEqual (Arg1, One))
                    {

   36CF1: A0 09 93 69 01                                   // ...i.

                        Return (
   36CF6: A4                                               // .

Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }
                }


   36CF7: 11 03 01 03                                      // ....

                If (LEqual (Arg2, One))
                {

   36CFB: A0 06 93 6A 01                                   // ...j.

                    Return (Arg4)
                }
            }


   36D00: A4 6C                                            // .l

            Return (
   36D02: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   36D03: 11 03 01 00                                      // ....

        Method (TP7D, 6, Serialized)
        {

   36D07: 14 2C 54 50 37 44 0E                             // .,TP7D.

            If (LEqual (Arg0, TP7G))
            {

   36D0E: A0 20 93 68 54 50 37 47                          // . .hTP7G

                If (LEqual (Arg2, Zero))
                {

   36D16: A0 0E 93 6A 00                                   // ...j.

                    If (LEqual (Arg1, One))
                    {

   36D1B: A0 09 93 69 01                                   // ...i.

                        Return (
   36D20: A4                                               // .

Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }
                }


   36D21: 11 03 01 03                                      // ....

                If (LEqual (Arg2, One))
                {

   36D25: A0 09 93 6A 01                                   // ...j.

                    Return (
   36D2A: A4                                               // .

ConcatenateResTemplate (Arg4, Arg5))
                }
            }


   36D2B: 84 6C 6D 00                                      // .lm.

            Return (
   36D2F: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   36D30: 11 03 01 00                                      // ....

        Method (I2CM, 3, Serialized)
        {

   36D34: 14 49 19 49 32 43 4D 0B                          // .I.I2CM.


   36D3C: 08 5F 54 5F 30 00                                // ._T_0.

            Switch (ToInteger (Arg0))
            {

   36D42: A2 4B 18 01 70 99 68 00 5F 54 5F 30              // .K..p.h._T_0

                Case (Zero)
                {

   36D4E: A0 4B 05 93 5F 54 5F 30 00                       // .K.._T_0.

                    Name (IIC0, 
   36D57: 08 49 49 43 30                                   // .IIC0

Buffer (0x23)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // ..\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x30,  // CI0.I2C0
                        /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                    })

   36D5C: 11 26 0A 23 8E 1E 00 01 00 01 02 00 00 01 06 00  // .&.#............
   36D6C: 80 1A 06 00 00 00 5C 5F 53 42 2E 50 43 49 30 2E  // ......\_SB.PCI0.
   36D7C: 49 32 43 30 00 79 00                             // I2C0.y.

                    CreateWordField (IIC0, 0x10, DAD0)

   36D83: 8B 49 49 43 30 0A 10 44 41 44 30                 // .IIC0..DAD0

                    CreateDWordField (IIC0, 0x0C, DSP0)
                    Store (Arg1, DAD0) /* \_SB_.PCI0.I2CM.DAD0 */
                    Store (Arg2, DSP0) /* \_SB_.PCI0.I2CM.DSP0 */

   36D8E: 8A 49 49 43 30 0A 0C 44 53 50 30 70 69 44 41 44  // .IIC0..DSP0piDAD
   36D9E: 30 70 6A 44 53 50 30                             // 0pjDSP0

                    Return (IIC0) /* \_SB_.PCI0.I2CM.IIC0 */
                }

   36DA5: A4 49 49 43 30                                   // .IIC0

                Case
   36DAA: A1 42 12                                         // .B.

 (One)
                {

   36DAD: A0 4B 05 93 5F 54 5F 30 01                       // .K.._T_0.

                    Name (IIC1, 
   36DB6: 08 49 49 43 31                                   // .IIC1

Buffer (0x23)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // ..\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x31,  // CI0.I2C1
                        /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                    })

   36DBB: 11 26 0A 23 8E 1E 00 01 00 01 02 00 00 01 06 00  // .&.#............
   36DCB: 80 1A 06 00 00 00 5C 5F 53 42 2E 50 43 49 30 2E  // ......\_SB.PCI0.
   36DDB: 49 32 43 31 00 79 00                             // I2C1.y.

                    CreateWordField (IIC1, 0x10, DAD1)

   36DE2: 8B 49 49 43 31 0A 10 44 41 44 31                 // .IIC1..DAD1

                    CreateDWordField (IIC1, 0x0C, DSP1)
                    Store (Arg1, DAD1) /* \_SB_.PCI0.I2CM.DAD1 */
                    Store (Arg2, DSP1) /* \_SB_.PCI0.I2CM.DSP1 */

   36DED: 8A 49 49 43 31 0A 0C 44 53 50 31 70 69 44 41 44  // .IIC1..DSP1piDAD
   36DFD: 31 70 6A 44 53 50 31                             // 1pjDSP1

                    Return (IIC1) /* \_SB_.PCI0.I2CM.IIC1 */
                }

   36E04: A4 49 49 43 31                                   // .IIC1

                Case
   36E09: A1 43 0C                                         // .C.

 (0x02)
                {

   36E0C: A0 4C 05 93 5F 54 5F 30 0A 02                    // .L.._T_0..

                    Name (IIC2, 
   36E16: 08 49 49 43 32                                   // .IIC2

Buffer (0x23)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // ..\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x32,  // CI0.I2C2
                        /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                    })

   36E1B: 11 26 0A 23 8E 1E 00 01 00 01 02 00 00 01 06 00  // .&.#............
   36E2B: 80 1A 06 00 00 00 5C 5F 53 42 2E 50 43 49 30 2E  // ......\_SB.PCI0.
   36E3B: 49 32 43 32 00 79 00                             // I2C2.y.

                    CreateWordField (IIC2, 0x10, DAD2)

   36E42: 8B 49 49 43 32 0A 10 44 41 44 32                 // .IIC2..DAD2

                    CreateDWordField (IIC2, 0x0C, DSP2)
                    Store (Arg1, DAD2) /* \_SB_.PCI0.I2CM.DAD2 */
                    Store (Arg2, DSP2) /* \_SB_.PCI0.I2CM.DSP2 */

   36E4D: 8A 49 49 43 32 0A 0C 44 53 50 32 70 69 44 41 44  // .IIC2..DSP2piDAD
   36E5D: 32 70 6A 44 53 50 32                             // 2pjDSP2

                    Return (IIC2) /* \_SB_.PCI0.I2CM.IIC2 */
                }

   36E64: A4 49 49 43 32                                   // .IIC2

                Case
   36E69: A1 43 06                                         // .C.

 (0x03)
                {

   36E6C: A0 4C 05 93 5F 54 5F 30 0A 03                    // .L.._T_0..

                    Name (IIC3, 
   36E76: 08 49 49 43 33                                   // .IIC3

Buffer (0x23)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // ..\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x33,  // CI0.I2C3
                        /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                    })

   36E7B: 11 26 0A 23 8E 1E 00 01 00 01 02 00 00 01 06 00  // .&.#............
   36E8B: 80 1A 06 00 00 00 5C 5F 53 42 2E 50 43 49 30 2E  // ......\_SB.PCI0.
   36E9B: 49 32 43 33 00 79 00                             // I2C3.y.

                    CreateWordField (IIC3, 0x10, DAD3)

   36EA2: 8B 49 49 43 33 0A 10 44 41 44 33                 // .IIC3..DAD3

                    CreateDWordField (IIC3, 0x0C, DSP3)
                    Store (Arg1, DAD3) /* \_SB_.PCI0.I2CM.DAD3 */
                    Store (Arg2, DSP3) /* \_SB_.PCI0.I2CM.DSP3 */

   36EAD: 8A 49 49 43 33 0A 0C 44 53 50 33 70 69 44 41 44  // .IIC3..DSP3piDAD
   36EBD: 33 70 6A 44 53 50 33                             // 3pjDSP3

                    Return (IIC3) /* \_SB_.PCI0.I2CM.IIC3 */
                }

   36EC4: A4 49 49 43 33                                   // .IIC3

                Default
                {

   36EC9: A1 03                                            // ..

                    Return (Zero)
                }


   36ECB: A4 00                                            // ..

            }
        }


   36ECD: A5                                               // .

        Method (SPIM, 3, Serialized)
        {

   36ECE: 14 4E 07 53 50 49 4D 0B                          // .N.SPIM.


   36ED6: 08 5F 54 5F 30 00                                // ._T_0.

            Switch (ToInteger (Arg0))
            {

   36EDC: A2 40 07 01 70 99 68 00 5F 54 5F 30              // .@..p.h._T_0

                Case (0x07)
                {

   36EE8: A0 4F 05 93 5F 54 5F 30 0A 07                    // .O.._T_0..

                    Name (IIC7, 
   36EF2: 08 49 49 43 37                                   // .IIC7

Buffer (0x26)
                    {
                        /* 0000 */  0x8E, 0x21, 0x00, 0x01, 0x00, 0x02, 0x02, 0x00,  // .!......
                        /* 0008 */  0x00, 0x01, 0x09, 0x00, 0x80, 0x96, 0x98, 0x00,  // ........
                        /* 0010 */  0x08, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                        /* 0018 */  0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x53,  // B.PCI0.S
                        /* 0020 */  0x50, 0x49, 0x31, 0x00, 0x79, 0x00               // PI1.y.
                    })

   36EF7: 11 29 0A 26 8E 21 00 01 00 02 02 00 00 01 09 00  // .).&.!..........
   36F07: 80 96 98 00 08 00 00 00 00 5C 5F 53 42 2E 50 43  // .........\_SB.PC
   36F17: 49 30 2E 53 50 49 31 00 79 00                    // I0.SPI1.y.

                    CreateByteField (IIC7, 0x11, DPH7)

   36F21: 8C 49 49 43 37 0A 11 44 50 48 37                 // .IIC7..DPH7

                    CreateDWordField (IIC7, 0x0C, DSP7)
                    Store (Arg1, DPH7) /* \_SB_.PCI0.SPIM.DPH7 */
                    Store (Arg2, DSP7) /* \_SB_.PCI0.SPIM.DSP7 */

   36F2C: 8A 49 49 43 37 0A 0C 44 53 50 37 70 69 44 50 48  // .IIC7..DSP7piDPH
   36F3C: 37 70 6A 44 53 50 37                             // 7pjDSP7

                    Return (IIC7) /* \_SB_.PCI0.SPIM.IIC7 */
                }

   36F43: A4 49 49 43 37                                   // .IIC7

                Default
                {

   36F48: A1 03                                            // ..

                    Return (Zero)
                }


   36F4A: A4 00                                            // ..

            }
        }


   36F4C: A5                                               // .

        Method (UCMM, 1, Serialized)
        {

   36F4D: 14 4E 2F 55 43 4D 4D 09                          // .N/UCMM.


   36F55: 08 5F 54 5F 30 00                                // ._T_0.

            Switch (ToInteger (Arg0))
            {

   36F5B: A2 40 2F 01 70 99 68 00 5F 54 5F 30              // .@/.p.h._T_0

                Case (Zero)
                {

   36F67: A0 4D 09 93 5F 54 5F 30 00                       // .M.._T_0.

                    Name (UCM0, 
   36F70: 08 55 43 4D 30                                   // .UCM0

Buffer (0x86)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x38, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // 8.\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x30,  // CI0.I2C0
                        /* 0020 */  0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02,  // ........
                        /* 0028 */  0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06,  // ........
                        /* 0030 */  0x00, 0x3F, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // .?.\_SB.
                        /* 0038 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43,  // PCI0.I2C
                        /* 0040 */  0x30, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01,  // 0.......
                        /* 0048 */  0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A,  // ........
                        /* 0050 */  0x06, 0x00, 0x20, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // .. .\_SB
                        /* 0058 */  0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32,  // .PCI0.I2
                        /* 0060 */  0x43, 0x30, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00,  // C0......
                        /* 0068 */  0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80,  // ........
                        /* 0070 */  0x1A, 0x06, 0x00, 0x27, 0x00, 0x5C, 0x5F, 0x53,  // ...'.\_S
                        /* 0078 */  0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49,  // B.PCI0.I
                        /* 0080 */  0x32, 0x43, 0x30, 0x00, 0x79, 0x00               // 2C0.y.
                    })

   36F75: 11 4A 08 0A 86 8E 1E 00 01 00 01 02 00 00 01 06  // .J..............
   36F85: 00 80 1A 06 00 38 00 5C 5F 53 42 2E 50 43 49 30  // .....8.\_SB.PCI0
   36F95: 2E 49 32 43 30 00 8E 1E 00 01 00 01 02 00 00 01  // .I2C0...........
   36FA5: 06 00 80 1A 06 00 3F 00 5C 5F 53 42 2E 50 43 49  // ......?.\_SB.PCI
   36FB5: 30 2E 49 32 43 30 00 8E 1E 00 01 00 01 02 00 00  // 0.I2C0..........
   36FC5: 01 06 00 80 1A 06 00 20 00 5C 5F 53 42 2E 50 43  // ....... .\_SB.PC
   36FD5: 49 30 2E 49 32 43 30 00 8E 1E 00 01 00 01 02 00  // I0.I2C0.........
   36FE5: 00 01 06 00 80 1A 06 00 27 00 5C 5F 53 42 2E 50  // ........'.\_SB.P
   36FF5: 43 49 30 2E 49 32 43 30 00 79 00                 // CI0.I2C0.y.

                    Return (UCM0) /* \_SB_.PCI0.UCMM.UCM0 */
                }

   37000: A4 55 43 4D 30                                   // .UCM0

                Case
   37005: A1 45 24                                         // .E$

 (One)
                {

   37008: A0 4A 0F 93 5F 54 5F 30 01                       // .J.._T_0.

                    Name (UCM1, 
   37011: 08 55 43 4D 31                                   // .UCM1

Buffer (0x86)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x38, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // 8.\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x31,  // CI0.I2C1
                        /* 0020 */  0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02,  // ........
                        /* 0028 */  0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06,  // ........
                        /* 0030 */  0x00, 0x3F, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // .?.\_SB.
                        /* 0038 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43,  // PCI0.I2C
                        /* 0040 */  0x31, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01,  // 1.......
                        /* 0048 */  0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A,  // ........
                        /* 0050 */  0x06, 0x00, 0x23, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ..#.\_SB
                        /* 0058 */  0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32,  // .PCI0.I2
                        /* 0060 */  0x43, 0x31, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00,  // C1......
                        /* 0068 */  0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80,  // ........
                        /* 0070 */  0x1A, 0x06, 0x00, 0x27, 0x00, 0x5C, 0x5F, 0x53,  // ...'.\_S
                        /* 0078 */  0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49,  // B.PCI0.I
                        /* 0080 */  0x32, 0x43, 0x31, 0x00, 0x79, 0x00               // 2C1.y.
                    })

   37016: 11 4A 08 0A 86 8E 1E 00 01 00 01 02 00 00 01 06  // .J..............
   37026: 00 80 1A 06 00 38 00 5C 5F 53 42 2E 50 43 49 30  // .....8.\_SB.PCI0
   37036: 2E 49 32 43 31 00 8E 1E 00 01 00 01 02 00 00 01  // .I2C1...........
   37046: 06 00 80 1A 06 00 3F 00 5C 5F 53 42 2E 50 43 49  // ......?.\_SB.PCI
   37056: 30 2E 49 32 43 31 00 8E 1E 00 01 00 01 02 00 00  // 0.I2C1..........
   37066: 01 06 00 80 1A 06 00 23 00 5C 5F 53 42 2E 50 43  // .......#.\_SB.PC
   37076: 49 30 2E 49 32 43 31 00 8E 1E 00 01 00 01 02 00  // I0.I2C1.........
   37086: 00 01 06 00 80 1A 06 00 27 00 5C 5F 53 42 2E 50  // ........'.\_SB.P
   37096: 43 49 30 2E 49 32 43 31 00 79 00                 // CI0.I2C1.y.

                    Name (UCM4, 
   370A1: 08 55 43 4D 34                                   // .UCM4

Buffer (0x44)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x23, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // #.\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x31,  // CI0.I2C1
                        /* 0020 */  0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02,  // ........
                        /* 0028 */  0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06,  // ........
                        /* 0030 */  0x00, 0x27, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // .'.\_SB.
                        /* 0038 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43,  // PCI0.I2C
                        /* 0040 */  0x31, 0x00, 0x79, 0x00                           // 1.y.
                    })

   370A6: 11 48 04 0A 44 8E 1E 00 01 00 01 02 00 00 01 06  // .H..D...........
   370B6: 00 80 1A 06 00 23 00 5C 5F 53 42 2E 50 43 49 30  // .....#.\_SB.PCI0
   370C6: 2E 49 32 43 31 00 8E 1E 00 01 00 01 02 00 00 01  // .I2C1...........
   370D6: 06 00 80 1A 06 00 27 00 5C 5F 53 42 2E 50 43 49  // ......'.\_SB.PCI
   370E6: 30 2E 49 32 43 31 00 79 00                       // 0.I2C1.y.

                    If (LEqual (SCRO, One))
                    {

   370EF: A0 0C 93 53 43 52 4F 01                          // ...SCRO.

                        Return (UCM1) /* \_SB_.PCI0.UCMM.UCM1 */
                    }

   370F7: A4 55 43 4D 31                                   // .UCM1

                    Else
                    {

   370FC: A1 06                                            // ..

                        Return (UCM4) /* \_SB_.PCI0.UCMM.UCM4 */
                    }
                }

   370FE: A4 55 43 4D 34                                   // .UCM4

                Case
   37103: A1 47 14                                         // .G.

 (0x02)
                {

   37106: A0 4E 09 93 5F 54 5F 30 0A 02                    // .N.._T_0..

                    Name (UCM2, 
   37110: 08 55 43 4D 32                                   // .UCM2

Buffer (0x86)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x38, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // 8.\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x32,  // CI0.I2C2
                        /* 0020 */  0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02,  // ........
                        /* 0028 */  0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06,  // ........
                        /* 0030 */  0x00, 0x3F, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // .?.\_SB.
                        /* 0038 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43,  // PCI0.I2C
                        /* 0040 */  0x32, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01,  // 2.......
                        /* 0048 */  0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A,  // ........
                        /* 0050 */  0x06, 0x00, 0x20, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // .. .\_SB
                        /* 0058 */  0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32,  // .PCI0.I2
                        /* 0060 */  0x43, 0x32, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00,  // C2......
                        /* 0068 */  0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80,  // ........
                        /* 0070 */  0x1A, 0x06, 0x00, 0x27, 0x00, 0x5C, 0x5F, 0x53,  // ...'.\_S
                        /* 0078 */  0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49,  // B.PCI0.I
                        /* 0080 */  0x32, 0x43, 0x32, 0x00, 0x79, 0x00               // 2C2.y.
                    })

   37115: 11 4A 08 0A 86 8E 1E 00 01 00 01 02 00 00 01 06  // .J..............
   37125: 00 80 1A 06 00 38 00 5C 5F 53 42 2E 50 43 49 30  // .....8.\_SB.PCI0
   37135: 2E 49 32 43 32 00 8E 1E 00 01 00 01 02 00 00 01  // .I2C2...........
   37145: 06 00 80 1A 06 00 3F 00 5C 5F 53 42 2E 50 43 49  // ......?.\_SB.PCI
   37155: 30 2E 49 32 43 32 00 8E 1E 00 01 00 01 02 00 00  // 0.I2C2..........
   37165: 01 06 00 80 1A 06 00 20 00 5C 5F 53 42 2E 50 43  // ....... .\_SB.PC
   37175: 49 30 2E 49 32 43 32 00 8E 1E 00 01 00 01 02 00  // I0.I2C2.........
   37185: 00 01 06 00 80 1A 06 00 27 00 5C 5F 53 42 2E 50  // ........'.\_SB.P
   37195: 43 49 30 2E 49 32 43 32 00 79 00                 // CI0.I2C2.y.

                    Return (UCM2) /* \_SB_.PCI0.UCMM.UCM2 */
                }

   371A0: A4 55 43 4D 32                                   // .UCM2

                Case
   371A5: A1 45 0A                                         // .E.

 (0x03)
                {

   371A8: A0 4E 09 93 5F 54 5F 30 0A 03                    // .N.._T_0..

                    Name (UCM3, 
   371B2: 08 55 43 4D 33                                   // .UCM3

Buffer (0x86)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x38, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // 8.\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x33,  // CI0.I2C3
                        /* 0020 */  0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02,  // ........
                        /* 0028 */  0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06,  // ........
                        /* 0030 */  0x00, 0x3F, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // .?.\_SB.
                        /* 0038 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43,  // PCI0.I2C
                        /* 0040 */  0x33, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01,  // 3.......
                        /* 0048 */  0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80, 0x1A,  // ........
                        /* 0050 */  0x06, 0x00, 0x20, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // .. .\_SB
                        /* 0058 */  0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49, 0x32,  // .PCI0.I2
                        /* 0060 */  0x43, 0x33, 0x00, 0x8E, 0x1E, 0x00, 0x01, 0x00,  // C3......
                        /* 0068 */  0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00, 0x80,  // ........
                        /* 0070 */  0x1A, 0x06, 0x00, 0x27, 0x00, 0x5C, 0x5F, 0x53,  // ...'.\_S
                        /* 0078 */  0x42, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x49,  // B.PCI0.I
                        /* 0080 */  0x32, 0x43, 0x33, 0x00, 0x79, 0x00               // 2C3.y.
                    })

   371B7: 11 4A 08 0A 86 8E 1E 00 01 00 01 02 00 00 01 06  // .J..............
   371C7: 00 80 1A 06 00 38 00 5C 5F 53 42 2E 50 43 49 30  // .....8.\_SB.PCI0
   371D7: 2E 49 32 43 33 00 8E 1E 00 01 00 01 02 00 00 01  // .I2C3...........
   371E7: 06 00 80 1A 06 00 3F 00 5C 5F 53 42 2E 50 43 49  // ......?.\_SB.PCI
   371F7: 30 2E 49 32 43 33 00 8E 1E 00 01 00 01 02 00 00  // 0.I2C3..........
   37207: 01 06 00 80 1A 06 00 20 00 5C 5F 53 42 2E 50 43  // ....... .\_SB.PC
   37217: 49 30 2E 49 32 43 33 00 8E 1E 00 01 00 01 02 00  // I0.I2C3.........
   37227: 00 01 06 00 80 1A 06 00 27 00 5C 5F 53 42 2E 50  // ........'.\_SB.P
   37237: 43 49 30 2E 49 32 43 33 00 79 00                 // CI0.I2C3.y.

                    Return (UCM3) /* \_SB_.PCI0.UCMM.UCM3 */
                }

   37242: A4 55 43 4D 33                                   // .UCM3

                Default
                {

   37247: A1 03                                            // ..

                    Return (Zero)
                }


   37249: A4 00                                            // ..

            }
        }
    }


   3724B: A5                                               // .

    Scope (_SB.PCI0.I2C0)
    {
    }


   3724C: 10 0F 2F 03 5F 53 42 5F 50 43 49 30 49 32 43 30  // ../._SB_PCI0I2C0

    Scope (_SB.PCI0.I2C1)
    {
    }


   3725C: 10 0F 2F 03 5F 53 42 5F 50 43 49 30 49 32 43 31  // ../._SB_PCI0I2C1

    Scope (_SB.PCI0.I2C2)
    {
    }


   3726C: 10 0F 2F 03 5F 53 42 5F 50 43 49 30 49 32 43 32  // ../._SB_PCI0I2C2

    Scope (_SB.PCI0.I2C3)
    {
    }


   3727C: 10 0F 2F 03 5F 53 42 5F 50 43 49 30 49 32 43 33  // ../._SB_PCI0I2C3

    Scope (_SB.PCI0.SPI1)
    {

   3728C: 10 43 3C 2F 03 5F 53 42 5F 50 43 49 30 53 50 49  // .C</._SB_PCI0SPI
   3729C: 31                                               // 1

        Name (SPIP, Zero)

   3729D: 08 53 50 49 50 00                                // .SPIP.

        Name (SPIX, Zero)

   372A3: 08 53 50 49 58 00                                // .SPIX.

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (SDS7, SPIP) /* \_SB_.PCI0.SPI1.SPIP */

   372A9: 14 16 5F 49 4E 49 00 70 53 44 53 37 53 50 49 50  // .._INI.pSDS7SPIP

            Store (0x07, SPIX) /* \_SB_.PCI0.SPI1.SPIX */
        }


   372B9: 70 0A 07 53 50 49 58                             // p..SPIX

        If (
   372C0: A0 4F 38 92                                      // .O8.

LNotEqual (SM01, Zero))
        {

   372C4: 93 53 4D 30 31 00                                // .SM01.

            Device (FPNT)
            {

   372CA: 5B 82 44 38 46 50 4E 54                          // [.D8FPNT

                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {

   372D2: 14 46 08 5F 48 49 44 00                          // .F._HID.

                    If (LEqual (FPTT, One))
                    {

   372DA: A0 11 93 46 50 54 54 01                          // ...FPTT.

                        Return ("FPC1011")
                    }


   372E2: A4 0D 46 50 43 31 30 31 31 00                    // ..FPC1011.

                    If (LEqual (FPTT, 0x02))
                    {

   372EC: A0 12 93 46 50 54 54 0A 02                       // ...FPTT..

                        Return ("FPC1020")
                    }


   372F5: A4 0D 46 50 43 31 30 32 30 00                    // ..FPC1020.

                    If (LEqual (FPTT, 0x03))
                    {

   372FF: A0 13 93 46 50 54 54 0A 03                       // ...FPTT..

                        Return ("VFSI6101")
                    }


   37308: A4 0D 56 46 53 49 36 31 30 31 00                 // ..VFSI6101.

                    If (LEqual (FPTT, 0x04))
                    {

   37313: A0 13 93 46 50 54 54 0A 04                       // ...FPTT..

                        Return ("VFSI7500")
                    }


   3731C: A4 0D 56 46 53 49 37 35 30 30 00                 // ..VFSI7500.

                    If (LEqual (FPTT, 0x05))
                    {

   37327: A0 13 93 46 50 54 54 0A 05                       // ...FPTT..

                        Return ("EGIS0300")
                    }


   37330: A4 0D 45 47 49 53 30 33 30 30 00                 // ..EGIS0300.

                    If (LEqual (FPTT, 0x06))
                    {

   3733B: A0 12 93 46 50 54 54 0A 06                       // ...FPTT..

                        Return ("FPC1021")
                    }


   37344: A4 0D 46 50 43 31 30 32 31 00                    // ..FPC1021.

                    Return ("DUMY0000")
                }


   3734E: A4 0D 44 55 4D 59 30 30 30 30 00                 // ..DUMY0000.

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    SHPO (GFPI, One)
                    SHPO (GFPS, One)
                }


   37359: 14 18 5F 49 4E 49 00 53 48 50 4F 47 46 50 49 01  // .._INI.SHPOGFPI.
   37369: 53 48 50 4F 47 46 50 53 01                       // SHPOGFPS.

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   37372: 14 1B 5F 53 54 41 00                             // .._STA.

                    If (LAnd (
   37379: A0 12 90 92                                      // ....

LNotEqual (FPTT, Zero), 
   3737D: 93 46 50 54 54 00                                // .FPTT.

LEqual (SPIP, One)))
                    {

   37383: 93 53 50 49 50 01                                // .SPIP.

                        Return (0x0F)
                    }


   37389: A4 0A 0F                                         // ...

                    Return (Zero)
                }


   3738C: A4 00                                            // ..

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {

   3738E: 14 41 2C 5F 43 52 53 08                          // .A,_CRS.


   37396: 08 5F 54 5F 30 00                                // ._T_0.

                    Name (BBUF, 
   3739C: 08 42 42 55 46                                   // .BBUF

Buffer (0x2A)
                    {
                        /* 0000 */  0x8C, 0x25, 0x00, 0x01, 0x01, 0x01, 0x00, 0x02,  // .%......
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x28, 0x00, 0x00, 0x00, 0x08,  // ...(....
                        /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x43,  // .\_SB.PC
                        /* 0020 */  0x49, 0x30, 0x2E, 0x47, 0x50, 0x49, 0x30, 0x00,  // I0.GPI0.
                        /* 0028 */  0x79, 0x00                                       // y.
                    })

   373A1: 11 2D 0A 2A 8C 25 00 01 01 01 00 02 00 00 00 00  // .-.*.%..........
   373B1: 00 00 17 00 00 19 00 28 00 00 00 08 00 5C 5F 53  // .......(.....\_S
   373C1: 42 2E 50 43 49 30 2E 47 50 49 30 00 79 00        // B.PCI0.GPI0.y.

                    Name (IBUF, 
   373CF: 08 49 42 55 46                                   // .IBUF

Buffer (0x0B)
                    {
                        /* 0000 */  0x89, 0x06, 0x00, 0x15, 0x01, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x79, 0x00                                 // .y.
                    })

   373D4: 11 0E 0A 0B 89 06 00 15 01 00 00 00 00 79 00     // .............y.

                    Name (GBUF, 
   373E3: 08 47 42 55 46                                   // .GBUF

Buffer (0x2A)
                    {
                        /* 0000 */  0x8C, 0x25, 0x00, 0x01, 0x00, 0x01, 0x00, 0x12,  // .%......
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00,  // ...(....
                        /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x43,  // .\_SB.PC
                        /* 0020 */  0x49, 0x30, 0x2E, 0x47, 0x50, 0x49, 0x30, 0x00,  // I0.GPI0.
                        /* 0028 */  0x79, 0x00                                       // y.
                    })

   373E8: 11 2D 0A 2A 8C 25 00 01 00 01 00 12 00 00 00 00  // .-.*.%..........
   373F8: 00 00 17 00 00 19 00 28 00 00 00 00 00 5C 5F 53  // .......(.....\_S
   37408: 42 2E 50 43 49 30 2E 47 50 49 30 00 79 00        // B.PCI0.GPI0.y.

                    Name (UBUF, 
   37416: 08 55 42 55 46                                   // .UBUF

Buffer (0x2A)
                    {
                        /* 0000 */  0x8C, 0x25, 0x00, 0x01, 0x01, 0x01, 0x00, 0x01,  // .%......
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00,  // ...(....
                        /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x43,  // .\_SB.PC
                        /* 0020 */  0x49, 0x30, 0x2E, 0x47, 0x50, 0x49, 0x30, 0x00,  // I0.GPI0.
                        /* 0028 */  0x79, 0x00                                       // y.
                    })

   3741B: 11 2D 0A 2A 8C 25 00 01 01 01 00 01 00 00 00 00  // .-.*.%..........
   3742B: 00 00 17 00 00 19 00 28 00 00 00 00 00 5C 5F 53  // .......(.....\_S
   3743B: 42 2E 50 43 49 30 2E 47 50 49 30 00 79 00        // B.PCI0.GPI0.y.

                    CreateWordField (BBUF, 0x17, SPIN)

   37449: 8B 42 42 55 46 0A 17 53 50 49 4E                 // .BBUF..SPIN

                    CreateWordField (GBUF, 0x17, GPIN)

   37454: 8B 47 42 55 46 0A 17 47 50 49 4E                 // .GBUF..GPIN

                    CreateDWordField (IBUF, 0x05, IPIN)

   3745F: 8A 49 42 55 46 0A 05 49 50 49 4E                 // .IBUF..IPIN

                    CreateWordField (UBUF, 0x17, UPIN)

   3746A: 8B 55 42 55 46 0A 17 55 50 49 4E                 // .UBUF..UPIN

                    CreateBitField (IBUF, 0x1A, ILVL)

   37475: 8D 49 42 55 46 0A 1A 49 4C 56 4C                 // .IBUF..ILVL

                    CreateBitField (IBUF, 0x19, ITRG)

   37480: 8D 49 42 55 46 0A 19 49 54 52 47                 // .IBUF..ITRG

                    CreateField (GBUF, 0x39, 0x02, GLVL)

   3748B: 5B 13 47 42 55 46 0A 39 0A 02 47 4C 56 4C        // [.GBUF.9..GLVL

                    CreateBitField (GBUF, 0x38, GTRG)
                    Store (GNUM (GFPS), SPIN) /* \_SB_.PCI0.SPI1.FPNT._CRS.SPIN */
                    Store (GNUM (GFPI), GPIN) /* \_SB_.PCI0.SPI1.FPNT._CRS.GPIN */
                    Store (INUM (GFPI), IPIN) /* \_SB_.PCI0.SPI1.FPNT._CRS.IPIN */
                    Store (GNUM (GFPI), UPIN) /* \_SB_.PCI0.SPI1.FPNT._CRS.UPIN */

   37499: 8D 47 42 55 46 0A 38 47 54 52 47 70 47 4E 55 4D  // .GBUF.8GTRGpGNUM
   374A9: 47 46 50 53 53 50 49 4E 70 47 4E 55 4D 47 46 50  // GFPSSPINpGNUMGFP
   374B9: 49 47 50 49 4E 70 49 4E 55 4D 47 46 50 49 49 50  // IGPINpINUMGFPIIP
   374C9: 49 4E 70 47 4E 55 4D 47 46 50 49 55 50 49 4E     // INpGNUMGFPIUPIN

                    If (LOr (LEqual (FPTT, 0x02), 
   374D8: A0 28 91 93 46 50 54 54 0A 02                    // .(..FPTT..

LEqual (FPTT, 0x06)))
                    {
                        Store (Zero, ILVL) /* \_SB_.PCI0.SPI1.FPNT._CRS.ILVL */
                        Store (One, ITRG) /* \_SB_.PCI0.SPI1.FPNT._CRS.ITRG */
                        Store (Zero, GLVL) /* \_SB_.PCI0.SPI1.FPNT._CRS.GLVL */

   374E2: 93 46 50 54 54 0A 06 70 00 49 4C 56 4C 70 01 49  // .FPTT..p.ILVLp.I
   374F2: 54 52 47 70 00 47 4C 56 4C                       // TRGp.GLVL

                        Store (One, GTRG) /* \_SB_.PCI0.SPI1.FPNT._CRS.GTRG */
                    }


   374FB: 70 01 47 54 52 47                                // p.GTRG

                    If (LEqual (FPTT, 0x04))
                    {
                        Store (Zero, ILVL) /* \_SB_.PCI0.SPI1.FPNT._CRS.ILVL */

   37501: A0 14 93 46 50 54 54 0A 04 70 00 49 4C 56 4C     // ...FPTT..p.ILVL

                        Store (One, ITRG) /* \_SB_.PCI0.SPI1.FPNT._CRS.ITRG */
                    }


   37510: 70 01 49 54 52 47                                // p.ITRG

                    Switch (ToInteger (FPTT))
                    {

   37516: A2 4F 08 01 70 99 46 50 54 54 00 5F 54 5F 30     // .O..p.FPTT._T_0

                        Case (One)
                        {
                            Store (0x00989680, Local1)

   37525: A0 11 93 5F 54 5F 30 01 70 0C 80 96 98 00 61     // ..._T_0.p.....a

                            Store (Zero, Local0)
                        }

   37534: 70 00 60                                         // p.`

                        Case
   37537: A1 4D 06                                         // .M.

 (0x02)
                        {
                            Store (0x002DC6C0, Local1)

   3753A: A0 12 93 5F 54 5F 30 0A 02 70 0C C0 C6 2D 00 61  // ..._T_0..p...-.a

                            Store (Zero, Local0)
                        }

   3754A: 70 00 60                                         // p.`

                        Case
   3754D: A1 47 05                                         // .G.

 (0x03)
                        {
                            Store (0x007A1200, Local1)

   37550: A0 12 93 5F 54 5F 30 0A 03 70 0C 00 12 7A 00 61  // ..._T_0..p...z.a

                            Store (One, Local0)
                        }

   37560: 70 01 60                                         // p.`

                        Case
   37563: A1 41 04                                         // .A.

 (0x04)
                        {
                            Store (0x007A1200, Local1)

   37566: A0 12 93 5F 54 5F 30 0A 04 70 0C 00 12 7A 00 61  // ..._T_0..p...z.a

                            Store (Zero, Local0)
                        }

   37576: 70 00 60                                         // p.`

                        Case
   37579: A1 2B                                            // .+

 (0x05)
                        {
                            Store (0x00F42400, Local1)

   3757B: A0 12 93 5F 54 5F 30 0A 05 70 0C 00 24 F4 00 61  // ..._T_0..p..$..a

                            Store (Zero, Local0)
                        }

   3758B: 70 00 60                                         // p.`

                        Case
   3758E: A1 16                                            // ..

 (0x06)
                        {
                            Store (0x002DC6C0, Local1)

   37590: A0 12 93 5F 54 5F 30 0A 06 70 0C C0 C6 2D 00 61  // ..._T_0..p...-.a

                            Store (Zero, Local0)
                        }

   375A0: 70 00 60                                         // p.`

                        Default
                        {
                        }


   375A3: A1 01                                            // ..

                    }


   375A5: A5                                               // .

                    If (LEqual (FPTT, One))
                    {

   375A6: A0 18 93 46 50 54 54 01                          // ...FPTT.

                        Return (
   375AE: A4                                               // .

ConcatenateResTemplate (SPIM (SPIX, Local0, Local1), BBUF))
                    }


   375AF: 84 53 50 49 4D 53 50 49 58 60 61 42 42 55 46 00  // .SPIMSPIX`aBBUF.

                    If (LAnd (LEqual (FPTT, 0x04), 
   375BF: A0 2C 90 93 46 50 54 54 0A 04                    // .,..FPTT..

LEqual (FPTM, Zero)))
                    {

   375C9: 93 46 50 54 4D 00                                // .FPTM.

                        Return (
   375CF: A4                                               // .

ConcatenateResTemplate (ConcatenateResTemplate (SPIM (SPIX, Local0, Local1), BBUF), ConcatenateResTemplate (UBUF, GBUF
                            )))
                    }


   375D0: 84 84 53 50 49 4D 53 50 49 58 60 61 42 42 55 46  // ..SPIMSPIX`aBBUF
   375E0: 00 84 55 42 55 46 47 42 55 46 00 00              // ..UBUFGBUF..

                    If (LAnd (LEqual (FPTT, 0x04), 
   375EC: A0 2D 90 93 46 50 54 54 0A 04                    // .-..FPTT..


   375F6: 92                                               // .

LNotEqual (FPTM, Zero)))
                    {

   375F7: 93 46 50 54 4D 00                                // .FPTM.

                        Return (
   375FD: A4                                               // .

ConcatenateResTemplate (ConcatenateResTemplate (SPIM (SPIX, Local0, Local1), BBUF), ConcatenateResTemplate (UBUF, IBUF
                            )))
                    }


   375FE: 84 84 53 50 49 4D 53 50 49 58 60 61 42 42 55 46  // ..SPIMSPIX`aBBUF
   3760E: 00 84 55 42 55 46 49 42 55 46 00 00              // ..UBUFIBUF..

                    If (LEqual (FPTM, Zero))
                    {

   3761A: A0 1E 93 46 50 54 4D 00                          // ...FPTM.

                        Return (
   37622: A4                                               // .

ConcatenateResTemplate (ConcatenateResTemplate (SPIM (SPIX, Local0, Local1), BBUF), GBUF))
                    }


   37623: 84 84 53 50 49 4D 53 50 49 58 60 61 42 42 55 46  // ..SPIMSPIX`aBBUF
   37633: 00 47 42 55 46 00                                // .GBUF.

                    Return (
   37639: A4                                               // .

ConcatenateResTemplate (ConcatenateResTemplate (SPIM (SPIX, Local0, Local1), BBUF), IBUF))
                }
            }
        }
    }


   3763A: 84 84 53 50 49 4D 53 50 49 58 60 61 42 42 55 46  // ..SPIMSPIX`aBBUF
   3764A: 00 49 42 55 46 00                                // .IBUF.

    Method (PKG1, 1, Serialized)
    {

   37650: 14 1D 50 4B 47 31 09                             // ..PKG1.

        Name (PKG, 
   37657: 08 50 4B 47 5F                                   // .PKG_

Package (0x01)
        {
            Zero
        })
        Store (Arg0, 
   3765C: 12 03 01 00 70 68                                // ....ph

Index (PKG, Zero))

   37662: 88 50 4B 47 5F 00 00                             // .PKG_..

        Return (PKG) /* \PKG1.PKG_ */
    }


   37669: A4 50 4B 47 5F                                   // .PKG_

    Method (PKG3, 3, Serialized)
    {

   3766E: 14 32 50 4B 47 33 0B                             // .2PKG3.

        Name (PKG, 
   37675: 08 50 4B 47 5F                                   // .PKG_

Package (0x03)
        {
            Zero, 
            Zero, 
            Zero
        })
        Store (Arg0, 
   3767A: 12 05 03 00 00 00 70 68                          // ......ph

Index (PKG, Zero))
        Store (Arg1, 
   37682: 88 50 4B 47 5F 00 00 70 69                       // .PKG_..pi

Index (PKG, One))
        Store (Arg2, 
   3768B: 88 50 4B 47 5F 01 00 70 6A                       // .PKG_..pj

Index (PKG, 0x02))

   37694: 88 50 4B 47 5F 0A 02 00                          // .PKG_...

        Return (PKG) /* \PKG3.PKG_ */
    }


   3769C: A4 50 4B 47 5F                                   // .PKG_

    If (USTP)
    {

   376A1: A0 4F 0D 55 53 54 50                             // .O.USTP

        Scope (_SB.PCI0.I2C1)
        {

   376A8: 10 48 07 2F 03 5F 53 42 5F 50 43 49 30 49 32 43  // .H./._SB_PCI0I2C
   376B8: 31                                               // 1

            Method (SSCN, 0, NotSerialized)
            {

   376B9: 14 17 53 53 43 4E 00                             // ..SSCN.

                Return (PKG3 (SSH1, SSL1, SSD1))
            }


   376C0: A4 50 4B 47 33 53 53 48 31 53 53 4C 31 53 53 44  // .PKG3SSH1SSL1SSD
   376D0: 31                                               // 1

            Method (FMCN, 0, NotSerialized)
            {

   376D1: 14 17 46 4D 43 4E 00                             // ..FMCN.

                Return (PKG3 (FMH1, FML1, FMD1))
            }


   376D8: A4 50 4B 47 33 46 4D 48 31 46 4D 4C 31 46 4D 44  // .PKG3FMH1FML1FMD
   376E8: 31                                               // 1

            Method (FPCN, 0, NotSerialized)
            {

   376E9: 14 17 46 50 43 4E 00                             // ..FPCN.

                Return (PKG3 (FPH1, FPL1, FPD1))
            }


   376F0: A4 50 4B 47 33 46 50 48 31 46 50 4C 31 46 50 44  // .PKG3FPH1FPL1FPD
   37700: 31                                               // 1

            Method (M0D3, 0, NotSerialized)
            {

   37701: 14 0F 4D 30 44 33 00                             // ..M0D3.

                Return (PKG1 (M0C1))
            }


   37708: A4 50 4B 47 31 4D 30 43 31                       // .PKG1M0C1

            Method (M1D3, 0, NotSerialized)
            {

   37711: 14 0F 4D 31 44 33 00                             // ..M1D3.

                Return (PKG1 (M1C1))
            }
        }


   37718: A4 50 4B 47 31 4D 31 43 31                       // .PKG1M1C1

        Scope (_SB.PCI0.SPI1)
        {

   37721: 10 2F 2F 03 5F 53 42 5F 50 43 49 30 53 50 49 31  // .//._SB_PCI0SPI1

            Method (M0D3, 0, NotSerialized)
            {

   37731: 14 0F 4D 30 44 33 00                             // ..M0D3.

                Return (PKG1 (M0C7))
            }


   37738: A4 50 4B 47 31 4D 30 43 37                       // .PKG1M0C7

            Method (M1D3, 0, NotSerialized)
            {

   37741: 14 0F 4D 31 44 33 00                             // ..M1D3.

                Return (PKG1 (M1C7))
            }
        }


   37748: A4 50 4B 47 31 4D 31 43 37                       // .PKG1M1C7

        Scope (_SB.PCI0.UA01)
        {

   37751: 10 2F 2F 03 5F 53 42 5F 50 43 49 30 55 41 30 31  // .//._SB_PCI0UA01

            Method (M0D3, 0, NotSerialized)
            {

   37761: 14 0F 4D 30 44 33 00                             // ..M0D3.

                Return (PKG1 (M0CA))
            }


   37768: A4 50 4B 47 31 4D 30 43 41                       // .PKG1M0CA

            Method (M1D3, 0, NotSerialized)
            {

   37771: 14 0F 4D 31 44 33 00                             // ..M1D3.

                Return (PKG1 (M1CA))
            }
        }
    }


   37778: A4 50 4B 47 31 4D 31 43 41                       // .PKG1M1CA

    Scope (_SB.PCI0.HDAS)
    {

   37781: 10 4D 0C 2F 03 5F 53 42 5F 50 43 49 30 48 44 41  // .M./._SB_PCI0HDA
   37791: 53                                               // S

        Method (PPMS, 1, Serialized)
        {

   37792: 14 40 0A 50 50 4D 53 09                          // .@.PPMS.

            If (LEqual (Arg0, 
   3779A: A0 20 93 68                                      // . .h

ToUUID ("7c708106-3aff-40fe-88be-8c999b3f7445") /* Unknown UUID */))
            {

   3779E: 11 13 0A 10 06 81 70 7C FF 3A FE 40 88 BE 8C 99  // ......p|.:.@....
   377AE: 9B 3F 74 45                                      // .?tE

                Return (
   377B2: A4                                               // .

And (ADPM, 0x04))
            }


   377B3: 7B 41 44 50 4D 0A 04 00                          // {ADPM...

            If (LEqual (Arg0, 
   377BB: A0 21 93 68                                      // .!.h

ToUUID ("ec774fa9-28d3-424a-90e4-69f984f1eeb7") /* Unknown UUID */))
            {

   377BF: 11 13 0A 10 A9 4F 77 EC D3 28 4A 42 90 E4 69 F9  // .....Ow..(JB..i.
   377CF: 84 F1 EE B7                                      // ....

                Return (
   377D3: A4                                               // .

And (ADPM, 0x0100))
            }


   377D4: 7B 41 44 50 4D 0B 00 01 00                       // {ADPM....

            If (LEqual (Arg0, ACCG (AG1L, AG1H)))
            {

   377DD: A0 1B 93 68 41 43 43 47 41 47 31 4C 41 47 31 48  // ...hACCGAG1LAG1H

                Return (
   377ED: A4                                               // .

And (ADPM, 0x20000000))
            }


   377EE: 7B 41 44 50 4D 0C 00 00 00 20 00                 // {ADPM.... .

            If (LEqual (Arg0, ACCG (AG2L, AG2H)))
            {

   377F9: A0 1B 93 68 41 43 43 47 41 47 32 4C 41 47 32 48  // ...hACCGAG2LAG2H

                Return (
   37809: A4                                               // .

And (ADPM, 0x40000000))
            }


   3780A: 7B 41 44 50 4D 0C 00 00 00 40 00                 // {ADPM....@.

            If (LEqual (Arg0, ACCG (AG3L, AG3H)))
            {

   37815: A0 1B 93 68 41 43 43 47 41 47 33 4C 41 47 33 48  // ...hACCGAG3LAG3H

                Return (
   37825: A4                                               // .

And (ADPM, 0x80000000))
            }


   37826: 7B 41 44 50 4D 0C 00 00 00 80 00                 // {ADPM......

            Return (Zero)
        }


   37831: A4 00                                            // ..

        Method (ACCG, 2, NotSerialized)
        {

   37833: 14 1B 41 43 43 47 02                             // ..ACCG.

            Name (GBUF, 
   3783A: 08 47 42 55 46                                   // .GBUF

Buffer (0x10){})
            Concatenate (Arg0, Arg1, GBUF) /* \_SB_.PCI0.HDAS.ACCG.GBUF */

   3783F: 11 03 0A 10 73 68 69 47 42 55 46                 // ....shiGBUF

            Return (GBUF) /* \_SB_.PCI0.HDAS.ACCG.GBUF */
        }
    }


   3784A: A4 47 42 55 46                                   // .GBUF

    Method (HIDW, 4, Serialized)
    {

   3784F: 14 44 0C 48 49 44 57 0C                          // .D.HIDW.


   37857: 08 5F 54 5F 30 00                                // ._T_0.

        If (LEqual (Arg0, 
   3785D: A0 4F 0A 93 68                                   // .O..h

ToUUID ("1730e71d-e5dd-4a34-be57-4d76b6a2fe37") /* Unknown UUID */))
        {

   37862: 11 13 0A 10 1D E7 30 17 DD E5 34 4A BE 57 4D 76  // ......0...4J.WMv
   37872: B6 A2 FE 37                                      // ...7

            If (LEqual (Arg2, Zero))
            {

   37876: A0 12 93 6A 00                                   // ...j.

                If (LEqual (Arg1, Zero))
                {

   3787B: A0 09 93 69 00                                   // ...i.

                    Return (
   37880: A4                                               // .

Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

   37881: 11 03 01 03                                      // ....

                Else
                {

   37885: A1 03                                            // ..

                    Return (Zero)
                }
            }


   37887: A4 00                                            // ..

            If (LEqual (Arg2, One))
            {

   37889: A0 4F 07 93 6A 01                                // .O..j.

                Switch (ToInteger (DerefOf (
   3788F: A2 47 07 01 70 99 83                             // .G..p..

Index (Arg3, Zero))))
                {

   37896: 88 6B 00 00 00 5F 54 5F 30                       // .k..._T_0

                    Case (Zero)
                    {

   3789F: A0 22 93 5F 54 5F 30 00                          // ."._T_0.

                        If (CondRefOf (\_SB.HIDD.HPEM))
                        {
                            P8XH (Zero, 0x5C)
                        }
                    }

   378A7: A0 1A 5B 12 5C 2F 03 5F 53 42 5F 48 49 44 44 48  // ..[.\/._SB_HIDDH
   378B7: 50 45 4D 00 50 38 58 48 00 0A 5C                 // PEM.P8XH..\

                    Case
   378C2: A1 43 04                                         // .C.

 (One)
                    {

   378C5: A0 2A 93 5F 54 5F 30 01                          // .*._T_0.

                        If (CondRefOf (\_SB.SLPB))
                        {
                            Notify (\_SB.SLPB, 0x80) // Status Change
                            P8XH (Zero, 0x5D)
                        }
                    }

   378CD: A0 22 5B 12 5C 2E 5F 53 42 5F 53 4C 50 42 00 86  // ."[.\._SB_SLPB..
   378DD: 5C 2E 5F 53 42 5F 53 4C 50 42 0A 80 50 38 58 48  // \._SB_SLPB..P8XH
   378ED: 00 0A 5D                                         // ..]

                    Case
   378F0: A1 15                                            // ..

 (
   378F2: A0 08                                            // ..

0x02)
                    {
                    }

   378F4: 93 5F 54 5F 30 0A 02                             // ._T_0..

                    Case
   378FB: A1 0A                                            // ..

 (
   378FD: A0 08                                            // ..

0x03)
                    {
                    }


   378FF: 93 5F 54 5F 30 0A 03                             // ._T_0..

                }


   37906: A5                                               // .

                Return (Zero)
            }

   37907: A4 00                                            // ..

            Else
            {

   37909: A1 03                                            // ..

                Return (Zero)
            }
        }

   3790B: A4 00                                            // ..

        Else
        {

   3790D: A1 06                                            // ..

            Return (
   3790F: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }


   37910: 11 03 01 00                                      // ....

    Method (HIWC, 1, NotSerialized)
    {

   37914: 14 22 48 49 57 43 01                             // ."HIWC.

        If (LEqual (Arg0, 
   3791B: A0 19 93 68                                      // ...h

ToUUID ("1730e71d-e5dd-4a34-be57-4d76b6a2fe37") /* Unknown UUID */))
        {

   3791F: 11 13 0A 10 1D E7 30 17 DD E5 34 4A BE 57 4D 76  // ......0...4J.WMv
   3792F: B6 A2 FE 37                                      // ...7

            Return (One)
        }


   37933: A4 01                                            // ..

        Return (Zero)
    }


   37935: A4 00                                            // ..

    Scope (\)
    {

   37937: 10 44 0B 5C 00                                   // .D.\.

        PowerResource (PIN, 0x00, 0x0000)
        {

   3793C: 5B 84 4E 0A 50 49 4E 5F 00 00 00                 // [.N.PIN_...

            Method (STA, 1, Serialized)
            {

   37947: 14 23 53 54 41 5F 09                             // .#STA_.

                If (LEqual (\_SB.GGOV (
   3794E: A0 18 93 5C 2E 5F 53 42 5F 47 47 4F 56           // ...\._SB_GGOV

DerefOf (
   3795B: 83                                               // .

Index (Arg0, Zero))), 
   3795C: 88 68 00 00                                      // .h..

DerefOf (
   37960: 83                                               // .

Index (Arg0, One
                    ))))
                {

   37961: 88 68 01 00                                      // .h..

                    Return (One)
                }

   37965: A4 01                                            // ..

                Else
                {

   37967: A1 03                                            // ..

                    Return (Zero)
                }
            }


   37969: A4 00                                            // ..

            Method (ON, 1, Serialized)
            {
                ADBG (
   3796B: 14 33 4F 4E 5F 5F 09 41 44 42 47                 // .3ON__.ADBG

Concatenate ("PINH GPIO=", ToHexString (DerefOf (
   37976: 73 0D 50 49 4E 48 20 47 50 49 4F 3D 00 98 83     // s.PINH GPIO=...

Index (Arg0, Zero)))))
                \_SB.SGOV (DerefOf (
   37985: 88 68 00 00 00 00 5C 2E 5F 53 42 5F 53 47 4F 56  // .h....\._SB_SGOV
   37995: 83                                               // .

Index (Arg0, Zero)), 
   37996: 88 68 00 00                                      // .h..

DerefOf (
   3799A: 83                                               // .

Index (Arg0, One)))
            }


   3799B: 88 68 01 00                                      // .h..

            Method (OFF, 1, Serialized)
            {
                ADBG (
   3799F: 14 35 4F 46 46 5F 09 41 44 42 47                 // .5OFF_.ADBG

Concatenate ("PINL GPIO=", ToHexString (DerefOf (
   379AA: 73 0D 50 49 4E 4C 20 47 50 49 4F 3D 00 98 83     // s.PINL GPIO=...

Index (Arg0, Zero)))))
                \_SB.SGOV (DerefOf (
   379B9: 88 68 00 00 00 00 5C 2E 5F 53 42 5F 53 47 4F 56  // .h....\._SB_SGOV
   379C9: 83                                               // .

Index (Arg0, Zero)), 
   379CA: 88 68 00 00                                      // .h..

Not (DerefOf (
   379CE: 80 83                                            // ..

Index (Arg0, One))
                    ))
            }


   379D0: 88 68 01 00 00                                   // .h...

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   379D5: 14 08 5F 53 54 41 00                             // .._STA.

                Return (Zero)
            }


   379DC: A4 00                                            // ..

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }


   379DE: 14 06 5F 4F 4E 5F 00                             // .._ON_.

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }
    }


   379E5: 14 06 5F 4F 46 46 00                             // .._OFF.

    Device (ALSD)
    {

   379EC: 5B 82 4C 06 41 4C 53 44                          // [.L.ALSD

        Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID

   379F4: 08 5F 48 49 44 0D 41 43 50 49 30 30 30 38 00     // ._HID.ACPI0008.

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {

   37A03: 14 14 5F 53 54 41 00                             // .._STA.

            If (LEqual (ALSE, 0x02))
            {

   37A0A: A0 0B 93 41 4C 53 45 0A 02                       // ...ALSE..

                Return (0x0B)
            }


   37A13: A4 0A 0B                                         // ...

            Return (Zero)
        }


   37A16: A4 00                                            // ..

        Method (_ALI, 0, NotSerialized)  // _ALI: Ambient Light Illuminance
        {

   37A18: 14 15 5F 41 4C 49 00                             // .._ALI.

            Return (
   37A1F: A4                                               // .

Or (ShiftLeft (LHIH, 0x08), LLOW))
        }


   37A20: 7D 79 4C 48 49 48 0A 08 00 4C 4C 4F 57 00        // }yLHIH...LLOW.

        Name (_ALR, 
   37A2E: 08 5F 41 4C 52                                   // ._ALR

Package (0x05)  // _ALR: Ambient Light Response
        {

   37A33: 12 26 05                                         // .&.

            Package (0x02)
            {
                0x46, 
                Zero
            }, 


   37A36: 12 05 02 0A 46 00                                // ....F.

            Package (0x02)
            {
                0x49, 
                0x0A
            }, 


   37A3C: 12 06 02 0A 49 0A 0A                             // ....I..

            Package (0x02)
            {
                0x55, 
                0x50
            }, 


   37A43: 12 06 02 0A 55 0A 50                             // ....U.P

            Package (0x02)
            {
                0x64, 
                0x012C
            }, 


   37A4A: 12 07 02 0A 64 0B 2C 01                          // ....d.,.

            Package (0x02)
            {
                0x96, 
                0x03E8
            }
        })
    }


   37A52: 12 07 02 0A 96 0B E8 03                          // ........

    If (
   37A5A: A0 24 92                                         // .$.

LNotEqual (GBES, Zero))
    {

   37A5D: 93 47 42 45 53 00                                // .GBES.

        Scope (_SB.PCI0.GLAN)
        {

   37A63: 10 1B 2F 03 5F 53 42 5F 50 43 49 30 47 4C 41 4E  // ../._SB_PCI0GLAN

            Method (FGEN, 0, Serialized)
            {

   37A73: 14 0B 46 47 45 4E 08                             // ..FGEN.

                Return (GSEN) /* \GSEN */
            }
        }
    }


   37A7A: A4 47 53 45 4E                                   // .GSEN

    Scope (_SB)
    {

   37A7F: 10 26 5F 53 42 5F                                // .&_SB_

        Device (PWRB)
        {

   37A85: 5B 82 1F 50 57 52 42                             // [..PWRB

            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID

   37A8C: 08 5F 48 49 44 0C 41 D0 0C 0C                    // ._HID.A...

            Name (PBST, One)

   37A96: 08 50 42 53 54 01                                // .PBST.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   37A9C: 14 09 5F 53 54 41 00                             // .._STA.

                Return (0x0F)
            }
        }
    }


   37AA3: A4 0A 0F                                         // ...

    Scope (_SB.PCI0.LPCB)
    {

   37AA6: 10 46 47 2F 03 5F 53 42 5F 50 43 49 30 4C 50 43  // .FG/._SB_PCI0LPC
   37AB6: 42                                               // B

        Device (H_EC)
        {

   37AB7: 5B 82 44 46 48 5F 45 43                          // [.DFH_EC

            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID

   37ABF: 08 5F 48 49 44 0C 41 D0 0C 09                    // ._HID.A...

            Name (_UID, One)  // _UID: Unique ID

   37AC9: 08 5F 55 49 44 01                                // ._UID.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store (0x03, ^^^GFX0.CLID) /* External reference */

   37ACF: 14 17 5F 53 54 41 00 70 0A 03 5E 5E 5E 2E 47 46  // .._STA.p..^^^.GF
   37ADF: 58 30 43 4C 49 44                                // X0CLID

                Return (Zero)
            }


   37AE5: A4 00                                            // ..

            Name (ECAV, Zero)

   37AE7: 08 45 43 41 56 00                                // .ECAV.

            Name (B1ST, 0x32)

   37AED: 08 42 31 53 54 0A 32                             // .B1ST.2

            Name (B2ST, 0x36)

   37AF4: 08 42 32 53 54 0A 36                             // .B2ST.6

            Name (CFAN, 0x03)

   37AFB: 08 43 46 41 4E 0A 03                             // .CFAN..

            Name (CMDR, 0x3A)

   37B02: 08 43 4D 44 52 0A 3A                             // .CMDR.:

            Name (DOCK, 0x30)

   37B09: 08 44 4F 43 4B 0A 30                             // .DOCK.0

            Name (PLMX, One)

   37B10: 08 50 4C 4D 58 01                                // .PLMX.

            Name (PECH, 0x83)

   37B16: 08 50 45 43 48 0A 83                             // .PECH..

            Name (PECL, 0x82)

   37B1D: 08 50 45 43 4C 0A 82                             // .PECL..

            Name (PENV, 0x44)

   37B24: 08 50 45 4E 56 0A 44                             // .PENV.D

            Name (PINV, 0x43)

   37B2B: 08 50 49 4E 56 0A 43                             // .PINV.C

            Name (PPSH, 0x42)

   37B32: 08 50 50 53 48 0A 42                             // .PPSH.B

            Name (PPSL, 0x41)

   37B39: 08 50 50 53 4C 0A 41                             // .PPSL.A

            Name (PSTP, 0x45)

   37B40: 08 50 53 54 50 0A 45                             // .PSTP.E

            Name (RPWR, 0x03)

   37B47: 08 52 50 57 52 0A 03                             // .RPWR..

            Name (LSTE, 0x03)

   37B4E: 08 4C 53 54 45 0A 03                             // .LSTE..

            Name (VPWR, 0x30)

   37B55: 08 56 50 57 52 0A 30                             // .VPWR.0

            Name (WTMS, 0xC4)

   37B5C: 08 57 54 4D 53 0A C4                             // .WTMS..

            Name (AWT2, 0xC5)

   37B63: 08 41 57 54 32 0A C5                             // .AWT2..

            Name (AWT1, 0xC6)

   37B6A: 08 41 57 54 31 0A C6                             // .AWT1..

            Name (AWT0, 0xC7)

   37B71: 08 41 57 54 30 0A C7                             // .AWT0..

            Name (DLED, 0x78)

   37B78: 08 44 4C 45 44 0A 78                             // .DLED.x

            Name (SPT2, 0xC8)

   37B7F: 08 53 50 54 32 0A C8                             // .SPT2..

            Name (PB10, 0x78)

   37B86: 08 50 42 31 30 0A 78                             // .PB10.x

            Name (IWCW, 0xA0)

   37B8D: 08 49 57 43 57 0A A0                             // .IWCW..

            Name (IWCR, 0xA0)

   37B94: 08 49 57 43 52 0A A0                             // .IWCR..

            Name (PVOL, 0xE8)

   37B9B: 08 50 56 4F 4C 0A E8                             // .PVOL..

            Name (PWRT, 0x79)

   37BA2: 08 50 57 52 54 0A 79                             // .PWRT.y

            Method (ECRD, 1, Serialized)
            {

   37BA9: 14 42 19 45 43 52 44 09                          // .B.ECRD.

                Store (DerefOf (Arg0), Local0)

   37BB1: 08 5F 54 5F 30 00 70 83 68 60                    // ._T_0.p.h`

                Switch (ToInteger (Local0))
                {

   37BBB: A2 4E 17 01 70 99 60 00 5F 54 5F 30              // .N..p.`._T_0

                    Case (0x32)
                    {

   37BC7: A0 0A 93 5F 54 5F 30 0A 32                       // ..._T_0.2

                        Return (Zero)
                    }

   37BD0: A4 00                                            // ..

                    Case
   37BD2: A1 46 16                                         // .F.

 (0x36)
                    {

   37BD5: A0 0A 93 5F 54 5F 30 0A 36                       // ..._T_0.6

                        Return (Zero)
                    }

   37BDE: A4 00                                            // ..

                    Case
   37BE0: A1 48 15                                         // .H.

 (0x03)
                    {

   37BE3: A0 0A 93 5F 54 5F 30 0A 03                       // ..._T_0..

                        Return (Zero)
                    }

   37BEC: A4 00                                            // ..

                    Case
   37BEE: A1 4A 14                                         // .J.

 (0x3A)
                    {

   37BF1: A0 0A 93 5F 54 5F 30 0A 3A                       // ..._T_0.:

                        Return (Zero)
                    }

   37BFA: A4 00                                            // ..

                    Case
   37BFC: A1 4C 13                                         // .L.

 (0x30)
                    {

   37BFF: A0 0A 93 5F 54 5F 30 0A 30                       // ..._T_0.0

                        Return (Zero)
                    }

   37C08: A4 00                                            // ..

                    Case
   37C0A: A1 4E 12                                         // .N.

 (One)
                    {

   37C0D: A0 09 93 5F 54 5F 30 01                          // ..._T_0.

                        Return (Zero)
                    }

   37C15: A4 00                                            // ..

                    Case
   37C17: A1 41 12                                         // .A.

 (0x83)
                    {

   37C1A: A0 0A 93 5F 54 5F 30 0A 83                       // ..._T_0..

                        Return (Zero)
                    }

   37C23: A4 00                                            // ..

                    Case
   37C25: A1 43 11                                         // .C.

 (0x82)
                    {

   37C28: A0 0A 93 5F 54 5F 30 0A 82                       // ..._T_0..

                        Return (Zero)
                    }

   37C31: A4 00                                            // ..

                    Case
   37C33: A1 45 10                                         // .E.

 (0x44)
                    {

   37C36: A0 0A 93 5F 54 5F 30 0A 44                       // ..._T_0.D

                        Return (Zero)
                    }

   37C3F: A4 00                                            // ..

                    Case
   37C41: A1 47 0F                                         // .G.

 (0x43)
                    {

   37C44: A0 0A 93 5F 54 5F 30 0A 43                       // ..._T_0.C

                        Return (Zero)
                    }

   37C4D: A4 00                                            // ..

                    Case
   37C4F: A1 49 0E                                         // .I.

 (0x42)
                    {

   37C52: A0 0A 93 5F 54 5F 30 0A 42                       // ..._T_0.B

                        Return (Zero)
                    }

   37C5B: A4 00                                            // ..

                    Case
   37C5D: A1 4B 0D                                         // .K.

 (0x41)
                    {

   37C60: A0 0A 93 5F 54 5F 30 0A 41                       // ..._T_0.A

                        Return (Zero)
                    }

   37C69: A4 00                                            // ..

                    Case
   37C6B: A1 4D 0C                                         // .M.

 (0x45)
                    {

   37C6E: A0 0A 93 5F 54 5F 30 0A 45                       // ..._T_0.E

                        Return (Zero)
                    }

   37C77: A4 00                                            // ..

                    Case
   37C79: A1 4F 0B                                         // .O.

 (0x03)
                    {

   37C7C: A0 0A 93 5F 54 5F 30 0A 03                       // ..._T_0..

                        Return (Zero)
                    }

   37C85: A4 00                                            // ..

                    Case
   37C87: A1 41 0B                                         // .A.

 (0x03)
                    {

   37C8A: A0 0A 93 5F 54 5F 30 0A 03                       // ..._T_0..

                        Return (Zero)
                    }

   37C93: A4 00                                            // ..

                    Case
   37C95: A1 43 0A                                         // .C.

 (0x30)
                    {

   37C98: A0 0A 93 5F 54 5F 30 0A 30                       // ..._T_0.0

                        Return (Zero)
                    }

   37CA1: A4 00                                            // ..

                    Case
   37CA3: A1 45 09                                         // .E.

 (0xC4)
                    {

   37CA6: A0 0A 93 5F 54 5F 30 0A C4                       // ..._T_0..

                        Return (Zero)
                    }

   37CAF: A4 00                                            // ..

                    Case
   37CB1: A1 47 08                                         // .G.

 (0xC5)
                    {

   37CB4: A0 0A 93 5F 54 5F 30 0A C5                       // ..._T_0..

                        Return (Zero)
                    }

   37CBD: A4 00                                            // ..

                    Case
   37CBF: A1 49 07                                         // .I.

 (0xC6)
                    {

   37CC2: A0 0A 93 5F 54 5F 30 0A C6                       // ..._T_0..

                        Return (Zero)
                    }

   37CCB: A4 00                                            // ..

                    Case
   37CCD: A1 4B 06                                         // .K.

 (0xC7)
                    {

   37CD0: A0 0A 93 5F 54 5F 30 0A C7                       // ..._T_0..

                        Return (Zero)
                    }

   37CD9: A4 00                                            // ..

                    Case
   37CDB: A1 4D 05                                         // .M.

 (0x78)
                    {

   37CDE: A0 0A 93 5F 54 5F 30 0A 78                       // ..._T_0.x

                        Return (Zero)
                    }

   37CE7: A4 00                                            // ..

                    Case
   37CE9: A1 4F 04                                         // .O.

 (0xC8)
                    {

   37CEC: A0 0A 93 5F 54 5F 30 0A C8                       // ..._T_0..

                        Return (Zero)
                    }

   37CF5: A4 00                                            // ..

                    Case
   37CF7: A1 41 04                                         // .A.

 (0x78)
                    {

   37CFA: A0 0A 93 5F 54 5F 30 0A 78                       // ..._T_0.x

                        Return (Zero)
                    }

   37D03: A4 00                                            // ..

                    Case
   37D05: A1 33                                            // .3

 (0xA0)
                    {

   37D07: A0 0A 93 5F 54 5F 30 0A A0                       // ..._T_0..

                        Return (Zero)
                    }

   37D10: A4 00                                            // ..

                    Case
   37D12: A1 26                                            // .&

 (0xA0)
                    {

   37D14: A0 0A 93 5F 54 5F 30 0A A0                       // ..._T_0..

                        Return (Zero)
                    }

   37D1D: A4 00                                            // ..

                    Case
   37D1F: A1 19                                            // ..

 (0xE8)
                    {

   37D21: A0 0A 93 5F 54 5F 30 0A E8                       // ..._T_0..

                        Return (Zero)
                    }

   37D2A: A4 00                                            // ..

                    Case
   37D2C: A1 0C                                            // ..

 (0x79)
                    {

   37D2E: A0 0A 93 5F 54 5F 30 0A 79                       // ..._T_0.y

                        Return (Zero)
                    }


   37D37: A4 00                                            // ..

                }


   37D39: A5                                               // .

                Return (Zero)
            }


   37D3A: A4 00                                            // ..

            Method (ECWT, 2, Serialized)
            {

   37D3C: 14 49 15 45 43 57 54 0A                          // .I.ECWT.

                Store (DerefOf (Arg0), Local0)

   37D44: 08 5F 54 5F 30 00 70 83 68 60                    // ._T_0.p.h`

                Switch (ToInteger (Local0))
                {

   37D4E: A2 47 14 01 70 99 60 00 5F 54 5F 30              // .G..p.`._T_0

                    Case (
   37D5A: A0 08                                            // ..

0x32)
                    {
                    }

   37D5C: 93 5F 54 5F 30 0A 32                             // ._T_0.2

                    Case
   37D63: A1 41 13                                         // .A.

 (
   37D66: A0 08                                            // ..

0x36)
                    {
                    }

   37D68: 93 5F 54 5F 30 0A 36                             // ._T_0.6

                    Case
   37D6F: A1 45 12                                         // .E.

 (
   37D72: A0 08                                            // ..

0x03)
                    {
                    }

   37D74: 93 5F 54 5F 30 0A 03                             // ._T_0..

                    Case
   37D7B: A1 49 11                                         // .I.

 (
   37D7E: A0 08                                            // ..

0x3A)
                    {
                    }

   37D80: 93 5F 54 5F 30 0A 3A                             // ._T_0.:

                    Case
   37D87: A1 4D 10                                         // .M.

 (
   37D8A: A0 08                                            // ..

0x30)
                    {
                    }

   37D8C: 93 5F 54 5F 30 0A 30                             // ._T_0.0

                    Case
   37D93: A1 41 10                                         // .A.

 (
   37D96: A0 07                                            // ..

One)
                    {
                    }

   37D98: 93 5F 54 5F 30 01                                // ._T_0.

                    Case
   37D9E: A1 46 0F                                         // .F.

 (
   37DA1: A0 08                                            // ..

0x83)
                    {
                    }

   37DA3: 93 5F 54 5F 30 0A 83                             // ._T_0..

                    Case
   37DAA: A1 4A 0E                                         // .J.

 (
   37DAD: A0 08                                            // ..

0x82)
                    {
                    }

   37DAF: 93 5F 54 5F 30 0A 82                             // ._T_0..

                    Case
   37DB6: A1 4E 0D                                         // .N.

 (
   37DB9: A0 08                                            // ..

0x44)
                    {
                    }

   37DBB: 93 5F 54 5F 30 0A 44                             // ._T_0.D

                    Case
   37DC2: A1 42 0D                                         // .B.

 (
   37DC5: A0 08                                            // ..

0x43)
                    {
                    }

   37DC7: 93 5F 54 5F 30 0A 43                             // ._T_0.C

                    Case
   37DCE: A1 46 0C                                         // .F.

 (
   37DD1: A0 08                                            // ..

0x42)
                    {
                    }

   37DD3: 93 5F 54 5F 30 0A 42                             // ._T_0.B

                    Case
   37DDA: A1 4A 0B                                         // .J.

 (
   37DDD: A0 08                                            // ..

0x41)
                    {
                    }

   37DDF: 93 5F 54 5F 30 0A 41                             // ._T_0.A

                    Case
   37DE6: A1 4E 0A                                         // .N.

 (
   37DE9: A0 08                                            // ..

0x45)
                    {
                    }

   37DEB: 93 5F 54 5F 30 0A 45                             // ._T_0.E

                    Case
   37DF2: A1 42 0A                                         // .B.

 (
   37DF5: A0 08                                            // ..

0x03)
                    {
                    }

   37DF7: 93 5F 54 5F 30 0A 03                             // ._T_0..

                    Case
   37DFE: A1 46 09                                         // .F.

 (
   37E01: A0 08                                            // ..

0x03)
                    {
                    }

   37E03: 93 5F 54 5F 30 0A 03                             // ._T_0..

                    Case
   37E0A: A1 4A 08                                         // .J.

 (
   37E0D: A0 08                                            // ..

0x30)
                    {
                    }

   37E0F: 93 5F 54 5F 30 0A 30                             // ._T_0.0

                    Case
   37E16: A1 4E 07                                         // .N.

 (
   37E19: A0 08                                            // ..

0xC4)
                    {
                    }

   37E1B: 93 5F 54 5F 30 0A C4                             // ._T_0..

                    Case
   37E22: A1 42 07                                         // .B.

 (
   37E25: A0 08                                            // ..

0xC5)
                    {
                    }

   37E27: 93 5F 54 5F 30 0A C5                             // ._T_0..

                    Case
   37E2E: A1 46 06                                         // .F.

 (
   37E31: A0 08                                            // ..

0xC6)
                    {
                    }

   37E33: 93 5F 54 5F 30 0A C6                             // ._T_0..

                    Case
   37E3A: A1 4A 05                                         // .J.

 (
   37E3D: A0 08                                            // ..

0xC7)
                    {
                    }

   37E3F: 93 5F 54 5F 30 0A C7                             // ._T_0..

                    Case
   37E46: A1 4E 04                                         // .N.

 (
   37E49: A0 08                                            // ..

0x78)
                    {
                    }

   37E4B: 93 5F 54 5F 30 0A 78                             // ._T_0.x

                    Case
   37E52: A1 42 04                                         // .B.

 (
   37E55: A0 08                                            // ..

0xC8)
                    {
                    }

   37E57: 93 5F 54 5F 30 0A C8                             // ._T_0..

                    Case
   37E5E: A1 36                                            // .6

 (
   37E60: A0 08                                            // ..

0x78)
                    {
                    }

   37E62: 93 5F 54 5F 30 0A 78                             // ._T_0.x

                    Case
   37E69: A1 2B                                            // .+

 (
   37E6B: A0 08                                            // ..

0xA0)
                    {
                    }

   37E6D: 93 5F 54 5F 30 0A A0                             // ._T_0..

                    Case
   37E74: A1 20                                            // . 

 (
   37E76: A0 08                                            // ..

0xA0)
                    {
                    }

   37E78: 93 5F 54 5F 30 0A A0                             // ._T_0..

                    Case
   37E7F: A1 15                                            // ..

 (
   37E81: A0 08                                            // ..

0xE8)
                    {
                    }

   37E83: 93 5F 54 5F 30 0A E8                             // ._T_0..

                    Case
   37E8A: A1 0A                                            // ..

 (
   37E8C: A0 08                                            // ..

0x79)
                    {
                    }


   37E8E: 93 5F 54 5F 30 0A 79                             // ._T_0.y

                }
            }


   37E95: A5                                               // .

            Method (ECMD, 1, Serialized)
            {
            }


   37E96: 14 06 45 43 4D 44 09                             // ..ECMD.

            Method (ECNT, 1, Serialized)
            {
            }


   37E9D: 14 06 45 43 4E 54 09                             // ..ECNT.

            Device (BAT0)
            {

   37EA4: 5B 82 1E 42 41 54 30                             // [..BAT0

                Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID

   37EAB: 08 5F 48 49 44 0C 41 D0 0C 0A                    // ._HID.A...

                Name (_UID, Zero)  // _UID: Unique ID

   37EB5: 08 5F 55 49 44 00                                // ._UID.

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   37EBB: 14 08 5F 53 54 41 00                             // .._STA.

                    Return (Zero)
                }
            }


   37EC2: A4 00                                            // ..

            Device (BAT1)
            {

   37EC4: 5B 82 2A 42 41 54 31                             // [.*BAT1

                Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID

   37ECB: 08 5F 48 49 44 0C 41 D0 0C 0A                    // ._HID.A...

                Name (_UID, One)  // _UID: Unique ID

   37ED5: 08 5F 55 49 44 01                                // ._UID.

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   37EDB: 14 08 5F 53 54 41 00                             // .._STA.

                    Return (Zero)
                }


   37EE2: A4 00                                            // ..

                Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                {

   37EE4: 14 0B 5F 42 53 54 00                             // .._BST.

                    Return (BST1 ())
                }
            }


   37EEB: A4 42 53 54 31                                   // .BST1

            Device (BAT2)
            {

   37EF0: 5B 82 2B 42 41 54 32                             // [.+BAT2

                Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID

   37EF7: 08 5F 48 49 44 0C 41 D0 0C 0A                    // ._HID.A...

                Name (_UID, 0x02)  // _UID: Unique ID

   37F01: 08 5F 55 49 44 0A 02                             // ._UID..

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   37F08: 14 08 5F 53 54 41 00                             // .._STA.

                    Return (Zero)
                }


   37F0F: A4 00                                            // ..

                Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                {

   37F11: 14 0B 5F 42 53 54 00                             // .._BST.

                    Return (BST2 ())
                }
            }
        }
    }


   37F18: A4 42 53 54 32                                   // .BST2

    Scope (\)
    {

   37F1D: 10 1A 5C 00                                      // ..\.

        Field (GNVS, AnyAcc, Lock, Preserve)
        {
            Offset (0x20), 
            B1SC,   8, 
            Offset (0x23), 
            B1SS,   8
        }
    }


   37F21: 5B 81 15 47 4E 56 53 10 00 40 10 42 31 53 43 08  // [..GNVS..@.B1SC.
   37F31: 00 10 42 31 53 53 08                             // ..B1SS.

    Scope (\)
    {

   37F38: 10 1A 5C 00                                      // ..\.

        Field (GNVS, AnyAcc, Lock, Preserve)
        {
            Offset (0x21), 
            B2SC,   8, 
            Offset (0x24), 
            B2SS,   8
        }
    }


   37F3C: 5B 81 15 47 4E 56 53 10 00 48 10 42 32 53 43 08  // [..GNVS..H.B2SC.
   37F4C: 00 10 42 32 53 53 08                             // ..B2SS.

    Device (_SB.PCI0.DOCK)
    {

   37F53: 5B 82 38 2F 03 5F 53 42 5F 50 43 49 30 44 4F 43  // [.8/._SB_PCI0DOC
   37F63: 4B                                               // K

        Name (_HID, "ABCD0000")  // _HID: Hardware ID

   37F64: 08 5F 48 49 44 0D 41 42 43 44 30 30 30 30 00     // ._HID.ABCD0000.

        Name (_CID, EisaId ("PNP0C15") /* Docking Station */)  // _CID: Compatible ID

   37F73: 08 5F 43 49 44 0C 41 D0 0C 15                    // ._CID.A...

        Name (_UID, 0x02)  // _UID: Unique ID

   37F7D: 08 5F 55 49 44 0A 02                             // ._UID..

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {

   37F84: 14 08 5F 53 54 41 00                             // .._STA.

            Return (Zero)
        }
    }


   37F8B: A4 00                                            // ..

    Scope (_SB)
    {

   37F8D: 10 36 5F 53 42 5F                                // .6_SB_

        Method (PWPR, 0, Serialized)
        {
        }


   37F93: 14 06 50 57 50 52 08                             // ..PWPR.

        Method (PWRR, 0, Serialized)
        {
        }


   37F9A: 14 06 50 57 52 52 08                             // ..PWRR.

        Device (LID0)
        {

   37FA1: 5B 82 21 4C 49 44 30                             // [.!LID0

            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID

   37FA8: 08 5F 48 49 44 0C 41 D0 0C 0D                    // ._HID.A...

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   37FB2: 14 08 5F 53 54 41 00                             // .._STA.

                Return (Zero)
            }


   37FB9: A4 00                                            // ..

            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {

   37FBB: 14 08 5F 4C 49 44 00                             // .._LID.

                Return (One)
            }
        }
    }


   37FC2: A4 01                                            // ..

    Scope (_SB.PCI0.LPCB.H_EC)
    {

   37FC4: 10 44 04 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  // .D./._SB_PCI0LPC
   37FD4: 42 48 5F 45 43                                   // BH_EC

        Method (BST1, 0, NotSerialized)
        {

   37FD9: 14 17 42 53 54 31 00                             // ..BST1.

            Name (PKG1, 
   37FE0: 08 50 4B 47 31                                   // .PKG1

Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })

   37FE5: 12 06 04 00 00 00 00                             // .......

            Return (PKG1) /* \_SB_.PCI0.LPCB.H_EC.BST1.PKG1 */
        }


   37FEC: A4 50 4B 47 31                                   // .PKG1

        Method (BST2, 0, NotSerialized)
        {

   37FF1: 14 17 42 53 54 32 00                             // ..BST2.

            Name (PKG2, 
   37FF8: 08 50 4B 47 32                                   // .PKG2

Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })

   37FFD: 12 06 04 00 00 00 00                             // .......

            Return (PKG2) /* \_SB_.PCI0.LPCB.H_EC.BST2.PKG2 */
        }
    }


   38004: A4 50 4B 47 32                                   // .PKG2

    Device (_SB.TPM)
    {

   38009: 5B 82 4F 51 2E 5F 53 42 5F 54 50 4D 5F           // [.OQ._SB_TPM_

        Name (TMRQ, 0x00000000)

   38016: 08 54 4D 52 51 0C 00 00 00 00                    // .TMRQ.....

        Name (TLVL, 0xFFFFFFFF)

   38020: 08 54 4C 56 4C 0C FF FF FF FF                    // .TLVL.....

        Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
        {

   3802A: 14 2F 5F 48 49 44 00                             // ./_HID.

            If (TCMF)
            {

   38031: A0 0B 54 43 4D 46                                // ..TCMF

                Return (0x01013469)
            }

   38037: A4 0C 69 34 01 01                                // ..i4..

            ElseIf
   3803D: A1 1C                                            // ..

 (LEqual (TTDP, Zero))
            {

   3803F: A0 0D 93 54 54 44 50 00                          // ...TTDP.

                Return (0x310CD041)
            }

   38047: A4 0C 41 D0 0C 31                                // ..A..1

            Else
            {

   3804D: A1 0C                                            // ..

                Return ("MSFT0101")
            }
        }


   3804F: A4 0D 4D 53 46 54 30 31 30 31 00                 // ..MSFT0101.

        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)

   3805A: 5B 80 54 4D 4D 42 00 0C 00 00 D4 FE 0B 00 50     // [.TMMB........P

        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACC0,   8, 
            Offset (0x08), 
            INTE,   32, 
            INTV,   8, 
            Offset (0x10), 
            INTS,   32, 
            INTF,   32, 
            TSTS,   32, 
            Offset (0x24), 
            FIFO,   32, 
            Offset (0x30), 
            IDTF,   32, 
            Offset (0x4C), 
            SCMD,   32
        }


   38069: 5B 81 41 04 54 4D 4D 42 11 41 43 43 30 08 00 38  // [.A.TMMB.ACC0..8
   38079: 49 4E 54 45 20 49 4E 54 56 08 00 18 49 4E 54 53  // INTE INTV...INTS
   38089: 20 49 4E 54 46 20 54 53 54 53 20 00 40 04 46 49  //  INTF TSTS .@.FI
   38099: 46 4F 20 00 40 04 49 44 54 46 20 00 40 0C 53 43  // FO .@.IDTF .@.SC
   380A9: 4D 44 20                                         // MD 

        Method (_STR, 0, NotSerialized)  // _STR: Description String
        {

   380AC: 14 47 05 5F 53 54 52 00                          // .G._STR.

            If (LEqual (TTDP, Zero))
            {

   380B4: A0 2A 93 54 54 44 50 00                          // .*.TTDP.

                Return (
   380BC: A4                                               // .

Unicode ("TPM 1.2 Device"))
            }

   380BD: 11 21 0A 1E 54 00 50 00 4D 00 20 00 31 00 2E 00  // .!..T.P.M. .1...
   380CD: 32 00 20 00 44 00 65 00 76 00 69 00 63 00 65 00  // 2. .D.e.v.i.c.e.
   380DD: 00 00                                            // ..

            Else
            {

   380DF: A1 24                                            // .$

                Return (
   380E1: A4                                               // .

Unicode ("TPM 2.0 Device"))
            }
        }


   380E2: 11 21 0A 1E 54 00 50 00 4D 00 20 00 32 00 2E 00  // .!..T.P.M. .2...
   380F2: 30 00 20 00 44 00 65 00 76 00 69 00 63 00 65 00  // 0. .D.e.v.i.c.e.
   38102: 00 00                                            // ..

        Name (_UID, One)  // _UID: Unique ID

   38104: 08 5F 55 49 44 01                                // ._UID.

        Name (CRST, 
   3810A: 08 43 52 53 54                                   // .CRST

Buffer (0x1A)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0xD7, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
            /* 0018 */  0x79, 0x00                                       // y.
        })

   3810F: 11 1D 0A 1A 86 09 00 00 00 00 00 00 00 10 00 00  // ................
   3811F: 86 09 00 00 00 00 D7 FE 00 10 00 00 79 00        // ............y.

        Name (CRSD, 
   3812D: 08 43 52 53 44                                   // .CRSD

Buffer (0x0E)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD4, 0xFE,  // ........
            /* 0008 */  0x00, 0x50, 0x00, 0x00, 0x79, 0x00               // .P..y.
        })

   38132: 11 11 0A 0E 86 09 00 01 00 00 D4 FE 00 50 00 00  // .............P..
   38142: 79 00                                            // y.

        Name (CRID, 
   38144: 08 43 52 49 44                                   // .CRID

Buffer (0x0E)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD4, 0xFE,  // ........
            /* 0008 */  0x00, 0x50, 0x00, 0x00, 0x79, 0x00               // .P..y.
        })

   38149: 11 11 0A 0E 86 09 00 01 00 00 D4 FE 00 50 00 00  // .............P..
   38159: 79 00                                            // y.

        Name (CREI, 
   3815B: 08 43 52 45 49                                   // .CREI

Buffer (0x17)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD4, 0xFE,  // ........
            /* 0008 */  0x00, 0x50, 0x00, 0x00, 0x89, 0x06, 0x00, 0x0D,  // .P......
            /* 0010 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
        })

   38160: 11 1A 0A 17 86 09 00 01 00 00 D4 FE 00 50 00 00  // .............P..
   38170: 89 06 00 0D 01 00 00 00 00 79 00                 // .........y.

        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {

   3817B: 14 4F 13 5F 43 52 53 08                          // .O._CRS.

            If (LEqual (AMDT, One))
            {

   38183: A0 4D 05 93 41 4D 44 54 01                       // .M..AMDT.

                CreateDWordField (CRST, 0x04, MTFB)

   3818C: 8A 43 52 53 54 0A 04 4D 54 46 42                 // .CRST..MTFB

                CreateDWordField (CRST, 0x08, LTFB)
                Store (TPMB, MTFB) /* \_SB_.TPM_._CRS.MTFB */
                Store (TPBS, LTFB) /* \_SB_.TPM_._CRS.LTFB */

   38197: 8A 43 52 53 54 0A 08 4C 54 46 42 70 54 50 4D 42  // .CRST..LTFBpTPMB
   381A7: 4D 54 46 42 70 54 50 42 53 4C 54 46 42           // MTFBpTPBSLTFB

                CreateDWordField (CRST, 0x10, MTFC)

   381B4: 8A 43 52 53 54 0A 10 4D 54 46 43                 // .CRST..MTFC

                CreateDWordField (CRST, 0x14, LTFC)
                Store (TPMC, MTFC) /* \_SB_.TPM_._CRS.MTFC */
                Store (TPCS, LTFC) /* \_SB_.TPM_._CRS.LTFC */

   381BF: 8A 43 52 53 54 0A 14 4C 54 46 43 70 54 50 4D 43  // .CRST..LTFCpTPMC
   381CF: 4D 54 46 43 70 54 50 43 53 4C 54 46 43           // MTFCpTPCSLTFC

                Return (CRST) /* \_SB_.TPM_.CRST */
            }

   381DC: A4 43 52 53 54                                   // .CRST

            Else
            {

   381E1: A1 44 0D                                         // .D.

                If (LEqual (DTP1, One))
                {

   381E4: A0 34 93 44 54 50 31 01                          // .4.DTP1.

                    CreateDWordField (CRSD, 0x04, MTFE)

   381EC: 8A 43 52 53 44 0A 04 4D 54 46 45                 // .CRSD..MTFE

                    CreateDWordField (CRSD, 0x08, LTFE)
                    Store (0xFED40000, MTFE) /* \_SB_.TPM_._CRS.MTFE */
                    Store (0x5000, LTFE) /* \_SB_.TPM_._CRS.LTFE */

   381F7: 8A 43 52 53 44 0A 08 4C 54 46 45 70 0C 00 00 D4  // .CRSD..LTFEp....
   38207: FE 4D 54 46 45 70 0B 00 50 4C 54 46 45           // .MTFEp..PLTFE

                    Return (CRSD) /* \_SB_.TPM_.CRSD */
                }

   38214: A4 43 52 53 44                                   // .CRSD

                ElseIf
   38219: A1 4B 08                                         // .K.

 (LEqual (TTPF, One))
                {

   3821C: A0 45 06 93 54 54 50 46 01                       // .E..TTPF.

                    If (LAnd (LEqual (TMRQ, Zero), 
   38225: A0 41 04 90 93 54 4D 52 51 00                    // .A...TMRQ.


   3822F: 92                                               // .

LNotEqual (TMRQ, 0xFFFFFFFF)))
                    {

   38230: 93 54 4D 52 51 0C FF FF FF FF                    // .TMRQ.....

                        CreateDWordField (CRID, 0x04, MTFD)

   3823A: 8A 43 52 49 44 0A 04 4D 54 46 44                 // .CRID..MTFD

                        CreateDWordField (CRID, 0x08, LTFD)
                        Store (0xFED40000, MTFD) /* \_SB_.TPM_._CRS.MTFD */
                        Store (0x5000, LTFD) /* \_SB_.TPM_._CRS.LTFD */

   38245: 8A 43 52 49 44 0A 08 4C 54 46 44 70 0C 00 00 D4  // .CRID..LTFDp....
   38255: FE 4D 54 46 44 70 0B 00 50 4C 54 46 44           // .MTFDp..PLTFD

                        Return (CRID) /* \_SB_.TPM_.CRID */
                    }

   38262: A4 43 52 49 44                                   // .CRID

                    Else
                    {

   38267: A1 1A                                            // ..

                        CreateDWordField (CREI, 0x11, LIRQ)
                        Store (TMRQ, LIRQ) /* \_SB_.TPM_._CRS.LIRQ */

   38269: 8A 43 52 45 49 0A 11 4C 49 52 51 70 54 4D 52 51  // .CREI..LIRQpTMRQ
   38279: 4C 49 52 51                                      // LIRQ

                        Return (CREI) /* \_SB_.TPM_.CREI */
                    }
                }

   3827D: A4 43 52 45 49                                   // .CREI

                ElseIf
   38282: A1 22                                            // ."

 (LEqual (TTPF, Zero))
                {

   38284: A0 20 93 54 54 50 46 00                          // . .TTPF.

                    CreateDWordField (CRST, 0x10, MTFF)
                    Store (FTPM, MTFF) /* \_SB_.TPM_._CRS.MTFF */

   3828C: 8A 43 52 53 54 0A 10 4D 54 46 46 70 46 54 50 4D  // .CRST..MTFFpFTPM
   3829C: 4D 54 46 46                                      // MTFF

                    Return (CRST) /* \_SB_.TPM_.CRST */
                }

                Store (Zero, MTFE) /* \_SB_.TPM_._CRS.MTFE */
                Store (Zero, LTFE) /* \_SB_.TPM_._CRS.LTFE */

   382A0: A4 43 52 53 54 70 00 4D 54 46 45 70 00 4C 54 46  // .CRSTp.MTFEp.LTF
   382B0: 45                                               // E

                Return (CRID) /* \_SB_.TPM_.CRID */
            }


   382B1: A4 43 52 49 44                                   // .CRID

            Return (CRID) /* \_SB_.TPM_.CRID */
        }


   382B6: A4 43 52 49 44                                   // .CRID

        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
        {

   382BB: 14 4F 0E 5F 53 52 53 09                          // .O._SRS.

            If (LAnd (
   382C3: A0 47 0E 90 92                                   // .G...

LNotEqual (TMRQ, Zero), 
   382C8: 93 54 4D 52 51 00                                // .TMRQ.


   382CE: 92                                               // .

LNotEqual (TMRQ, 0xFFFFFFFF)))
            {

   382CF: 93 54 4D 52 51 0C FF FF FF FF                    // .TMRQ.....

                CreateDWordField (Arg0, 0x11, IRQ0)

   382D9: 8A 68 0A 11 49 52 51 30                          // .h..IRQ0

                CreateDWordField (CREI, 0x11, LIRQ)
                Store (IRQ0, LIRQ) /* \_SB_.TPM_._SRS.LIRQ */
                Store (IRQ0, TMRQ) /* \_SB_.TPM_.TMRQ */

   382E1: 8A 43 52 45 49 0A 11 4C 49 52 51 70 49 52 51 30  // .CREI..LIRQpIRQ0
   382F1: 4C 49 52 51 70 49 52 51 30 54 4D 52 51           // LIRQpIRQ0TMRQ

                CreateBitField (Arg0, 0x79, ITRG)

   382FE: 8D 68 0A 79 49 54 52 47                          // .h.yITRG

                CreateBitField (CREI, 0x79, LTRG)
                Store (ITRG, LTRG) /* \_SB_.TPM_._SRS.LTRG */

   38306: 8D 43 52 45 49 0A 79 4C 54 52 47 70 49 54 52 47  // .CREI.yLTRGpITRG
   38316: 4C 54 52 47                                      // LTRG

                CreateBitField (Arg0, 0x7A, ILVL)

   3831A: 8D 68 0A 7A 49 4C 56 4C                          // .h.zILVL

                CreateBitField (CREI, 0x7A, LLVL)
                Store (ILVL, LLVL) /* \_SB_.TPM_._SRS.LLVL */

   38322: 8D 43 52 45 49 0A 7A 4C 4C 56 4C 70 49 4C 56 4C  // .CREI.zLLVLpILVL
   38332: 4C 4C 56 4C                                      // LLVL

                If (LOr (LEqual (And (IDTF, 0x0F), Zero), 
   38336: A0 44 07 91 93 7B 49 44 54 46 0A 0F 00 00        // .D...{IDTF....

LEqual (And (IDTF, 0x0F
                    ), 0x0F)))
                {

   38344: 93 7B 49 44 54 46 0A 0F 00 0A 0F                 // .{IDTF.....

                    If (LLess (IRQ0, 0x10))
                    {

   3834F: A0 15 95 49 52 51 30 0A 10                       // ...IRQ0..

                        Store (And (IRQ0, 0x0F), INTV) /* \_SB_.TPM_.INTV */
                    }


   38358: 70 7B 49 52 51 30 0A 0F 00 49 4E 54 56           // p{IRQ0...INTV

                    If (LEqual (ITRG, One))
                    {

   38365: A0 12 93 49 54 52 47 01                          // ...ITRG.

                        Or (INTE, 0x10, INTE) /* \_SB_.TPM_.INTE */
                    }

   3836D: 7D 49 4E 54 45 0A 10 49 4E 54 45                 // }INTE..INTE

                    Else
                    {

   38378: A1 0F                                            // ..

                        And (INTE, 0xFFFFFFEF, INTE) /* \_SB_.TPM_.INTE */
                    }


   3837A: 7B 49 4E 54 45 0C EF FF FF FF 49 4E 54 45        // {INTE.....INTE

                    If (LEqual (ILVL, Zero))
                    {

   38388: A0 12 93 49 4C 56 4C 00                          // ...ILVL.

                        Or (INTE, 0x08, INTE) /* \_SB_.TPM_.INTE */
                    }

   38390: 7D 49 4E 54 45 0A 08 49 4E 54 45                 // }INTE..INTE

                    Else
                    {

   3839B: A1 0F                                            // ..

                        And (INTE, 0xFFFFFFF7, INTE) /* \_SB_.TPM_.INTE */
                    }
                }
            }
        }


   3839D: 7B 49 4E 54 45 0C F7 FF FF FF 49 4E 54 45        // {INTE.....INTE

        OperationRegion (CRBD, SystemMemory, TPMM, 0x48)

   383AB: 5B 80 43 52 42 44 00 54 50 4D 4D 0A 48           // [.CRBD.TPMM.H

        Field (CRBD, AnyAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            HERR,   32, 
            Offset (0x40), 
            HCMD,   32, 
            HSTS,   32
        }


   383B8: 5B 81 1A 43 52 42 44 00 00 20 48 45 52 52 20 00  // [..CRBD.. HERR .
   383C8: 40 1C 48 43 4D 44 20 48 53 54 53 20              // @.HCMD HSTS 

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {

   383D4: 14 30 5F 53 54 41 00                             // .0_STA.

            If (LEqual (TTDP, Zero))
            {

   383DB: A0 12 93 54 54 44 50 00                          // ...TTDP.

                If (TPMF)
                {

   383E3: A0 08 54 50 4D 46                                // ..TPMF

                    Return (0x0F)
                }


   383E9: A4 0A 0F                                         // ...

                Return (Zero)
            }

   383EC: A4 00                                            // ..

            ElseIf
   383EE: A1 14                                            // ..

 (LEqual (TTDP, One))
            {

   383F0: A0 12 93 54 54 44 50 01                          // ...TTDP.

                If (TPMF)
                {

   383F8: A0 08 54 50 4D 46                                // ..TPMF

                    Return (0x0F)
                }


   383FE: A4 0A 0F                                         // ...

                Return (Zero)
            }


   38401: A4 00                                            // ..

            Return (Zero)
        }


   38403: A4 00                                            // ..

        Method (STRT, 3, Serialized)
        {

   38405: 14 44 0C 53 54 52 54 0B                          // .D.STRT.


   3840D: 08 5F 54 5F 30 00                                // ._T_0.

            OperationRegion (TPMR, SystemMemory, FTPM, 0x1000)

   38413: 5B 80 54 50 4D 52 00 46 54 50 4D 0B 00 10        // [.TPMR.FTPM...

            Field (TPMR, AnyAcc, NoLock, Preserve)
            {
                Offset (0x04), 
                FERR,   32, 
                Offset (0x0C), 
                BEGN,   32
            }


   38421: 5B 81 14 54 50 4D 52 00 00 20 46 45 52 52 20 00  // [..TPMR.. FERR .
   38431: 20 42 45 47 4E 20                                //  BEGN 

            Name (TIMR, Zero)

   38437: 08 54 49 4D 52 00                                // .TIMR.

            If (
   3843D: A0 07                                            // ..


   3843F: 92                                               // .

LNotEqual (ToInteger (Arg0), Zero)){}

   38440: 93 99 68 00 00                                   // ..h..

            Switch (ToInteger (Arg1))
            {

   38445: A2 42 08 01 70 99 69 00 5F 54 5F 30              // .B..p.i._T_0

                Case (Zero)
                {

   38451: A0 0C 93 5F 54 5F 30 00                          // ..._T_0.

                    Return (
   38459: A4                                               // .

Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

   3845A: 11 03 01 03                                      // ....

                Case
   3845E: A1 48 06                                         // .H.

 (One)
                {
                    Store (Zero, TIMR) /* \_SB_.TPM_.STRT.TIMR */

   38461: A0 45 06 93 5F 54 5F 30 01 70 00 54 49 4D 52     // .E.._T_0.p.TIMR

                    If (LEqual (AMDT, One))
                    {

   38470: A0 28 93 41 4D 44 54 01                          // .(.AMDT.

                        While (LAnd (LEqual (BEGN, One), 
   38478: A2 20 90 93 42 45 47 4E 01                       // . ..BEGN.

LLess (TIMR, 0x0200)))
                        {

   38481: 95 54 49 4D 52 0B 00 02                          // .TIMR...

                            If (LEqual (BEGN, One))
                            {
                                Sleep (One)

   38489: A0 0F 93 42 45 47 4E 01 5B 22 01                 // ...BEGN.[".

                                Increment (TIMR)
                            }
                        }
                    }

   38494: 75 54 49 4D 52                                   // uTIMR

                    ElseIf
   38499: A1 2B                                            // .+

 (LEqual (Or (And (HSTS, 0x02), And (HSTS, One)
                        ), 0x03))
                    {

   3849B: A0 1B 93 7D 7B 48 53 54 53 0A 02 00 7B 48 53 54  // ...}{HSTS...{HST
   384AB: 53 01 00 00 0A 03                                // S.....

                        Store (One, HCMD) /* \_SB_.TPM_.HCMD */
                    }

   384B1: 70 01 48 43 4D 44                                // p.HCMD

                    Else
                    {
                        Store (One, FERR) /* \_SB_.TPM_.STRT.FERR */

   384B7: A1 0D 70 01 46 45 52 52                          // ..p.FERR

                        Store (Zero, BEGN) /* \_SB_.TPM_.STRT.BEGN */
                    }


   384BF: 70 00 42 45 47 4E                                // p.BEGN

                    Return (Zero)
                }


   384C5: A4 00                                            // ..

            }


   384C7: A5                                               // .

            Return (One)
        }


   384C8: A4 01                                            // ..

        Method (CRYF, 3, Serialized)
        {

   384CA: 14 4F 05 43 52 59 46 0B                          // .O.CRYF.


   384D2: 08 5F 54 5F 30 00                                // ._T_0.

            If (
   384D8: A0 07                                            // ..


   384DA: 92                                               // .

LNotEqual (ToInteger (Arg0), One)){}

   384DB: 93 99 68 00 01                                   // ..h..

            Switch (ToInteger (Arg1))
            {

   384E0: A2 44 04 01 70 99 69 00 5F 54 5F 30              // .D..p.i._T_0

                Case (Zero)
                {

   384EC: A0 0C 93 5F 54 5F 30 00                          // ..._T_0.

                    Return (
   384F4: A4                                               // .

Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

   384F5: 11 03 01 03                                      // ....

                Case
   384F9: A1 2A                                            // .*

 (One)
                {

   384FB: A0 28 93 5F 54 5F 30 01                          // .(._T_0.

                    Name (TPMV, 
   38503: 08 54 50 4D 56                                   // .TPMV

Package (0x02)
                    {
                        One, 

   38508: 12 09 02 01                                      // ....

                        Package (0x02)
                        {
                            One, 
                            0x20
                        }
                    })

   3850C: 12 05 02 01 0A 20                                // ..... 

                    If (LEqual (_STA (), Zero))
                    {

   38512: A0 0C 93 5F 53 54 41 00                          // ..._STA.

                        Return (
   3851A: A4                                               // .

Package (0x01)
                        {
                            Zero
                        })
                    }


   3851B: 12 03 01 00                                      // ....

                    Return (TPMV) /* \_SB_.TPM_.CRYF.TPMV */
                }


   3851F: A4 54 50 4D 56                                   // .TPMV

            }


   38524: A5                                               // .

            Return (
   38525: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }


   38526: 11 03 01 00                                      // ....

    Scope (_SB.TPM)
    {

   3852A: 10 46 34 2E 5F 53 42 5F 54 50 4D 5F              // .F4._SB_TPM_

        OperationRegion (TSMI, SystemIO, SMIA, One)

   38536: 5B 80 54 53 4D 49 01 53 4D 49 41 01              // [.TSMI.SMIA.

        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            SMI,    8
        }


   38542: 5B 81 0B 54 53 4D 49 01 53 4D 49 5F 08           // [..TSMI.SMI_.

        OperationRegion (ATNV, SystemMemory, PPIM, PPIL)

   3854F: 5B 80 41 54 4E 56 00 50 50 49 4D 50 50 49 4C     // [.ATNV.PPIMPPIL

        Field (ATNV, AnyAcc, NoLock, Preserve)
        {
            RQST,   32, 
            RCNT,   32, 
            ERRO,   32, 
            FLAG,   32, 
            MISC,   32, 
            OPTN,   32, 
            SRSP,   32
        }


   3855E: 5B 81 29 41 54 4E 56 00 52 51 53 54 20 52 43 4E  // [.)ATNV.RQST RCN
   3856E: 54 20 45 52 52 4F 20 46 4C 41 47 20 4D 49 53 43  // T ERRO FLAG MISC
   3857E: 20 4F 50 54 4E 20 53 52 53 50 20                 //  OPTN SRSP 

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   38589: 14 40 28 5F 44 53 4D 0C                          // .@(_DSM.


   38591: 08 5F 54 5F 31 00                                // ._T_1.


   38597: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   3859D: A0 47 1B 93 68                                   // .G..h

ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
            {

   385A2: 11 13 0A 10 A6 FA DD 3D 1B 36 B4 4E A4 24 8D 10  // .......=.6.N.$..
   385B2: 08 9D 16 53                                      // ...S

                Switch (ToInteger (Arg2))
                {

   385B6: A2 4E 19 01 70 99 6A 00 5F 54 5F 30              // .N..p.j._T_0

                    Case (Zero)
                    {

   385C2: A0 0E 93 5F 54 5F 30 00                          // ..._T_0.

                        Return (
   385CA: A4                                               // .

Buffer (0x02)
                        {
                             0xFF, 0x01                                       // ..
                        })
                    }

   385CB: 11 05 0A 02 FF 01                                // ......

                    Case
   385D1: A1 42 18                                         // .B.

 (One)
                    {

   385D4: A0 1D 93 5F 54 5F 30 01                          // ..._T_0.

                        If (LEqual (PPIV, Zero))
                        {

   385DC: A0 0D 93 50 50 49 56 00                          // ...PPIV.

                            Return ("1.2")
                        }

   385E4: A4 0D 31 2E 32 00                                // ..1.2.

                        Else
                        {

   385EA: A1 07                                            // ..

                            Return ("1.3")
                        }
                    }

   385EC: A4 0D 31 2E 33 00                                // ..1.3.

                    Case
   385F2: A1 41 16                                         // .A.

 (0x02)
                    {
                        Store (DerefOf (
   385F5: A0 3C 93 5F 54 5F 30 0A 02 70 83                 // .<._T_0..p.

Index (Arg3, Zero)), RQST) /* \_SB_.TPM_.RQST */
                        Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */
                        Store (0x02, FLAG) /* \_SB_.TPM_.FLAG */
                        Store (OFST, TMF1) /* \TMF1 */
                        Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */
                        Store (TMF1, SMI) /* \_SB_.TPM_.SMI_ */

   38600: 88 6B 00 00 52 51 53 54 70 00 53 52 53 50 70 0A  // .k..RQSTp.SRSPp.
   38610: 02 46 4C 41 47 70 4F 46 53 54 54 4D 46 31 70 00  // .FLAGpOFSTTMF1p.
   38620: 53 52 53 50 70 54 4D 46 31 53 4D 49 5F           // SRSPpTMF1SMI_

                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }

   3862D: A4 53 52 53 50                                   // .SRSP

                    Case
   38632: A1 41 12                                         // .A.

 (0x03)
                    {

   38635: A0 23 93 5F 54 5F 30 0A 03                       // .#._T_0..

                        Name (PPI1, 
   3863E: 08 50 50 49 31                                   // .PPI1

Package (0x02)
                        {
                            Zero, 
                            Zero
                        })
                        Store (RQST, 
   38643: 12 04 02 00 00 70 52 51 53 54                    // .....pRQST

Index (PPI1, One))

   3864D: 88 50 50 49 31 01 00                             // .PPI1..

                        Return (PPI1) /* \_SB_.TPM_._DSM.PPI1 */
                    }

   38654: A4 50 50 49 31                                   // .PPI1

                    Case
   38659: A1 4A 0F                                         // .J.

 (0x04)
                    {

   3865C: A0 0D 93 5F 54 5F 30 0A 04                       // ..._T_0..

                        Return (TRST) /* \TRST */
                    }

   38665: A4 54 52 53 54                                   // .TRST

                    Case
   3866A: A1 49 0E                                         // .I.

 (0x05)
                    {

   3866D: A0 48 04 93 5F 54 5F 30 0A 05                    // .H.._T_0..

                        Name (PPI2, 
   38677: 08 50 50 49 32                                   // .PPI2

Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */
                        Store (0x05, FLAG) /* \_SB_.TPM_.FLAG */
                        Store (OFST, SMI) /* \_SB_.TPM_.SMI_ */
                        Store (RCNT, 
   3867C: 12 05 03 00 00 00 70 00 53 52 53 50 70 0A 05 46  // ......p.SRSPp..F
   3868C: 4C 41 47 70 4F 46 53 54 53 4D 49 5F 70 52 43 4E  // LAGpOFSTSMI_pRCN
   3869C: 54                                               // T

Index (PPI2, One))
                        Store (ERRO, 
   3869D: 88 50 50 49 32 01 00 70 45 52 52 4F              // .PPI2..pERRO

Index (PPI2, 0x02))

   386A9: 88 50 50 49 32 0A 02 00                          // .PPI2...

                        Return (PPI2) /* \_SB_.TPM_._DSM.PPI2 */
                    }

   386B1: A4 50 50 49 32                                   // .PPI2

                    Case
   386B6: A1 4D 09                                         // .M.

 (0x06)
                    {

   386B9: A0 0B 93 5F 54 5F 30 0A 06                       // ..._T_0..

                        Return (0x03)
                    }

   386C2: A4 0A 03                                         // ...

                    Case
   386C5: A1 4E 08                                         // .N.

 (0x07)
                    {
                        Store (DerefOf (
   386C8: A0 40 05 93 5F 54 5F 30 0A 07 70 83              // .@.._T_0..p.

Index (Arg3, Zero)), RQST) /* \_SB_.TPM_.RQST */
                        Store (0x07, FLAG) /* \_SB_.TPM_.FLAG */
                        Store (Zero, OPTN) /* \_SB_.TPM_.OPTN */

   386D4: 88 6B 00 00 52 51 53 54 70 0A 07 46 4C 41 47 70  // .k..RQSTp..FLAGp
   386E4: 00 4F 50 54 4E                                   // .OPTN

                        If (LEqual (RQST, 0x17))
                        {

   386E9: A0 12 93 52 51 53 54 0A 17                       // ...RQST..

                            ToInteger (DerefOf (
   386F2: 99 83                                            // ..

Index (Arg3, One)), OPTN) /* \_SB_.TPM_.OPTN */
                        }

                        Store (OFST, TMF1) /* \TMF1 */
                        Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */
                        Store (TMF1, SMI) /* \_SB_.TPM_.SMI_ */

   386F4: 88 6B 01 00 4F 50 54 4E 70 4F 46 53 54 54 4D 46  // .k..OPTNpOFSTTMF
   38704: 31 70 00 53 52 53 50 70 54 4D 46 31 53 4D 49 5F  // 1p.SRSPpTMF1SMI_

                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }

   38714: A4 53 52 53 50                                   // .SRSP

                    Case
   38719: A1 3A                                            // .:

 (0x08)
                    {
                        Store (DerefOf (
   3871B: A0 36 93 5F 54 5F 30 0A 08 70 83                 // .6._T_0..p.

Index (Arg3, Zero)), RQST) /* \_SB_.TPM_.RQST */
                        Store (0x08, FLAG) /* \_SB_.TPM_.FLAG */
                        Store (OFST, TMF1) /* \TMF1 */
                        Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */
                        Store (TMF1, SMI) /* \_SB_.TPM_.SMI_ */

   38726: 88 6B 00 00 52 51 53 54 70 0A 08 46 4C 41 47 70  // .k..RQSTp..FLAGp
   38736: 4F 46 53 54 54 4D 46 31 70 00 53 52 53 50 70 54  // OFSTTMF1p.SRSPpT
   38746: 4D 46 31 53 4D 49 5F                             // MF1SMI_

                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }

   3874D: A4 53 52 53 50                                   // .SRSP

                    Default
                    {
                    }


   38752: A1 01                                            // ..

                }
            }

   38754: A5                                               // .

            ElseIf
   38755: A1 4F 06                                         // .O.

 (LEqual (Arg0, 
   38758: A0 4C 06 93 68                                   // .L..h

ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d") /* TPM Memory Clear */))
            {

   3875D: 11 13 0A 10 ED 54 60 37 13 CC 75 46 90 1C 47 56  // .....T`7..uF..GV
   3876D: D7 F2 D4 5D                                      // ...]

                Switch (ToInteger (Arg2))
                {

   38771: A2 43 05 01 70 99 6A 00 5F 54 5F 31              // .C..p.j._T_1

                    Case (Zero)
                    {

   3877D: A0 0C 93 5F 54 5F 31 00                          // ..._T_1.

                        Return (
   38785: A4                                               // .

Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

   38786: 11 03 01 03                                      // ....

                    Case
   3878A: A1 39                                            // .9

 (One)
                    {
                        Store (DerefOf (
   3878C: A0 35 93 5F 54 5F 31 01 70 83                    // .5._T_1.p.

Index (Arg3, Zero)), RQST) /* \_SB_.TPM_.RQST */
                        Store (0x09, FLAG) /* \_SB_.TPM_.FLAG */
                        Store (OFST, TMF1) /* \TMF1 */
                        Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */
                        Store (TMF1, SMI) /* \_SB_.TPM_.SMI_ */

   38796: 88 6B 00 00 52 51 53 54 70 0A 09 46 4C 41 47 70  // .k..RQSTp..FLAGp
   387A6: 4F 46 53 54 54 4D 46 31 70 00 53 52 53 50 70 54  // OFSTTMF1p.SRSPpT
   387B6: 4D 46 31 53 4D 49 5F                             // MF1SMI_

                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }

   387BD: A4 53 52 53 50                                   // .SRSP

                    Default
                    {
                    }


   387C2: A1 01                                            // ..

                }
            }


   387C4: A5                                               // .

            If (LEqual (Arg0, 
   387C5: A0 1F 93 68                                      // ...h

ToUUID ("cf8e16a5-c1e8-4e25-b712-4f54a96702c8") /* TPM Hardware Information */))
            {

   387C9: 11 13 0A 10 A5 16 8E CF E8 C1 25 4E B7 12 4F 54  // ..........%N..OT
   387D9: A9 67 02 C8                                      // .g..

                Return (CRYF (Arg1, Arg2, Arg3))
            }


   387DD: A4 43 52 59 46 69 6A 6B                          // .CRYFijk

            If (LEqual (Arg0, 
   387E5: A0 1F 93 68                                      // ...h

ToUUID ("6bbf6cab-5463-4714-b7cd-f0203c0368d4") /* TPM Start Method */))
            {

   387E9: 11 13 0A 10 AB 6C BF 6B 63 54 14 47 B7 CD F0 20  // .....l.kcT.G... 
   387F9: 3C 03 68 D4                                      // <.h.

                Return (STRT (Arg1, Arg2, Arg3))
            }


   387FD: A4 53 54 52 54 69 6A 6B                          // .STRTijk

            Return (
   38805: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   38806: 11 03 01 00                                      // ....

        Method (TPTS, 1, Serialized)
        {

   3880A: 14 46 06 54 50 54 53 09                          // .F.TPTS.


   38812: 08 5F 54 5F 30 00                                // ._T_0.

            Switch (ToInteger (Arg0))
            {

   38818: A2 48 05 01 70 99 68 00 5F 54 5F 30              // .H..p.h._T_0

                Case (0x04)
                {
                    Store (Zero, RQST) /* \_SB_.TPM_.RQST */
                    Store (0x09, FLAG) /* \_SB_.TPM_.FLAG */
                    Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */

   38824: A0 24 93 5F 54 5F 30 0A 04 70 00 52 51 53 54 70  // .$._T_0..p.RQSTp
   38834: 0A 09 46 4C 41 47 70 00 53 52 53 50              // ..FLAGp.SRSP

                    Store (OFST, SMI) /* \_SB_.TPM_.SMI_ */
                }

   38840: 70 4F 46 53 54 53 4D 49 5F                       // pOFSTSMI_

                Case
   38849: A1 26                                            // .&

 (0x05)
                {
                    Store (Zero, RQST) /* \_SB_.TPM_.RQST */
                    Store (0x09, FLAG) /* \_SB_.TPM_.FLAG */
                    Store (Zero, SRSP) /* \_SB_.TPM_.SRSP */

   3884B: A0 24 93 5F 54 5F 30 0A 05 70 00 52 51 53 54 70  // .$._T_0..p.RQSTp
   3885B: 0A 09 46 4C 41 47 70 00 53 52 53 50              // ..FLAGp.SRSP

                    Store (OFST, SMI) /* \_SB_.TPM_.SMI_ */
                }


   38867: 70 4F 46 53 54 53 4D 49 5F                       // pOFSTSMI_

            }
        }
    }


   38870: A5                                               // .

    Scope (\)
    {

   38871: 10 46 63 5C 00                                   // .Fc\.

        Device (ABAW)
        {

   38876: 5B 82 40 63 41 42 41 57                          // [.@cABAW

            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID

   3887E: 08 5F 48 49 44 0C 41 D0 0C 14                    // ._HID.A...

            Name (_UID, "AsusBACKUPWMI")  // _UID: Unique ID

   38888: 08 5F 55 49 44 0D 41 73 75 73 42 41 43 4B 55 50  // ._UID.AsusBACKUP
   38898: 57 4D 49 00                                      // WMI.

            Name (_WDG, 
   3889C: 08 5F 57 44 47                                   // ._WDG

Buffer (0x28)
            {
                /* 0000 */  0x19, 0x56, 0x48, 0xA0, 0x07, 0x3E, 0xBE, 0x4A,  // .VH..>.J
                /* 0008 */  0xBE, 0x6B, 0x0A, 0xB6, 0x7E, 0x2A, 0x92, 0xE6,  // .k..~*..
                /* 0010 */  0x42, 0x43, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // BC..!...
                /* 0018 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
                /* 0020 */  0xC9, 0x06, 0x29, 0x10, 0x4D, 0x4F, 0x01, 0x00   // ..).MO..
            })

   388A1: 11 2B 0A 28 19 56 48 A0 07 3E BE 4A BE 6B 0A B6  // .+.(.VH..>.J.k..
   388B1: 7E 2A 92 E6 42 43 01 02 21 12 90 05 66 D5 D1 11  // ~*..BC..!...f...
   388C1: B2 F0 00 A0 C9 06 29 10 4D 4F 01 00              // ......).MO..

            Method (WMBC, 3, Serialized)
            {

   388CD: 14 4F 07 57 4D 42 43 0B                          // .O.WMBC.


   388D5: 08 5F 54 5F 30 00                                // ._T_0.

                Switch (Arg1)
                {

   388DB: A2 4F 06 01 70 69 5F 54 5F 30                    // .O..pi_T_0

                    Case (0x41424145)
                    {

   388E5: A0 10 93 5F 54 5F 30 0C 45 41 42 41              // ..._T_0.EABA

                        Return (EABA ())
                    }

   388F1: A4 45 41 42 41                                   // .EABA

                    Case
   388F6: A1 43 05                                         // .C.

 (0x41424147)
                    {

   388F9: A0 10 93 5F 54 5F 30 0C 47 41 42 41              // ..._T_0.GABA

                        Return (GABA ())
                    }

   38905: A4 47 41 42 41                                   // .GABA

                    Case
   3890A: A1 3F                                            // .?

 (0x53425544)
                    {

   3890C: A0 11 93 5F 54 5F 30 0C 44 55 42 53              // ..._T_0.DUBS

                        Return (SBUD (Arg2))
                    }

   38918: A4 53 42 55 44 6A                                // .SBUDj

                    Case
   3891E: A1 2B                                            // .+

 (0x47425544)
                    {

   38920: A0 11 93 5F 54 5F 30 0C 44 55 42 47              // ..._T_0.DUBG

                        Return (GBUD (Arg2))
                    }

   3892C: A4 47 42 55 44 6A                                // .GBUDj

                    Case
   38932: A1 17                                            // ..

 (0x53595343)
                    {

   38934: A0 11 93 5F 54 5F 30 0C 43 53 59 53              // ..._T_0.CSYS

                        Return (SYSC (Arg2))
                    }

   38940: A4 53 59 53 43 6A                                // .SYSCj

                    Default
                    {

   38946: A1 03                                            // ..

                        Return (Zero)
                    }


   38948: A4 00                                            // ..

                }


   3894A: A5                                               // .

                Return (Zero)
            }


   3894B: A4 00                                            // ..

            Name (WQMO, 
   3894D: 08 57 51 4D 4F                                   // .WQMO

Buffer (0x03F5)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0xE5, 0x03, 0x00, 0x00, 0x06, 0x0F, 0x00, 0x00,  // ........
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0xA8, 0x50, 0x87, 0x00, 0x01, 0x06, 0x18, 0x42,  // .P.....B
                /* 0020 */  0x20, 0x74, 0x01, 0x89, 0xC0, 0xA1, 0x21, 0x14,  //  t....!.
                /* 0028 */  0x46, 0x01, 0x0C, 0x46, 0x02, 0x84, 0xE4, 0x40,  // F..F...@
                /* 0030 */  0xC8, 0x05, 0x13, 0x13, 0x20, 0x02, 0x42, 0x5E,  // .... .B^
                /* 0038 */  0x05, 0xD8, 0x14, 0x60, 0x12, 0x44, 0xFD, 0xFB,  // ...`.D..
                /* 0040 */  0x43, 0x94, 0x04, 0x87, 0x12, 0x02, 0x21, 0x89,  // C.....!.
                /* 0048 */  0x02, 0xCC, 0x0B, 0xD0, 0x2D, 0xC0, 0xB0, 0x00,  // ....-...
                /* 0050 */  0xDB, 0x02, 0x4C, 0x0B, 0x70, 0x0C, 0x49, 0xA5,  // ..L.p.I.
                /* 0058 */  0x81, 0x53, 0x02, 0x4B, 0x81, 0x90, 0x50, 0x01,  // .S.K..P.
                /* 0060 */  0xCA, 0x05, 0xF8, 0x16, 0xA0, 0x1D, 0x51, 0x92,  // ......Q.
                /* 0068 */  0x05, 0x58, 0x86, 0x11, 0x81, 0x47, 0x11, 0xD9,  // .X...G..
                /* 0070 */  0x68, 0x9C, 0xA0, 0x6C, 0x68, 0x94, 0x0C, 0x08,  // h..lh...
                /* 0078 */  0x79, 0x16, 0x60, 0x1D, 0x98, 0x10, 0xD8, 0xBD,  // y.`.....
                /* 0080 */  0x00, 0x83, 0x02, 0x84, 0xCD, 0x42, 0xE2, 0x04,  // .....B..
                /* 0088 */  0x58, 0x13, 0xA0, 0x4D, 0x80, 0x31, 0x01, 0xE6,  // X..M.1..
                /* 0090 */  0x04, 0xD8, 0x12, 0xE0, 0x4C, 0x80, 0x45, 0x28,  // ....L.E(
                /* 0098 */  0x79, 0x43, 0x11, 0x58, 0xBC, 0x0A, 0x71, 0x84,  // yC.X..q.
                /* 00A0 */  0x12, 0xC3, 0x80, 0x31, 0xA2, 0x44, 0x0B, 0x65,  // ...1.D.e
                /* 00A8 */  0x98, 0x80, 0x91, 0x2A, 0x83, 0x11, 0x72, 0x8C,  // ...*..r.
                /* 00B0 */  0x70, 0xB6, 0x3F, 0x08, 0x12, 0x6C, 0xC1, 0x1A,  // p.?..l..
                /* 00B8 */  0xAA, 0x23, 0x8D, 0x06, 0x35, 0xBC, 0x04, 0x87,  // .#..5...
                /* 00C0 */  0xEB, 0xA1, 0x9E, 0x63, 0xE7, 0x02, 0xA4, 0x4F,  // ...c...O
                /* 00C8 */  0x52, 0x20, 0x07, 0x79, 0x6E, 0x75, 0x8E, 0x93,  // R .ynu..
                /* 00D0 */  0x80, 0x24, 0x30, 0x56, 0x82, 0x0E, 0x06, 0x0E,  // .$0V....
                /* 00D8 */  0xC5, 0x35, 0xA0, 0x66, 0x7C, 0xBC, 0x4C, 0x10,  // .5.f|.L.
                /* 00E0 */  0x1C, 0x6A, 0x88, 0x1E, 0x68, 0xB8, 0x13, 0x38,  // .j..h..8
                /* 00E8 */  0x44, 0x06, 0xE8, 0x69, 0x1D, 0x0D, 0xE6, 0x00,  // D..i....
                /* 00F0 */  0x60, 0x87, 0x93, 0xD1, 0x3D, 0xA0, 0x54, 0x01,  // `...=.T.
                /* 00F8 */  0x66, 0xC7, 0xAC, 0x89, 0x25, 0x38, 0x1E, 0x43,  // f...%8.C
                /* 0100 */  0x9F, 0xEE, 0xF9, 0x9C, 0x70, 0x02, 0xCB, 0x1F,  // ....p...
                /* 0108 */  0x04, 0x6A, 0x64, 0x86, 0xF6, 0x20, 0x4F, 0x2B,  // .jd.. O+
                /* 0110 */  0x66, 0xC8, 0xC3, 0x3F, 0x2C, 0x26, 0x16, 0x42,  // f..?,&.B
                /* 0118 */  0x1F, 0x04, 0x8F, 0x07, 0xDE, 0xFF, 0x7F, 0x3C,  // .......<
                /* 0120 */  0xE0, 0x51, 0x7C, 0x26, 0x10, 0xC2, 0x2B, 0x41,  // .Q|&..+A
                /* 0128 */  0x6C, 0x0F, 0x28, 0x41, 0x81, 0xC0, 0xE8, 0x01,  // l.(A....
                /* 0130 */  0xD9, 0xAF, 0x00, 0x84, 0xE0, 0x65, 0x8E, 0x48,  // .....e.H
                /* 0138 */  0x4E, 0x11, 0x34, 0x26, 0x4F, 0xEE, 0xD5, 0x20,  // N.4&O.. 
                /* 0140 */  0xC4, 0xBB, 0x40, 0xE8, 0xB3, 0x3A, 0xE5, 0x30,  // ..@..:.0
                /* 0148 */  0x85, 0x9F, 0x13, 0x28, 0x41, 0x91, 0x03, 0x40,  // ...(A..@
                /* 0150 */  0x89, 0x19, 0x00, 0xEA, 0x14, 0x10, 0xFB, 0x70,  // .......p
                /* 0158 */  0x4E, 0xE6, 0x00, 0x0E, 0x27, 0xCA, 0x39, 0x1C,  // N...'.9.
                /* 0160 */  0x8F, 0x8F, 0x0C, 0x46, 0x38, 0xCB, 0x72, 0x4F,  // ...F8.rO
                /* 0168 */  0x0E, 0x44, 0xF3, 0x1C, 0x34, 0x85, 0x53, 0x7A,  // .D..4.Sz
                /* 0170 */  0x19, 0x30, 0xC1, 0x04, 0xAB, 0x94, 0x05, 0x10,  // .0......
                /* 0178 */  0x05, 0x3A, 0x1E, 0xC8, 0xC6, 0x4A, 0x4D, 0xA0,  // .:...JM.
                /* 0180 */  0x23, 0x85, 0x65, 0x01, 0x69, 0x38, 0xB8, 0x33,  // #.e.i8.3
                /* 0188 */  0x45, 0x98, 0xD7, 0x03, 0x0F, 0xDC, 0xE7, 0x03,  // E.......
                /* 0190 */  0xCF, 0x2A, 0xC2, 0x93, 0x01, 0x01, 0xD5, 0x71,  // .*.....q
                /* 0198 */  0x83, 0xC7, 0x87, 0x50, 0xF8, 0x31, 0x51, 0x38,  // ...P.1Q8
                /* 01A0 */  0xC7, 0x05, 0xA3, 0x20, 0x3E, 0x01, 0x38, 0x0A,  // ... >.8.
                /* 01A8 */  0x84, 0x9C, 0x1C, 0x06, 0xD0, 0x43, 0x3B, 0x0B,  // .....C;.
                /* 01B0 */  0x43, 0x1C, 0xAA, 0x09, 0x3C, 0x95, 0x47, 0x06,  // C...<.G.
                /* 01B8 */  0x58, 0x03, 0x8C, 0x78, 0x72, 0x9E, 0x86, 0xE1,  // X..xr...
                /* 01C0 */  0x0C, 0x69, 0x38, 0x7E, 0x15, 0x38, 0xAF, 0x04,  // .i8~.8..
                /* 01C8 */  0xFC, 0x48, 0x00, 0xFF, 0xBA, 0xE1, 0x03, 0xC1,  // .H......
                /* 01D0 */  0x29, 0x3C, 0x69, 0xBC, 0x5D, 0x24, 0xF0, 0x91,  // )<i.]$..
                /* 01D8 */  0x00, 0x1C, 0x40, 0xBE, 0x03, 0x58, 0xE9, 0x39,  // ..@..X.9
                /* 01E0 */  0x80, 0xCE, 0x21, 0x44, 0x98, 0x68, 0x26, 0xF8,  // ..!D.h&.
                /* 01E8 */  0xFF, 0x87, 0xE7, 0x82, 0x47, 0x4A, 0x65, 0x8D,  // ....GJe.
                /* 01F0 */  0x0B, 0x75, 0x2C, 0xF0, 0xE1, 0x80, 0x61, 0x9F,  // .u,...a.
                /* 01F8 */  0xFC, 0xD1, 0x14, 0x3D, 0x43, 0x5D, 0x08, 0x0E,  // ...=C]..
                /* 0200 */  0xEA, 0xED, 0xC1, 0x16, 0x0D, 0x2A, 0x34, 0x08,  // .....*4.
                /* 0208 */  0xEB, 0x91, 0x72, 0x58, 0xA3, 0x85, 0x3D, 0xE0,  // ..rX..=.
                /* 0210 */  0x27, 0x07, 0xDF, 0x3A, 0x3C, 0x33, 0x63, 0x84,  // '..:<3c.
                /* 0218 */  0xF5, 0x68, 0x1D, 0xE9, 0x60, 0x80, 0x12, 0x35,  // .h..`..5
                /* 0220 */  0x54, 0x03, 0xC9, 0xE3, 0x2C, 0xC8, 0xCD, 0x00,  // T...,...
                /* 0228 */  0xCE, 0xDC, 0x4E, 0xE5, 0x50, 0xD9, 0xC9, 0x00,  // ..N.P...
                /* 0230 */  0x38, 0x0C, 0xE3, 0x48, 0xCE, 0xE3, 0xF1, 0x21,  // 8..H...!
                /* 0238 */  0xC2, 0x8B, 0x0C, 0x3B, 0x19, 0x00, 0x9E, 0x3D,  // ...;...=
                /* 0240 */  0x9E, 0x0C, 0x40, 0xF1, 0xFF, 0x3F, 0x19, 0xE0,  // ..@..?..
                /* 0248 */  0xA2, 0xAC, 0x42, 0x27, 0x03, 0x3E, 0x60, 0x0B,  // ..B'.>`.
                /* 0250 */  0x02, 0xD2, 0x84, 0xDE, 0x6F, 0x1E, 0x67, 0x0C,  // ....o.g.
                /* 0258 */  0xEC, 0xC1, 0x1D, 0x47, 0xE4, 0x37, 0x80, 0x63,  // ...G.7.c
                /* 0260 */  0x79, 0xA0, 0x61, 0x12, 0x00, 0x75, 0x1E, 0xF0,  // y.a..u..
                /* 0268 */  0xA8, 0x1C, 0x9E, 0x42, 0xE1, 0x69, 0x74, 0x2C,  // ...B.it,
                /* 0270 */  0x40, 0x9C, 0x0E, 0x28, 0x88, 0x0F, 0x41, 0x8E,  // @..(..A.
                /* 0278 */  0x70, 0x2C, 0x40, 0x8F, 0xD2, 0xE3, 0x38, 0x05,  // p,@...8.
                /* 0280 */  0x36, 0xBA, 0x83, 0x64, 0x03, 0xF3, 0xD8, 0xB8,  // 6..d....
                /* 0288 */  0x06, 0x08, 0xDD, 0x00, 0x8C, 0x6B, 0x35, 0x83,  // .....k5.
                /* 0290 */  0x45, 0x81, 0xF9, 0x4C, 0x80, 0xD1, 0x75, 0x25,  // E..L..u%
                /* 0298 */  0x00, 0x59, 0x86, 0x11, 0xA1, 0x55, 0x80, 0x48,  // .Y...U.H
                /* 02A0 */  0x23, 0xA4, 0xEE, 0x48, 0x9E, 0x11, 0x78, 0x0F,  // #..H..x.
                /* 02A8 */  0x5F, 0x64, 0x46, 0x20, 0x8B, 0x71, 0xB1, 0x80,  // _dF .q..
                /* 02B0 */  0x72, 0xDC, 0xE0, 0x93, 0x06, 0xFB, 0x91, 0xC0,  // r.......
                /* 02B8 */  0x63, 0x02, 0x9B, 0x3E, 0x01, 0xFF, 0xFF, 0x6B,  // c..>...k
                /* 02C0 */  0x05, 0xB8, 0xD1, 0xF9, 0xA9, 0xC4, 0xC7, 0x05,  // ........
                /* 02C8 */  0x1E, 0x78, 0xD4, 0x14, 0xC4, 0x83, 0x72, 0x98,  // .x....r.
                /* 02D0 */  0xB9, 0xA2, 0x4F, 0x6B, 0x1E, 0xC0, 0x1B, 0xC9,  // ..Ok....
                /* 02D8 */  0x53, 0x92, 0x21, 0x5E, 0x22, 0x7C, 0x4A, 0xF2,  // S.!^"|J.
                /* 02E0 */  0xA9, 0x04, 0xEC, 0x50, 0x3E, 0x95, 0x00, 0x9E,  // ...P>...
                /* 02E8 */  0x1C, 0x3A, 0x35, 0xEB, 0xF4, 0x54, 0x02, 0x2E,  // .:5..T..
                /* 02F0 */  0x49, 0xEB, 0xD0, 0xA9, 0x04, 0x77, 0xB0, 0xF3,  // I....w..
                /* 02F8 */  0x84, 0x1E, 0x7F, 0xD8, 0x29, 0x07, 0x73, 0x80,  // ....).s.
                /* 0300 */  0xE0, 0x27, 0x14, 0x9D, 0x7D, 0x50, 0x21, 0x28,  // .'..}P!(
                /* 0308 */  0x14, 0xE1, 0x54, 0x82, 0x12, 0x0D, 0x47, 0x41,  // ..T...GA
                /* 0310 */  0x3C, 0x36, 0x07, 0x81, 0xD0, 0xFF, 0xFF, 0x5C,  // <6.....\
                /* 0318 */  0x80, 0x3B, 0xB6, 0xF9, 0xA4, 0xE7, 0x4B, 0x81,  // .;....K.
                /* 0320 */  0xC5, 0x9F, 0x0A, 0xA0, 0xDE, 0x28, 0xD8, 0xD1,  // .....(..
                /* 0328 */  0x07, 0x18, 0x0D, 0x0A, 0xCE, 0x34, 0xF9, 0x18,  // .....4..
                /* 0330 */  0x3C, 0x28, 0x70, 0x0F, 0xD7, 0x27, 0x07, 0xC0,  // <(p..'..
                /* 0338 */  0x93, 0x44, 0xAB, 0x0A, 0x4F, 0x0E, 0x20, 0xD3,  // .D..O. .
                /* 0340 */  0x7F, 0x72, 0x40, 0xAB, 0x00, 0xD2, 0x39, 0x8C,  // .r@...9.
                /* 0348 */  0x9F, 0x1C, 0xE0, 0xE4, 0x3E, 0x32, 0xD0, 0x51,  // ....>2.Q
                /* 0350 */  0xF9, 0xFF, 0x9F, 0x98, 0x44, 0xA9, 0x0F, 0x28,  // ....D..(
                /* 0358 */  0xA8, 0x9C, 0x63, 0xA7, 0x20, 0x06, 0x74, 0x88,  // ..c. .t.
                /* 0360 */  0x93, 0x03, 0xF4, 0xF3, 0x11, 0xF0, 0xBC, 0xDA,  // ........
                /* 0368 */  0x00, 0x8B, 0xE8, 0x53, 0x45, 0x85, 0x9D, 0x2A,  // ...SE..*
                /* 0370 */  0x05, 0xF1, 0x54, 0x7D, 0x9F, 0x80, 0x7B, 0xAB,  // ..T}..{.
                /* 0378 */  0x7C, 0xB1, 0x01, 0xFB, 0x7D, 0x02, 0x30, 0xF3,  // |...}.0.
                /* 0380 */  0xFF, 0xBF, 0x4F, 0x40, 0xF2, 0x78, 0x9F, 0x00,  // ..O@.x..
                /* 0388 */  0x97, 0x42, 0x9B, 0x3E, 0x35, 0x1A, 0xB5, 0x6A,  // .B.>5..j
                /* 0390 */  0x50, 0xA6, 0x46, 0x99, 0x06, 0xB5, 0xFA, 0x54,  // P.F....T
                /* 0398 */  0x6A, 0xCC, 0x98, 0x96, 0x93, 0x96, 0x2F, 0x32,  // j...../2
                /* 03A0 */  0x54, 0xC4, 0x72, 0x04, 0x62, 0xE9, 0x14, 0x32,  // T.r.b..2
                /* 03A8 */  0x72, 0x12, 0x30, 0x88, 0xEE, 0x0E, 0xE4, 0x73,  // r.0....s
                /* 03B0 */  0x2A, 0x20, 0x4B, 0x03, 0x11, 0x90, 0x23, 0x7D,  // * K...#}
                /* 03B8 */  0x1B, 0x04, 0xE4, 0x7C, 0x20, 0x02, 0xB2, 0x2A,  // ...| ..*
                /* 03C0 */  0x0F, 0x40, 0x4C, 0x22, 0x88, 0x80, 0x9C, 0x0D,  // .@L"....
                /* 03C8 */  0x88, 0x06, 0x05, 0xA2, 0xB1, 0xD6, 0x29, 0x20,  // ......) 
                /* 03D0 */  0x87, 0x04, 0x11, 0x90, 0x05, 0x7E, 0xD1, 0x04,  // .....~..
                /* 03D8 */  0x64, 0xB9, 0x20, 0x02, 0x72, 0x50, 0x20, 0x1A,  // d. .rP .
                /* 03E0 */  0x1B, 0x88, 0x0A, 0x7E, 0x23, 0x08, 0xC8, 0xEA,  // ...~#...
                /* 03E8 */  0x41, 0x04, 0x64, 0x9D, 0x36, 0x80, 0x98, 0x6A,  // A.d.6..j
                /* 03F0 */  0x10, 0x01, 0xF9, 0xFF, 0x0F                     // .....
            })

   38952: 11 4A 3F 0B F5 03 46 4F 4D 42 01 00 00 00 E5 03  // .J?...FOMB......
   38962: 00 00 06 0F 00 00 44 53 00 01 1A 7D DA 54 A8 50  // ......DS...}.T.P
   38972: 87 00 01 06 18 42 20 74 01 89 C0 A1 21 14 46 01  // .....B t....!.F.
   38982: 0C 46 02 84 E4 40 C8 05 13 13 20 02 42 5E 05 D8  // .F...@.... .B^..
   38992: 14 60 12 44 FD FB 43 94 04 87 12 02 21 89 02 CC  // .`.D..C.....!...
   389A2: 0B D0 2D C0 B0 00 DB 02 4C 0B 70 0C 49 A5 81 53  // ..-.....L.p.I..S
   389B2: 02 4B 81 90 50 01 CA 05 F8 16 A0 1D 51 92 05 58  // .K..P.......Q..X
   389C2: 86 11 81 47 11 D9 68 9C A0 6C 68 94 0C 08 79 16  // ...G..h..lh...y.
   389D2: 60 1D 98 10 D8 BD 00 83 02 84 CD 42 E2 04 58 13  // `..........B..X.
   389E2: A0 4D 80 31 01 E6 04 D8 12 E0 4C 80 45 28 79 43  // .M.1......L.E(yC
   389F2: 11 58 BC 0A 71 84 12 C3 80 31 A2 44 0B 65 98 80  // .X..q....1.D.e..
   38A02: 91 2A 83 11 72 8C 70 B6 3F 08 12 6C C1 1A AA 23  // .*..r.p.?..l...#
   38A12: 8D 06 35 BC 04 87 EB A1 9E 63 E7 02 A4 4F 52 20  // ..5......c...OR 
   38A22: 07 79 6E 75 8E 93 80 24 30 56 82 0E 06 0E C5 35  // .ynu...$0V.....5
   38A32: A0 66 7C BC 4C 10 1C 6A 88 1E 68 B8 13 38 44 06  // .f|.L..j..h..8D.
   38A42: E8 69 1D 0D E6 00 60 87 93 D1 3D A0 54 01 66 C7  // .i....`...=.T.f.
   38A52: AC 89 25 38 1E 43 9F EE F9 9C 70 02 CB 1F 04 6A  // ..%8.C....p....j
   38A62: 64 86 F6 20 4F 2B 66 C8 C3 3F 2C 26 16 42 1F 04  // d.. O+f..?,&.B..
   38A72: 8F 07 DE FF 7F 3C E0 51 7C 26 10 C2 2B 41 6C 0F  // .....<.Q|&..+Al.
   38A82: 28 41 81 C0 E8 01 D9 AF 00 84 E0 65 8E 48 4E 11  // (A.........e.HN.
   38A92: 34 26 4F EE D5 20 C4 BB 40 E8 B3 3A E5 30 85 9F  // 4&O.. ..@..:.0..
   38AA2: 13 28 41 91 03 40 89 19 00 EA 14 10 FB 70 4E E6  // .(A..@.......pN.
   38AB2: 00 0E 27 CA 39 1C 8F 8F 0C 46 38 CB 72 4F 0E 44  // ..'.9....F8.rO.D
   38AC2: F3 1C 34 85 53 7A 19 30 C1 04 AB 94 05 10 05 3A  // ..4.Sz.0.......:
   38AD2: 1E C8 C6 4A 4D A0 23 85 65 01 69 38 B8 33 45 98  // ...JM.#.e.i8.3E.
   38AE2: D7 03 0F DC E7 03 CF 2A C2 93 01 01 D5 71 83 C7  // .......*.....q..
   38AF2: 87 50 F8 31 51 38 C7 05 A3 20 3E 01 38 0A 84 9C  // .P.1Q8... >.8...
   38B02: 1C 06 D0 43 3B 0B 43 1C AA 09 3C 95 47 06 58 03  // ...C;.C...<.G.X.
   38B12: 8C 78 72 9E 86 E1 0C 69 38 7E 15 38 AF 04 FC 48  // .xr....i8~.8...H
   38B22: 00 FF BA E1 03 C1 29 3C 69 BC 5D 24 F0 91 00 1C  // ......)<i.]$....
   38B32: 40 BE 03 58 E9 39 80 CE 21 44 98 68 26 F8 FF 87  // @..X.9..!D.h&...
   38B42: E7 82 47 4A 65 8D 0B 75 2C F0 E1 80 61 9F FC D1  // ..GJe..u,...a...
   38B52: 14 3D 43 5D 08 0E EA ED C1 16 0D 2A 34 08 EB 91  // .=C].......*4...
   38B62: 72 58 A3 85 3D E0 27 07 DF 3A 3C 33 63 84 F5 68  // rX..=.'..:<3c..h
   38B72: 1D E9 60 80 12 35 54 03 C9 E3 2C C8 CD 00 CE DC  // ..`..5T...,.....
   38B82: 4E E5 50 D9 C9 00 38 0C E3 48 CE E3 F1 21 C2 8B  // N.P...8..H...!..
   38B92: 0C 3B 19 00 9E 3D 9E 0C 40 F1 FF 3F 19 E0 A2 AC  // .;...=..@..?....
   38BA2: 42 27 03 3E 60 0B 02 D2 84 DE 6F 1E 67 0C EC C1  // B'.>`.....o.g...
   38BB2: 1D 47 E4 37 80 63 79 A0 61 12 00 75 1E F0 A8 1C  // .G.7.cy.a..u....
   38BC2: 9E 42 E1 69 74 2C 40 9C 0E 28 88 0F 41 8E 70 2C  // .B.it,@..(..A.p,
   38BD2: 40 8F D2 E3 38 05 36 BA 83 64 03 F3 D8 B8 06 08  // @...8.6..d......
   38BE2: DD 00 8C 6B 35 83 45 81 F9 4C 80 D1 75 25 00 59  // ...k5.E..L..u%.Y
   38BF2: 86 11 A1 55 80 48 23 A4 EE 48 9E 11 78 0F 5F 64  // ...U.H#..H..x._d
   38C02: 46 20 8B 71 B1 80 72 DC E0 93 06 FB 91 C0 63 02  // F .q..r.......c.
   38C12: 9B 3E 01 FF FF 6B 05 B8 D1 F9 A9 C4 C7 05 1E 78  // .>...k.........x
   38C22: D4 14 C4 83 72 98 B9 A2 4F 6B 1E C0 1B C9 53 92  // ....r...Ok....S.
   38C32: 21 5E 22 7C 4A F2 A9 04 EC 50 3E 95 00 9E 1C 3A  // !^"|J....P>....:
   38C42: 35 EB F4 54 02 2E 49 EB D0 A9 04 77 B0 F3 84 1E  // 5..T..I....w....
   38C52: 7F D8 29 07 73 80 E0 27 14 9D 7D 50 21 28 14 E1  // ..).s..'..}P!(..
   38C62: 54 82 12 0D 47 41 3C 36 07 81 D0 FF FF 5C 80 3B  // T...GA<6.....\.;
   38C72: B6 F9 A4 E7 4B 81 C5 9F 0A A0 DE 28 D8 D1 07 18  // ....K......(....
   38C82: 0D 0A CE 34 F9 18 3C 28 70 0F D7 27 07 C0 93 44  // ...4..<(p..'...D
   38C92: AB 0A 4F 0E 20 D3 7F 72 40 AB 00 D2 39 8C 9F 1C  // ..O. ..r@...9...
   38CA2: E0 E4 3E 32 D0 51 F9 FF 9F 98 44 A9 0F 28 A8 9C  // ..>2.Q....D..(..
   38CB2: 63 A7 20 06 74 88 93 03 F4 F3 11 F0 BC DA 00 8B  // c. .t...........
   38CC2: E8 53 45 85 9D 2A 05 F1 54 7D 9F 80 7B AB 7C B1  // .SE..*..T}..{.|.
   38CD2: 01 FB 7D 02 30 F3 FF BF 4F 40 F2 78 9F 00 97 42  // ..}.0...O@.x...B
   38CE2: 9B 3E 35 1A B5 6A 50 A6 46 99 06 B5 FA 54 6A CC  // .>5..jP.F....Tj.
   38CF2: 98 96 93 96 2F 32 54 C4 72 04 62 E9 14 32 72 12  // ..../2T.r.b..2r.
   38D02: 30 88 EE 0E E4 73 2A 20 4B 03 11 90 23 7D 1B 04  // 0....s* K...#}..
   38D12: E4 7C 20 02 B2 2A 0F 40 4C 22 88 80 9C 0D 88 06  // .| ..*.@L"......
   38D22: 05 A2 B1 D6 29 20 87 04 11 90 05 7E D1 04 64 B9  // ....) .....~..d.
   38D32: 20 02 72 50 20 1A 1B 88 0A 7E 23 08 C8 EA 41 04  //  .rP ....~#...A.
   38D42: 64 9D 36 80 98 6A 10 01 F9 FF 0F                 // d.6..j.....

            OperationRegion (DEB0, SystemIO, 0x80, One)

   38D4D: 5B 80 44 45 42 30 01 0A 80 01                    // [.DEB0....

            Field (DEB0, ByteAcc, NoLock, Preserve)
            {
                DBG8,   8
            }


   38D57: 5B 81 0B 44 45 42 30 01 44 42 47 38 08           // [..DEB0.DBG8.

            OperationRegion (IOB2, SystemIO, SMIP, 0x02)

   38D64: 5B 80 49 4F 42 32 01 53 4D 49 50 0A 02           // [.IOB2.SMIP..

            Field (IOB2, ByteAcc, NoLock, Preserve)
            {
                SMPT,   8, 
                SMIS,   8
            }


   38D71: 5B 81 10 49 4F 42 32 01 53 4D 50 54 08 53 4D 49  // [..IOB2.SMPT.SMI
   38D81: 53 08                                            // S.

            Method (ISMI, 1, Serialized)
            {

   38D83: 14 0C 49 53 4D 49 09                             // ..ISMI.

                Store (Arg0, SMPT) /* \ABAW.SMPT */
            }


   38D8A: 70 68 53 4D 50 54                                // phSMPT

            Method (EABA, 0, Serialized)
            {
                ISMI (0x95)

   38D90: 14 0E 45 41 42 41 08 49 53 4D 49 0A 95           // ..EABA.ISMI..

                Return (Zero)
            }


   38D9D: A4 00                                            // ..

            Method (GABA, 0, Serialized)
            {

   38D9F: 14 0B 47 41 42 41 08                             // ..GABA.

                Return (ABAP) /* \ABAW.ABAP */
            }


   38DA6: A4 41 42 41 50                                   // .ABAP

            Method (SYSC, 1, Serialized)
            {
                Store (Arg0, SYSD) /* \ABAW.SYSD */
                ISMI (0x95)

   38DAB: 14 17 53 59 53 43 09 70 68 53 59 53 44 49 53 4D  // ..SYSC.phSYSDISM
   38DBB: 49 0A 95                                         // I..

                Return (ERCO) /* \ABAW.ERCO */
            }


   38DBE: A4 45 52 43 4F                                   // .ERCO

            Method (SBUD, 1, Serialized)
            {
                Store (Arg0, IDAT) /* \ABAW.IDAT */
                Add (INDX, 0x0C, Local0)
                Add (Local0, ABAP, Local1)

   38DC3: 14 3D 53 42 55 44 09 70 68 49 44 41 54 72 49 4E  // .=SBUD.phIDATrIN
   38DD3: 44 58 0A 0C 60 72 60 41 42 41 50 61              // DX..`r`ABAPa

                OperationRegion (SBTB, SystemMemory, Local1, 0x04)

   38DDF: 5B 80 53 42 54 42 00 61 0A 04                    // [.SBTB.a..

                Field (SBTB, ByteAcc, NoLock, Preserve)
                {
                    TDAT,   32
                }

                Store (DAT0, TDAT) /* \ABAW.SBUD.TDAT */

   38DE9: 5B 81 0B 53 42 54 42 01 54 44 41 54 20 70 44 41  // [..SBTB.TDAT pDA
   38DF9: 54 30 54 44 41 54                                // T0TDAT

                Return (Zero)
            }


   38DFF: A4 00                                            // ..

            Method (GBUD, 1, Serialized)
            {
                Store (Arg0, INDX) /* \ABAW.INDX */
                Add (INDX, 0x0C, Local0)
                Add (Local0, ABAP, Local1)

   38E01: 14 37 47 42 55 44 09 70 68 49 4E 44 58 72 49 4E  // .7GBUD.phINDXrIN
   38E11: 44 58 0A 0C 60 72 60 41 42 41 50 61              // DX..`r`ABAPa

                OperationRegion (GBTB, SystemMemory, Local1, 0x04)

   38E1D: 5B 80 47 42 54 42 00 61 0A 04                    // [.GBTB.a..

                Field (GBTB, ByteAcc, NoLock, Preserve)
                {
                    RDAT,   32
                }


   38E27: 5B 81 0B 47 42 54 42 01 52 44 41 54 20           // [..GBTB.RDAT 

                Return (RDAT) /* \ABAW.GBUD.RDAT */
            }


   38E34: A4 52 44 41 54                                   // .RDAT

            Name (ABAP, 0x5D303018)

   38E39: 08 41 42 41 50 0C 18 30 30 5D                    // .ABAP..00]

            Name (WBUF, 
   38E43: 08 57 42 55 46                                   // .WBUF

Buffer (0x50){})

   38E48: 11 03 0A 50                                      // ...P

            OperationRegion (\ABAX, SystemMemory, ABAP, 0x00010000)

   38E4C: 5B 80 5C 41 42 41 58 00 41 42 41 50 0C 00 00 01  // [.\ABAX.ABAP....
   38E5C: 00                                               // .

            Field (ABAX, ByteAcc, NoLock, Preserve)
            {
                SIGN,   32, 
                WFUN,   32, 
                DSIG,   32, 
                BUDA,   1024, 
                ERCO,   32, 
                IDAT,   96
            }


   38E5D: 5B 81 26 41 42 41 58 01 53 49 47 4E 20 57 46 55  // [.&ABAX.SIGN WFU
   38E6D: 4E 20 44 53 49 47 20 42 55 44 41 40 40 45 52 43  // N DSIG BUDA@@ERC
   38E7D: 4F 20 49 44 41 54 40 06                          // O IDAT@.

            Field (ABAX, ByteAcc, NoLock, Preserve)
            {
                Offset (0x90), 
                INDX,   32, 
                DAT0,   32
            }


   38E85: 5B 81 13 41 42 41 58 01 00 40 48 49 4E 44 58 20  // [..ABAX..@HINDX 
   38E95: 44 41 54 30 20                                   // DAT0 

            Field (ABAX, ByteAcc, NoLock, Preserve)
            {
                SYSD,   96
            }
        }
    }


   38E9A: 5B 81 0C 41 42 41 58 01 53 59 53 44 40 06        // [..ABAX.SYSD@.

    Scope (_SB)
    {

   38EA8: 10 21 5F 53 42 5F                                // .!_SB_

        OperationRegion (WPBR, SystemMemory, 0x5D302000, 0x0001)

   38EAE: 5B 80 57 50 42 52 00 0C 00 20 30 5D 0B 01 00     // [.WPBR... 0]...

        Field (WPBR, AnyAcc, NoLock, Preserve)
        {
            CTRL,   8
        }
    }


   38EBD: 5B 81 0B 57 50 42 52 00 43 54 52 4C 08           // [..WPBR.CTRL.

    Scope (_SB)
    {

   38ECA: 10 4D 28 5F 53 42 5F                             // .M(_SB_

        Name (RAMB, 0x5D32A018)

   38ED1: 08 52 41 4D 42 0C 18 A0 32 5D                    // .RAMB...2]

        OperationRegion (\RAMW, SystemMemory, RAMB, 0x00010000)

   38EDB: 5B 80 5C 52 41 4D 57 00 52 41 4D 42 0C 00 00 01  // [.\RAMW.RAMB....
   38EEB: 00                                               // .

        Field (RAMW, ByteAcc, NoLock, Preserve)
        {
            DSAF,   32, 
            PAR0,   32, 
            PAR1,   32, 
            PAR2,   32, 
            PINX,   32, 
            PADD,   2048
        }


   38EEC: 5B 81 25 52 41 4D 57 01 44 53 41 46 20 50 41 52  // [.%RAMW.DSAF PAR
   38EFC: 30 20 50 41 52 31 20 50 41 52 32 20 50 49 4E 58  // 0 PAR1 PAR2 PINX
   38F0C: 20 50 41 44 44 40 80                             //  PADD@.

        Mutex (MPAR, 0x00)

   38F13: 5B 01 4D 50 41 52 00                             // [.MPAR.

        Name (ARBF, 
   38F1A: 08 41 52 42 46                                   // .ARBF

Buffer (0x10){})

   38F1F: 11 03 0A 10                                      // ....

        CreateDWordField (ARBF, Zero, REAX)

   38F23: 8A 41 52 42 46 00 52 45 41 58                    // .ARBF.REAX

        CreateDWordField (ARBF, 0x04, REBX)

   38F2D: 8A 41 52 42 46 0A 04 52 45 42 58                 // .ARBF..REBX

        CreateDWordField (ARBF, 0x08, RECX)

   38F38: 8A 41 52 42 46 0A 08 52 45 43 58                 // .ARBF..RECX

        CreateDWordField (ARBF, 0x0C, REDX)

   38F43: 8A 41 52 42 46 0A 0C 52 45 44 58                 // .ARBF..REDX

        OperationRegion (DEB0, SystemIO, 0x80, One)

   38F4E: 5B 80 44 45 42 30 01 0A 80 01                    // [.DEB0....

        Field (DEB0, ByteAcc, NoLock, Preserve)
        {
            DB80,   8
        }


   38F58: 5B 81 0B 44 45 42 30 01 44 42 38 30 08           // [..DEB0.DB80.

        OperationRegion (IOG2, SystemIO, SMIP, 0x02)

   38F65: 5B 80 49 4F 47 32 01 53 4D 49 50 0A 02           // [.IOG2.SMIP..

        Field (IOG2, ByteAcc, NoLock, Preserve)
        {
            SSCP,   8, 
            SSSP,   8
        }


   38F72: 5B 81 10 49 4F 47 32 01 53 53 43 50 08 53 53 53  // [..IOG2.SSCP.SSS
   38F82: 50 08                                            // P.

        Method (ISMI, 1, Serialized)
        {

   38F84: 14 0C 49 53 4D 49 09                             // ..ISMI.

            Store (Arg0, SSCP) /* \_SB_.SSCP */
        }


   38F8B: 70 68 53 53 43 50                                // phSSCP

        Method (GMSR, 1, Serialized)
        {

   38F91: 14 4F 04 47 4D 53 52 09                          // .O.GMSR.

            If (LEqual (Acquire (MPAR, 0xFFFF), Zero))
            {
                Store (0x80000000, PINX) /* \_SB_.PINX */
                Store (Arg0, PAR0) /* \_SB_.PAR0 */
                ISMI (0x90)
                Store (Arg0, RECX) /* \_SB_.RECX */
                Store (PAR1, REAX) /* \_SB_.REAX */
                Store (PAR2, REDX) /* \_SB_.REDX */
                Release (MPAR)

   38F99: A0 45 04 93 5B 23 4D 50 41 52 FF FF 00 70 0C 00  // .E..[#MPAR...p..
   38FA9: 00 00 80 50 49 4E 58 70 68 50 41 52 30 49 53 4D  // ...PINXphPAR0ISM
   38FB9: 49 0A 90 70 68 52 45 43 58 70 50 41 52 31 52 45  // I..phRECXpPAR1RE
   38FC9: 41 58 70 50 41 52 32 52 45 44 58 5B 27 4D 50 41  // AXpPAR2REDX['MPA
   38FD9: 52                                               // R

                Return (ARBF) /* \_SB_.ARBF */
            }


   38FDA: A4 41 52 42 46                                   // .ARBF

            Return (Ones)
        }


   38FDF: A4 FF                                            // ..

        Method (SMSR, 1, Serialized)
        {

   38FE1: 14 46 06 53 4D 53 52 09                          // .F.SMSR.

            If (LEqual (Acquire (MPAR, 0xFFFF), Zero))
            {

   38FE9: A0 4C 05 93 5B 23 4D 50 41 52 FF FF 00           // .L..[#MPAR...

                CreateDWordField (Arg0, Zero, AEAX)

   38FF6: 8A 68 00 41 45 41 58                             // .h.AEAX

                CreateDWordField (Arg0, 0x04, AEBX)

   38FFD: 8A 68 0A 04 41 45 42 58                          // .h..AEBX

                CreateDWordField (Arg0, 0x08, AECX)

   39005: 8A 68 0A 08 41 45 43 58                          // .h..AECX

                CreateDWordField (Arg0, 0x0C, AEDX)
                Store (0x80000001, PINX) /* \_SB_.PINX */
                Store (AECX, PAR0) /* \_SB_.PAR0 */
                Store (AEAX, PAR1) /* \_SB_.PAR1 */
                Store (AEDX, PAR2) /* \_SB_.PAR2 */
                ISMI (0x90)

   3900D: 8A 68 0A 0C 41 45 44 58 70 0C 01 00 00 80 50 49  // .h..AEDXp.....PI
   3901D: 4E 58 70 41 45 43 58 50 41 52 30 70 41 45 41 58  // NXpAECXPAR0pAEAX
   3902D: 50 41 52 31 70 41 45 44 58 50 41 52 32 49 53 4D  // PAR1pAEDXPAR2ISM
   3903D: 49 0A 90                                         // I..

                Release (MPAR)
            }


   39040: 5B 27 4D 50 41 52                                // ['MPAR

            Return (Ones)
        }


   39046: A4 FF                                            // ..

        Method (GCID, 1, Serialized)
        {

   39048: 14 48 04 47 43 49 44 09                          // .H.GCID.

            If (LEqual (Acquire (MPAR, 0xFFFF), Zero))
            {
                Store (0x80000002, PINX) /* \_SB_.PINX */
                Store (Arg0, PAR0) /* \_SB_.PAR0 */
                ISMI (0x90)
                Store (PAR1, REAX) /* \_SB_.REAX */
                Store (PAR2, REDX) /* \_SB_.REDX */
                Release (MPAR)

   39050: A0 3E 93 5B 23 4D 50 41 52 FF FF 00 70 0C 02 00  // .>.[#MPAR...p...
   39060: 00 80 50 49 4E 58 70 68 50 41 52 30 49 53 4D 49  // ..PINXphPAR0ISMI
   39070: 0A 90 70 50 41 52 31 52 45 41 58 70 50 41 52 32  // ..pPAR1REAXpPAR2
   39080: 52 45 44 58 5B 27 4D 50 41 52                    // REDX['MPAR

                Return (ARBF) /* \_SB_.ARBF */
            }


   3908A: A4 41 52 42 46                                   // .ARBF

            Return (Ones)
        }


   3908F: A4 FF                                            // ..

        Method (GPRE, 1, Serialized)
        {
            Store (Arg0, PAR0) /* \_SB_.PAR0 */
            Store (0x80000005, PINX) /* \_SB_.PINX */
            ISMI (0x90)

   39091: 14 21 47 50 52 45 09 70 68 50 41 52 30 70 0C 05  // .!GPRE.phPAR0p..
   390A1: 00 00 80 50 49 4E 58 49 53 4D 49 0A 90           // ...PINXISMI..

            Return (PAR0) /* \_SB_.PAR0 */
        }


   390AE: A4 50 41 52 30                                   // .PAR0

        Method (GNVS, 1, Serialized)
        {
            Store (Arg0, PAR0) /* \_SB_.PAR0 */
            Store (0x80000003, PINX) /* \_SB_.PINX */
            ISMI (0x90)

   390B3: 14 21 47 4E 56 53 09 70 68 50 41 52 30 70 0C 03  // .!GNVS.phPAR0p..
   390C3: 00 00 80 50 49 4E 58 49 53 4D 49 0A 90           // ...PINXISMI..

            Return (PAR1) /* \_SB_.PAR1 */
        }


   390D0: A4 50 41 52 31                                   // .PAR1

        Method (SNVS, 2, Serialized)
        {
            Store (Arg0, PAR0) /* \_SB_.PAR0 */
            Store (Arg1, PAR1) /* \_SB_.PAR1 */
            Store (0x80000004, PINX) /* \_SB_.PINX */
            ISMI (0x90)
        }


   390D5: 14 22 53 4E 56 53 0A 70 68 50 41 52 30 70 69 50  // ."SNVS.phPAR0piP
   390E5: 41 52 31 70 0C 04 00 00 80 50 49 4E 58 49 53 4D  // AR1p.....PINXISM
   390F5: 49 0A 90                                         // I..

        Method (SIRS, 0, Serialized)
        {
            Store (0x8000000A, PINX) /* \_SB_.PINX */
            ISMI (0x90)
        }


   390F8: 14 16 53 49 52 53 08 70 0C 0A 00 00 80 50 49 4E  // ..SIRS.p.....PIN
   39108: 58 49 53 4D 49 0A 90                             // XISMI..

        Method (SRAD, 0, Serialized)
        {
            Store (0x8000000B, PINX) /* \_SB_.PINX */
            ISMI (0x90)
        }


   3910F: 14 16 53 52 41 44 08 70 0C 0B 00 00 80 50 49 4E  // ..SRAD.p.....PIN
   3911F: 58 49 53 4D 49 0A 90                             // XISMI..

        Method (SARM, 1, Serialized)
        {

   39126: 14 17 53 41 52 4D 09                             // ..SARM.

            If (LAnd (LGreater (Arg0, 0x03), 
   3912D: A0 10 90 94 68 0A 03                             // ....h..

LLess (Arg0, 0x06)))
            {
                ISMI (0x92)
            }
        }


   39134: 95 68 0A 06 49 53 4D 49 0A 92                    // .h..ISMI..

        Method (GAMM, 0, Serialized)
        {
            ISMI (0x91)
        }


   3913E: 14 0C 47 41 4D 4D 08 49 53 4D 49 0A 91           // ..GAMM.ISMI..

        Method (SAMM, 0, Serialized)
        {
            ISMI (0x92)
        }
    }
}



Table Header:
Table Body (Length 0x39158)
