    DF38: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    DF3B: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    DF3F: A4 01                                            // ..

                    Case
    DF41: A1 26                                            // .&

 (0x09)
                    {

    DF43: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    DF4C: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    DF54: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    DF57: 95 69 0A 03                                      // .i..

                                Return (
    DF5B: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    DF5C: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    DF68: A5                                               // .

            Return (
    DF69: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    DF6A: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    DF6E: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    DF76: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    DF7C: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    DF86: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    DF93: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    DF9A: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    DFA6: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    DFAF: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    DFB1: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    DFBA: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    DFC1: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    DFC5: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP07.PMSX */

    DFCF: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    DFDF: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP07.PSPX */
            }
        }


    DFE2: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    DFE8: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP07.PPRW))
            {

    DFEF: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    DFFF: 50 30 37 50 50 52 57 00                          // P07PPRW.

                Return (PPRW ())
            }


    E007: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    E00C: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP08)
    {

    E015: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 30  // .AI/._SB_PCI0RP0
    E025: 38                                               // 8

        Name (LTRZ, Zero)

    E026: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    E02C: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    E032: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x08)

    E038: 08 53 4C 4F 54 0A 08                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    E03F: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTR8, LTRZ) /* \_SB_.PCI0.RP08.LTRZ */
                Store (PML8, LMSL) /* \_SB_.PCI0.RP08.LMSL */
                Store (PNL8, LNSL) /* \_SB_.PCI0.RP08.LNSL */

    E046: A0 2D 50 52 45 53 70 4C 54 52 38 4C 54 52 5A 70  // .-PRESpLTR8LTRZp
    E056: 50 4D 4C 38 4C 4D 53 4C 70 50 4E 4C 38 4C 4E 53  // PML8LMSLpPNL8LNS
    E066: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    E067: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    E074: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    E07F: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    E08F: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    E09F: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    E0AF: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    E0BF: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    E0CF: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    E0DF: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    E0EF: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    E0FF: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    E101: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    E111: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    E118: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    E120: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP08.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP08.L23R */
            Store (Zero, Local0)

    E12C: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    E13C: 60                                               // `

            While (L23R)
            {

    E13D: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    E143: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    E149: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP08.DPGE */
            Store (Zero, Local0)

    E14E: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    E159: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    E161: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    E167: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    E16C: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP08.LEDM */
        }


    E16E: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    E174: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    E17C: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP08.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    E188: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    E197: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    E19D: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    E1A3: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP08.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP08.LDIS */

    E1A8: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP08.LDIS */
        }


    E1B6: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    E1BC: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    E1C3: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    E1CF: A4 00                                            // ..

            Else
            {

    E1D1: A1 03                                            // ..

                Return (One)
            }
        }


    E1D3: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    E1D5: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    E1DD: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    E1E8: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    E1EB: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    E1EF: A4 00                                            // ..

            ElseIf
    E1F1: A1 0A                                            // ..

 (
    E1F3: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    E1F6: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    E1FA: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    E200: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    E20E: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    E211: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    E215: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    E224: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    E228: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    E22D: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    E234: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    E23C: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    E242: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    E247: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    E257: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    E25B: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    E267: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    E270: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    E275: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    E27B: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    E285: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    E290: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    E29B: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    E2A6: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    E2B1: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP08._DSM.FUN0 */

    E2B4: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    E2BE: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP08._DSM.FUN6 */
                            }


    E2C4: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    E2CA: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    E2D2: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP08._DSM.FUN8 */

    E2D5: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP08._DSM.FUN9 */
                                }
                            }
                        }


    E2DF: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP08._DSM.OPTS */
                    }

    E2E5: A4 4F 50 54 53                                   // .OPTS

                    Case
    E2EA: A1 4F 10                                         // .O.

 (0x05)
                    {

    E2ED: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    E2F6: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    E2FB: A4 01                                            // ..

                    Case
    E2FD: A1 4C 0F                                         // .L.

 (0x06)
                    {

    E300: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    E30A: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    E30E: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    E312: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    E319: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    E323: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP08.LMSL */

    E329: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    E339: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP08.LNSL */
                                    }

    E33C: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    E344: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP08.LMSL */

    E346: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    E356: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP08.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    E359: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    E369: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    E36E: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    E37E: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    E37F: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    E38F: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    E393: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    E3A3: 03 00                                            // ..

Index (LTRV, 0x03))

    E3A5: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP08.LTRV */
                            }

    E3AD: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    E3B2: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    E3B4: A4 00                                            // ..

                    Case
    E3B6: A1 43 04                                         // .C.

 (0x08)
                    {

    E3B9: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    E3C2: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    E3CA: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    E3CD: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    E3D1: A4 01                                            // ..

                    Case
    E3D3: A1 26                                            // .&

 (0x09)
                    {

    E3D5: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    E3DE: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    E3E6: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    E3E9: 95 69 0A 03                                      // .i..

                                Return (
    E3ED: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    E3EE: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    E3FA: A5                                               // .

            Return (
    E3FB: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    E3FC: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    E400: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    E408: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    E40E: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    E418: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    E425: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    E42C: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    E438: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    E441: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    E443: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    E44C: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    E453: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    E457: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP08.PMSX */

    E461: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    E471: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP08.PSPX */
            }
        }


    E474: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    E47A: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP08.PPRW))
            {

    E481: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    E491: 50 30 38 50 50 52 57 00                          // P08PPRW.

                Return (PPRW ())
            }


    E499: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    E49E: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP09)
    {

    E4A7: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 30  // .AI/._SB_PCI0RP0
    E4B7: 39                                               // 9

        Name (LTRZ, Zero)

    E4B8: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    E4BE: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    E4C4: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x09)

    E4CA: 08 53 4C 4F 54 0A 09                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    E4D1: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTR9, LTRZ) /* \_SB_.PCI0.RP09.LTRZ */
                Store (PML9, LMSL) /* \_SB_.PCI0.RP09.LMSL */
                Store (PNL9, LNSL) /* \_SB_.PCI0.RP09.LNSL */

    E4D8: A0 2D 50 52 45 53 70 4C 54 52 39 4C 54 52 5A 70  // .-PRESpLTR9LTRZp
    E4E8: 50 4D 4C 39 4C 4D 53 4C 70 50 4E 4C 39 4C 4E 53  // PML9LMSLpPNL9LNS
    E4F8: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    E4F9: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    E506: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    E511: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    E521: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    E531: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    E541: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    E551: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    E561: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    E571: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    E581: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    E591: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    E593: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    E5A3: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    E5AA: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    E5B2: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP09.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP09.L23R */
            Store (Zero, Local0)

    E5BE: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    E5CE: 60                                               // `

            While (L23R)
            {

    E5CF: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    E5D5: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    E5DB: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP09.DPGE */
            Store (Zero, Local0)

    E5E0: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    E5EB: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    E5F3: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    E5F9: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    E5FE: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP09.LEDM */
        }


    E600: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    E606: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    E60E: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP09.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    E61A: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    E629: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    E62F: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    E635: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP09.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP09.LDIS */

    E63A: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP09.LDIS */
        }


    E648: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    E64E: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    E655: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    E661: A4 00                                            // ..

            Else
            {

    E663: A1 03                                            // ..

                Return (One)
            }
        }


    E665: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    E667: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    E66F: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    E67A: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    E67D: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    E681: A4 00                                            // ..

            ElseIf
    E683: A1 0A                                            // ..

 (
    E685: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    E688: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    E68C: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    E692: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    E6A0: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    E6A3: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    E6A7: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    E6B6: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    E6BA: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    E6BF: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    E6C6: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    E6CE: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    E6D4: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    E6D9: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    E6E9: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    E6ED: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    E6F9: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    E702: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    E707: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    E70D: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    E717: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    E722: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    E72D: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    E738: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    E743: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP09._DSM.FUN0 */

    E746: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    E750: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP09._DSM.FUN6 */
                            }


    E756: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    E75C: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    E764: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP09._DSM.FUN8 */

    E767: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP09._DSM.FUN9 */
                                }
                            }
                        }


    E771: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP09._DSM.OPTS */
                    }

    E777: A4 4F 50 54 53                                   // .OPTS

                    Case
    E77C: A1 4F 10                                         // .O.

 (0x05)
                    {

    E77F: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    E788: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    E78D: A4 01                                            // ..

                    Case
    E78F: A1 4C 0F                                         // .L.

 (0x06)
                    {

    E792: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    E79C: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    E7A0: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    E7A4: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    E7AB: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    E7B5: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP09.LMSL */

    E7BB: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    E7CB: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP09.LNSL */
                                    }

    E7CE: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    E7D6: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP09.LMSL */

    E7D8: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    E7E8: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP09.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    E7EB: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    E7FB: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    E800: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    E810: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    E811: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    E821: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    E825: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    E835: 03 00                                            // ..

Index (LTRV, 0x03))

    E837: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP09.LTRV */
                            }

    E83F: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    E844: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    E846: A4 00                                            // ..

                    Case
    E848: A1 43 04                                         // .C.

 (0x08)
                    {

    E84B: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    E854: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    E85C: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    E85F: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    E863: A4 01                                            // ..

                    Case
    E865: A1 26                                            // .&

 (0x09)
                    {

    E867: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    E870: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    E878: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    E87B: 95 69 0A 03                                      // .i..

                                Return (
    E87F: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    E880: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    E88C: A5                                               // .

            Return (
    E88D: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    E88E: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    E892: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    E89A: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    E8A0: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    E8AA: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    E8B7: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    E8BE: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    E8CA: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    E8D3: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    E8D5: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    E8DE: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    E8E5: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    E8E9: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP09.PMSX */

    E8F3: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    E903: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP09.PSPX */
            }
        }


    E906: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    E90C: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP09.PPRW))
            {

    E913: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    E923: 50 30 39 50 50 52 57 00                          // P09PPRW.

                Return (PPRW ())
            }


    E92B: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    E930: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP10)
    {

    E939: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
    E949: 30                                               // 0

        Name (LTRZ, Zero)

    E94A: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    E950: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    E956: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x0A)

    E95C: 08 53 4C 4F 54 0A 0A                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    E963: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRA, LTRZ) /* \_SB_.PCI0.RP10.LTRZ */
                Store (PMLA, LMSL) /* \_SB_.PCI0.RP10.LMSL */
                Store (PNLA, LNSL) /* \_SB_.PCI0.RP10.LNSL */

    E96A: A0 2D 50 52 45 53 70 4C 54 52 41 4C 54 52 5A 70  // .-PRESpLTRALTRZp
    E97A: 50 4D 4C 41 4C 4D 53 4C 70 50 4E 4C 41 4C 4E 53  // PMLALMSLpPNLALNS
    E98A: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    E98B: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    E998: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    E9A3: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    E9B3: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    E9C3: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    E9D3: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    E9E3: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    E9F3: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    EA03: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    EA13: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    EA23: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    EA25: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    EA35: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    EA3C: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    EA44: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP10.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP10.L23R */
            Store (Zero, Local0)

    EA50: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    EA60: 60                                               // `

            While (L23R)
            {

    EA61: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    EA67: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    EA6D: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP10.DPGE */
            Store (Zero, Local0)

    EA72: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    EA7D: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    EA85: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    EA8B: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    EA90: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP10.LEDM */
        }


    EA92: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    EA98: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    EAA0: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP10.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    EAAC: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    EABB: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    EAC1: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    EAC7: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP10.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP10.LDIS */

    EACC: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP10.LDIS */
        }


    EADA: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    EAE0: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    EAE7: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    EAF3: A4 00                                            // ..

            Else
            {

    EAF5: A1 03                                            // ..

                Return (One)
            }
        }


    EAF7: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    EAF9: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    EB01: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    EB0C: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    EB0F: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    EB13: A4 00                                            // ..

            ElseIf
    EB15: A1 0A                                            // ..

 (
    EB17: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    EB1A: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    EB1E: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    EB24: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    EB32: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    EB35: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    EB39: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    EB48: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    EB4C: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    EB51: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    EB58: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    EB60: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    EB66: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    EB6B: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    EB7B: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    EB7F: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    EB8B: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    EB94: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    EB99: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    EB9F: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    EBA9: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    EBB4: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    EBBF: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    EBCA: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    EBD5: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP10._DSM.FUN0 */

    EBD8: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    EBE2: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP10._DSM.FUN6 */
                            }


    EBE8: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    EBEE: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    EBF6: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP10._DSM.FUN8 */

    EBF9: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP10._DSM.FUN9 */
                                }
                            }
                        }


    EC03: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP10._DSM.OPTS */
                    }

    EC09: A4 4F 50 54 53                                   // .OPTS

                    Case
    EC0E: A1 4F 10                                         // .O.

 (0x05)
                    {

    EC11: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    EC1A: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    EC1F: A4 01                                            // ..

                    Case
    EC21: A1 4C 0F                                         // .L.

 (0x06)
                    {

    EC24: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    EC2E: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    EC32: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    EC36: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    EC3D: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    EC47: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP10.LMSL */

    EC4D: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    EC5D: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP10.LNSL */
                                    }

    EC60: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    EC68: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP10.LMSL */

    EC6A: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    EC7A: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP10.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    EC7D: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    EC8D: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    EC92: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    ECA2: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    ECA3: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    ECB3: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    ECB7: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    ECC7: 03 00                                            // ..

Index (LTRV, 0x03))

    ECC9: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP10.LTRV */
                            }

    ECD1: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    ECD6: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    ECD8: A4 00                                            // ..

                    Case
    ECDA: A1 43 04                                         // .C.

 (0x08)
                    {

    ECDD: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    ECE6: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    ECEE: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    ECF1: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    ECF5: A4 01                                            // ..

                    Case
    ECF7: A1 26                                            // .&

 (0x09)
                    {

    ECF9: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    ED02: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    ED0A: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    ED0D: 95 69 0A 03                                      // .i..

                                Return (
    ED11: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    ED12: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    ED1E: A5                                               // .

            Return (
    ED1F: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    ED20: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    ED24: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    ED2C: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    ED32: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    ED3C: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    ED49: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    ED50: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    ED5C: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    ED65: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    ED67: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    ED70: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    ED77: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    ED7B: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP10.PMSX */

    ED85: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    ED95: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP10.PSPX */
            }
        }


    ED98: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    ED9E: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP10.PPRW))
            {

    EDA5: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    EDB5: 50 31 30 50 50 52 57 00                          // P10PPRW.

                Return (PPRW ())
            }


    EDBD: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    EDC2: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP11)
    {

    EDCB: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
    EDDB: 31                                               // 1

        Name (LTRZ, Zero)

    EDDC: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    EDE2: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    EDE8: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x0B)

    EDEE: 08 53 4C 4F 54 0A 0B                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    EDF5: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRB, LTRZ) /* \_SB_.PCI0.RP11.LTRZ */
                Store (PMLB, LMSL) /* \_SB_.PCI0.RP11.LMSL */
                Store (PNLB, LNSL) /* \_SB_.PCI0.RP11.LNSL */

    EDFC: A0 2D 50 52 45 53 70 4C 54 52 42 4C 54 52 5A 70  // .-PRESpLTRBLTRZp
    EE0C: 50 4D 4C 42 4C 4D 53 4C 70 50 4E 4C 42 4C 4E 53  // PMLBLMSLpPNLBLNS
    EE1C: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    EE1D: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    EE2A: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    EE35: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    EE45: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    EE55: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    EE65: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    EE75: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    EE85: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    EE95: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    EEA5: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    EEB5: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    EEB7: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    EEC7: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    EECE: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    EED6: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP11.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP11.L23R */
            Store (Zero, Local0)

    EEE2: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    EEF2: 60                                               // `

            While (L23R)
            {

    EEF3: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    EEF9: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    EEFF: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP11.DPGE */
            Store (Zero, Local0)

    EF04: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    EF0F: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    EF17: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    EF1D: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    EF22: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP11.LEDM */
        }


    EF24: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    EF2A: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    EF32: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP11.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    EF3E: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    EF4D: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    EF53: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    EF59: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP11.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP11.LDIS */

    EF5E: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP11.LDIS */
        }


    EF6C: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    EF72: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    EF79: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    EF85: A4 00                                            // ..

            Else
            {

    EF87: A1 03                                            // ..

                Return (One)
            }
        }


    EF89: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    EF8B: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    EF93: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    EF9E: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    EFA1: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    EFA5: A4 00                                            // ..

            ElseIf
    EFA7: A1 0A                                            // ..

 (
    EFA9: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    EFAC: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    EFB0: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    EFB6: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    EFC4: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    EFC7: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    EFCB: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    EFDA: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    EFDE: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    EFE3: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    EFEA: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    EFF2: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    EFF8: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    EFFD: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    F00D: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    F011: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    F01D: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    F026: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    F02B: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    F031: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    F03B: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    F046: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    F051: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    F05C: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    F067: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP11._DSM.FUN0 */

    F06A: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    F074: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP11._DSM.FUN6 */
                            }


    F07A: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    F080: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    F088: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP11._DSM.FUN8 */

    F08B: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP11._DSM.FUN9 */
                                }
                            }
                        }


    F095: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP11._DSM.OPTS */
                    }

    F09B: A4 4F 50 54 53                                   // .OPTS

                    Case
    F0A0: A1 4F 10                                         // .O.

 (0x05)
                    {

    F0A3: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    F0AC: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    F0B1: A4 01                                            // ..

                    Case
    F0B3: A1 4C 0F                                         // .L.

 (0x06)
                    {

    F0B6: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    F0C0: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    F0C4: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    F0C8: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    F0CF: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    F0D9: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP11.LMSL */

    F0DF: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    F0EF: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP11.LNSL */
                                    }

    F0F2: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    F0FA: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP11.LMSL */

    F0FC: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    F10C: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP11.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    F10F: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    F11F: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    F124: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    F134: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    F135: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    F145: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    F149: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    F159: 03 00                                            // ..

Index (LTRV, 0x03))

    F15B: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP11.LTRV */
                            }

    F163: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    F168: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    F16A: A4 00                                            // ..

                    Case
    F16C: A1 43 04                                         // .C.

 (0x08)
                    {

    F16F: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    F178: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    F180: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    F183: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    F187: A4 01                                            // ..

                    Case
    F189: A1 26                                            // .&

 (0x09)
                    {

    F18B: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    F194: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    F19C: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    F19F: 95 69 0A 03                                      // .i..

                                Return (
    F1A3: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    F1A4: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    F1B0: A5                                               // .

            Return (
    F1B1: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    F1B2: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    F1B6: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    F1BE: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    F1C4: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    F1CE: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    F1DB: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    F1E2: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    F1EE: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    F1F7: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    F1F9: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    F202: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    F209: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    F20D: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP11.PMSX */

    F217: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    F227: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP11.PSPX */
            }
        }


    F22A: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    F230: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP11.PPRW))
            {

    F237: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    F247: 50 31 31 50 50 52 57 00                          // P11PPRW.

                Return (PPRW ())
            }


    F24F: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    F254: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP12)
    {

    F25D: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
    F26D: 32                                               // 2

        Name (LTRZ, Zero)

    F26E: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    F274: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    F27A: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x0C)

    F280: 08 53 4C 4F 54 0A 0C                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    F287: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRC, LTRZ) /* \_SB_.PCI0.RP12.LTRZ */
                Store (PMLC, LMSL) /* \_SB_.PCI0.RP12.LMSL */
                Store (PNLC, LNSL) /* \_SB_.PCI0.RP12.LNSL */

    F28E: A0 2D 50 52 45 53 70 4C 54 52 43 4C 54 52 5A 70  // .-PRESpLTRCLTRZp
    F29E: 50 4D 4C 43 4C 4D 53 4C 70 50 4E 4C 43 4C 4E 53  // PMLCLMSLpPNLCLNS
    F2AE: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    F2AF: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    F2BC: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    F2C7: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    F2D7: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    F2E7: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    F2F7: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    F307: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    F317: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    F327: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    F337: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    F347: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    F349: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    F359: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    F360: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    F368: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP12.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP12.L23R */
            Store (Zero, Local0)

    F374: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    F384: 60                                               // `

            While (L23R)
            {

    F385: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    F38B: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    F391: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP12.DPGE */
            Store (Zero, Local0)

    F396: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    F3A1: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    F3A9: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    F3AF: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    F3B4: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP12.LEDM */
        }


    F3B6: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    F3BC: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    F3C4: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP12.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    F3D0: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    F3DF: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    F3E5: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    F3EB: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP12.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP12.LDIS */

    F3F0: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP12.LDIS */
        }


    F3FE: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    F404: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    F40B: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    F417: A4 00                                            // ..

            Else
            {

    F419: A1 03                                            // ..

                Return (One)
            }
        }


    F41B: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    F41D: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    F425: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    F430: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    F433: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    F437: A4 00                                            // ..

            ElseIf
    F439: A1 0A                                            // ..

 (
    F43B: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    F43E: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    F442: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    F448: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    F456: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    F459: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    F45D: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    F46C: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    F470: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    F475: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    F47C: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    F484: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    F48A: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    F48F: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    F49F: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    F4A3: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    F4AF: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    F4B8: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    F4BD: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    F4C3: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    F4CD: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    F4D8: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    F4E3: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    F4EE: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    F4F9: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP12._DSM.FUN0 */

    F4FC: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    F506: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP12._DSM.FUN6 */
                            }


    F50C: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    F512: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    F51A: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP12._DSM.FUN8 */

    F51D: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP12._DSM.FUN9 */
                                }
                            }
                        }


    F527: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP12._DSM.OPTS */
                    }

    F52D: A4 4F 50 54 53                                   // .OPTS

                    Case
    F532: A1 4F 10                                         // .O.

 (0x05)
                    {

    F535: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    F53E: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    F543: A4 01                                            // ..

                    Case
    F545: A1 4C 0F                                         // .L.

 (0x06)
                    {

    F548: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    F552: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    F556: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    F55A: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    F561: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    F56B: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP12.LMSL */

    F571: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    F581: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP12.LNSL */
                                    }

    F584: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    F58C: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP12.LMSL */

    F58E: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    F59E: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP12.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    F5A1: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    F5B1: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    F5B6: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    F5C6: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    F5C7: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    F5D7: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    F5DB: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    F5EB: 03 00                                            // ..

Index (LTRV, 0x03))

    F5ED: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP12.LTRV */
                            }

    F5F5: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    F5FA: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    F5FC: A4 00                                            // ..

                    Case
    F5FE: A1 43 04                                         // .C.

 (0x08)
                    {

    F601: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    F60A: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    F612: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    F615: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    F619: A4 01                                            // ..

                    Case
    F61B: A1 26                                            // .&

 (0x09)
                    {

    F61D: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    F626: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    F62E: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    F631: 95 69 0A 03                                      // .i..

                                Return (
    F635: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    F636: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    F642: A5                                               // .

            Return (
    F643: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    F644: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    F648: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    F650: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    F656: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    F660: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    F66D: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    F674: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    F680: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    F689: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    F68B: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    F694: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    F69B: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    F69F: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP12.PMSX */

    F6A9: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    F6B9: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP12.PSPX */
            }
        }


    F6BC: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    F6C2: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP12.PPRW))
            {

    F6C9: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    F6D9: 50 31 32 50 50 52 57 00                          // P12PPRW.

                Return (PPRW ())
            }


    F6E1: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    F6E6: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP13)
    {

    F6EF: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
    F6FF: 33                                               // 3

        Name (LTRZ, Zero)

    F700: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    F706: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    F70C: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x0D)

    F712: 08 53 4C 4F 54 0A 0D                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    F719: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRD, LTRZ) /* \_SB_.PCI0.RP13.LTRZ */
                Store (PMLD, LMSL) /* \_SB_.PCI0.RP13.LMSL */
                Store (PNLD, LNSL) /* \_SB_.PCI0.RP13.LNSL */

    F720: A0 2D 50 52 45 53 70 4C 54 52 44 4C 54 52 5A 70  // .-PRESpLTRDLTRZp
    F730: 50 4D 4C 44 4C 4D 53 4C 70 50 4E 4C 44 4C 4E 53  // PMLDLMSLpPNLDLNS
    F740: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    F741: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    F74E: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    F759: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    F769: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    F779: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    F789: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    F799: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    F7A9: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    F7B9: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    F7C9: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    F7D9: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    F7DB: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    F7EB: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    F7F2: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    F7FA: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP13.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP13.L23R */
            Store (Zero, Local0)

    F806: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    F816: 60                                               // `

            While (L23R)
            {

    F817: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    F81D: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    F823: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP13.DPGE */
            Store (Zero, Local0)

    F828: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    F833: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    F83B: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    F841: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    F846: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP13.LEDM */
        }


    F848: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    F84E: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    F856: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP13.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    F862: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    F871: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    F877: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    F87D: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP13.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP13.LDIS */

    F882: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP13.LDIS */
        }


    F890: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    F896: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    F89D: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    F8A9: A4 00                                            // ..

            Else
            {

    F8AB: A1 03                                            // ..

                Return (One)
            }
        }


    F8AD: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    F8AF: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    F8B7: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    F8C2: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    F8C5: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    F8C9: A4 00                                            // ..

            ElseIf
    F8CB: A1 0A                                            // ..

 (
    F8CD: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    F8D0: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    F8D4: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    F8DA: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    F8E8: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    F8EB: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    F8EF: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    F8FE: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    F902: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    F907: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    F90E: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    F916: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    F91C: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    F921: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    F931: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    F935: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    F941: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    F94A: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    F94F: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    F955: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    F95F: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    F96A: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    F975: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    F980: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    F98B: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP13._DSM.FUN0 */

    F98E: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    F998: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP13._DSM.FUN6 */
                            }


    F99E: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    F9A4: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    F9AC: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP13._DSM.FUN8 */

    F9AF: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP13._DSM.FUN9 */
                                }
                            }
                        }


    F9B9: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP13._DSM.OPTS */
                    }

    F9BF: A4 4F 50 54 53                                   // .OPTS

                    Case
    F9C4: A1 4F 10                                         // .O.

 (0x05)
                    {

    F9C7: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    F9D0: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    F9D5: A4 01                                            // ..

                    Case
    F9D7: A1 4C 0F                                         // .L.

 (0x06)
                    {

    F9DA: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    F9E4: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    F9E8: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    F9EC: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    F9F3: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    F9FD: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP13.LMSL */

    FA03: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    FA13: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP13.LNSL */
                                    }

    FA16: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    FA1E: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP13.LMSL */

    FA20: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    FA30: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP13.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    FA33: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    FA43: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    FA48: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    FA58: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    FA59: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    FA69: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    FA6D: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    FA7D: 03 00                                            // ..

Index (LTRV, 0x03))

    FA7F: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP13.LTRV */
                            }

    FA87: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    FA8C: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    FA8E: A4 00                                            // ..

                    Case
    FA90: A1 43 04                                         // .C.

 (0x08)
                    {

    FA93: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    FA9C: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    FAA4: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    FAA7: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    FAAB: A4 01                                            // ..

                    Case
    FAAD: A1 26                                            // .&

 (0x09)
                    {

    FAAF: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    FAB8: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    FAC0: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    FAC3: 95 69 0A 03                                      // .i..

                                Return (
    FAC7: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    FAC8: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    FAD4: A5                                               // .

            Return (
    FAD5: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    FAD6: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    FADA: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    FAE2: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    FAE8: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    FAF2: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    FAFF: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    FB06: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    FB12: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    FB1B: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    FB1D: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    FB26: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    FB2D: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    FB31: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP13.PMSX */

    FB3B: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    FB4B: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP13.PSPX */
            }
        }


    FB4E: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    FB54: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP13.PPRW))
            {

    FB5B: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    FB6B: 50 31 33 50 50 52 57 00                          // P13PPRW.

                Return (PPRW ())
            }


    FB73: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


    FB78: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP14)
    {

    FB81: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
    FB91: 34                                               // 4

        Name (LTRZ, Zero)

    FB92: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

    FB98: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

    FB9E: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x0E)

    FBA4: 08 53 4C 4F 54 0A 0E                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

    FBAB: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRE, LTRZ) /* \_SB_.PCI0.RP14.LTRZ */
                Store (PMLE, LMSL) /* \_SB_.PCI0.RP14.LMSL */
                Store (PNLE, LNSL) /* \_SB_.PCI0.RP14.LNSL */

    FBB2: A0 2D 50 52 45 53 70 4C 54 52 45 4C 54 52 5A 70  // .-PRESpLTRELTRZp
    FBC2: 50 4D 4C 45 4C 4D 53 4C 70 50 4E 4C 45 4C 4E 53  // PMLELMSLpPNLELNS
    FBD2: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


    FBD3: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

    FBE0: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


    FBEB: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
    FBFB: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
    FC0B: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
    FC1B: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
    FC2B: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
    FC3B: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
    FC4B: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
    FC5B: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
    FC6B: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


    FC6D: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
    FC7D: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

    FC84: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    FC8C: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP14.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP14.L23R */
            Store (Zero, Local0)

    FC98: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
    FCA8: 60                                               // `

            While (L23R)
            {

    FCA9: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

    FCAF: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    FCB5: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP14.DPGE */
            Store (Zero, Local0)

    FCBA: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

    FCC5: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

    FCCD: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

    FCD3: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


    FCD8: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP14.LEDM */
        }


    FCDA: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

    FCE0: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    FCE8: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP14.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

    FCF4: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

    FD03: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

    FD09: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

    FD0F: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP14.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP14.LDIS */

    FD14: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP14.LDIS */
        }


    FD22: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

    FD28: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

    FD2F: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

    FD3B: A4 00                                            // ..

            Else
            {

    FD3D: A1 03                                            // ..

                Return (One)
            }
        }


    FD3F: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

    FD41: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

    FD49: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
    FD54: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

    FD57: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

    FD5B: A4 00                                            // ..

            ElseIf
    FD5D: A1 0A                                            // ..

 (
    FD5F: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

    FD62: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

    FD66: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
    FD6C: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

    FD7A: 80 60 00                                         // .`.

                Sleep (0x10)
            }


    FD7D: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

    FD81: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


    FD90: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
    FD94: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

    FD99: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    FDA0: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


    FDA8: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    FDAE: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

    FDB3: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
    FDC3: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

    FDC7: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

    FDD3: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
    FDDC: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

    FDE1: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

    FDE7: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

    FDF1: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

    FDFC: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

    FE07: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

    FE12: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
    FE1D: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP14._DSM.FUN0 */

    FE20: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

    FE2A: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP14._DSM.FUN6 */
                            }


    FE30: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

    FE36: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
    FE3E: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP14._DSM.FUN8 */

    FE41: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP14._DSM.FUN9 */
                                }
                            }
                        }


    FE4B: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP14._DSM.OPTS */
                    }

    FE51: A4 4F 50 54 53                                   // .OPTS

                    Case
    FE56: A1 4F 10                                         // .O.

 (0x05)
                    {

    FE59: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

    FE62: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

    FE67: A4 01                                            // ..

                    Case
    FE69: A1 4C 0F                                         // .L.

 (0x06)
                    {

    FE6C: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
    FE76: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

    FE7A: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

    FE7E: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
    FE85: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

    FE8F: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP14.LMSL */

    FE95: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
    FEA5: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP14.LNSL */
                                    }

    FEA8: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
    FEB0: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP14.LMSL */

    FEB2: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
    FEC2: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP14.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
    FEC5: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
    FED5: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
    FEDA: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
    FEEA: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
    FEEB: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
    FEFB: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
    FEFF: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
    FF0F: 03 00                                            // ..

Index (LTRV, 0x03))

    FF11: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP14.LTRV */
                            }

    FF19: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

    FF1E: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

    FF20: A4 00                                            // ..

                    Case
    FF22: A1 43 04                                         // .C.

 (0x08)
                    {

    FF25: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

    FF2E: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
    FF36: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    FF39: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

    FF3D: A4 01                                            // ..

                    Case
    FF3F: A1 26                                            // .&

 (0x09)
                    {

    FF41: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

    FF4A: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
    FF52: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

    FF55: 95 69 0A 03                                      // .i..

                                Return (
    FF59: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


    FF5A: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


    FF66: A5                                               // .

            Return (
    FF67: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


    FF68: 11 03 01 00                                      // ....

        Device (PXSX)
        {

    FF6C: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

    FF74: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

    FF7A: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


    FF84: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

    FF91: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

    FF98: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

    FFA4: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

    FFAD: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


    FFAF: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

    FFB8: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
    FFBF: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
    FFC3: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP14.PMSX */

    FFCD: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
    FFDD: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP14.PSPX */
            }
        }


    FFE0: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

    FFE6: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP14.PPRW))
            {

    FFED: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
    FFFD: 50 31 34 50 50 52 57 00                          // P14PPRW.

                Return (PPRW ())
            }


   10005: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   1000A: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP15)
    {

   10013: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
   10023: 35                                               // 5

        Name (LTRZ, Zero)

   10024: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   1002A: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   10030: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x0F)

   10036: 08 53 4C 4F 54 0A 0F                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   1003D: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRF, LTRZ) /* \_SB_.PCI0.RP15.LTRZ */
                Store (PMLF, LMSL) /* \_SB_.PCI0.RP15.LMSL */
                Store (PNLF, LNSL) /* \_SB_.PCI0.RP15.LNSL */

   10044: A0 2D 50 52 45 53 70 4C 54 52 46 4C 54 52 5A 70  // .-PRESpLTRFLTRZp
   10054: 50 4D 4C 46 4C 4D 53 4C 70 50 4E 4C 46 4C 4E 53  // PMLFLMSLpPNLFLNS
   10064: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   10065: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   10072: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   1007D: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   1008D: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   1009D: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   100AD: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   100BD: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   100CD: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   100DD: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   100ED: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   100FD: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   100FF: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   1010F: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   10116: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   1011E: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP15.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP15.L23R */
            Store (Zero, Local0)

   1012A: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   1013A: 60                                               // `

            While (L23R)
            {

   1013B: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   10141: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   10147: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP15.DPGE */
            Store (Zero, Local0)

   1014C: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   10157: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   1015F: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   10165: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   1016A: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP15.LEDM */
        }


   1016C: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   10172: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   1017A: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP15.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   10186: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   10195: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   1019B: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   101A1: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP15.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP15.LDIS */

   101A6: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP15.LDIS */
        }


   101B4: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   101BA: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   101C1: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   101CD: A4 00                                            // ..

            Else
            {

   101CF: A1 03                                            // ..

                Return (One)
            }
        }


   101D1: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   101D3: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   101DB: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   101E6: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   101E9: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   101ED: A4 00                                            // ..

            ElseIf
   101EF: A1 0A                                            // ..

 (
   101F1: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   101F4: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   101F8: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   101FE: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   1020C: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   1020F: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   10213: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   10222: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   10226: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   1022B: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   10232: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   1023A: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   10240: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   10245: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   10255: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   10259: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   10265: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   1026E: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   10273: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   10279: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   10283: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   1028E: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   10299: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   102A4: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   102AF: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP15._DSM.FUN0 */

   102B2: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   102BC: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP15._DSM.FUN6 */
                            }


   102C2: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   102C8: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   102D0: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP15._DSM.FUN8 */

   102D3: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP15._DSM.FUN9 */
                                }
                            }
                        }


   102DD: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP15._DSM.OPTS */
                    }

   102E3: A4 4F 50 54 53                                   // .OPTS

                    Case
   102E8: A1 4F 10                                         // .O.

 (0x05)
                    {

   102EB: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   102F4: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   102F9: A4 01                                            // ..

                    Case
   102FB: A1 4C 0F                                         // .L.

 (0x06)
                    {

   102FE: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   10308: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   1030C: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   10310: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   10317: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   10321: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP15.LMSL */

   10327: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   10337: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP15.LNSL */
                                    }

   1033A: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   10342: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP15.LMSL */

   10344: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   10354: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP15.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   10357: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   10367: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   1036C: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   1037C: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   1037D: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   1038D: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   10391: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   103A1: 03 00                                            // ..

Index (LTRV, 0x03))

   103A3: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP15.LTRV */
                            }

   103AB: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   103B0: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   103B2: A4 00                                            // ..

                    Case
   103B4: A1 43 04                                         // .C.

 (0x08)
                    {

   103B7: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   103C0: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   103C8: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   103CB: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   103CF: A4 01                                            // ..

                    Case
   103D1: A1 26                                            // .&

 (0x09)
                    {

   103D3: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   103DC: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   103E4: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   103E7: 95 69 0A 03                                      // .i..

                                Return (
   103EB: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   103EC: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   103F8: A5                                               // .

            Return (
   103F9: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   103FA: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   103FE: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   10406: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   1040C: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   10416: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   10423: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   1042A: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   10436: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   1043F: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   10441: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   1044A: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   10451: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   10455: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP15.PMSX */

   1045F: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   1046F: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP15.PSPX */
            }
        }


   10472: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   10478: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP15.PPRW))
            {

   1047F: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   1048F: 50 31 35 50 50 52 57 00                          // P15PPRW.

                Return (PPRW ())
            }


   10497: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   1049C: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP16)
    {

   104A5: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
   104B5: 36                                               // 6

        Name (LTRZ, Zero)

   104B6: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   104BC: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   104C2: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x10)

   104C8: 08 53 4C 4F 54 0A 10                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   104CF: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRG, LTRZ) /* \_SB_.PCI0.RP16.LTRZ */
                Store (PMLG, LMSL) /* \_SB_.PCI0.RP16.LMSL */
                Store (PNLG, LNSL) /* \_SB_.PCI0.RP16.LNSL */

   104D6: A0 2D 50 52 45 53 70 4C 54 52 47 4C 54 52 5A 70  // .-PRESpLTRGLTRZp
   104E6: 50 4D 4C 47 4C 4D 53 4C 70 50 4E 4C 47 4C 4E 53  // PMLGLMSLpPNLGLNS
   104F6: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   104F7: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   10504: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   1050F: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   1051F: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   1052F: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   1053F: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   1054F: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   1055F: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   1056F: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   1057F: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   1058F: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   10591: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   105A1: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   105A8: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   105B0: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP16.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP16.L23R */
            Store (Zero, Local0)

   105BC: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   105CC: 60                                               // `

            While (L23R)
            {

   105CD: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   105D3: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   105D9: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP16.DPGE */
            Store (Zero, Local0)

   105DE: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   105E9: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   105F1: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   105F7: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   105FC: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP16.LEDM */
        }


   105FE: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   10604: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   1060C: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP16.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   10618: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   10627: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   1062D: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   10633: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP16.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP16.LDIS */

   10638: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP16.LDIS */
        }


   10646: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   1064C: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10653: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   1065F: A4 00                                            // ..

            Else
            {

   10661: A1 03                                            // ..

                Return (One)
            }
        }


   10663: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   10665: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   1066D: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   10678: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   1067B: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   1067F: A4 00                                            // ..

            ElseIf
   10681: A1 0A                                            // ..

 (
   10683: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   10686: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   1068A: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   10690: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   1069E: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   106A1: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   106A5: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   106B4: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   106B8: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   106BD: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   106C4: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   106CC: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   106D2: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   106D7: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   106E7: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   106EB: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   106F7: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   10700: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   10705: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   1070B: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   10715: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   10720: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   1072B: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   10736: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   10741: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP16._DSM.FUN0 */

   10744: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   1074E: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP16._DSM.FUN6 */
                            }


   10754: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   1075A: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   10762: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP16._DSM.FUN8 */

   10765: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP16._DSM.FUN9 */
                                }
                            }
                        }


   1076F: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP16._DSM.OPTS */
                    }

   10775: A4 4F 50 54 53                                   // .OPTS

                    Case
   1077A: A1 4F 10                                         // .O.

 (0x05)
                    {

   1077D: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   10786: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   1078B: A4 01                                            // ..

                    Case
   1078D: A1 4C 0F                                         // .L.

 (0x06)
                    {

   10790: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   1079A: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   1079E: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   107A2: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   107A9: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   107B3: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP16.LMSL */

   107B9: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   107C9: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP16.LNSL */
                                    }

   107CC: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   107D4: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP16.LMSL */

   107D6: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   107E6: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP16.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   107E9: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   107F9: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   107FE: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   1080E: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   1080F: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   1081F: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   10823: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   10833: 03 00                                            // ..

Index (LTRV, 0x03))

   10835: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP16.LTRV */
                            }

   1083D: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   10842: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   10844: A4 00                                            // ..

                    Case
   10846: A1 43 04                                         // .C.

 (0x08)
                    {

   10849: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   10852: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   1085A: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   1085D: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   10861: A4 01                                            // ..

                    Case
   10863: A1 26                                            // .&

 (0x09)
                    {

   10865: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   1086E: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   10876: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   10879: 95 69 0A 03                                      // .i..

                                Return (
   1087D: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   1087E: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   1088A: A5                                               // .

            Return (
   1088B: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   1088C: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   10890: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   10898: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   1089E: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   108A8: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   108B5: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   108BC: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   108C8: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   108D1: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   108D3: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   108DC: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   108E3: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   108E7: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP16.PMSX */

   108F1: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   10901: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP16.PSPX */
            }
        }


   10904: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   1090A: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP16.PPRW))
            {

   10911: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   10921: 50 31 36 50 50 52 57 00                          // P16PPRW.

                Return (PPRW ())
            }


   10929: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   1092E: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP17)
    {

   10937: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
   10947: 37                                               // 7

        Name (LTRZ, Zero)

   10948: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   1094E: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   10954: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x11)

   1095A: 08 53 4C 4F 54 0A 11                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   10961: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRH, LTRZ) /* \_SB_.PCI0.RP17.LTRZ */
                Store (PMLH, LMSL) /* \_SB_.PCI0.RP17.LMSL */
                Store (PNLH, LNSL) /* \_SB_.PCI0.RP17.LNSL */

   10968: A0 2D 50 52 45 53 70 4C 54 52 48 4C 54 52 5A 70  // .-PRESpLTRHLTRZp
   10978: 50 4D 4C 48 4C 4D 53 4C 70 50 4E 4C 48 4C 4E 53  // PMLHLMSLpPNLHLNS
   10988: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   10989: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   10996: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   109A1: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   109B1: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   109C1: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   109D1: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   109E1: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   109F1: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   10A01: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   10A11: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   10A21: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   10A23: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   10A33: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   10A3A: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10A42: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP17.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP17.L23R */
            Store (Zero, Local0)

   10A4E: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   10A5E: 60                                               // `

            While (L23R)
            {

   10A5F: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   10A65: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   10A6B: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP17.DPGE */
            Store (Zero, Local0)

   10A70: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   10A7B: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   10A83: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   10A89: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   10A8E: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP17.LEDM */
        }


   10A90: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   10A96: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10A9E: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP17.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   10AAA: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   10AB9: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   10ABF: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   10AC5: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP17.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP17.LDIS */

   10ACA: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP17.LDIS */
        }


   10AD8: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   10ADE: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10AE5: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   10AF1: A4 00                                            // ..

            Else
            {

   10AF3: A1 03                                            // ..

                Return (One)
            }
        }


   10AF5: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   10AF7: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   10AFF: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   10B0A: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   10B0D: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   10B11: A4 00                                            // ..

            ElseIf
   10B13: A1 0A                                            // ..

 (
   10B15: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   10B18: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   10B1C: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   10B22: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   10B30: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   10B33: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   10B37: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   10B46: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   10B4A: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   10B4F: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   10B56: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   10B5E: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   10B64: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   10B69: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   10B79: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   10B7D: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   10B89: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   10B92: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   10B97: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   10B9D: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   10BA7: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   10BB2: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   10BBD: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   10BC8: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   10BD3: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP17._DSM.FUN0 */

   10BD6: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   10BE0: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP17._DSM.FUN6 */
                            }


   10BE6: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   10BEC: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   10BF4: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP17._DSM.FUN8 */

   10BF7: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP17._DSM.FUN9 */
                                }
                            }
                        }


   10C01: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP17._DSM.OPTS */
                    }

   10C07: A4 4F 50 54 53                                   // .OPTS

                    Case
   10C0C: A1 4F 10                                         // .O.

 (0x05)
                    {

   10C0F: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   10C18: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   10C1D: A4 01                                            // ..

                    Case
   10C1F: A1 4C 0F                                         // .L.

 (0x06)
                    {

   10C22: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   10C2C: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   10C30: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   10C34: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   10C3B: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   10C45: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP17.LMSL */

   10C4B: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   10C5B: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP17.LNSL */
                                    }

   10C5E: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   10C66: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP17.LMSL */

   10C68: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   10C78: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP17.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   10C7B: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   10C8B: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   10C90: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   10CA0: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   10CA1: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   10CB1: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   10CB5: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   10CC5: 03 00                                            // ..

Index (LTRV, 0x03))

   10CC7: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP17.LTRV */
                            }

   10CCF: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   10CD4: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   10CD6: A4 00                                            // ..

                    Case
   10CD8: A1 43 04                                         // .C.

 (0x08)
                    {

   10CDB: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   10CE4: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   10CEC: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   10CEF: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   10CF3: A4 01                                            // ..

                    Case
   10CF5: A1 26                                            // .&

 (0x09)
                    {

   10CF7: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   10D00: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   10D08: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   10D0B: 95 69 0A 03                                      // .i..

                                Return (
   10D0F: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   10D10: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   10D1C: A5                                               // .

            Return (
   10D1D: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   10D1E: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   10D22: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   10D2A: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   10D30: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   10D3A: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   10D47: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   10D4E: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   10D5A: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   10D63: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   10D65: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   10D6E: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   10D75: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   10D79: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP17.PMSX */

   10D83: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   10D93: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP17.PSPX */
            }
        }


   10D96: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   10D9C: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP17.PPRW))
            {

   10DA3: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   10DB3: 50 31 37 50 50 52 57 00                          // P17PPRW.

                Return (PPRW ())
            }


   10DBB: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   10DC0: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP18)
    {

   10DC9: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
   10DD9: 38                                               // 8

        Name (LTRZ, Zero)

   10DDA: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   10DE0: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   10DE6: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x12)

   10DEC: 08 53 4C 4F 54 0A 12                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   10DF3: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRI, LTRZ) /* \_SB_.PCI0.RP18.LTRZ */
                Store (PMLI, LMSL) /* \_SB_.PCI0.RP18.LMSL */
                Store (PNLI, LNSL) /* \_SB_.PCI0.RP18.LNSL */

   10DFA: A0 2D 50 52 45 53 70 4C 54 52 49 4C 54 52 5A 70  // .-PRESpLTRILTRZp
   10E0A: 50 4D 4C 49 4C 4D 53 4C 70 50 4E 4C 49 4C 4E 53  // PMLILMSLpPNLILNS
   10E1A: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   10E1B: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   10E28: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   10E33: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   10E43: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   10E53: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   10E63: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   10E73: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   10E83: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   10E93: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   10EA3: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   10EB3: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   10EB5: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   10EC5: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   10ECC: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10ED4: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP18.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP18.L23R */
            Store (Zero, Local0)

   10EE0: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   10EF0: 60                                               // `

            While (L23R)
            {

   10EF1: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   10EF7: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   10EFD: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP18.DPGE */
            Store (Zero, Local0)

   10F02: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   10F0D: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   10F15: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   10F1B: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   10F20: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP18.LEDM */
        }


   10F22: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   10F28: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10F30: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP18.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   10F3C: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   10F4B: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   10F51: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   10F57: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP18.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP18.LDIS */

   10F5C: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP18.LDIS */
        }


   10F6A: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   10F70: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   10F77: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   10F83: A4 00                                            // ..

            Else
            {

   10F85: A1 03                                            // ..

                Return (One)
            }
        }


   10F87: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   10F89: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   10F91: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   10F9C: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   10F9F: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   10FA3: A4 00                                            // ..

            ElseIf
   10FA5: A1 0A                                            // ..

 (
   10FA7: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   10FAA: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   10FAE: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   10FB4: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   10FC2: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   10FC5: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   10FC9: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   10FD8: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   10FDC: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   10FE1: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   10FE8: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   10FF0: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   10FF6: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   10FFB: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   1100B: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   1100F: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   1101B: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   11024: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   11029: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   1102F: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   11039: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   11044: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   1104F: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   1105A: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   11065: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP18._DSM.FUN0 */

   11068: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   11072: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP18._DSM.FUN6 */
                            }


   11078: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   1107E: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   11086: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP18._DSM.FUN8 */

   11089: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP18._DSM.FUN9 */
                                }
                            }
                        }


   11093: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP18._DSM.OPTS */
                    }

   11099: A4 4F 50 54 53                                   // .OPTS

                    Case
   1109E: A1 4F 10                                         // .O.

 (0x05)
                    {

   110A1: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   110AA: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   110AF: A4 01                                            // ..

                    Case
   110B1: A1 4C 0F                                         // .L.

 (0x06)
                    {

   110B4: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   110BE: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   110C2: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   110C6: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   110CD: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   110D7: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP18.LMSL */

   110DD: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   110ED: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP18.LNSL */
                                    }

   110F0: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   110F8: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP18.LMSL */

   110FA: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   1110A: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP18.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   1110D: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   1111D: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   11122: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   11132: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   11133: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   11143: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   11147: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   11157: 03 00                                            // ..

Index (LTRV, 0x03))

   11159: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP18.LTRV */
                            }

   11161: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   11166: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   11168: A4 00                                            // ..

                    Case
   1116A: A1 43 04                                         // .C.

 (0x08)
                    {

   1116D: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   11176: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   1117E: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   11181: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   11185: A4 01                                            // ..

                    Case
   11187: A1 26                                            // .&

 (0x09)
                    {

   11189: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   11192: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   1119A: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   1119D: 95 69 0A 03                                      // .i..

                                Return (
   111A1: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   111A2: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   111AE: A5                                               // .

            Return (
   111AF: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   111B0: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   111B4: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   111BC: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   111C2: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   111CC: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   111D9: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   111E0: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   111EC: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   111F5: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   111F7: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   11200: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   11207: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   1120B: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP18.PMSX */

   11215: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   11225: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP18.PSPX */
            }
        }


   11228: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   1122E: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP18.PPRW))
            {

   11235: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   11245: 50 31 38 50 50 52 57 00                          // P18PPRW.

                Return (PPRW ())
            }


   1124D: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   11252: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP19)
    {

   1125B: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 31  // .AI/._SB_PCI0RP1
   1126B: 39                                               // 9

        Name (LTRZ, Zero)

   1126C: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   11272: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   11278: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x13)

   1127E: 08 53 4C 4F 54 0A 13                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   11285: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRJ, LTRZ) /* \_SB_.PCI0.RP19.LTRZ */
                Store (PMLJ, LMSL) /* \_SB_.PCI0.RP19.LMSL */
                Store (PNLJ, LNSL) /* \_SB_.PCI0.RP19.LNSL */

   1128C: A0 2D 50 52 45 53 70 4C 54 52 4A 4C 54 52 5A 70  // .-PRESpLTRJLTRZp
   1129C: 50 4D 4C 4A 4C 4D 53 4C 70 50 4E 4C 4A 4C 4E 53  // PMLJLMSLpPNLJLNS
   112AC: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   112AD: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   112BA: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   112C5: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   112D5: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   112E5: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   112F5: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   11305: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   11315: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   11325: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   11335: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   11345: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   11347: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   11357: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   1135E: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   11366: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP19.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP19.L23R */
            Store (Zero, Local0)

   11372: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   11382: 60                                               // `

            While (L23R)
            {

   11383: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   11389: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   1138F: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP19.DPGE */
            Store (Zero, Local0)

   11394: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   1139F: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   113A7: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   113AD: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   113B2: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP19.LEDM */
        }


   113B4: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   113BA: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   113C2: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP19.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   113CE: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   113DD: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   113E3: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   113E9: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP19.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP19.LDIS */

   113EE: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP19.LDIS */
        }


   113FC: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   11402: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   11409: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   11415: A4 00                                            // ..

            Else
            {

   11417: A1 03                                            // ..

                Return (One)
            }
        }


   11419: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   1141B: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   11423: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   1142E: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   11431: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   11435: A4 00                                            // ..

            ElseIf
   11437: A1 0A                                            // ..

 (
   11439: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   1143C: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   11440: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   11446: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   11454: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   11457: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   1145B: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   1146A: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   1146E: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   11473: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   1147A: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   11482: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   11488: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   1148D: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   1149D: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   114A1: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   114AD: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   114B6: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   114BB: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   114C1: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   114CB: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   114D6: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   114E1: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   114EC: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   114F7: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP19._DSM.FUN0 */

   114FA: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   11504: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP19._DSM.FUN6 */
                            }


   1150A: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   11510: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   11518: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP19._DSM.FUN8 */

   1151B: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP19._DSM.FUN9 */
                                }
                            }
                        }


   11525: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP19._DSM.OPTS */
                    }

   1152B: A4 4F 50 54 53                                   // .OPTS

                    Case
   11530: A1 4F 10                                         // .O.

 (0x05)
                    {

   11533: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   1153C: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   11541: A4 01                                            // ..

                    Case
   11543: A1 4C 0F                                         // .L.

 (0x06)
                    {

   11546: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   11550: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   11554: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   11558: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   1155F: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   11569: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP19.LMSL */

   1156F: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   1157F: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP19.LNSL */
                                    }

   11582: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   1158A: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP19.LMSL */

   1158C: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   1159C: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP19.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   1159F: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   115AF: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   115B4: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   115C4: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   115C5: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   115D5: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   115D9: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   115E9: 03 00                                            // ..

Index (LTRV, 0x03))

   115EB: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP19.LTRV */
                            }

   115F3: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   115F8: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   115FA: A4 00                                            // ..

                    Case
   115FC: A1 43 04                                         // .C.

 (0x08)
                    {

   115FF: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   11608: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   11610: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   11613: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   11617: A4 01                                            // ..

                    Case
   11619: A1 26                                            // .&

 (0x09)
                    {

   1161B: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   11624: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   1162C: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   1162F: 95 69 0A 03                                      // .i..

                                Return (
   11633: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   11634: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   11640: A5                                               // .

            Return (
   11641: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   11642: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   11646: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   1164E: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   11654: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   1165E: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   1166B: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   11672: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   1167E: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   11687: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   11689: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   11692: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   11699: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   1169D: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP19.PMSX */

   116A7: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   116B7: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP19.PSPX */
            }
        }


   116BA: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   116C0: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP19.PPRW))
            {

   116C7: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   116D7: 50 31 39 50 50 52 57 00                          // P19PPRW.

                Return (PPRW ())
            }


   116DF: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   116E4: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP20)
    {

   116ED: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 32  // .AI/._SB_PCI0RP2
   116FD: 30                                               // 0

        Name (LTRZ, Zero)

   116FE: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   11704: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   1170A: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x14)

   11710: 08 53 4C 4F 54 0A 14                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   11717: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRK, LTRZ) /* \_SB_.PCI0.RP20.LTRZ */
                Store (PMLK, LMSL) /* \_SB_.PCI0.RP20.LMSL */
                Store (PNLK, LNSL) /* \_SB_.PCI0.RP20.LNSL */

   1171E: A0 2D 50 52 45 53 70 4C 54 52 4B 4C 54 52 5A 70  // .-PRESpLTRKLTRZp
   1172E: 50 4D 4C 4B 4C 4D 53 4C 70 50 4E 4C 4B 4C 4E 53  // PMLKLMSLpPNLKLNS
   1173E: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   1173F: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   1174C: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   11757: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   11767: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   11777: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   11787: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   11797: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   117A7: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   117B7: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   117C7: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   117D7: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   117D9: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   117E9: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   117F0: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   117F8: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP20.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP20.L23R */
            Store (Zero, Local0)

   11804: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   11814: 60                                               // `

            While (L23R)
            {

   11815: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   1181B: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   11821: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP20.DPGE */
            Store (Zero, Local0)

   11826: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   11831: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   11839: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   1183F: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   11844: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP20.LEDM */
        }


   11846: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   1184C: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   11854: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP20.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   11860: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   1186F: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   11875: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   1187B: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP20.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP20.LDIS */

   11880: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP20.LDIS */
        }


   1188E: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   11894: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   1189B: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   118A7: A4 00                                            // ..

            Else
            {

   118A9: A1 03                                            // ..

                Return (One)
            }
        }


   118AB: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   118AD: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   118B5: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   118C0: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   118C3: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   118C7: A4 00                                            // ..

            ElseIf
   118C9: A1 0A                                            // ..

 (
   118CB: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   118CE: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   118D2: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   118D8: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   118E6: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   118E9: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   118ED: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   118FC: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   11900: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   11905: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   1190C: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   11914: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   1191A: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   1191F: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   1192F: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   11933: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   1193F: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   11948: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   1194D: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   11953: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   1195D: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   11968: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   11973: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   1197E: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   11989: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP20._DSM.FUN0 */

   1198C: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   11996: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP20._DSM.FUN6 */
                            }


   1199C: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   119A2: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   119AA: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP20._DSM.FUN8 */

   119AD: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP20._DSM.FUN9 */
                                }
                            }
                        }


   119B7: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP20._DSM.OPTS */
                    }

   119BD: A4 4F 50 54 53                                   // .OPTS

                    Case
   119C2: A1 4F 10                                         // .O.

 (0x05)
                    {

   119C5: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   119CE: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   119D3: A4 01                                            // ..

                    Case
   119D5: A1 4C 0F                                         // .L.

 (0x06)
                    {

   119D8: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   119E2: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   119E6: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   119EA: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   119F1: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   119FB: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP20.LMSL */

   11A01: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   11A11: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP20.LNSL */
                                    }

   11A14: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   11A1C: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP20.LMSL */

   11A1E: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   11A2E: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP20.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   11A31: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   11A41: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   11A46: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   11A56: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   11A57: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   11A67: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   11A6B: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   11A7B: 03 00                                            // ..

Index (LTRV, 0x03))

   11A7D: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP20.LTRV */
                            }

   11A85: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   11A8A: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   11A8C: A4 00                                            // ..

                    Case
   11A8E: A1 43 04                                         // .C.

 (0x08)
                    {

   11A91: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   11A9A: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   11AA2: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   11AA5: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   11AA9: A4 01                                            // ..

                    Case
   11AAB: A1 26                                            // .&

 (0x09)
                    {

   11AAD: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   11AB6: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   11ABE: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   11AC1: 95 69 0A 03                                      // .i..

                                Return (
   11AC5: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   11AC6: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   11AD2: A5                                               // .

            Return (
   11AD3: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   11AD4: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   11AD8: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   11AE0: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   11AE6: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   11AF0: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   11AFD: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   11B04: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   11B10: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   11B19: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   11B1B: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   11B24: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   11B2B: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   11B2F: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP20.PMSX */

   11B39: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   11B49: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP20.PSPX */
            }
        }


   11B4C: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   11B52: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP20.PPRW))
            {

   11B59: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   11B69: 50 32 30 50 50 52 57 00                          // P20PPRW.

                Return (PPRW ())
            }


   11B71: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   11B76: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP21)
    {

   11B7F: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 32  // .AI/._SB_PCI0RP2
   11B8F: 31                                               // 1

        Name (LTRZ, Zero)

   11B90: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   11B96: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   11B9C: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x15)

   11BA2: 08 53 4C 4F 54 0A 15                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   11BA9: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRL, LTRZ) /* \_SB_.PCI0.RP21.LTRZ */
                Store (PMLL, LMSL) /* \_SB_.PCI0.RP21.LMSL */
                Store (PNLL, LNSL) /* \_SB_.PCI0.RP21.LNSL */

   11BB0: A0 2D 50 52 45 53 70 4C 54 52 4C 4C 54 52 5A 70  // .-PRESpLTRLLTRZp
   11BC0: 50 4D 4C 4C 4C 4D 53 4C 70 50 4E 4C 4C 4C 4E 53  // PMLLLMSLpPNLLLNS
   11BD0: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   11BD1: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   11BDE: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   11BE9: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   11BF9: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   11C09: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   11C19: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   11C29: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   11C39: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   11C49: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   11C59: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   11C69: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   11C6B: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   11C7B: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   11C82: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   11C8A: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP21.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP21.L23R */
            Store (Zero, Local0)

   11C96: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   11CA6: 60                                               // `

            While (L23R)
            {

   11CA7: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   11CAD: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   11CB3: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP21.DPGE */
            Store (Zero, Local0)

   11CB8: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   11CC3: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   11CCB: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   11CD1: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   11CD6: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP21.LEDM */
        }


   11CD8: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   11CDE: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   11CE6: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP21.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   11CF2: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   11D01: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   11D07: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   11D0D: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP21.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP21.LDIS */

   11D12: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP21.LDIS */
        }


   11D20: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   11D26: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   11D2D: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   11D39: A4 00                                            // ..

            Else
            {

   11D3B: A1 03                                            // ..

                Return (One)
            }
        }


   11D3D: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   11D3F: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   11D47: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   11D52: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   11D55: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   11D59: A4 00                                            // ..

            ElseIf
   11D5B: A1 0A                                            // ..

 (
   11D5D: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   11D60: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   11D64: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   11D6A: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   11D78: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   11D7B: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   11D7F: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   11D8E: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   11D92: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   11D97: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   11D9E: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   11DA6: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   11DAC: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   11DB1: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   11DC1: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   11DC5: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   11DD1: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   11DDA: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   11DDF: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   11DE5: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   11DEF: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   11DFA: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   11E05: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   11E10: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   11E1B: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP21._DSM.FUN0 */

   11E1E: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   11E28: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP21._DSM.FUN6 */
                            }


   11E2E: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   11E34: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   11E3C: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP21._DSM.FUN8 */

   11E3F: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP21._DSM.FUN9 */
                                }
                            }
                        }


   11E49: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP21._DSM.OPTS */
                    }

   11E4F: A4 4F 50 54 53                                   // .OPTS

                    Case
   11E54: A1 4F 10                                         // .O.

 (0x05)
                    {

   11E57: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   11E60: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   11E65: A4 01                                            // ..

                    Case
   11E67: A1 4C 0F                                         // .L.

 (0x06)
                    {

   11E6A: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   11E74: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   11E78: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   11E7C: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   11E83: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   11E8D: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP21.LMSL */

   11E93: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   11EA3: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP21.LNSL */
                                    }

   11EA6: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   11EAE: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP21.LMSL */

   11EB0: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   11EC0: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP21.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   11EC3: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   11ED3: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   11ED8: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   11EE8: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   11EE9: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   11EF9: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   11EFD: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   11F0D: 03 00                                            // ..

Index (LTRV, 0x03))

   11F0F: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP21.LTRV */
                            }

   11F17: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   11F1C: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   11F1E: A4 00                                            // ..

                    Case
   11F20: A1 43 04                                         // .C.

 (0x08)
                    {

   11F23: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   11F2C: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   11F34: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   11F37: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   11F3B: A4 01                                            // ..

                    Case
   11F3D: A1 26                                            // .&

 (0x09)
                    {

   11F3F: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   11F48: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   11F50: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   11F53: 95 69 0A 03                                      // .i..

                                Return (
   11F57: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   11F58: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   11F64: A5                                               // .

            Return (
   11F65: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   11F66: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   11F6A: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   11F72: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   11F78: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   11F82: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   11F8F: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   11F96: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   11FA2: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   11FAB: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   11FAD: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   11FB6: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   11FBD: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   11FC1: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP21.PMSX */

   11FCB: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   11FDB: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP21.PSPX */
            }
        }


   11FDE: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   11FE4: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP21.PPRW))
            {

   11FEB: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   11FFB: 50 32 31 50 50 52 57 00                          // P21PPRW.

                Return (PPRW ())
            }


   12003: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   12008: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP22)
    {

   12011: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 32  // .AI/._SB_PCI0RP2
   12021: 32                                               // 2

        Name (LTRZ, Zero)

   12022: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   12028: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   1202E: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x16)

   12034: 08 53 4C 4F 54 0A 16                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   1203B: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRM, LTRZ) /* \_SB_.PCI0.RP22.LTRZ */
                Store (PMLM, LMSL) /* \_SB_.PCI0.RP22.LMSL */
                Store (PNLM, LNSL) /* \_SB_.PCI0.RP22.LNSL */

   12042: A0 2D 50 52 45 53 70 4C 54 52 4D 4C 54 52 5A 70  // .-PRESpLTRMLTRZp
   12052: 50 4D 4C 4D 4C 4D 53 4C 70 50 4E 4C 4D 4C 4E 53  // PMLMLMSLpPNLMLNS
   12062: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   12063: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   12070: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   1207B: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   1208B: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   1209B: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   120AB: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   120BB: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   120CB: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   120DB: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   120EB: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   120FB: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   120FD: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   1210D: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   12114: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   1211C: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP22.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP22.L23R */
            Store (Zero, Local0)

   12128: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   12138: 60                                               // `

            While (L23R)
            {

   12139: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   1213F: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   12145: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP22.DPGE */
            Store (Zero, Local0)

   1214A: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   12155: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   1215D: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   12163: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   12168: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP22.LEDM */
        }


   1216A: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   12170: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   12178: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP22.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   12184: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   12193: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   12199: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   1219F: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP22.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP22.LDIS */

   121A4: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP22.LDIS */
        }


   121B2: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   121B8: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   121BF: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   121CB: A4 00                                            // ..

            Else
            {

   121CD: A1 03                                            // ..

                Return (One)
            }
        }


   121CF: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   121D1: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   121D9: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   121E4: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   121E7: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   121EB: A4 00                                            // ..

            ElseIf
   121ED: A1 0A                                            // ..

 (
   121EF: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   121F2: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   121F6: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   121FC: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   1220A: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   1220D: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   12211: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   12220: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   12224: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   12229: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   12230: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   12238: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   1223E: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   12243: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   12253: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   12257: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   12263: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   1226C: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   12271: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   12277: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   12281: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   1228C: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   12297: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   122A2: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   122AD: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP22._DSM.FUN0 */

   122B0: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   122BA: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP22._DSM.FUN6 */
                            }


   122C0: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   122C6: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   122CE: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP22._DSM.FUN8 */

   122D1: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP22._DSM.FUN9 */
                                }
                            }
                        }


   122DB: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP22._DSM.OPTS */
                    }

   122E1: A4 4F 50 54 53                                   // .OPTS

                    Case
   122E6: A1 4F 10                                         // .O.

 (0x05)
                    {

   122E9: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   122F2: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   122F7: A4 01                                            // ..

                    Case
   122F9: A1 4C 0F                                         // .L.

 (0x06)
                    {

   122FC: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   12306: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   1230A: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   1230E: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   12315: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   1231F: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP22.LMSL */

   12325: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   12335: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP22.LNSL */
                                    }

   12338: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   12340: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP22.LMSL */

   12342: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   12352: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP22.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   12355: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   12365: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   1236A: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   1237A: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   1237B: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   1238B: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   1238F: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   1239F: 03 00                                            // ..

Index (LTRV, 0x03))

   123A1: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP22.LTRV */
                            }

   123A9: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   123AE: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   123B0: A4 00                                            // ..

                    Case
   123B2: A1 43 04                                         // .C.

 (0x08)
                    {

   123B5: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   123BE: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   123C6: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   123C9: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   123CD: A4 01                                            // ..

                    Case
   123CF: A1 26                                            // .&

 (0x09)
                    {

   123D1: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   123DA: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   123E2: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   123E5: 95 69 0A 03                                      // .i..

                                Return (
   123E9: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   123EA: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   123F6: A5                                               // .

            Return (
   123F7: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   123F8: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   123FC: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   12404: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   1240A: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   12414: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   12421: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   12428: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   12434: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   1243D: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   1243F: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   12448: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   1244F: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   12453: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP22.PMSX */

   1245D: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   1246D: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP22.PSPX */
            }
        }


   12470: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   12476: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP22.PPRW))
            {

   1247D: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   1248D: 50 32 32 50 50 52 57 00                          // P22PPRW.

                Return (PPRW ())
            }


   12495: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   1249A: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP23)
    {

   124A3: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 32  // .AI/._SB_PCI0RP2
   124B3: 33                                               // 3

        Name (LTRZ, Zero)

   124B4: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   124BA: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   124C0: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x17)

   124C6: 08 53 4C 4F 54 0A 17                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   124CD: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRN, LTRZ) /* \_SB_.PCI0.RP23.LTRZ */
                Store (PMLN, LMSL) /* \_SB_.PCI0.RP23.LMSL */
                Store (PNLN, LNSL) /* \_SB_.PCI0.RP23.LNSL */

   124D4: A0 2D 50 52 45 53 70 4C 54 52 4E 4C 54 52 5A 70  // .-PRESpLTRNLTRZp
   124E4: 50 4D 4C 4E 4C 4D 53 4C 70 50 4E 4C 4E 4C 4E 53  // PMLNLMSLpPNLNLNS
   124F4: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   124F5: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   12502: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   1250D: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   1251D: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   1252D: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   1253D: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   1254D: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   1255D: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   1256D: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   1257D: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   1258D: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   1258F: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   1259F: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   125A6: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   125AE: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP23.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP23.L23R */
            Store (Zero, Local0)

   125BA: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   125CA: 60                                               // `

            While (L23R)
            {

   125CB: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   125D1: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   125D7: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP23.DPGE */
            Store (Zero, Local0)

   125DC: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   125E7: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   125EF: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   125F5: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   125FA: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP23.LEDM */
        }


   125FC: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   12602: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   1260A: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP23.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   12616: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   12625: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   1262B: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   12631: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP23.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP23.LDIS */

   12636: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP23.LDIS */
        }


   12644: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   1264A: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   12651: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   1265D: A4 00                                            // ..

            Else
            {

   1265F: A1 03                                            // ..

                Return (One)
            }
        }


   12661: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   12663: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   1266B: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   12676: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   12679: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   1267D: A4 00                                            // ..

            ElseIf
   1267F: A1 0A                                            // ..

 (
   12681: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   12684: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   12688: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   1268E: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   1269C: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   1269F: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   126A3: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   126B2: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   126B6: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   126BB: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   126C2: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   126CA: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   126D0: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   126D5: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   126E5: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   126E9: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   126F5: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   126FE: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   12703: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   12709: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   12713: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   1271E: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   12729: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   12734: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   1273F: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP23._DSM.FUN0 */

   12742: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   1274C: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP23._DSM.FUN6 */
                            }


   12752: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   12758: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   12760: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP23._DSM.FUN8 */

   12763: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP23._DSM.FUN9 */
                                }
                            }
                        }


   1276D: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP23._DSM.OPTS */
                    }

   12773: A4 4F 50 54 53                                   // .OPTS

                    Case
   12778: A1 4F 10                                         // .O.

 (0x05)
                    {

   1277B: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   12784: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   12789: A4 01                                            // ..

                    Case
   1278B: A1 4C 0F                                         // .L.

 (0x06)
                    {

   1278E: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   12798: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   1279C: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   127A0: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   127A7: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   127B1: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP23.LMSL */

   127B7: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   127C7: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP23.LNSL */
                                    }

   127CA: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   127D2: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP23.LMSL */

   127D4: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   127E4: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP23.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   127E7: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   127F7: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   127FC: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   1280C: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   1280D: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   1281D: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   12821: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   12831: 03 00                                            // ..

Index (LTRV, 0x03))

   12833: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP23.LTRV */
                            }

   1283B: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   12840: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   12842: A4 00                                            // ..

                    Case
   12844: A1 43 04                                         // .C.

 (0x08)
                    {

   12847: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   12850: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   12858: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   1285B: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   1285F: A4 01                                            // ..

                    Case
   12861: A1 26                                            // .&

 (0x09)
                    {

   12863: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   1286C: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   12874: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   12877: 95 69 0A 03                                      // .i..

                                Return (
   1287B: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   1287C: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   12888: A5                                               // .

            Return (
   12889: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   1288A: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   1288E: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   12896: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   1289C: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   128A6: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   128B3: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   128BA: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   128C6: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   128CF: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   128D1: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   128DA: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   128E1: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   128E5: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP23.PMSX */

   128EF: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   128FF: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP23.PSPX */
            }
        }


   12902: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   12908: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP23.PPRW))
            {

   1290F: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   1291F: 50 32 33 50 50 52 57 00                          // P23PPRW.

                Return (PPRW ())
            }


   12927: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   1292C: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0.RP24)
    {

   12935: 10 41 49 2F 03 5F 53 42 5F 50 43 49 30 52 50 32  // .AI/._SB_PCI0RP2
   12945: 34                                               // 4

        Name (LTRZ, Zero)

   12946: 08 4C 54 52 5A 00                                // .LTRZ.

        Name (LMSL, Zero)

   1294C: 08 4C 4D 53 4C 00                                // .LMSL.

        Name (LNSL, Zero)

   12952: 08 4C 4E 53 4C 00                                // .LNSL.

        Name (SLOT, 0x18)

   12958: 08 53 4C 4F 54 0A 18                             // .SLOT..

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {

   1295F: 14 34 5F 49 4E 49 00                             // .4_INI.

            If (PRES ())
            {
                Store (LTRO, LTRZ) /* \_SB_.PCI0.RP24.LTRZ */
                Store (PMLO, LMSL) /* \_SB_.PCI0.RP24.LMSL */
                Store (PNLO, LNSL) /* \_SB_.PCI0.RP24.LNSL */

   12966: A0 2D 50 52 45 53 70 4C 54 52 4F 4C 54 52 5A 70  // .-PRESpLTROLTRZp
   12976: 50 4D 4C 4F 4C 4D 53 4C 70 50 4E 4C 4F 4C 4E 53  // PMLOLMSLpPNLOLNS
   12986: 4C                                               // L

                If (CondRefOf (PINI))
                {
                    PINI ()
                }
            }
        }


   12987: A0 0C 5B 12 50 49 4E 49 00 50 49 4E 49           // ..[.PINI.PINI

        OperationRegion (PXCS, PCI_Config, Zero, 0x0480)

   12994: 5B 80 50 58 43 53 02 00 0B 80 04                 // [.PXCS.....

        Field (PXCS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x50), 
            L0SE,   1, 
                ,   3, 
            LDIS,   1, 
            Offset (0x51), 
            Offset (0x52), 
                ,   13, 
            LASX,   1, 
            Offset (0x5A), 
            ABPX,   1, 
                ,   2, 
            PDCX,   1, 
                ,   2, 
            PDSX,   1, 
            Offset (0x5B), 
            Offset (0x60), 
            Offset (0x62), 
            PSPX,   1, 
            Offset (0xA4), 
            D3HT,   2, 
            Offset (0xD8), 
                ,   30, 
            HPEX,   1, 
            PMEX,   1, 
            Offset (0xE2), 
                ,   2, 
            L23E,   1, 
            L23R,   1, 
            Offset (0x324), 
                ,   3, 
            LEDM,   1, 
            Offset (0x420), 
                ,   30, 
            DPGE,   1
        }


   1299F: 5B 81 40 08 50 58 43 53 00 56 44 49 44 20 00 40  // [.@.PXCS.VDID .@
   129AF: 26 4C 30 53 45 01 00 03 4C 44 49 53 01 00 03 00  // &L0SE...LDIS....
   129BF: 08 00 0D 4C 41 53 58 01 00 32 41 42 50 58 01 00  // ...LASX..2ABPX..
   129CF: 02 50 44 43 58 01 00 02 50 44 53 58 01 00 01 00  // .PDCX...PDSX....
   129DF: 28 00 10 50 53 50 58 01 00 4F 20 44 33 48 54 02  // (..PSPX..O D3HT.
   129EF: 00 4E 19 00 1E 48 50 45 58 01 50 4D 45 58 01 00  // .N...HPEX.PMEX..
   129FF: 30 00 02 4C 32 33 45 01 4C 32 33 52 01 00 8C 20  // 0..L23E.L23R... 
   12A0F: 01 00 03 4C 45 44 4D 01 00 4C 7D 00 1E 44 50 47  // ...LEDM..L}..DPG
   12A1F: 45 01                                            // E.

        Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
        {
            Offset (0xDC), 
                ,   30, 
            HPSX,   1, 
            PMSX,   1
        }


   12A21: 5B 81 15 50 58 43 53 40 00 40 6E 00 1E 48 50 53  // [..PXCS@.@n..HPS
   12A31: 58 01 50 4D 53 58 01                             // X.PMSX.

        Method (L23D, 0, Serialized)
        {

   12A38: 14 4B 05 4C 32 33 44 08                          // .K.L23D.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   12A40: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (Zero, DPGE) /* \_SB_.PCI0.RP24.DPGE */
            Store (One, L23R) /* \_SB_.PCI0.RP24.L23R */
            Store (Zero, Local0)

   12A4C: A4 00 70 00 44 50 47 45 70 01 4C 32 33 52 70 00  // ..p.DPGEp.L23Rp.
   12A5C: 60                                               // `

            While (L23R)
            {

   12A5D: A2 12 4C 32 33 52                                // ..L23R

                If (LGreater (Local0, 0x04))
                {

   12A63: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   12A69: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, DPGE) /* \_SB_.PCI0.RP24.DPGE */
            Store (Zero, Local0)

   12A6E: 75 60 70 01 44 50 47 45 70 00 60                 // u`p.DPGEp.`

            While (LEqual (LASX, Zero))
            {

   12A79: A2 14 93 4C 41 53 58 00                          // ...LASX.

                If (LGreater (Local0, 0x08))
                {

   12A81: A0 06 94 60 0A 08                                // ...`..

                    Break
                }

                Sleep (0x10)

   12A87: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }


   12A8C: 75 60                                            // u`

            Store (Zero, LEDM) /* \_SB_.PCI0.RP24.LEDM */
        }


   12A8E: 70 00 4C 45 44 4D                                // p.LEDM

        Method (DL23, 0, Serialized)
        {

   12A94: 14 47 04 44 4C 32 33 08                          // .G.DL23.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   12A9C: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

            Store (One, L23E) /* \_SB_.PCI0.RP24.L23E */
            Sleep (0x10)
            Store (Zero, Local0)

   12AA8: A4 00 70 01 4C 32 33 45 5B 22 0A 10 70 00 60     // ..p.L23E["..p.`

            While (L23E)
            {

   12AB7: A2 12 4C 32 33 45                                // ..L23E

                If (LGreater (Local0, 0x04))
                {

   12ABD: A0 06 94 60 0A 04                                // ...`..

                    Break
                }

                Sleep (0x10)

   12AC3: A5 5B 22 0A 10                                   // .["..

                Increment (Local0)
            }

            Store (One, LEDM) /* \_SB_.PCI0.RP24.LEDM */
            Store (One, LDIS) /* \_SB_.PCI0.RP24.LDIS */

   12AC8: 75 60 70 01 4C 45 44 4D 70 01 4C 44 49 53        // u`p.LEDMp.LDIS

            Store (Zero, LDIS) /* \_SB_.PCI0.RP24.LDIS */
        }


   12AD6: 70 00 4C 44 49 53                                // p.LDIS

        Method (PRES, 0, NotSerialized)
        {

   12ADC: 14 18 50 52 45 53 00                             // ..PRES.

            If (LEqual (VDID, 0xFFFFFFFF))
            {

   12AE3: A0 0D 93 56 44 49 44 0C FF FF FF FF              // ...VDID.....

                Return (Zero)
            }

   12AEF: A4 00                                            // ..

            Else
            {

   12AF1: A1 03                                            // ..

                Return (One)
            }
        }


   12AF3: A4 01                                            // ..

        Method (SPCO, 2, Serialized)
        {

   12AF5: 14 42 05 53 50 43 4F 0A                          // .B.SPCO.

            If (LEqual (PCHS, PCHH))
            {

   12AFD: A0 13 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                If (
   12B08: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x10))
                {

   12B0B: 95 68 0A 10                                      // .h..

                    Return (Zero)
                }
            }

   12B0F: A4 00                                            // ..

            ElseIf
   12B11: A1 0A                                            // ..

 (
   12B13: A0 08 92                                         // ...

LGreaterEqual (Arg0, 0x06))
            {

   12B16: 95 68 0A 06                                      // .h..

                Return (Zero)
            }

            ShiftLeft (One, Arg0, Local0)

   12B1A: A4 00 79 01 68 60                                // ..y.h`

            If (LEqual (Arg1, One))
            {
                PCRA (0xDC, 0x100C, 
   12B20: A0 14 93 69 01 50 43 52 41 0A DC 0B 0C 10        // ...i.PCRA.....

Not (Local0))

   12B2E: 80 60 00                                         // .`.

                Sleep (0x10)
            }


   12B31: 5B 22 0A 10                                      // ["..

            If (LEqual (Arg1, Zero))
            {
                PCRO (0xDC, 0x100C, Local0)

   12B35: A0 12 93 69 00 50 43 52 4F 0A DC 0B 0C 10 60     // ...i.PCRO.....`

                Sleep (0x10)
            }
        }


   12B44: 5B 22 0A 10                                      // ["..

        Name (LTRV, 
   12B48: 08 4C 54 52 56                                   // .LTRV

Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })

   12B4D: 12 06 04 00 00 00 00                             // .......

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

   12B54: 14 4B 1C 5F 44 53 4D 0C                          // .K._DSM.


   12B5C: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
   12B62: A0 48 1B 93 68                                   // .H..h

ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {

   12B67: 11 13 0A 10 D0 37 C9 E5 53 35 7A 4D 91 17 EA 4D  // .....7..S5zM...M
   12B77: 19 C3 43 4D                                      // ..CM

                Switch (ToInteger (Arg2))
                {

   12B7B: A2 4F 19 01 70 99 6A 00 5F 54 5F 30              // .O..p.j._T_0

                    Case (Zero)
                    {

   12B87: A0 42 08 93 5F 54 5F 30 00                       // .B.._T_0.

                        Name (OPTS, 
   12B90: 08 4F 50 54 53                                   // .OPTS

Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        })

   12B95: 11 05 0A 02 00 00                                // ......

                        CreateBitField (OPTS, Zero, FUN0)

   12B9B: 8D 4F 50 54 53 00 46 55 4E 30                    // .OPTS.FUN0

                        CreateBitField (OPTS, 0x04, FUN4)

   12BA5: 8D 4F 50 54 53 0A 04 46 55 4E 34                 // .OPTS..FUN4

                        CreateBitField (OPTS, 0x06, FUN6)

   12BB0: 8D 4F 50 54 53 0A 06 46 55 4E 36                 // .OPTS..FUN6

                        CreateBitField (OPTS, 0x08, FUN8)

   12BBB: 8D 4F 50 54 53 0A 08 46 55 4E 38                 // .OPTS..FUN8

                        CreateBitField (OPTS, 0x09, FUN9)

   12BC6: 8D 4F 50 54 53 0A 09 46 55 4E 39                 // .OPTS..FUN9

                        If (
   12BD1: A0 33 92                                         // .3.

LGreaterEqual (Arg1, 0x02))
                        {
                            Store (One, FUN0) /* \_SB_.PCI0.RP24._DSM.FUN0 */

   12BD4: 95 69 0A 02 70 01 46 55 4E 30                    // .i..p.FUN0

                            If (LTRZ)
                            {

   12BDE: A0 0B 4C 54 52 5A                                // ..LTRZ

                                Store (One, FUN6) /* \_SB_.PCI0.RP24._DSM.FUN6 */
                            }


   12BE4: 70 01 46 55 4E 36                                // p.FUN6

                            If (LEqual (ECR1, One))
                            {

   12BEA: A0 1A 93 45 43 52 31 01                          // ...ECR1.

                                If (
   12BF2: A0 12 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                                {
                                    Store (One, FUN8) /* \_SB_.PCI0.RP24._DSM.FUN8 */

   12BF5: 95 69 0A 03 70 01 46 55 4E 38                    // .i..p.FUN8

                                    Store (One, FUN9) /* \_SB_.PCI0.RP24._DSM.FUN9 */
                                }
                            }
                        }


   12BFF: 70 01 46 55 4E 39                                // p.FUN9

                        Return (OPTS) /* \_SB_.PCI0.RP24._DSM.OPTS */
                    }

   12C05: A4 4F 50 54 53                                   // .OPTS

                    Case
   12C0A: A1 4F 10                                         // .O.

 (0x05)
                    {

   12C0D: A0 0F 93 5F 54 5F 30 0A 05                       // ..._T_0..

                        If (LEqual (Arg1, One))
                        {

   12C16: A0 06 93 69 01                                   // ...i.

                            Return (One)
                        }
                    }

   12C1B: A4 01                                            // ..

                    Case
   12C1D: A1 4C 0F                                         // .L.

 (0x06)
                    {

   12C20: A0 45 0B 93 5F 54 5F 30 0A 06                    // .E.._T_0..

                        If (
   12C2A: A0 4B 0A 92                                      // .K..

LGreaterEqual (Arg1, 0x02))
                        {

   12C2E: 95 69 0A 02                                      // .i..

                            If (LTRZ)
                            {

   12C32: A0 4F 09 4C 54 52 5A                             // .O.LTRZ

                                If (LOr (LEqual (LMSL, Zero), 
   12C39: A0 47 04 91 93 4C 4D 53 4C 00                    // .G...LMSL.

LEqual (LNSL, Zero)))
                                {

   12C43: 93 4C 4E 53 4C 00                                // .LNSL.

                                    If (LEqual (PCHS, PCHH))
                                    {
                                        Store (0x0846, LMSL) /* \_SB_.PCI0.RP24.LMSL */

   12C49: A0 1A 93 50 43 48 53 50 43 48 48 70 0B 46 08 4C  // ...PCHSPCHHp.F.L
   12C59: 4D 53 4C                                         // MSL

                                        Store (0x0846, LNSL) /* \_SB_.PCI0.RP24.LNSL */
                                    }

   12C5C: 70 0B 46 08 4C 4E 53 4C                          // p.F.LNSL

                                    ElseIf
   12C64: A1 1C                                            // ..

 (LEqual (PCHS, PCHL))
                                    {
                                        Store (0x1003, LMSL) /* \_SB_.PCI0.RP24.LMSL */

   12C66: A0 1A 93 50 43 48 53 50 43 48 4C 70 0B 03 10 4C  // ...PCHSPCHLp...L
   12C76: 4D 53 4C                                         // MSL

                                        Store (0x1003, LNSL) /* \_SB_.PCI0.RP24.LNSL */
                                    }
                                }

                                Store (And (ShiftRight (LMSL, 0x0A), 0x07), 
   12C79: 70 0B 03 10 4C 4E 53 4C 70 7B 7A 4C 4D 53 4C 0A  // p...LNSLp{zLMSL.
   12C89: 0A 00 0A 07 00                                   // .....

Index (LTRV, Zero))
                                Store (And (LMSL, 0x03FF), 
   12C8E: 88 4C 54 52 56 00 00 70 7B 4C 4D 53 4C 0B FF 03  // .LTRV..p{LMSL...
   12C9E: 00                                               // .

Index (LTRV, One))
                                Store (And (ShiftRight (LNSL, 0x0A), 0x07), 
   12C9F: 88 4C 54 52 56 01 00 70 7B 7A 4C 4E 53 4C 0A 0A  // .LTRV..p{zLNSL..
   12CAF: 00 0A 07 00                                      // ....

Index (LTRV, 0x02))
                                Store (And (LNSL, 0x03FF), 
   12CB3: 88 4C 54 52 56 0A 02 00 70 7B 4C 4E 53 4C 0B FF  // .LTRV...p{LNSL..
   12CC3: 03 00                                            // ..

Index (LTRV, 0x03))

   12CC5: 88 4C 54 52 56 0A 03 00                          // .LTRV...

                                Return (LTRV) /* \_SB_.PCI0.RP24.LTRV */
                            }

   12CCD: A4 4C 54 52 56                                   // .LTRV

                            Else
                            {

   12CD2: A1 03                                            // ..

                                Return (Zero)
                            }
                        }
                    }

   12CD4: A4 00                                            // ..

                    Case
   12CD6: A1 43 04                                         // .C.

 (0x08)
                    {

   12CD9: A0 19 93 5F 54 5F 30 0A 08                       // ..._T_0..

                        If (LEqual (ECR1, One))
                        {

   12CE2: A0 10 93 45 43 52 31 01                          // ...ECR1.

                            If (
   12CEA: A0 08 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   12CED: 95 69 0A 03                                      // .i..

                                Return (One)
                            }
                        }
                    }

   12CF1: A4 01                                            // ..

                    Case
   12CF3: A1 26                                            // .&

 (0x09)
                    {

   12CF5: A0 24 93 5F 54 5F 30 0A 09                       // .$._T_0..

                        If (LEqual (ECR1, One))
                        {

   12CFE: A0 1B 93 45 43 52 31 01                          // ...ECR1.

                            If (
   12D06: A0 13 92                                         // ...

LGreaterEqual (Arg1, 0x03))
                            {

   12D09: 95 69 0A 03                                      // .i..

                                Return (
   12D0D: A4                                               // .

Package (0x05)
                                {
                                    0xC350, 
                                    Ones, 
                                    Ones, 
                                    0xC350, 
                                    Ones
                                })
                            }
                        }
                    }


   12D0E: 12 0B 05 0B 50 C3 FF FF 0B 50 C3 FF              // ....P....P..

                }
            }


   12D1A: A5                                               // .

            Return (
   12D1B: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }


   12D1C: 11 03 01 00                                      // ....

        Device (PXSX)
        {

   12D20: 5B 82 4A 04 50 58 53 58                          // [.J.PXSX

            Name (_ADR, Zero)  // _ADR: Address

   12D28: 08 5F 41 44 52 00                                // ._ADR.

            OperationRegion (PSCS, PCI_Config, Zero, 0x10)

   12D2E: 5B 80 50 53 43 53 02 00 0A 10                    // [.PSCS....

            Field (PSCS, AnyAcc, NoLock, Preserve)
            {
                VDDD,   32
            }


   12D38: 5B 81 0B 50 53 43 53 00 56 44 44 44 20           // [..PSCS.VDDD 

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {

   12D45: 14 26 5F 50 52 57 00                             // .&_PRW.

                If (LEqual (VDDD, 0x10801B21))
                {

   12D4C: A0 14 93 56 44 44 44 0C 21 1B 80 10              // ...VDDD.!...

                    Return (GPRW (0x6B, 0x04))
                }

   12D58: A4 47 50 52 57 0A 6B 0A 04                       // .GPRW.k..

                Else
                {

   12D61: A1 0A                                            // ..

                    Return (GPRW (0x69, 0x04))
                }
            }
        }


   12D63: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

        Method (HPME, 0, Serialized)
        {

   12D6C: 14 2D 48 50 4D 45 08                             // .-HPME.

            If (LAnd (
   12D73: A0 26 90 92                                      // .&..

LNotEqual (VDID, 0xFFFFFFFF), 
   12D77: 93 56 44 49 44 0C FF FF FF FF                    // .VDID.....

LEqual (PMSX, One)))
            {
                Notify (PXSX, 0x02) // Device Wake
                Store (One, PMSX) /* \_SB_.PCI0.RP24.PMSX */

   12D81: 93 50 4D 53 58 01 86 50 58 53 58 0A 02 70 01 50  // .PMSX..PXSX..p.P
   12D91: 4D 53 58                                         // MSX

                Store (One, PSPX) /* \_SB_.PCI0.RP24.PSPX */
            }
        }


   12D94: 70 01 50 53 50 58                                // p.PSPX

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {

   12D9A: 14 2C 5F 50 52 57 00                             // .,_PRW.

            If (CondRefOf (\_SB.PCI0.RP24.PPRW))
            {

   12DA1: A0 1C 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   12DB1: 50 32 34 50 50 52 57 00                          // P24PPRW.

                Return (PPRW ())
            }


   12DB9: A4 50 50 52 57                                   // .PPRW

            Return (GPRW (0x69, 0x04))
        }
    }


   12DBE: A4 47 50 52 57 0A 69 0A 04                       // .GPRW.i..

    Scope (_SB.PCI0)
    {

   12DC7: 10 87 A5 02 2E 5F 53 42 5F 50 43 49 30           // ....._SB_PCI0

        Device (SAT0)
        {

   12DD4: 5B 82 89 8B 02 53 41 54 30                       // [....SAT0

            Name (_ADR, 0x00170000)  // _ADR: Address

   12DDD: 08 5F 41 44 52 0C 00 00 17 00                    // ._ADR.....

            Name (_DSD, 
   12DE7: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   12DEC: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   12DEF: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   12DFF: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   12E03: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   12E06: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   12E16: 62 6C 65 00 01                                   // ble..

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {

   12E1B: 14 09 5F 53 30 57 00                             // .._S0W.

                Return (0x03)
            }


   12E22: A4 0A 03                                         // ...

            Device (PRT0)
            {

   12E25: 5B 82 23 50 52 54 30                             // [.#PRT0

                Name (_ADR, 0xFFFF)  // _ADR: Address

   12E2C: 08 5F 41 44 52 0B FF FF                          // ._ADR...

                Method (PRES, 0, NotSerialized)
                {

   12E34: 14 15 50 52 45 53 00                             // ..PRES.

                    If (And (SPPR, One))
                    {

   12E3B: A0 0A 7B 53 50 50 52 01 00                       // ..{SPPR..

                        Return (One)
                    }

   12E44: A4 01                                            // ..

                    Else
                    {

   12E46: A1 03                                            // ..

                        Return (Zero)
                    }
                }
            }


   12E48: A4 00                                            // ..

            Device (PRT1)
            {

   12E4A: 5B 82 26 50 52 54 31                             // [.&PRT1

                Name (_ADR, 0x0001FFFF)  // _ADR: Address

   12E51: 08 5F 41 44 52 0C FF FF 01 00                    // ._ADR.....

                Method (PRES, 0, NotSerialized)
                {

   12E5B: 14 16 50 52 45 53 00                             // ..PRES.

                    If (And (SPPR, 0x02))
                    {

   12E62: A0 0B 7B 53 50 50 52 0A 02 00                    // ..{SPPR...

                        Return (One)
                    }

   12E6C: A4 01                                            // ..

                    Else
                    {

   12E6E: A1 03                                            // ..

                        Return (Zero)
                    }
                }
            }


   12E70: A4 00                                            // ..

            Device (PRT2)
            {

   12E72: 5B 82 26 50 52 54 32                             // [.&PRT2

                Name (_ADR, 0x0002FFFF)  // _ADR: Address

   12E79: 08 5F 41 44 52 0C FF FF 02 00                    // ._ADR.....

                Method (PRES, 0, NotSerialized)
                {

   12E83: 14 16 50 52 45 53 00                             // ..PRES.

                    If (And (SPPR, 0x04))
                    {

   12E8A: A0 0B 7B 53 50 50 52 0A 04 00                    // ..{SPPR...

                        Return (One)
                    }

   12E94: A4 01                                            // ..

                    Else
                    {

   12E96: A1 03                                            // ..

                        Return (Zero)
                    }
                }
            }


   12E98: A4 00                                            // ..

            Device (PRT3)
            {

   12E9A: 5B 82 26 50 52 54 33                             // [.&PRT3

                Name (_ADR, 0x0003FFFF)  // _ADR: Address

   12EA1: 08 5F 41 44 52 0C FF FF 03 00                    // ._ADR.....

                Method (PRES, 0, NotSerialized)
                {

   12EAB: 14 16 50 52 45 53 00                             // ..PRES.

                    If (And (SPPR, 0x08))
                    {

   12EB2: A0 0B 7B 53 50 50 52 0A 08 00                    // ..{SPPR...

                        Return (One)
                    }

   12EBC: A4 01                                            // ..

                    Else
                    {

   12EBE: A1 03                                            // ..

                        Return (Zero)
                    }
                }
            }


   12EC0: A4 00                                            // ..

            Device (PRT4)
            {

   12EC2: 5B 82 26 50 52 54 34                             // [.&PRT4

                Name (_ADR, 0x0004FFFF)  // _ADR: Address

   12EC9: 08 5F 41 44 52 0C FF FF 04 00                    // ._ADR.....

                Method (PRES, 0, NotSerialized)
                {

   12ED3: 14 16 50 52 45 53 00                             // ..PRES.

                    If (And (SPPR, 0x10))
                    {

   12EDA: A0 0B 7B 53 50 50 52 0A 10 00                    // ..{SPPR...

                        Return (One)
                    }

   12EE4: A4 01                                            // ..

                    Else
                    {

   12EE6: A1 03                                            // ..

                        Return (Zero)
                    }
                }
            }


   12EE8: A4 00                                            // ..

            Device (PRT5)
            {

   12EEA: 5B 82 26 50 52 54 35                             // [.&PRT5

                Name (_ADR, 0x0005FFFF)  // _ADR: Address

   12EF1: 08 5F 41 44 52 0C FF FF 05 00                    // ._ADR.....

                Method (PRES, 0, NotSerialized)
                {

   12EFB: 14 16 50 52 45 53 00                             // ..PRES.

                    If (And (SPPR, 0x20))
                    {

   12F02: A0 0B 7B 53 50 50 52 0A 20 00                    // ..{SPPR. .

                        Return (One)
                    }

   12F0C: A4 01                                            // ..

                    Else
                    {

   12F0E: A1 03                                            // ..

                        Return (Zero)
                    }
                }
            }


   12F10: A4 00                                            // ..

            Device (NVM1)
            {

   12F12: 5B 82 41 7E 4E 56 4D 31                          // [.A~NVM1

                Name (_ADR, 0x00C1FFFF)  // _ADR: Address

   12F1A: 08 5F 41 44 52 0C FF FF C1 00                    // ._ADR.....

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (NIT1, NITV) /* \_SB_.PCI0.SAT0.NVM1.NITV */
                    Store (NPM1, NPMV) /* \_SB_.PCI0.SAT0.NVM1.NPMV */
                    Store (NPC1, NPCV) /* \_SB_.PCI0.SAT0.NVM1.NPCV */
                    Store (NL11, NL1V) /* \_SB_.PCI0.SAT0.NVM1.NL1V */
                    Store (ND21, ND2V) /* \_SB_.PCI0.SAT0.NVM1.ND2V */
                    Store (ND11, ND1V) /* \_SB_.PCI0.SAT0.NVM1.ND1V */
                    Store (NLR1, NLRV) /* \_SB_.PCI0.SAT0.NVM1.NLRV */
                    Store (NLD1, NLDV) /* \_SB_.PCI0.SAT0.NVM1.NLDV */
                    Store (NEA1, NEAV) /* \_SB_.PCI0.SAT0.NVM1.NEAV */
                    Store (NEB1, NEBV) /* \_SB_.PCI0.SAT0.NVM1.NEBV */
                    Store (NEC1, NECV) /* \_SB_.PCI0.SAT0.NVM1.NECV */
                    Store (NRA1, NRAV) /* \_SB_.PCI0.SAT0.NVM1.NRAV */
                    Store (NMB1, NMBV) /* \_SB_.PCI0.SAT0.NVM1.NMBV */
                    Store (NMV1, NMVV) /* \_SB_.PCI0.SAT0.NVM1.NMVV */
                    Store (NPB1, NPBV) /* \_SB_.PCI0.SAT0.NVM1.NPBV */
                    Store (NPV1, NPVV) /* \_SB_.PCI0.SAT0.NVM1.NPVV */
                    Store (NRP1, NRPN) /* \_SB_.PCI0.SAT0.NVM1.NRPN */

   12F24: 14 46 0A 5F 49 4E 49 00 70 4E 49 54 31 4E 49 54  // .F._INI.pNIT1NIT
   12F34: 56 70 4E 50 4D 31 4E 50 4D 56 70 4E 50 43 31 4E  // VpNPM1NPMVpNPC1N
   12F44: 50 43 56 70 4E 4C 31 31 4E 4C 31 56 70 4E 44 32  // PCVpNL11NL1VpND2
   12F54: 31 4E 44 32 56 70 4E 44 31 31 4E 44 31 56 70 4E  // 1ND2VpND11ND1VpN
   12F64: 4C 52 31 4E 4C 52 56 70 4E 4C 44 31 4E 4C 44 56  // LR1NLRVpNLD1NLDV
   12F74: 70 4E 45 41 31 4E 45 41 56 70 4E 45 42 31 4E 45  // pNEA1NEAVpNEB1NE
   12F84: 42 56 70 4E 45 43 31 4E 45 43 56 70 4E 52 41 31  // BVpNEC1NECVpNRA1
   12F94: 4E 52 41 56 70 4E 4D 42 31 4E 4D 42 56 70 4E 4D  // NRAVpNMB1NMBVpNM
   12FA4: 56 31 4E 4D 56 56 70 4E 50 42 31 4E 50 42 56 70  // V1NMVVpNPB1NPBVp
   12FB4: 4E 50 56 31 4E 50 56 56 70 4E 52 50 31 4E 52 50  // NPV1NPVVpNRP1NRP
   12FC4: 4E                                               // N

                    Store (Zero, NCRN) /* \_SB_.PCI0.SAT0.NVM1.NCRN */
                }


   12FC5: 70 00 4E 43 52 4E                                // p.NCRN

                Name (PRBI, Zero)

   12FCB: 08 50 52 42 49 00                                // .PRBI.

                Name (PRBD, Zero)

   12FD1: 08 50 52 42 44 00                                // .PRBD.

                Name (PCMD, Zero)

   12FD7: 08 50 43 4D 44 00                                // .PCMD.

                Name (NCRN, Zero)

   12FDD: 08 4E 43 52 4E 00                                // .NCRN.

                Name (NITV, Zero)

   12FE3: 08 4E 49 54 56 00                                // .NITV.

                Name (NPMV, Zero)

   12FE9: 08 4E 50 4D 56 00                                // .NPMV.

                Name (NPCV, Zero)

   12FEF: 08 4E 50 43 56 00                                // .NPCV.

                Name (NL1V, Zero)

   12FF5: 08 4E 4C 31 56 00                                // .NL1V.

                Name (ND2V, Zero)

   12FFB: 08 4E 44 32 56 00                                // .ND2V.

                Name (ND1V, Zero)

   13001: 08 4E 44 31 56 00                                // .ND1V.

                Name (NLRV, Zero)

   13007: 08 4E 4C 52 56 00                                // .NLRV.

                Name (NLDV, Zero)

   1300D: 08 4E 4C 44 56 00                                // .NLDV.

                Name (NEAV, Zero)

   13013: 08 4E 45 41 56 00                                // .NEAV.

                Name (NEBV, Zero)

   13019: 08 4E 45 42 56 00                                // .NEBV.

                Name (NECV, Zero)

   1301F: 08 4E 45 43 56 00                                // .NECV.

                Name (NRAV, Zero)

   13025: 08 4E 52 41 56 00                                // .NRAV.

                Name (NMBV, Zero)

   1302B: 08 4E 4D 42 56 00                                // .NMBV.

                Name (NMVV, Zero)

   13031: 08 4E 4D 56 56 00                                // .NMVV.

                Name (NPBV, Zero)

   13037: 08 4E 50 42 56 00                                // .NPBV.

                Name (NPVV, Zero)

   1303D: 08 4E 50 56 56 00                                // .NPVV.

                Name (NRPN, Zero)

   13043: 08 4E 52 50 4E 00                                // .NRPN.

                Name (MXIE, Zero)

   13049: 08 4D 58 49 45 00                                // .MXIE.

                Name (ID3C, Zero)

   1304F: 08 49 44 33 43 00                                // .ID3C.

                Name (ID3H, Zero)

   13055: 08 49 44 33 48 00                                // .ID3H.

                Name (CSAV, Zero)

   1305B: 08 43 53 41 56 00                                // .CSAV.

                Method (_PS3, 0, Serialized)  // _PS3: Power State 3
                {
                    ADBG (
   13061: 14 26 5F 50 53 33 08 41 44 42 47                 // .&_PS3.ADBG

Concatenate ("_PS3r:", ToHexString (_ADR)))

   1306C: 73 0D 5F 50 53 33 72 3A 00 98 5F 41 44 52 00 00  // s._PS3r:.._ADR..

                    If (IR3D ())
                    {

   1307C: A0 07 49 52 33 44                                // ..IR3D

                        Return (Zero)
                    }

                    NVD3 ()
                }


   13082: A4 00 4E 56 44 33                                // ..NVD3

                Method (_PS0, 0, Serialized)  // _PS0: Power State 0
                {
                    ADBG (
   13088: 14 26 5F 50 53 30 08 41 44 42 47                 // .&_PS0.ADBG

Concatenate ("_PS0r:", ToHexString (_ADR)))

   13093: 73 0D 5F 50 53 30 72 3A 00 98 5F 41 44 52 00 00  // s._PS0r:.._ADR..

                    If (IR3D ())
                    {

   130A3: A0 07 49 52 33 44                                // ..IR3D

                        Return (Zero)
                    }

                    NVD0 ()
                }


   130A9: A4 00 4E 56 44 30                                // ..NVD0

                Method (RL23, 0, NotSerialized)
                {
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x04, One)
                    Sleep (0x10)
                    Store (Zero, Local0)

   130AF: 14 43 05 52 4C 32 33 00 52 44 43 41 4E 43 52 4E  // .C.RL23.RDCANCRN
   130BF: 0A E2 0C FF FF FF FF 0A 04 01 5B 22 0A 10 70 00  // ..........["..p.
   130CF: 60                                               // `

                    While (And (RDCA (NCRN, 0xE2, Zero, Zero, Zero), 0x04))
                    {

   130D0: A2 1F 7B 52 44 43 41 4E 43 52 4E 0A E2 00 00 00  // ..{RDCANCRN.....
   130E0: 0A 04 00                                         // ...

                        If (LGreater (Local0, 0x04))
                        {

   130E3: A0 06 94 60 0A 04                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   130E9: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFFF, 0x08, One)
                }


   130EE: 75 60 52 44 43 41 4E 43 52 4E 0B 24 03 0C FF FF  // u`RDCANCRN.$....
   130FE: FF FF 0A 08 01                                   // .....

                Method (RLA, 0, NotSerialized)
                {
                    RDCA (NCRN, 0x0420, 0xBFFFFFFF, Zero, One)
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x08, One)
                    Sleep (0x10)
                    Store (Zero, Local0)

   13103: 14 40 0A 52 4C 41 5F 00 52 44 43 41 4E 43 52 4E  // .@.RLA_.RDCANCRN
   13113: 0B 20 04 0C FF FF FF BF 00 01 52 44 43 41 4E 43  // . ........RDCANC
   13123: 52 4E 0A E2 0C FF FF FF FF 0A 08 01 5B 22 0A 10  // RN..........["..
   13133: 70 00 60                                         // p.`

                    While (And (RDCA (NCRN, 0xE2, Zero, Zero, Zero), 0x08))
                    {

   13136: A2 1F 7B 52 44 43 41 4E 43 52 4E 0A E2 00 00 00  // ..{RDCANCRN.....
   13146: 0A 08 00                                         // ...

                        If (LGreater (Local0, 0x04))
                        {

   13149: A0 06 94 60 0A 04                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   1314F: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0420, 0xFFFFFFFF, 0x40000000, One)
                    Store (Zero, Local0)

   13154: 75 60 52 44 43 41 4E 43 52 4E 0B 20 04 0C FF FF  // u`RDCANCRN. ....
   13164: FF FF 0C 00 00 00 40 01 70 00 60                 // ......@.p.`

                    While (LEqual (And (RDCA (NCRN, 0x52, Zero, Zero, Zero), 0x2000), Zero))
                    {

   1316F: A2 22 93 7B 52 44 43 41 4E 43 52 4E 0A 52 00 00  // .".{RDCANCRN.R..
   1317F: 00 0B 00 20 00 00                                // ... ..

                        If (LGreater (Local0, 0x08))
                        {

   13185: A0 06 94 60 0A 08                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   1318B: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFF7, Zero, One)
                }


   13190: 75 60 52 44 43 41 4E 43 52 4E 0B 24 03 0C F7 FF  // u`RDCANCRN.$....
   131A0: FF FF 00 01                                      // ....

                Method (RPON, 0, Serialized)
                {
                    ADBG (
   131A4: 14 43 06 52 50 4F 4E 08 41 44 42 47              // .C.RPON.ADBG

Concatenate ("RPONs: ", ToHexString (_ADR)))

   131B0: 73 0D 52 50 4F 4E 73 3A 20 00 98 5F 41 44 52 00  // s.RPONs: .._ADR.
   131C0: 00                                               // .

                    If (LEqual (ID3C, Zero))
                    {
                        ADBG ("RPON: no D3C")

   131C1: A0 1B 93 49 44 33 43 00 41 44 42 47 0D 52 50 4F  // ...ID3C.ADBG.RPO
   131D1: 4E 3A 20 6E 6F 20 44 33 43 00                    // N: no D3C.

                        Return (Zero)
                    }

                    RSON (NRPN)
                    RLA ()
                    Sleep (0x64)
                    Store (Zero, ID3C) /* \_SB_.PCI0.SAT0.NVM1.ID3C */
                    ADBG (
   131DB: A4 00 52 53 4F 4E 4E 52 50 4E 52 4C 41 5F 5B 22  // ..RSONNRPNRLA_["
   131EB: 0A 64 70 00 49 44 33 43 41 44 42 47              // .dp.ID3CADBG

Concatenate ("RPONe: ", ToHexString (_ADR)))
                }


   131F7: 73 0D 52 50 4F 4E 65 3A 20 00 98 5F 41 44 52 00  // s.RPONe: .._ADR.
   13207: 00                                               // .

                Method (RPOF, 0, Serialized)
                {
                    ADBG (
   13208: 14 48 05 52 50 4F 46 08 41 44 42 47              // .H.RPOF.ADBG

Concatenate ("RPOFs: ", ToHexString (_ADR)))

   13214: 73 0D 52 50 4F 46 73 3A 20 00 98 5F 41 44 52 00  // s.RPOFs: .._ADR.
   13224: 00                                               // .

                    If (LEqual (ID3H, Zero))
                    {
                        ADBG ("RPOF: No D3H")

   13225: A0 1C 93 49 44 33 48 00 41 44 42 47 0D 52 50 4F  // ...ID3H.ADBG.RPO
   13235: 46 3A 20 4E 6F 20 44 33 48 00                    // F: No D3H.

                        BreakPoint

   1323F: CC                                               // .

                        Return (Zero)
                    }


   13240: A4 00                                            // ..

                    If (LNot (D3CS (NRPN)))
                    {

   13242: A0 0C 92 44 33 43 53 4E 52 50 4E                 // ...D3CSNRPN

                        Return (Zero)
                    }

                    RL23 ()
                    RSOF (NRPN)

   1324D: A4 00 52 4C 32 33 52 53 4F 46 4E 52 50 4E        // ..RL23RSOFNRPN

                    Store (One, ID3C) /* \_SB_.PCI0.SAT0.NVM1.ID3C */
                }


   1325B: 70 01 49 44 33 43                                // p.ID3C

                Method (SAVC, 0, Serialized)
                {
                    ADBG (
   13261: 14 40 0C 53 41 56 43 08 41 44 42 47              // .@.SAVC.ADBG

Concatenate ("SAVC:", ToHexString (_ADR)))
                    Store (RDCA (NCRN, 0x04, Zero, Zero, 0x02), PCMD) /* \_SB_.PCI0.SAT0.NVM1.PCMD */

   1326D: 73 0D 53 41 56 43 3A 00 98 5F 41 44 52 00 00 70  // s.SAVC:.._ADR..p
   1327D: 52 44 43 41 4E 43 52 4E 0A 04 00 00 0A 02 50 43  // RDCANCRN......PC
   1328D: 4D 44                                            // MD

                    If (LEqual (NITV, One))
                    {
                        Store (0x24, PRBI) /* \_SB_.PCI0.SAT0.NVM1.PRBI */

   1328F: A0 21 93 4E 49 54 56 01 70 0A 24 50 52 42 49     // .!.NITV.p.$PRBI

                        Store (RDCA (NCRN, 0x24, Zero, Zero, 0x02), PRBD) /* \_SB_.PCI0.SAT0.NVM1.PRBD */
                    }

   1329E: 70 52 44 43 41 4E 43 52 4E 0A 24 00 00 0A 02 50  // pRDCANCRN.$....P
   132AE: 52 42 44                                         // RBD

                    ElseIf
   132B1: A1 4A 06                                         // .J.

 (LEqual (NITV, 0x02))
                    {
                        Store (0x10, PRBI) /* \_SB_.PCI0.SAT0.NVM1.PRBI */
                        Store (RDCA (NCRN, 0x10, Zero, Zero, 0x02), PRBD) /* \_SB_.PCI0.SAT0.NVM1.PRBD */

   132B4: A0 47 06 93 4E 49 54 56 0A 02 70 0A 10 50 52 42  // .G..NITV..p..PRB
   132C4: 49 70 52 44 43 41 4E 43 52 4E 0A 10 00 00 0A 02  // IpRDCANCRN......
   132D4: 50 52 42 44                                      // PRBD

                        OperationRegion (MCRC, SystemMemory, Add (GPCB (), 0x000B833C), 0x04)

   132D8: 5B 80 4D 43 52 43 00 72 47 50 43 42 0C 3C 83 0B  // [.MCRC.rGPCB.<..
   132E8: 00 00 0A 04                                      // ....

                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }


   132EC: 5B 81 19 4D 43 52 43 00 53 43 53 4F 08 00 08 54  // [..MCRC.SCSO...T
   132FC: 43 53 4F 08 00 07 52 45 5F 5F 01                 // CSO...RE__.

                        Store (RDCA (NCRN, TCSO, Zero, Zero, 0x02), MXIE) /* \_SB_.PCI0.SAT0.NVM1.MXIE */
                    }


   13307: 70 52 44 43 41 4E 43 52 4E 54 43 53 4F 00 00 0A  // pRDCANCRNTCSO...
   13317: 02 4D 58 49 45                                   // .MXIE

                    Store (One, CSAV) /* \_SB_.PCI0.SAT0.NVM1.CSAV */
                }


   1331C: 70 01 43 53 41 56                                // p.CSAV

                Method (NVD3, 0, Serialized)
                {
                    ADBG (
   13322: 14 45 07 4E 56 44 33 08 41 44 42 47              // .E.NVD3.ADBG

Concatenate ("NVD3:", ToHexString (_ADR)))

   1332E: 73 0D 4E 56 44 33 3A 00 98 5F 41 44 52 00 00     // s.NVD3:.._ADR..

                    If (LEqual (NITV, Zero))
                    {

   1333D: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }


   13345: A4 00                                            // ..

                    If (LEqual (ID3H, One))
                    {
                        ADBG ("Skip in D3")

   13347: A0 19 93 49 44 33 48 01 41 44 42 47 0D 53 6B 69  // ...ID3H.ADBG.Ski
   13357: 70 20 69 6E 20 44 33 00                          // p in D3.

                        Return (Zero)
                    }

                    SAVC ()
                    RDCA (NCRN, Add (NPMV, 0x04), 0xFFFFFFFC, 0x03, 0x03)
                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, 0x03, One)
                    Store (One, ID3H) /* \_SB_.PCI0.SAT0.NVM1.ID3H */

   1335F: A4 00 53 41 56 43 52 44 43 41 4E 43 52 4E 72 4E  // ..SAVCRDCANCRNrN
   1336F: 50 4D 56 0A 04 00 0C FC FF FF FF 0A 03 0A 03 52  // PMV............R
   1337F: 44 43 41 4E 43 52 4E 0A A4 0C FC FF FF FF 0A 03  // DCANCRN.........
   1338F: 01 70 01 49 44 33 48                             // .p.ID3H

                    Return (Zero)
                }


   13396: A4 00                                            // ..

                Method (NVD0, 0, Serialized)
                {
                    ADBG (
   13398: 14 48 10 4E 56 44 30 08 41 44 42 47              // .H.NVD0.ADBG

Concatenate ("NVD0:", ToHexString (_ADR)))

   133A4: 73 0D 4E 56 44 30 3A 00 98 5F 41 44 52 00 00     // s.NVD0:.._ADR..

                    If (LEqual (NITV, Zero))
                    {

   133B3: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }


   133BB: A4 00                                            // ..

                    If (LEqual (ID3H, Zero))
                    {
                        ADBG ("Remap already in D0")

   133BD: A0 22 93 49 44 33 48 00 41 44 42 47 0D 52 65 6D  // .".ID3H.ADBG.Rem
   133CD: 61 70 20 61 6C 72 65 61 64 79 20 69 6E 20 44 30  // ap already in D0
   133DD: 00                                               // .

                        Return (Zero)
                    }

                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, Zero, One)
                    RDCA (NCRN, Add (NPMV, 0x04), 0xFFFFFFFC, Zero, 0x03)

   133DE: A4 00 52 44 43 41 4E 43 52 4E 0A A4 0C FC FF FF  // ..RDCANCRN......
   133EE: FF 00 01 52 44 43 41 4E 43 52 4E 72 4E 50 4D 56  // ...RDCANCRNrNPMV
   133FE: 0A 04 00 0C FC FF FF FF 00 0A 03                 // ...........

                    If (LEqual (CSAV, One))
                    {
                        CNRS ()

   13409: A0 45 07 93 43 53 41 56 01 43 4E 52 53           // .E..CSAV.CNRS

                        If (LEqual (NITV, 0x02))
                        {

   13416: A0 48 06 93 4E 49 54 56 0A 02                    // .H..NITV..

                            OperationRegion (MCRC, SystemMemory, Add (GPCB (), 0x000B833C), 0x04)

   13420: 5B 80 4D 43 52 43 00 72 47 50 43 42 0C 3C 83 0B  // [.MCRC.rGPCB.<..
   13430: 00 00 0A 04                                      // ....

                            Field (MCRC, AnyAcc, NoLock, Preserve)
                            {
                                SCSO,   8, 
                                Offset (0x02), 
                                TCSO,   8, 
                                    ,   7, 
                                RE,     1
                            }

                            RDCA (NCRN, TCSO, 0xFFFFFFFF, And (MXIE, 0x80000000), 0x03)
                            ADBG ("NVD0:  MSIXe")
                        }
                    }

   13434: 5B 81 19 4D 43 52 43 00 53 43 53 4F 08 00 08 54  // [..MCRC.SCSO...T
   13444: 43 53 4F 08 00 07 52 45 5F 5F 01 52 44 43 41 4E  // CSO...RE__.RDCAN
   13454: 43 52 4E 54 43 53 4F 0C FF FF FF FF 7B 4D 58 49  // CRNTCSO.....{MXI
   13464: 45 0C 00 00 00 80 00 0A 03 41 44 42 47 0D 4E 56  // E........ADBG.NV
   13474: 44 30 3A 20 20 4D 53 49 58 65 00                 // D0:  MSIXe.

                    Else
                    {
                        ADBG ("Skip remap restore")
                    }

                    Store (Zero, ID3H) /* \_SB_.PCI0.SAT0.NVM1.ID3H */

   1347F: A1 19 41 44 42 47 0D 53 6B 69 70 20 72 65 6D 61  // ..ADBG.Skip rema
   1348F: 70 20 72 65 73 74 6F 72 65 00 70 00 49 44 33 48  // p restore.p.ID3H

                    Return (Zero)
                }


   1349F: A4 00                                            // ..

                Method (CNRS, 0, Serialized)
                {
                    ADBG (
   134A1: 14 43 25 43 4E 52 53 08 41 44 42 47              // .C%CNRS.ADBG

Concatenate ("CNRSs ", ToDecimalString (Timer)))

   134AD: 73 0D 43 4E 52 53 73 20 00 97 5B 33 00 00        // s.CNRSs ..[3..

                    If (LEqual (NITV, Zero))
                    {

   134BB: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }

                    RDCA (NCRN, 0x10, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x14, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x18, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x1C, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x20, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x24, Zero, Zero, 0x03)
                    RDCA (NCRN, PRBI, Zero, PRBD, 0x03)
                    RDCA (NCRN, 0x04, 0xFFFFFFF8, PCMD, 0x03)

   134C3: A4 00 52 44 43 41 4E 43 52 4E 0A 10 00 00 0A 03  // ..RDCANCRN......
   134D3: 52 44 43 41 4E 43 52 4E 0A 14 00 00 0A 03 52 44  // RDCANCRN......RD
   134E3: 43 41 4E 43 52 4E 0A 18 00 00 0A 03 52 44 43 41  // CANCRN......RDCA
   134F3: 4E 43 52 4E 0A 1C 00 00 0A 03 52 44 43 41 4E 43  // NCRN......RDCANC
   13503: 52 4E 0A 20 00 00 0A 03 52 44 43 41 4E 43 52 4E  // RN. ....RDCANCRN
   13513: 0A 24 00 00 0A 03 52 44 43 41 4E 43 52 4E 50 52  // .$....RDCANCRNPR
   13523: 42 49 00 50 52 42 44 0A 03 52 44 43 41 4E 43 52  // BI.PRBD..RDCANCR
   13533: 4E 0A 04 0C F8 FF FF FF 50 43 4D 44 0A 03        // N.......PCMD..

                    If (
   13541: A0 4E 05 92                                      // .N..

LNotEqual (NL1V, Zero))
                    {
                        RDCA (NCRN, Add (NL1V, 0x0C), 0xFFFFFF00, ND2V, 0x03)
                        RDCA (NCRN, Add (NL1V, 0x08), 0x0F, And (ND1V, 0xFFFFFFF0), 0x03)
                        RDCA (NCRN, Add (NL1V, 0x08), 0xFFFFFFFF, ND1V, 0x03)
                    }


   13545: 93 4E 4C 31 56 00 52 44 43 41 4E 43 52 4E 72 4E  // .NL1V.RDCANCRNrN
   13555: 4C 31 56 0A 0C 00 0C 00 FF FF FF 4E 44 32 56 0A  // L1V........ND2V.
   13565: 03 52 44 43 41 4E 43 52 4E 72 4E 4C 31 56 0A 08  // .RDCANCRNrNL1V..
   13575: 00 0A 0F 7B 4E 44 31 56 0C F0 FF FF FF 00 0A 03  // ...{ND1V........
   13585: 52 44 43 41 4E 43 52 4E 72 4E 4C 31 56 0A 08 00  // RDCANCRNrNL1V...
   13595: 0C FF FF FF FF 4E 44 31 56 0A 03                 // .....ND1V..

                    If (
   135A0: A0 23 92                                         // .#.

LNotEqual (NLRV, Zero))
                    {
                        RDCA (NCRN, Add (NLRV, 0x04), 0xFFFFFFFF, NLDV, 0x03)
                    }

                    RDCA (NCRN, Add (NPCV, 0x10), 0xFFFFFEBF, And (NEAV, 0xFFFC), 0x03)
                    RDCA (NCRN, Add (NPCV, 0x28), 0xFFFFFBFF, NECV, 0x03)
                    RDCA (NCRN, Add (NPCV, 0x08), 0xFFFFFF1F, NEBV, 0x03)
                    RDCA (NCRN, 0x68, 0xFFFFFBFF, NRAV, One)

   135A3: 93 4E 4C 52 56 00 52 44 43 41 4E 43 52 4E 72 4E  // .NLRV.RDCANCRNrN
   135B3: 4C 52 56 0A 04 00 0C FF FF FF FF 4E 4C 44 56 0A  // LRV........NLDV.
   135C3: 03 52 44 43 41 4E 43 52 4E 72 4E 50 43 56 0A 10  // .RDCANCRNrNPCV..
   135D3: 00 0C BF FE FF FF 7B 4E 45 41 56 0B FC FF 00 0A  // ......{NEAV.....
   135E3: 03 52 44 43 41 4E 43 52 4E 72 4E 50 43 56 0A 28  // .RDCANCRNrNPCV.(
   135F3: 00 0C FF FB FF FF 4E 45 43 56 0A 03 52 44 43 41  // ......NECV..RDCA
   13603: 4E 43 52 4E 72 4E 50 43 56 0A 08 00 0C 1F FF FF  // NCRNrNPCV.......
   13613: FF 4E 45 42 56 0A 03 52 44 43 41 4E 43 52 4E 0A  // .NEBV..RDCANCRN.
   13623: 68 0C FF FB FF FF 4E 52 41 56 01                 // h.....NRAV.

                    If (LEqual (And (NEAV, 0x40), 0x40))
                    {
                        RDCA (NCRN, 0x50, 0xFFFFFFDF, 0x20, One)
                        ADBG (
   1362E: A0 4B 04 93 7B 4E 45 41 56 0A 40 00 0A 40 52 44  // .K..{NEAV.@..@RD
   1363E: 43 41 4E 43 52 4E 0A 50 0C DF FF FF FF 0A 20 01  // CANCRN.P...... .
   1364E: 41 44 42 47                                      // ADBG

Concatenate ("CNRSw ", ToDecimalString (Timer)))

   13652: 73 0D 43 4E 52 53 77 20 00 97 5B 33 00 00        // s.CNRSw ..[3..

                        While (LEqual (And (RDCA (NCRN, 0x52, Zero, Zero, Zero), 0x2000), Zero))
                        {

   13660: A2 19 93 7B 52 44 43 41 4E 43 52 4E 0A 52 00 00  // ...{RDCANCRN.R..
   13670: 00 0B 00 20 00 00                                // ... ..

                            Stall (0x0A)
                        }
                    }

                    ADBG (
   13676: 5B 21 0A 0A 41 44 42 47                          // [!..ADBG

Concatenate ("CNRSx ", ToDecimalString (Timer)))
                    RDCA (NCRN, Add (NPCV, 0x10), 0xFFFFFFFC, And (NEAV, 0x03), 0x03)

   1367E: 73 0D 43 4E 52 53 78 20 00 97 5B 33 00 00 52 44  // s.CNRSx ..[3..RD
   1368E: 43 41 4E 43 52 4E 72 4E 50 43 56 0A 10 00 0C FC  // CANCRNrNPCV.....
   1369E: FF FF FF 7B 4E 45 41 56 0A 03 00 0A 03           // ...{NEAV.....

                    If (
   136AB: A0 1B 92                                         // ...

LNotEqual (NMVV, Zero))
                    {
                        RDCA (NCRN, NMBV, Zero, NMVV, 0x03)
                    }


   136AE: 93 4E 4D 56 56 00 52 44 43 41 4E 43 52 4E 4E 4D  // .NMVV.RDCANCRNNM
   136BE: 42 56 00 4E 4D 56 56 0A 03                       // BV.NMVV..

                    If (
   136C7: A0 1B 92                                         // ...

LNotEqual (NPVV, Zero))
                    {
                        RDCA (NCRN, NPBV, Zero, NPVV, 0x03)
                    }

                    ADBG (
   136CA: 93 4E 50 56 56 00 52 44 43 41 4E 43 52 4E 4E 50  // .NPVV.RDCANCRNNP
   136DA: 42 56 00 4E 50 56 56 0A 03 41 44 42 47           // BV.NPVV..ADBG

Concatenate ("CNRSe ", ToDecimalString (Timer)))
                }
            }


   136E7: 73 0D 43 4E 52 53 65 20 00 97 5B 33 00 00        // s.CNRSe ..[3..

            Device (NVM2)
            {

   136F5: 5B 82 41 7E 4E 56 4D 32                          // [.A~NVM2

                Name (_ADR, 0x00C2FFFF)  // _ADR: Address

   136FD: 08 5F 41 44 52 0C FF FF C2 00                    // ._ADR.....

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (NIT2, NITV) /* \_SB_.PCI0.SAT0.NVM2.NITV */
                    Store (NPM2, NPMV) /* \_SB_.PCI0.SAT0.NVM2.NPMV */
                    Store (NPC2, NPCV) /* \_SB_.PCI0.SAT0.NVM2.NPCV */
                    Store (NL12, NL1V) /* \_SB_.PCI0.SAT0.NVM2.NL1V */
                    Store (ND22, ND2V) /* \_SB_.PCI0.SAT0.NVM2.ND2V */
                    Store (ND12, ND1V) /* \_SB_.PCI0.SAT0.NVM2.ND1V */
                    Store (NLR2, NLRV) /* \_SB_.PCI0.SAT0.NVM2.NLRV */
                    Store (NLD2, NLDV) /* \_SB_.PCI0.SAT0.NVM2.NLDV */
                    Store (NEA2, NEAV) /* \_SB_.PCI0.SAT0.NVM2.NEAV */
                    Store (NEB2, NEBV) /* \_SB_.PCI0.SAT0.NVM2.NEBV */
                    Store (NEC2, NECV) /* \_SB_.PCI0.SAT0.NVM2.NECV */
                    Store (NRA2, NRAV) /* \_SB_.PCI0.SAT0.NVM2.NRAV */
                    Store (NMB2, NMBV) /* \_SB_.PCI0.SAT0.NVM2.NMBV */
                    Store (NMV2, NMVV) /* \_SB_.PCI0.SAT0.NVM2.NMVV */
                    Store (NPB2, NPBV) /* \_SB_.PCI0.SAT0.NVM2.NPBV */
                    Store (NPV2, NPVV) /* \_SB_.PCI0.SAT0.NVM2.NPVV */
                    Store (NRP2, NRPN) /* \_SB_.PCI0.SAT0.NVM2.NRPN */

   13707: 14 46 0A 5F 49 4E 49 00 70 4E 49 54 32 4E 49 54  // .F._INI.pNIT2NIT
   13717: 56 70 4E 50 4D 32 4E 50 4D 56 70 4E 50 43 32 4E  // VpNPM2NPMVpNPC2N
   13727: 50 43 56 70 4E 4C 31 32 4E 4C 31 56 70 4E 44 32  // PCVpNL12NL1VpND2
   13737: 32 4E 44 32 56 70 4E 44 31 32 4E 44 31 56 70 4E  // 2ND2VpND12ND1VpN
   13747: 4C 52 32 4E 4C 52 56 70 4E 4C 44 32 4E 4C 44 56  // LR2NLRVpNLD2NLDV
   13757: 70 4E 45 41 32 4E 45 41 56 70 4E 45 42 32 4E 45  // pNEA2NEAVpNEB2NE
   13767: 42 56 70 4E 45 43 32 4E 45 43 56 70 4E 52 41 32  // BVpNEC2NECVpNRA2
   13777: 4E 52 41 56 70 4E 4D 42 32 4E 4D 42 56 70 4E 4D  // NRAVpNMB2NMBVpNM
   13787: 56 32 4E 4D 56 56 70 4E 50 42 32 4E 50 42 56 70  // V2NMVVpNPB2NPBVp
   13797: 4E 50 56 32 4E 50 56 56 70 4E 52 50 32 4E 52 50  // NPV2NPVVpNRP2NRP
   137A7: 4E                                               // N

                    Store (One, NCRN) /* \_SB_.PCI0.SAT0.NVM2.NCRN */
                }


   137A8: 70 01 4E 43 52 4E                                // p.NCRN

                Name (PRBI, Zero)

   137AE: 08 50 52 42 49 00                                // .PRBI.

                Name (PRBD, Zero)

   137B4: 08 50 52 42 44 00                                // .PRBD.

                Name (PCMD, Zero)

   137BA: 08 50 43 4D 44 00                                // .PCMD.

                Name (NCRN, Zero)

   137C0: 08 4E 43 52 4E 00                                // .NCRN.

                Name (NITV, Zero)

   137C6: 08 4E 49 54 56 00                                // .NITV.

                Name (NPMV, Zero)

   137CC: 08 4E 50 4D 56 00                                // .NPMV.

                Name (NPCV, Zero)

   137D2: 08 4E 50 43 56 00                                // .NPCV.

                Name (NL1V, Zero)

   137D8: 08 4E 4C 31 56 00                                // .NL1V.

                Name (ND2V, Zero)

   137DE: 08 4E 44 32 56 00                                // .ND2V.

                Name (ND1V, Zero)

   137E4: 08 4E 44 31 56 00                                // .ND1V.

                Name (NLRV, Zero)

   137EA: 08 4E 4C 52 56 00                                // .NLRV.

                Name (NLDV, Zero)

   137F0: 08 4E 4C 44 56 00                                // .NLDV.

                Name (NEAV, Zero)

   137F6: 08 4E 45 41 56 00                                // .NEAV.

                Name (NEBV, Zero)

   137FC: 08 4E 45 42 56 00                                // .NEBV.

                Name (NECV, Zero)

   13802: 08 4E 45 43 56 00                                // .NECV.

                Name (NRAV, Zero)

   13808: 08 4E 52 41 56 00                                // .NRAV.

                Name (NMBV, Zero)

   1380E: 08 4E 4D 42 56 00                                // .NMBV.

                Name (NMVV, Zero)

   13814: 08 4E 4D 56 56 00                                // .NMVV.

                Name (NPBV, Zero)

   1381A: 08 4E 50 42 56 00                                // .NPBV.

                Name (NPVV, Zero)

   13820: 08 4E 50 56 56 00                                // .NPVV.

                Name (NRPN, Zero)

   13826: 08 4E 52 50 4E 00                                // .NRPN.

                Name (MXIE, Zero)

   1382C: 08 4D 58 49 45 00                                // .MXIE.

                Name (ID3C, Zero)

   13832: 08 49 44 33 43 00                                // .ID3C.

                Name (ID3H, Zero)

   13838: 08 49 44 33 48 00                                // .ID3H.

                Name (CSAV, Zero)

   1383E: 08 43 53 41 56 00                                // .CSAV.

                Method (_PS3, 0, Serialized)  // _PS3: Power State 3
                {
                    ADBG (
   13844: 14 26 5F 50 53 33 08 41 44 42 47                 // .&_PS3.ADBG

Concatenate ("_PS3r:", ToHexString (_ADR)))

   1384F: 73 0D 5F 50 53 33 72 3A 00 98 5F 41 44 52 00 00  // s._PS3r:.._ADR..

                    If (IR3D ())
                    {

   1385F: A0 07 49 52 33 44                                // ..IR3D

                        Return (Zero)
                    }

                    NVD3 ()
                }


   13865: A4 00 4E 56 44 33                                // ..NVD3

                Method (_PS0, 0, Serialized)  // _PS0: Power State 0
                {
                    ADBG (
   1386B: 14 26 5F 50 53 30 08 41 44 42 47                 // .&_PS0.ADBG

Concatenate ("_PS0r:", ToHexString (_ADR)))

   13876: 73 0D 5F 50 53 30 72 3A 00 98 5F 41 44 52 00 00  // s._PS0r:.._ADR..

                    If (IR3D ())
                    {

   13886: A0 07 49 52 33 44                                // ..IR3D

                        Return (Zero)
                    }

                    NVD0 ()
                }


   1388C: A4 00 4E 56 44 30                                // ..NVD0

                Method (RL23, 0, NotSerialized)
                {
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x04, One)
                    Sleep (0x10)
                    Store (Zero, Local0)

   13892: 14 43 05 52 4C 32 33 00 52 44 43 41 4E 43 52 4E  // .C.RL23.RDCANCRN
   138A2: 0A E2 0C FF FF FF FF 0A 04 01 5B 22 0A 10 70 00  // ..........["..p.
   138B2: 60                                               // `

                    While (And (RDCA (NCRN, 0xE2, Zero, Zero, Zero), 0x04))
                    {

   138B3: A2 1F 7B 52 44 43 41 4E 43 52 4E 0A E2 00 00 00  // ..{RDCANCRN.....
   138C3: 0A 04 00                                         // ...

                        If (LGreater (Local0, 0x04))
                        {

   138C6: A0 06 94 60 0A 04                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   138CC: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFFF, 0x08, One)
                }


   138D1: 75 60 52 44 43 41 4E 43 52 4E 0B 24 03 0C FF FF  // u`RDCANCRN.$....
   138E1: FF FF 0A 08 01                                   // .....

                Method (RLA, 0, NotSerialized)
                {
                    RDCA (NCRN, 0x0420, 0xBFFFFFFF, Zero, One)
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x08, One)
                    Sleep (0x10)
                    Store (Zero, Local0)

   138E6: 14 40 0A 52 4C 41 5F 00 52 44 43 41 4E 43 52 4E  // .@.RLA_.RDCANCRN
   138F6: 0B 20 04 0C FF FF FF BF 00 01 52 44 43 41 4E 43  // . ........RDCANC
   13906: 52 4E 0A E2 0C FF FF FF FF 0A 08 01 5B 22 0A 10  // RN..........["..
   13916: 70 00 60                                         // p.`

                    While (And (RDCA (NCRN, 0xE2, Zero, Zero, Zero), 0x08))
                    {

   13919: A2 1F 7B 52 44 43 41 4E 43 52 4E 0A E2 00 00 00  // ..{RDCANCRN.....
   13929: 0A 08 00                                         // ...

                        If (LGreater (Local0, 0x04))
                        {

   1392C: A0 06 94 60 0A 04                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   13932: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0420, 0xFFFFFFFF, 0x40000000, One)
                    Store (Zero, Local0)

   13937: 75 60 52 44 43 41 4E 43 52 4E 0B 20 04 0C FF FF  // u`RDCANCRN. ....
   13947: FF FF 0C 00 00 00 40 01 70 00 60                 // ......@.p.`

                    While (LEqual (And (RDCA (NCRN, 0x52, Zero, Zero, Zero), 0x2000), Zero))
                    {

   13952: A2 22 93 7B 52 44 43 41 4E 43 52 4E 0A 52 00 00  // .".{RDCANCRN.R..
   13962: 00 0B 00 20 00 00                                // ... ..

                        If (LGreater (Local0, 0x08))
                        {

   13968: A0 06 94 60 0A 08                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   1396E: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFF7, Zero, One)
                }


   13973: 75 60 52 44 43 41 4E 43 52 4E 0B 24 03 0C F7 FF  // u`RDCANCRN.$....
   13983: FF FF 00 01                                      // ....

                Method (RPON, 0, Serialized)
                {
                    ADBG (
   13987: 14 43 06 52 50 4F 4E 08 41 44 42 47              // .C.RPON.ADBG

Concatenate ("RPONs: ", ToHexString (_ADR)))

   13993: 73 0D 52 50 4F 4E 73 3A 20 00 98 5F 41 44 52 00  // s.RPONs: .._ADR.
   139A3: 00                                               // .

                    If (LEqual (ID3C, Zero))
                    {
                        ADBG ("RPON: no D3C")

   139A4: A0 1B 93 49 44 33 43 00 41 44 42 47 0D 52 50 4F  // ...ID3C.ADBG.RPO
   139B4: 4E 3A 20 6E 6F 20 44 33 43 00                    // N: no D3C.

                        Return (Zero)
                    }

                    RSON (NRPN)
                    RLA ()
                    Sleep (0x64)
                    Store (Zero, ID3C) /* \_SB_.PCI0.SAT0.NVM2.ID3C */
                    ADBG (
   139BE: A4 00 52 53 4F 4E 4E 52 50 4E 52 4C 41 5F 5B 22  // ..RSONNRPNRLA_["
   139CE: 0A 64 70 00 49 44 33 43 41 44 42 47              // .dp.ID3CADBG

Concatenate ("RPONe: ", ToHexString (_ADR)))
                }


   139DA: 73 0D 52 50 4F 4E 65 3A 20 00 98 5F 41 44 52 00  // s.RPONe: .._ADR.
   139EA: 00                                               // .

                Method (RPOF, 0, Serialized)
                {
                    ADBG (
   139EB: 14 48 05 52 50 4F 46 08 41 44 42 47              // .H.RPOF.ADBG

Concatenate ("RPOFs: ", ToHexString (_ADR)))

   139F7: 73 0D 52 50 4F 46 73 3A 20 00 98 5F 41 44 52 00  // s.RPOFs: .._ADR.
   13A07: 00                                               // .

                    If (LEqual (ID3H, Zero))
                    {
                        ADBG ("RPOF: No D3H")

   13A08: A0 1C 93 49 44 33 48 00 41 44 42 47 0D 52 50 4F  // ...ID3H.ADBG.RPO
   13A18: 46 3A 20 4E 6F 20 44 33 48 00                    // F: No D3H.

                        BreakPoint

   13A22: CC                                               // .

                        Return (Zero)
                    }


   13A23: A4 00                                            // ..

                    If (LNot (D3CS (NRPN)))
                    {

   13A25: A0 0C 92 44 33 43 53 4E 52 50 4E                 // ...D3CSNRPN

                        Return (Zero)
                    }

                    RL23 ()
                    RSOF (NRPN)

   13A30: A4 00 52 4C 32 33 52 53 4F 46 4E 52 50 4E        // ..RL23RSOFNRPN

                    Store (One, ID3C) /* \_SB_.PCI0.SAT0.NVM2.ID3C */
                }


   13A3E: 70 01 49 44 33 43                                // p.ID3C

                Method (SAVC, 0, Serialized)
                {
                    ADBG (
   13A44: 14 40 0C 53 41 56 43 08 41 44 42 47              // .@.SAVC.ADBG

Concatenate ("SAVC:", ToHexString (_ADR)))
                    Store (RDCA (NCRN, 0x04, Zero, Zero, 0x02), PCMD) /* \_SB_.PCI0.SAT0.NVM2.PCMD */

   13A50: 73 0D 53 41 56 43 3A 00 98 5F 41 44 52 00 00 70  // s.SAVC:.._ADR..p
   13A60: 52 44 43 41 4E 43 52 4E 0A 04 00 00 0A 02 50 43  // RDCANCRN......PC
   13A70: 4D 44                                            // MD

                    If (LEqual (NITV, One))
                    {
                        Store (0x24, PRBI) /* \_SB_.PCI0.SAT0.NVM2.PRBI */

   13A72: A0 21 93 4E 49 54 56 01 70 0A 24 50 52 42 49     // .!.NITV.p.$PRBI

                        Store (RDCA (NCRN, 0x24, Zero, Zero, 0x02), PRBD) /* \_SB_.PCI0.SAT0.NVM2.PRBD */
                    }

   13A81: 70 52 44 43 41 4E 43 52 4E 0A 24 00 00 0A 02 50  // pRDCANCRN.$....P
   13A91: 52 42 44                                         // RBD

                    ElseIf
   13A94: A1 4A 06                                         // .J.

 (LEqual (NITV, 0x02))
                    {
                        Store (0x10, PRBI) /* \_SB_.PCI0.SAT0.NVM2.PRBI */
                        Store (RDCA (NCRN, 0x10, Zero, Zero, 0x02), PRBD) /* \_SB_.PCI0.SAT0.NVM2.PRBD */

   13A97: A0 47 06 93 4E 49 54 56 0A 02 70 0A 10 50 52 42  // .G..NITV..p..PRB
   13AA7: 49 70 52 44 43 41 4E 43 52 4E 0A 10 00 00 0A 02  // IpRDCANCRN......
   13AB7: 50 52 42 44                                      // PRBD

                        OperationRegion (MCRC, SystemMemory, Add (GPCB (), 0x000B833C), 0x04)

   13ABB: 5B 80 4D 43 52 43 00 72 47 50 43 42 0C 3C 83 0B  // [.MCRC.rGPCB.<..
   13ACB: 00 00 0A 04                                      // ....

                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }


   13ACF: 5B 81 19 4D 43 52 43 00 53 43 53 4F 08 00 08 54  // [..MCRC.SCSO...T
   13ADF: 43 53 4F 08 00 07 52 45 5F 5F 01                 // CSO...RE__.

                        Store (RDCA (NCRN, TCSO, Zero, Zero, 0x02), MXIE) /* \_SB_.PCI0.SAT0.NVM2.MXIE */
                    }


   13AEA: 70 52 44 43 41 4E 43 52 4E 54 43 53 4F 00 00 0A  // pRDCANCRNTCSO...
   13AFA: 02 4D 58 49 45                                   // .MXIE

                    Store (One, CSAV) /* \_SB_.PCI0.SAT0.NVM2.CSAV */
                }


   13AFF: 70 01 43 53 41 56                                // p.CSAV

                Method (NVD3, 0, Serialized)
                {
                    ADBG (
   13B05: 14 45 07 4E 56 44 33 08 41 44 42 47              // .E.NVD3.ADBG

Concatenate ("NVD3:", ToHexString (_ADR)))

   13B11: 73 0D 4E 56 44 33 3A 00 98 5F 41 44 52 00 00     // s.NVD3:.._ADR..

                    If (LEqual (NITV, Zero))
                    {

   13B20: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }


   13B28: A4 00                                            // ..

                    If (LEqual (ID3H, One))
                    {
                        ADBG ("Skip in D3")

   13B2A: A0 19 93 49 44 33 48 01 41 44 42 47 0D 53 6B 69  // ...ID3H.ADBG.Ski
   13B3A: 70 20 69 6E 20 44 33 00                          // p in D3.

                        Return (Zero)
                    }

                    SAVC ()
                    RDCA (NCRN, Add (NPMV, 0x04), 0xFFFFFFFC, 0x03, 0x03)
                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, 0x03, One)
                    Store (One, ID3H) /* \_SB_.PCI0.SAT0.NVM2.ID3H */

   13B42: A4 00 53 41 56 43 52 44 43 41 4E 43 52 4E 72 4E  // ..SAVCRDCANCRNrN
   13B52: 50 4D 56 0A 04 00 0C FC FF FF FF 0A 03 0A 03 52  // PMV............R
   13B62: 44 43 41 4E 43 52 4E 0A A4 0C FC FF FF FF 0A 03  // DCANCRN.........
   13B72: 01 70 01 49 44 33 48                             // .p.ID3H

                    Return (Zero)
                }


   13B79: A4 00                                            // ..

                Method (NVD0, 0, Serialized)
                {
                    ADBG (
   13B7B: 14 48 10 4E 56 44 30 08 41 44 42 47              // .H.NVD0.ADBG

Concatenate ("NVD0:", ToHexString (_ADR)))

   13B87: 73 0D 4E 56 44 30 3A 00 98 5F 41 44 52 00 00     // s.NVD0:.._ADR..

                    If (LEqual (NITV, Zero))
                    {

   13B96: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }


   13B9E: A4 00                                            // ..

                    If (LEqual (ID3H, Zero))
                    {
                        ADBG ("Remap already in D0")

   13BA0: A0 22 93 49 44 33 48 00 41 44 42 47 0D 52 65 6D  // .".ID3H.ADBG.Rem
   13BB0: 61 70 20 61 6C 72 65 61 64 79 20 69 6E 20 44 30  // ap already in D0
   13BC0: 00                                               // .

                        Return (Zero)
                    }

                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, Zero, One)
                    RDCA (NCRN, Add (NPMV, 0x04), 0xFFFFFFFC, Zero, 0x03)

   13BC1: A4 00 52 44 43 41 4E 43 52 4E 0A A4 0C FC FF FF  // ..RDCANCRN......
   13BD1: FF 00 01 52 44 43 41 4E 43 52 4E 72 4E 50 4D 56  // ...RDCANCRNrNPMV
   13BE1: 0A 04 00 0C FC FF FF FF 00 0A 03                 // ...........

                    If (LEqual (CSAV, One))
                    {
                        CNRS ()

   13BEC: A0 45 07 93 43 53 41 56 01 43 4E 52 53           // .E..CSAV.CNRS

                        If (LEqual (NITV, 0x02))
                        {

   13BF9: A0 48 06 93 4E 49 54 56 0A 02                    // .H..NITV..

                            OperationRegion (MCRC, SystemMemory, Add (GPCB (), 0x000B833C), 0x04)

   13C03: 5B 80 4D 43 52 43 00 72 47 50 43 42 0C 3C 83 0B  // [.MCRC.rGPCB.<..
   13C13: 00 00 0A 04                                      // ....

                            Field (MCRC, AnyAcc, NoLock, Preserve)
                            {
                                SCSO,   8, 
                                Offset (0x02), 
                                TCSO,   8, 
                                    ,   7, 
                                RE,     1
                            }

                            RDCA (NCRN, TCSO, 0xFFFFFFFF, And (MXIE, 0x80000000), 0x03)
                            ADBG ("NVD0:  MSIXe")
                        }
                    }

   13C17: 5B 81 19 4D 43 52 43 00 53 43 53 4F 08 00 08 54  // [..MCRC.SCSO...T
   13C27: 43 53 4F 08 00 07 52 45 5F 5F 01 52 44 43 41 4E  // CSO...RE__.RDCAN
   13C37: 43 52 4E 54 43 53 4F 0C FF FF FF FF 7B 4D 58 49  // CRNTCSO.....{MXI
   13C47: 45 0C 00 00 00 80 00 0A 03 41 44 42 47 0D 4E 56  // E........ADBG.NV
   13C57: 44 30 3A 20 20 4D 53 49 58 65 00                 // D0:  MSIXe.

                    Else
                    {
                        ADBG ("Skip remap restore")
                    }

                    Store (Zero, ID3H) /* \_SB_.PCI0.SAT0.NVM2.ID3H */

   13C62: A1 19 41 44 42 47 0D 53 6B 69 70 20 72 65 6D 61  // ..ADBG.Skip rema
   13C72: 70 20 72 65 73 74 6F 72 65 00 70 00 49 44 33 48  // p restore.p.ID3H

                    Return (Zero)
                }


   13C82: A4 00                                            // ..

                Method (CNRS, 0, Serialized)
                {
                    ADBG (
   13C84: 14 43 25 43 4E 52 53 08 41 44 42 47              // .C%CNRS.ADBG

Concatenate ("CNRSs ", ToDecimalString (Timer)))

   13C90: 73 0D 43 4E 52 53 73 20 00 97 5B 33 00 00        // s.CNRSs ..[3..

                    If (LEqual (NITV, Zero))
                    {

   13C9E: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }

                    RDCA (NCRN, 0x10, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x14, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x18, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x1C, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x20, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x24, Zero, Zero, 0x03)
                    RDCA (NCRN, PRBI, Zero, PRBD, 0x03)
                    RDCA (NCRN, 0x04, 0xFFFFFFF8, PCMD, 0x03)

   13CA6: A4 00 52 44 43 41 4E 43 52 4E 0A 10 00 00 0A 03  // ..RDCANCRN......
   13CB6: 52 44 43 41 4E 43 52 4E 0A 14 00 00 0A 03 52 44  // RDCANCRN......RD
   13CC6: 43 41 4E 43 52 4E 0A 18 00 00 0A 03 52 44 43 41  // CANCRN......RDCA
   13CD6: 4E 43 52 4E 0A 1C 00 00 0A 03 52 44 43 41 4E 43  // NCRN......RDCANC
   13CE6: 52 4E 0A 20 00 00 0A 03 52 44 43 41 4E 43 52 4E  // RN. ....RDCANCRN
   13CF6: 0A 24 00 00 0A 03 52 44 43 41 4E 43 52 4E 50 52  // .$....RDCANCRNPR
   13D06: 42 49 00 50 52 42 44 0A 03 52 44 43 41 4E 43 52  // BI.PRBD..RDCANCR
   13D16: 4E 0A 04 0C F8 FF FF FF 50 43 4D 44 0A 03        // N.......PCMD..

                    If (
   13D24: A0 4E 05 92                                      // .N..

LNotEqual (NL1V, Zero))
                    {
                        RDCA (NCRN, Add (NL1V, 0x0C), 0xFFFFFF00, ND2V, 0x03)
                        RDCA (NCRN, Add (NL1V, 0x08), 0x0F, And (ND1V, 0xFFFFFFF0), 0x03)
                        RDCA (NCRN, Add (NL1V, 0x08), 0xFFFFFFFF, ND1V, 0x03)
                    }


   13D28: 93 4E 4C 31 56 00 52 44 43 41 4E 43 52 4E 72 4E  // .NL1V.RDCANCRNrN
   13D38: 4C 31 56 0A 0C 00 0C 00 FF FF FF 4E 44 32 56 0A  // L1V........ND2V.
   13D48: 03 52 44 43 41 4E 43 52 4E 72 4E 4C 31 56 0A 08  // .RDCANCRNrNL1V..
   13D58: 00 0A 0F 7B 4E 44 31 56 0C F0 FF FF FF 00 0A 03  // ...{ND1V........
   13D68: 52 44 43 41 4E 43 52 4E 72 4E 4C 31 56 0A 08 00  // RDCANCRNrNL1V...
   13D78: 0C FF FF FF FF 4E 44 31 56 0A 03                 // .....ND1V..

                    If (
   13D83: A0 23 92                                         // .#.

LNotEqual (NLRV, Zero))
                    {
                        RDCA (NCRN, Add (NLRV, 0x04), 0xFFFFFFFF, NLDV, 0x03)
                    }

                    RDCA (NCRN, Add (NPCV, 0x10), 0xFFFFFEBF, And (NEAV, 0xFFFC), 0x03)
                    RDCA (NCRN, Add (NPCV, 0x28), 0xFFFFFBFF, NECV, 0x03)
                    RDCA (NCRN, Add (NPCV, 0x08), 0xFFFFFF1F, NEBV, 0x03)
                    RDCA (NCRN, 0x68, 0xFFFFFBFF, NRAV, One)

   13D86: 93 4E 4C 52 56 00 52 44 43 41 4E 43 52 4E 72 4E  // .NLRV.RDCANCRNrN
   13D96: 4C 52 56 0A 04 00 0C FF FF FF FF 4E 4C 44 56 0A  // LRV........NLDV.
   13DA6: 03 52 44 43 41 4E 43 52 4E 72 4E 50 43 56 0A 10  // .RDCANCRNrNPCV..
   13DB6: 00 0C BF FE FF FF 7B 4E 45 41 56 0B FC FF 00 0A  // ......{NEAV.....
   13DC6: 03 52 44 43 41 4E 43 52 4E 72 4E 50 43 56 0A 28  // .RDCANCRNrNPCV.(
   13DD6: 00 0C FF FB FF FF 4E 45 43 56 0A 03 52 44 43 41  // ......NECV..RDCA
   13DE6: 4E 43 52 4E 72 4E 50 43 56 0A 08 00 0C 1F FF FF  // NCRNrNPCV.......
   13DF6: FF 4E 45 42 56 0A 03 52 44 43 41 4E 43 52 4E 0A  // .NEBV..RDCANCRN.
   13E06: 68 0C FF FB FF FF 4E 52 41 56 01                 // h.....NRAV.

                    If (LEqual (And (NEAV, 0x40), 0x40))
                    {
                        RDCA (NCRN, 0x50, 0xFFFFFFDF, 0x20, One)
                        ADBG (
   13E11: A0 4B 04 93 7B 4E 45 41 56 0A 40 00 0A 40 52 44  // .K..{NEAV.@..@RD
   13E21: 43 41 4E 43 52 4E 0A 50 0C DF FF FF FF 0A 20 01  // CANCRN.P...... .
   13E31: 41 44 42 47                                      // ADBG

Concatenate ("CNRSw ", ToDecimalString (Timer)))

   13E35: 73 0D 43 4E 52 53 77 20 00 97 5B 33 00 00        // s.CNRSw ..[3..

                        While (LEqual (And (RDCA (NCRN, 0x52, Zero, Zero, Zero), 0x2000), Zero))
                        {

   13E43: A2 19 93 7B 52 44 43 41 4E 43 52 4E 0A 52 00 00  // ...{RDCANCRN.R..
   13E53: 00 0B 00 20 00 00                                // ... ..

                            Stall (0x0A)
                        }
                    }

                    ADBG (
   13E59: 5B 21 0A 0A 41 44 42 47                          // [!..ADBG

Concatenate ("CNRSx ", ToDecimalString (Timer)))
                    RDCA (NCRN, Add (NPCV, 0x10), 0xFFFFFFFC, And (NEAV, 0x03), 0x03)

   13E61: 73 0D 43 4E 52 53 78 20 00 97 5B 33 00 00 52 44  // s.CNRSx ..[3..RD
   13E71: 43 41 4E 43 52 4E 72 4E 50 43 56 0A 10 00 0C FC  // CANCRNrNPCV.....
   13E81: FF FF FF 7B 4E 45 41 56 0A 03 00 0A 03           // ...{NEAV.....

                    If (
   13E8E: A0 1B 92                                         // ...

LNotEqual (NMVV, Zero))
                    {
                        RDCA (NCRN, NMBV, Zero, NMVV, 0x03)
                    }


   13E91: 93 4E 4D 56 56 00 52 44 43 41 4E 43 52 4E 4E 4D  // .NMVV.RDCANCRNNM
   13EA1: 42 56 00 4E 4D 56 56 0A 03                       // BV.NMVV..

                    If (
   13EAA: A0 1B 92                                         // ...

LNotEqual (NPVV, Zero))
                    {
                        RDCA (NCRN, NPBV, Zero, NPVV, 0x03)
                    }

                    ADBG (
   13EAD: 93 4E 50 56 56 00 52 44 43 41 4E 43 52 4E 4E 50  // .NPVV.RDCANCRNNP
   13EBD: 42 56 00 4E 50 56 56 0A 03 41 44 42 47           // BV.NPVV..ADBG

Concatenate ("CNRSe ", ToDecimalString (Timer)))
                }
            }


   13ECA: 73 0D 43 4E 52 53 65 20 00 97 5B 33 00 00        // s.CNRSe ..[3..

            Device (NVM3)
            {

   13ED8: 5B 82 42 7E 4E 56 4D 33                          // [.B~NVM3

                Name (_ADR, 0x00C3FFFF)  // _ADR: Address

   13EE0: 08 5F 41 44 52 0C FF FF C3 00                    // ._ADR.....

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (NIT3, NITV) /* \_SB_.PCI0.SAT0.NVM3.NITV */
                    Store (NPM3, NPMV) /* \_SB_.PCI0.SAT0.NVM3.NPMV */
                    Store (NPC3, NPCV) /* \_SB_.PCI0.SAT0.NVM3.NPCV */
                    Store (NL13, NL1V) /* \_SB_.PCI0.SAT0.NVM3.NL1V */
                    Store (ND23, ND2V) /* \_SB_.PCI0.SAT0.NVM3.ND2V */
                    Store (ND13, ND1V) /* \_SB_.PCI0.SAT0.NVM3.ND1V */
                    Store (NLR3, NLRV) /* \_SB_.PCI0.SAT0.NVM3.NLRV */
                    Store (NLD3, NLDV) /* \_SB_.PCI0.SAT0.NVM3.NLDV */
                    Store (NEA3, NEAV) /* \_SB_.PCI0.SAT0.NVM3.NEAV */
                    Store (NEB3, NEBV) /* \_SB_.PCI0.SAT0.NVM3.NEBV */
                    Store (NEC3, NECV) /* \_SB_.PCI0.SAT0.NVM3.NECV */
                    Store (NRA3, NRAV) /* \_SB_.PCI0.SAT0.NVM3.NRAV */
                    Store (NMB3, NMBV) /* \_SB_.PCI0.SAT0.NVM3.NMBV */
                    Store (NMV3, NMVV) /* \_SB_.PCI0.SAT0.NVM3.NMVV */
                    Store (NPB3, NPBV) /* \_SB_.PCI0.SAT0.NVM3.NPBV */
                    Store (NPV3, NPVV) /* \_SB_.PCI0.SAT0.NVM3.NPVV */
                    Store (NRP3, NRPN) /* \_SB_.PCI0.SAT0.NVM3.NRPN */

   13EEA: 14 47 0A 5F 49 4E 49 00 70 4E 49 54 33 4E 49 54  // .G._INI.pNIT3NIT
   13EFA: 56 70 4E 50 4D 33 4E 50 4D 56 70 4E 50 43 33 4E  // VpNPM3NPMVpNPC3N
   13F0A: 50 43 56 70 4E 4C 31 33 4E 4C 31 56 70 4E 44 32  // PCVpNL13NL1VpND2
   13F1A: 33 4E 44 32 56 70 4E 44 31 33 4E 44 31 56 70 4E  // 3ND2VpND13ND1VpN
   13F2A: 4C 52 33 4E 4C 52 56 70 4E 4C 44 33 4E 4C 44 56  // LR3NLRVpNLD3NLDV
   13F3A: 70 4E 45 41 33 4E 45 41 56 70 4E 45 42 33 4E 45  // pNEA3NEAVpNEB3NE
   13F4A: 42 56 70 4E 45 43 33 4E 45 43 56 70 4E 52 41 33  // BVpNEC3NECVpNRA3
   13F5A: 4E 52 41 56 70 4E 4D 42 33 4E 4D 42 56 70 4E 4D  // NRAVpNMB3NMBVpNM
   13F6A: 56 33 4E 4D 56 56 70 4E 50 42 33 4E 50 42 56 70  // V3NMVVpNPB3NPBVp
   13F7A: 4E 50 56 33 4E 50 56 56 70 4E 52 50 33 4E 52 50  // NPV3NPVVpNRP3NRP
   13F8A: 4E                                               // N

                    Store (0x02, NCRN) /* \_SB_.PCI0.SAT0.NVM3.NCRN */
                }


   13F8B: 70 0A 02 4E 43 52 4E                             // p..NCRN

                Name (PRBI, Zero)

   13F92: 08 50 52 42 49 00                                // .PRBI.

                Name (PRBD, Zero)

   13F98: 08 50 52 42 44 00                                // .PRBD.

                Name (PCMD, Zero)

   13F9E: 08 50 43 4D 44 00                                // .PCMD.

                Name (NCRN, Zero)

   13FA4: 08 4E 43 52 4E 00                                // .NCRN.

                Name (NITV, Zero)

   13FAA: 08 4E 49 54 56 00                                // .NITV.

                Name (NPMV, Zero)

   13FB0: 08 4E 50 4D 56 00                                // .NPMV.

                Name (NPCV, Zero)

   13FB6: 08 4E 50 43 56 00                                // .NPCV.

                Name (NL1V, Zero)

   13FBC: 08 4E 4C 31 56 00                                // .NL1V.

                Name (ND2V, Zero)

   13FC2: 08 4E 44 32 56 00                                // .ND2V.

                Name (ND1V, Zero)

   13FC8: 08 4E 44 31 56 00                                // .ND1V.

                Name (NLRV, Zero)

   13FCE: 08 4E 4C 52 56 00                                // .NLRV.

                Name (NLDV, Zero)

   13FD4: 08 4E 4C 44 56 00                                // .NLDV.

                Name (NEAV, Zero)

   13FDA: 08 4E 45 41 56 00                                // .NEAV.

                Name (NEBV, Zero)

   13FE0: 08 4E 45 42 56 00                                // .NEBV.

                Name (NECV, Zero)

   13FE6: 08 4E 45 43 56 00                                // .NECV.

                Name (NRAV, Zero)

   13FEC: 08 4E 52 41 56 00                                // .NRAV.

                Name (NMBV, Zero)

   13FF2: 08 4E 4D 42 56 00                                // .NMBV.

                Name (NMVV, Zero)

   13FF8: 08 4E 4D 56 56 00                                // .NMVV.

                Name (NPBV, Zero)

   13FFE: 08 4E 50 42 56 00                                // .NPBV.

                Name (NPVV, Zero)

   14004: 08 4E 50 56 56 00                                // .NPVV.

                Name (NRPN, Zero)

   1400A: 08 4E 52 50 4E 00                                // .NRPN.

                Name (MXIE, Zero)

   14010: 08 4D 58 49 45 00                                // .MXIE.

                Name (ID3C, Zero)

   14016: 08 49 44 33 43 00                                // .ID3C.

                Name (ID3H, Zero)

   1401C: 08 49 44 33 48 00                                // .ID3H.

                Name (CSAV, Zero)

   14022: 08 43 53 41 56 00                                // .CSAV.

                Method (_PS3, 0, Serialized)  // _PS3: Power State 3
                {
                    ADBG (
   14028: 14 26 5F 50 53 33 08 41 44 42 47                 // .&_PS3.ADBG

Concatenate ("_PS3r:", ToHexString (_ADR)))

   14033: 73 0D 5F 50 53 33 72 3A 00 98 5F 41 44 52 00 00  // s._PS3r:.._ADR..

                    If (IR3D ())
                    {

   14043: A0 07 49 52 33 44                                // ..IR3D

                        Return (Zero)
                    }

                    NVD3 ()
                }


   14049: A4 00 4E 56 44 33                                // ..NVD3

                Method (_PS0, 0, Serialized)  // _PS0: Power State 0
                {
                    ADBG (
   1404F: 14 26 5F 50 53 30 08 41 44 42 47                 // .&_PS0.ADBG

Concatenate ("_PS0r:", ToHexString (_ADR)))

   1405A: 73 0D 5F 50 53 30 72 3A 00 98 5F 41 44 52 00 00  // s._PS0r:.._ADR..

                    If (IR3D ())
                    {

   1406A: A0 07 49 52 33 44                                // ..IR3D

                        Return (Zero)
                    }

                    NVD0 ()
                }


   14070: A4 00 4E 56 44 30                                // ..NVD0

                Method (RL23, 0, NotSerialized)
                {
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x04, One)
                    Sleep (0x10)
                    Store (Zero, Local0)

   14076: 14 43 05 52 4C 32 33 00 52 44 43 41 4E 43 52 4E  // .C.RL23.RDCANCRN
   14086: 0A E2 0C FF FF FF FF 0A 04 01 5B 22 0A 10 70 00  // ..........["..p.
   14096: 60                                               // `

                    While (And (RDCA (NCRN, 0xE2, Zero, Zero, Zero), 0x04))
                    {

   14097: A2 1F 7B 52 44 43 41 4E 43 52 4E 0A E2 00 00 00  // ..{RDCANCRN.....
   140A7: 0A 04 00                                         // ...

                        If (LGreater (Local0, 0x04))
                        {

   140AA: A0 06 94 60 0A 04                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   140B0: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFFF, 0x08, One)
                }


   140B5: 75 60 52 44 43 41 4E 43 52 4E 0B 24 03 0C FF FF  // u`RDCANCRN.$....
   140C5: FF FF 0A 08 01                                   // .....

                Method (RLA, 0, NotSerialized)
                {
                    RDCA (NCRN, 0x0420, 0xBFFFFFFF, Zero, One)
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x08, One)
                    Sleep (0x10)
                    Store (Zero, Local0)

   140CA: 14 40 0A 52 4C 41 5F 00 52 44 43 41 4E 43 52 4E  // .@.RLA_.RDCANCRN
   140DA: 0B 20 04 0C FF FF FF BF 00 01 52 44 43 41 4E 43  // . ........RDCANC
   140EA: 52 4E 0A E2 0C FF FF FF FF 0A 08 01 5B 22 0A 10  // RN..........["..
   140FA: 70 00 60                                         // p.`

                    While (And (RDCA (NCRN, 0xE2, Zero, Zero, Zero), 0x08))
                    {

   140FD: A2 1F 7B 52 44 43 41 4E 43 52 4E 0A E2 00 00 00  // ..{RDCANCRN.....
   1410D: 0A 08 00                                         // ...

                        If (LGreater (Local0, 0x04))
                        {

   14110: A0 06 94 60 0A 04                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   14116: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0420, 0xFFFFFFFF, 0x40000000, One)
                    Store (Zero, Local0)

   1411B: 75 60 52 44 43 41 4E 43 52 4E 0B 20 04 0C FF FF  // u`RDCANCRN. ....
   1412B: FF FF 0C 00 00 00 40 01 70 00 60                 // ......@.p.`

                    While (LEqual (And (RDCA (NCRN, 0x52, Zero, Zero, Zero), 0x2000), Zero))
                    {

   14136: A2 22 93 7B 52 44 43 41 4E 43 52 4E 0A 52 00 00  // .".{RDCANCRN.R..
   14146: 00 0B 00 20 00 00                                // ... ..

                        If (LGreater (Local0, 0x08))
                        {

   1414C: A0 06 94 60 0A 08                                // ...`..

                            Break
                        }

                        Sleep (0x10)

   14152: A5 5B 22 0A 10                                   // .["..

                        Increment (Local0)
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFF7, Zero, One)
                }


   14157: 75 60 52 44 43 41 4E 43 52 4E 0B 24 03 0C F7 FF  // u`RDCANCRN.$....
   14167: FF FF 00 01                                      // ....

                Method (RPON, 0, Serialized)
                {
                    ADBG (
   1416B: 14 43 06 52 50 4F 4E 08 41 44 42 47              // .C.RPON.ADBG

Concatenate ("RPONs: ", ToHexString (_ADR)))

   14177: 73 0D 52 50 4F 4E 73 3A 20 00 98 5F 41 44 52 00  // s.RPONs: .._ADR.
   14187: 00                                               // .

                    If (LEqual (ID3C, Zero))
                    {
                        ADBG ("RPON: no D3C")

   14188: A0 1B 93 49 44 33 43 00 41 44 42 47 0D 52 50 4F  // ...ID3C.ADBG.RPO
   14198: 4E 3A 20 6E 6F 20 44 33 43 00                    // N: no D3C.

                        Return (Zero)
                    }

                    RSON (NRPN)
                    RLA ()
                    Sleep (0x64)
                    Store (Zero, ID3C) /* \_SB_.PCI0.SAT0.NVM3.ID3C */
                    ADBG (
   141A2: A4 00 52 53 4F 4E 4E 52 50 4E 52 4C 41 5F 5B 22  // ..RSONNRPNRLA_["
   141B2: 0A 64 70 00 49 44 33 43 41 44 42 47              // .dp.ID3CADBG

Concatenate ("RPONe: ", ToHexString (_ADR)))
                }


   141BE: 73 0D 52 50 4F 4E 65 3A 20 00 98 5F 41 44 52 00  // s.RPONe: .._ADR.
   141CE: 00                                               // .

                Method (RPOF, 0, Serialized)
                {
                    ADBG (
   141CF: 14 48 05 52 50 4F 46 08 41 44 42 47              // .H.RPOF.ADBG

Concatenate ("RPOFs: ", ToHexString (_ADR)))

   141DB: 73 0D 52 50 4F 46 73 3A 20 00 98 5F 41 44 52 00  // s.RPOFs: .._ADR.
   141EB: 00                                               // .

                    If (LEqual (ID3H, Zero))
                    {
                        ADBG ("RPOF: No D3H")

   141EC: A0 1C 93 49 44 33 48 00 41 44 42 47 0D 52 50 4F  // ...ID3H.ADBG.RPO
   141FC: 46 3A 20 4E 6F 20 44 33 48 00                    // F: No D3H.

                        BreakPoint

   14206: CC                                               // .

                        Return (Zero)
                    }


   14207: A4 00                                            // ..

                    If (LNot (D3CS (NRPN)))
                    {

   14209: A0 0C 92 44 33 43 53 4E 52 50 4E                 // ...D3CSNRPN

                        Return (Zero)
                    }

                    RL23 ()
                    RSOF (NRPN)

   14214: A4 00 52 4C 32 33 52 53 4F 46 4E 52 50 4E        // ..RL23RSOFNRPN

                    Store (One, ID3C) /* \_SB_.PCI0.SAT0.NVM3.ID3C */
                }


   14222: 70 01 49 44 33 43                                // p.ID3C

                Method (SAVC, 0, Serialized)
                {
                    ADBG (
   14228: 14 40 0C 53 41 56 43 08 41 44 42 47              // .@.SAVC.ADBG

Concatenate ("SAVC:", ToHexString (_ADR)))
                    Store (RDCA (NCRN, 0x04, Zero, Zero, 0x02), PCMD) /* \_SB_.PCI0.SAT0.NVM3.PCMD */

   14234: 73 0D 53 41 56 43 3A 00 98 5F 41 44 52 00 00 70  // s.SAVC:.._ADR..p
   14244: 52 44 43 41 4E 43 52 4E 0A 04 00 00 0A 02 50 43  // RDCANCRN......PC
   14254: 4D 44                                            // MD

                    If (LEqual (NITV, One))
                    {
                        Store (0x24, PRBI) /* \_SB_.PCI0.SAT0.NVM3.PRBI */

   14256: A0 21 93 4E 49 54 56 01 70 0A 24 50 52 42 49     // .!.NITV.p.$PRBI

                        Store (RDCA (NCRN, 0x24, Zero, Zero, 0x02), PRBD) /* \_SB_.PCI0.SAT0.NVM3.PRBD */
                    }

   14265: 70 52 44 43 41 4E 43 52 4E 0A 24 00 00 0A 02 50  // pRDCANCRN.$....P
   14275: 52 42 44                                         // RBD

                    ElseIf
   14278: A1 4A 06                                         // .J.

 (LEqual (NITV, 0x02))
                    {
                        Store (0x10, PRBI) /* \_SB_.PCI0.SAT0.NVM3.PRBI */
                        Store (RDCA (NCRN, 0x10, Zero, Zero, 0x02), PRBD) /* \_SB_.PCI0.SAT0.NVM3.PRBD */

   1427B: A0 47 06 93 4E 49 54 56 0A 02 70 0A 10 50 52 42  // .G..NITV..p..PRB
   1428B: 49 70 52 44 43 41 4E 43 52 4E 0A 10 00 00 0A 02  // IpRDCANCRN......
   1429B: 50 52 42 44                                      // PRBD

                        OperationRegion (MCRC, SystemMemory, Add (GPCB (), 0x000B833C), 0x04)

   1429F: 5B 80 4D 43 52 43 00 72 47 50 43 42 0C 3C 83 0B  // [.MCRC.rGPCB.<..
   142AF: 00 00 0A 04                                      // ....

                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }


   142B3: 5B 81 19 4D 43 52 43 00 53 43 53 4F 08 00 08 54  // [..MCRC.SCSO...T
   142C3: 43 53 4F 08 00 07 52 45 5F 5F 01                 // CSO...RE__.

                        Store (RDCA (NCRN, TCSO, Zero, Zero, 0x02), MXIE) /* \_SB_.PCI0.SAT0.NVM3.MXIE */
                    }


   142CE: 70 52 44 43 41 4E 43 52 4E 54 43 53 4F 00 00 0A  // pRDCANCRNTCSO...
   142DE: 02 4D 58 49 45                                   // .MXIE

                    Store (One, CSAV) /* \_SB_.PCI0.SAT0.NVM3.CSAV */
                }


   142E3: 70 01 43 53 41 56                                // p.CSAV

                Method (NVD3, 0, Serialized)
                {
                    ADBG (
   142E9: 14 45 07 4E 56 44 33 08 41 44 42 47              // .E.NVD3.ADBG

Concatenate ("NVD3:", ToHexString (_ADR)))

   142F5: 73 0D 4E 56 44 33 3A 00 98 5F 41 44 52 00 00     // s.NVD3:.._ADR..

                    If (LEqual (NITV, Zero))
                    {

   14304: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }


   1430C: A4 00                                            // ..

                    If (LEqual (ID3H, One))
                    {
                        ADBG ("Skip in D3")

   1430E: A0 19 93 49 44 33 48 01 41 44 42 47 0D 53 6B 69  // ...ID3H.ADBG.Ski
   1431E: 70 20 69 6E 20 44 33 00                          // p in D3.

                        Return (Zero)
                    }

                    SAVC ()
                    RDCA (NCRN, Add (NPMV, 0x04), 0xFFFFFFFC, 0x03, 0x03)
                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, 0x03, One)
                    Store (One, ID3H) /* \_SB_.PCI0.SAT0.NVM3.ID3H */

   14326: A4 00 53 41 56 43 52 44 43 41 4E 43 52 4E 72 4E  // ..SAVCRDCANCRNrN
   14336: 50 4D 56 0A 04 00 0C FC FF FF FF 0A 03 0A 03 52  // PMV............R
   14346: 44 43 41 4E 43 52 4E 0A A4 0C FC FF FF FF 0A 03  // DCANCRN.........
   14356: 01 70 01 49 44 33 48                             // .p.ID3H

                    Return (Zero)
                }


   1435D: A4 00                                            // ..

                Method (NVD0, 0, Serialized)
                {
                    ADBG (
   1435F: 14 48 10 4E 56 44 30 08 41 44 42 47              // .H.NVD0.ADBG

Concatenate ("NVD0:", ToHexString (_ADR)))

   1436B: 73 0D 4E 56 44 30 3A 00 98 5F 41 44 52 00 00     // s.NVD0:.._ADR..

                    If (LEqual (NITV, Zero))
                    {

   1437A: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }


   14382: A4 00                                            // ..

                    If (LEqual (ID3H, Zero))
                    {
                        ADBG ("Remap already in D0")

   14384: A0 22 93 49 44 33 48 00 41 44 42 47 0D 52 65 6D  // .".ID3H.ADBG.Rem
   14394: 61 70 20 61 6C 72 65 61 64 79 20 69 6E 20 44 30  // ap already in D0
   143A4: 00                                               // .

                        Return (Zero)
                    }

                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, Zero, One)
                    RDCA (NCRN, Add (NPMV, 0x04), 0xFFFFFFFC, Zero, 0x03)

   143A5: A4 00 52 44 43 41 4E 43 52 4E 0A A4 0C FC FF FF  // ..RDCANCRN......
   143B5: FF 00 01 52 44 43 41 4E 43 52 4E 72 4E 50 4D 56  // ...RDCANCRNrNPMV
   143C5: 0A 04 00 0C FC FF FF FF 00 0A 03                 // ...........

                    If (LEqual (CSAV, One))
                    {
                        CNRS ()

   143D0: A0 45 07 93 43 53 41 56 01 43 4E 52 53           // .E..CSAV.CNRS

                        If (LEqual (NITV, 0x02))
                        {

   143DD: A0 48 06 93 4E 49 54 56 0A 02                    // .H..NITV..

                            OperationRegion (MCRC, SystemMemory, Add (GPCB (), 0x000B833C), 0x04)

   143E7: 5B 80 4D 43 52 43 00 72 47 50 43 42 0C 3C 83 0B  // [.MCRC.rGPCB.<..
   143F7: 00 00 0A 04                                      // ....

                            Field (MCRC, AnyAcc, NoLock, Preserve)
                            {
                                SCSO,   8, 
                                Offset (0x02), 
                                TCSO,   8, 
                                    ,   7, 
                                RE,     1
                            }

                            RDCA (NCRN, TCSO, 0xFFFFFFFF, And (MXIE, 0x80000000), 0x03)
                            ADBG ("NVD0:  MSIXe")
                        }
                    }

   143FB: 5B 81 19 4D 43 52 43 00 53 43 53 4F 08 00 08 54  // [..MCRC.SCSO...T
   1440B: 43 53 4F 08 00 07 52 45 5F 5F 01 52 44 43 41 4E  // CSO...RE__.RDCAN
   1441B: 43 52 4E 54 43 53 4F 0C FF FF FF FF 7B 4D 58 49  // CRNTCSO.....{MXI
   1442B: 45 0C 00 00 00 80 00 0A 03 41 44 42 47 0D 4E 56  // E........ADBG.NV
   1443B: 44 30 3A 20 20 4D 53 49 58 65 00                 // D0:  MSIXe.

                    Else
                    {
                        ADBG ("Skip remap restore")
                    }

                    Store (Zero, ID3H) /* \_SB_.PCI0.SAT0.NVM3.ID3H */

   14446: A1 19 41 44 42 47 0D 53 6B 69 70 20 72 65 6D 61  // ..ADBG.Skip rema
   14456: 70 20 72 65 73 74 6F 72 65 00 70 00 49 44 33 48  // p restore.p.ID3H

                    Return (Zero)
                }


   14466: A4 00                                            // ..

                Method (CNRS, 0, Serialized)
                {
                    ADBG (
   14468: 14 43 25 43 4E 52 53 08 41 44 42 47              // .C%CNRS.ADBG

Concatenate ("CNRSs ", ToDecimalString (Timer)))

   14474: 73 0D 43 4E 52 53 73 20 00 97 5B 33 00 00        // s.CNRSs ..[3..

                    If (LEqual (NITV, Zero))
                    {

   14482: A0 09 93 4E 49 54 56 00                          // ...NITV.

                        Return (Zero)
                    }

                    RDCA (NCRN, 0x10, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x14, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x18, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x1C, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x20, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x24, Zero, Zero, 0x03)
                    RDCA (NCRN, PRBI, Zero, PRBD, 0x03)
                    RDCA (NCRN, 0x04, 0xFFFFFFF8, PCMD, 0x03)

   1448A: A4 00 52 44 43 41 4E 43 52 4E 0A 10 00 00 0A 03  // ..RDCANCRN......
   1449A: 52 44 43 41 4E 43 52 4E 0A 14 00 00 0A 03 52 44  // RDCANCRN......RD
   144AA: 43 41 4E 43 52 4E 0A 18 00 00 0A 03 52 44 43 41  // CANCRN......RDCA
   144BA: 4E 43 52 4E 0A 1C 00 00 0A 03 52 44 43 41 4E 43  // NCRN......RDCANC
   144CA: 52 4E 0A 20 00 00 0A 03 52 44 43 41 4E 43 52 4E  // RN. ....RDCANCRN
   144DA: 0A 24 00 00 0A 03 52 44 43 41 4E 43 52 4E 50 52  // .$....RDCANCRNPR
   144EA: 42 49 00 50 52 42 44 0A 03 52 44 43 41 4E 43 52  // BI.PRBD..RDCANCR
   144FA: 4E 0A 04 0C F8 FF FF FF 50 43 4D 44 0A 03        // N.......PCMD..

                    If (
   14508: A0 4E 05 92                                      // .N..

LNotEqual (NL1V, Zero))
                    {
                        RDCA (NCRN, Add (NL1V, 0x0C), 0xFFFFFF00, ND2V, 0x03)
                        RDCA (NCRN, Add (NL1V, 0x08), 0x0F, And (ND1V, 0xFFFFFFF0), 0x03)
                        RDCA (NCRN, Add (NL1V, 0x08), 0xFFFFFFFF, ND1V, 0x03)
                    }


   1450C: 93 4E 4C 31 56 00 52 44 43 41 4E 43 52 4E 72 4E  // .NL1V.RDCANCRNrN
   1451C: 4C 31 56 0A 0C 00 0C 00 FF FF FF 4E 44 32 56 0A  // L1V........ND2V.
   1452C: 03 52 44 43 41 4E 43 52 4E 72 4E 4C 31 56 0A 08  // .RDCANCRNrNL1V..
   1453C: 00 0A 0F 7B 4E 44 31 56 0C F0 FF FF FF 00 0A 03  // ...{ND1V........
   1454C: 52 44 43 41 4E 43 52 4E 72 4E 4C 31 56 0A 08 00  // RDCANCRNrNL1V...
   1455C: 0C FF FF FF FF 4E 44 31 56 0A 03                 // .....ND1V..

                    If (
   14567: A0 23 92                                         // .#.

LNotEqual (NLRV, Zero))
                    {
                        RDCA (NCRN, Add (NLRV, 0x04), 0xFFFFFFFF, NLDV, 0x03)
                    }

                    RDCA (NCRN, Add (NPCV, 0x10), 0xFFFFFEBF, And (NEAV, 0xFFFC), 0x03)
                    RDCA (NCRN, Add (NPCV, 0x28), 0xFFFFFBFF, NECV, 0x03)
                    RDCA (NCRN, Add (NPCV, 0x08), 0xFFFFFF1F, NEBV, 0x03)
                    RDCA (NCRN, 0x68, 0xFFFFFBFF, NRAV, One)

   1456A: 93 4E 4C 52 56 00 52 44 43 41 4E 43 52 4E 72 4E  // .NLRV.RDCANCRNrN
   1457A: 4C 52 56 0A 04 00 0C FF FF FF FF 4E 4C 44 56 0A  // LRV........NLDV.
   1458A: 03 52 44 43 41 4E 43 52 4E 72 4E 50 43 56 0A 10  // .RDCANCRNrNPCV..
   1459A: 00 0C BF FE FF FF 7B 4E 45 41 56 0B FC FF 00 0A  // ......{NEAV.....
   145AA: 03 52 44 43 41 4E 43 52 4E 72 4E 50 43 56 0A 28  // .RDCANCRNrNPCV.(
   145BA: 00 0C FF FB FF FF 4E 45 43 56 0A 03 52 44 43 41  // ......NECV..RDCA
   145CA: 4E 43 52 4E 72 4E 50 43 56 0A 08 00 0C 1F FF FF  // NCRNrNPCV.......
   145DA: FF 4E 45 42 56 0A 03 52 44 43 41 4E 43 52 4E 0A  // .NEBV..RDCANCRN.
   145EA: 68 0C FF FB FF FF 4E 52 41 56 01                 // h.....NRAV.

                    If (LEqual (And (NEAV, 0x40), 0x40))
                    {
                        RDCA (NCRN, 0x50, 0xFFFFFFDF, 0x20, One)
                        ADBG (
   145F5: A0 4B 04 93 7B 4E 45 41 56 0A 40 00 0A 40 52 44  // .K..{NEAV.@..@RD
   14605: 43 41 4E 43 52 4E 0A 50 0C DF FF FF FF 0A 20 01  // CANCRN.P...... .
   14615: 41 44 42 47                                      // ADBG

Concatenate ("CNRSw ", ToDecimalString (Timer)))

   14619: 73 0D 43 4E 52 53 77 20 00 97 5B 33 00 00        // s.CNRSw ..[3..

                        While (LEqual (And (RDCA (NCRN, 0x52, Zero, Zero, Zero), 0x2000), Zero))
                        {

   14627: A2 19 93 7B 52 44 43 41 4E 43 52 4E 0A 52 00 00  // ...{RDCANCRN.R..
   14637: 00 0B 00 20 00 00                                // ... ..

                            Stall (0x0A)
                        }
                    }

                    ADBG (
   1463D: 5B 21 0A 0A 41 44 42 47                          // [!..ADBG

Concatenate ("CNRSx ", ToDecimalString (Timer)))
                    RDCA (NCRN, Add (NPCV, 0x10), 0xFFFFFFFC, And (NEAV, 0x03), 0x03)

   14645: 73 0D 43 4E 52 53 78 20 00 97 5B 33 00 00 52 44  // s.CNRSx ..[3..RD
   14655: 43 41 4E 43 52 4E 72 4E 50 43 56 0A 10 00 0C FC  // CANCRNrNPCV.....
   14665: FF FF FF 7B 4E 45 41 56 0A 03 00 0A 03           // ...{NEAV.....

                    If (
   14672: A0 1B 92                                         // ...

LNotEqual (NMVV, Zero))
                    {
                        RDCA (NCRN, NMBV, Zero, NMVV, 0x03)
                    }


   14675: 93 4E 4D 56 56 00 52 44 43 41 4E 43 52 4E 4E 4D  // .NMVV.RDCANCRNNM
   14685: 42 56 00 4E 4D 56 56 0A 03                       // BV.NMVV..

                    If (
   1468E: A0 1B 92                                         // ...

LNotEqual (NPVV, Zero))
                    {
                        RDCA (NCRN, NPBV, Zero, NPVV, 0x03)
                    }

                    ADBG (
   14691: 93 4E 50 56 56 00 52 44 43 41 4E 43 52 4E 4E 50  // .NPVV.RDCANCRNNP
   146A1: 42 56 00 4E 50 56 56 0A 03 41 44 42 47           // BV.NPVV..ADBG

Concatenate ("CNRSe ", ToDecimalString (Timer)))
                }
            }


   146AE: 73 0D 43 4E 52 53 65 20 00 97 5B 33 00 00        // s.CNRSe ..[3..

            Method (RDCA, 5, Serialized)
            {

   146BC: 14 4D 0F 52 44 43 41 0D                          // .M.RDCA.


   146C4: 08 5F 54 5F 30 00                                // ._T_0.

                OperationRegion (RPAL, SystemMemory, Add (GPCB (), Add (0x000B8100, Arg1)), 0x04)

   146CA: 5B 80 52 50 41 4C 00 72 47 50 43 42 72 0C 00 81  // [.RPAL.rGPCBr...
   146DA: 0B 00 69 00 00 0A 04                             // ..i....

                Field (RPAL, DWordAcc, Lock, Preserve)
                {
                    RPCD,   32
                }


   146E1: 5B 81 0B 52 50 41 4C 13 52 50 43 44 20           // [..RPAL.RPCD 

                OperationRegion (EPAC, SystemMemory, Add (GPCB (), 0x000B8308), 0x08)

   146EE: 5B 80 45 50 41 43 00 72 47 50 43 42 0C 08 83 0B  // [.EPAC.rGPCB....
   146FE: 00 00 0A 08                                      // ....

                Field (EPAC, DWordAcc, Lock, Preserve)
                {
                    CAIR,   32, 
                    CADR,   32
                }


   14702: 5B 81 10 45 50 41 43 13 43 41 49 52 20 43 41 44  // [..EPAC.CAIR CAD
   14712: 52 20                                            // R 

                OperationRegion (NCRG, SystemMemory, Add (GPCB (), 0x000B8FC0), 0x04)

   14714: 5B 80 4E 43 52 47 00 72 47 50 43 42 0C C0 8F 0B  // [.NCRG.rGPCB....
   14724: 00 00 0A 04                                      // ....

                Field (NCRG, DWordAcc, Lock, Preserve)
                {
                    CRGC,   32
                }


   14728: 5B 81 0B 4E 43 52 47 13 43 52 47 43 20           // [..NCRG.CRGC 

                If (LGreater (Arg0, 0x02))
                {

   14735: A0 07 94 68 0A 02                                // ...h..

                    Return (Zero)
                }

   1473B: A4 00                                            // ..

                Else
                {

   1473D: A1 07                                            // ..

                    Store (Arg0, CRGC) /* \_SB_.PCI0.SAT0.RDCA.CRGC */
                }


   1473F: 70 68 43 52 47 43                                // phCRGC

                Switch (ToInteger (Arg4))
                {

   14745: A2 42 07 01 70 99 6C 00 5F 54 5F 30              // .B..p.l._T_0

                    Case (Zero)
                    {

   14751: A0 0C 93 5F 54 5F 30 00                          // ..._T_0.

                        Return (RPCD) /* \_SB_.PCI0.SAT0.RDCA.RPCD */
                    }

   14759: A4 52 50 43 44                                   // .RPCD

                    Case
   1475E: A1 48 05                                         // .H.

 (0x02)
                    {
                        Store (Arg1, CAIR) /* \_SB_.PCI0.SAT0.RDCA.CAIR */

   14761: A0 13 93 5F 54 5F 30 0A 02 70 69 43 41 49 52     // ..._T_0..piCAIR

                        Return (CADR) /* \_SB_.PCI0.SAT0.RDCA.CADR */
                    }

   14770: A4 43 41 44 52                                   // .CADR

                    Case
   14775: A1 41 04                                         // .A.

 (One)
                    {
                        And (Arg2, RPCD, Local0)
                        Or (Arg3, Local0, Local0)

   14778: A0 18 93 5F 54 5F 30 01 7B 6A 52 50 43 44 60 7D  // ..._T_0.{jRPCD`}
   14788: 6B 60 60                                         // k``

                        Store (Local0, RPCD) /* \_SB_.PCI0.SAT0.RDCA.RPCD */
                    }

   1478B: 70 60 52 50 43 44                                // p`RPCD

                    Case
   14791: A1 25                                            // .%

 (0x03)
                    {
                        Store (Arg1, CAIR) /* \_SB_.PCI0.SAT0.RDCA.CAIR */
                        And (Arg2, CADR, Local0)
                        Or (Arg3, Local0, Local0)

   14793: A0 1F 93 5F 54 5F 30 0A 03 70 69 43 41 49 52 7B  // ..._T_0..piCAIR{
   147A3: 6A 43 41 44 52 60 7D 6B 60 60                    // jCADR`}k``

                        Store (Local0, CADR) /* \_SB_.PCI0.SAT0.RDCA.CADR */
                    }

   147AD: 70 60 43 41 44 52                                // p`CADR

                    Default
                    {

   147B3: A1 03                                            // ..

                        Return (Zero)
                    }


   147B5: A4 00                                            // ..

                }


   147B7: A5                                               // .

                Return (Zero)
            }


   147B8: A4 00                                            // ..

            Method (D3CS, 1, Serialized)
            {

   147BA: 14 42 19 44 33 43 53 09                          // .B.D3CS.


   147C2: 08 5F 54 5F 30 00                                // ._T_0.

                Switch (Arg0)
                {

   147C8: A2 42 18 01 70 68 5F 54 5F 30                    // .B..ph_T_0

                    Case (0x04)
                    {

   147D2: A0 22 93 5F 54 5F 30 0A 04                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP05.POFF))
                        {

   147DB: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   147EB: 50 30 35 50 4F 46 46 00                          // P05POFF.

                            Return (One)
                        }
                    }

   147F3: A4 01                                            // ..

                    Case
   147F5: A1 44 15                                         // .D.

 (0x06)
                    {

   147F8: A0 22 93 5F 54 5F 30 0A 06                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP07.POFF))
                        {

   14801: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   14811: 50 30 37 50 4F 46 46 00                          // P07POFF.

                            Return (One)
                        }
                    }

   14819: A4 01                                            // ..

                    Case
   1481B: A1 4E 12                                         // .N.

 (0x08)
                    {

   1481E: A0 22 93 5F 54 5F 30 0A 08                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP09.POFF))
                        {

   14827: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   14837: 50 30 39 50 4F 46 46 00                          // P09POFF.

                            Return (One)
                        }
                    }

   1483F: A4 01                                            // ..

                    Case
   14841: A1 48 10                                         // .H.

 (0x0A)
                    {

   14844: A0 22 93 5F 54 5F 30 0A 0A                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP11.POFF))
                        {

   1484D: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   1485D: 50 31 31 50 4F 46 46 00                          // P11POFF.

                            Return (One)
                        }
                    }

   14865: A4 01                                            // ..

                    Case
   14867: A1 42 0E                                         // .B.

 (0x0C)
                    {

   1486A: A0 22 93 5F 54 5F 30 0A 0C                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP13.POFF))
                        {

   14873: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   14883: 50 31 33 50 4F 46 46 00                          // P13POFF.

                            Return (One)
                        }
                    }

   1488B: A4 01                                            // ..

                    Case
   1488D: A1 4C 0B                                         // .L.

 (0x0E)
                    {

   14890: A0 22 93 5F 54 5F 30 0A 0E                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP15.POFF))
                        {

   14899: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   148A9: 50 31 35 50 4F 46 46 00                          // P15POFF.

                            Return (One)
                        }
                    }

   148B1: A4 01                                            // ..

                    Case
   148B3: A1 46 09                                         // .F.

 (0x10)
                    {

   148B6: A0 22 93 5F 54 5F 30 0A 10                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP17.POFF))
                        {

   148BF: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   148CF: 50 31 37 50 4F 46 46 00                          // P17POFF.

                            Return (One)
                        }
                    }

   148D7: A4 01                                            // ..

                    Case
   148D9: A1 40 07                                         // .@.

 (0x12)
                    {

   148DC: A0 22 93 5F 54 5F 30 0A 12                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP19.POFF))
                        {

   148E5: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   148F5: 50 31 39 50 4F 46 46 00                          // P19POFF.

                            Return (One)
                        }
                    }

   148FD: A4 01                                            // ..

                    Case
   148FF: A1 4A 04                                         // .J.

 (0x14)
                    {

   14902: A0 22 93 5F 54 5F 30 0A 14                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP21.POFF))
                        {

   1490B: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   1491B: 50 32 31 50 4F 46 46 00                          // P21POFF.

                            Return (One)
                        }
                    }

   14923: A4 01                                            // ..

                    Case
   14925: A1 24                                            // .$

 (0x16)
                    {

   14927: A0 22 93 5F 54 5F 30 0A 16                       // ."._T_0..

                        If (CondRefOf (\_SB.PCI0.RP23.POFF))
                        {

   14930: A0 19 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ..[.\/._SB_PCI0R
   14940: 50 32 33 50 4F 46 46 00                          // P23POFF.

                            Return (One)
                        }
                    }


   14948: A4 01                                            // ..

                }


   1494A: A5                                               // .

                Return (Zero)
            }


   1494B: A4 00                                            // ..

            Method (RSON, 1, Serialized)
            {

   1494D: 14 4A 1E 52 53 4F 4E 09                          // .J.RSON.


   14955: 08 5F 54 5F 30 00                                // ._T_0.

                Switch (Arg0)
                {

   1495B: A2 4C 1D 01 70 68 5F 54 5F 30                    // .L..ph_T_0

                    Case (0x04)
                    {

   14965: A0 2B 93 5F 54 5F 30 0A 04                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP05.PON))
                        {
                            ^^RP05.PON ()
                        }
                    }

   1496E: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   1497E: 50 30 35 50 4F 4E 5F 00 5E 5E 2E 52 50 30 35 50  // P05PON_.^^.RP05P
   1498E: 4F 4E 5F                                         // ON_

                    Case
   14991: A1 45 1A                                         // .E.

 (0x06)
                    {

   14994: A0 2B 93 5F 54 5F 30 0A 06                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP07.PON))
                        {
                            ^^RP07.PON ()
                        }
                    }

   1499D: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   149AD: 50 30 37 50 4F 4E 5F 00 5E 5E 2E 52 50 30 37 50  // P07PON_.^^.RP07P
   149BD: 4F 4E 5F                                         // ON_

                    Case
   149C0: A1 46 17                                         // .F.

 (0x08)
                    {

   149C3: A0 2B 93 5F 54 5F 30 0A 08                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP09.PON))
                        {
                            ^^RP09.PON ()
                        }
                    }

   149CC: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   149DC: 50 30 39 50 4F 4E 5F 00 5E 5E 2E 52 50 30 39 50  // P09PON_.^^.RP09P
   149EC: 4F 4E 5F                                         // ON_

                    Case
   149EF: A1 47 14                                         // .G.

 (0x0A)
                    {

   149F2: A0 2B 93 5F 54 5F 30 0A 0A                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP11.PON))
                        {
                            ^^RP11.PON ()
                        }
                    }

   149FB: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14A0B: 50 31 31 50 4F 4E 5F 00 5E 5E 2E 52 50 31 31 50  // P11PON_.^^.RP11P
   14A1B: 4F 4E 5F                                         // ON_

                    Case
   14A1E: A1 48 11                                         // .H.

 (0x0C)
                    {

   14A21: A0 2B 93 5F 54 5F 30 0A 0C                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP13.PON))
                        {
                            ^^RP13.PON ()
                        }
                    }

   14A2A: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14A3A: 50 31 33 50 4F 4E 5F 00 5E 5E 2E 52 50 31 33 50  // P13PON_.^^.RP13P
   14A4A: 4F 4E 5F                                         // ON_

                    Case
   14A4D: A1 49 0E                                         // .I.

 (0x0E)
                    {

   14A50: A0 2B 93 5F 54 5F 30 0A 0E                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP15.PON))
                        {
                            ^^RP15.PON ()
                        }
                    }

   14A59: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14A69: 50 31 35 50 4F 4E 5F 00 5E 5E 2E 52 50 31 35 50  // P15PON_.^^.RP15P
   14A79: 4F 4E 5F                                         // ON_

                    Case
   14A7C: A1 4A 0B                                         // .J.

 (0x10)
                    {

   14A7F: A0 2B 93 5F 54 5F 30 0A 10                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP17.PON))
                        {
                            ^^RP17.PON ()
                        }
                    }

   14A88: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14A98: 50 31 37 50 4F 4E 5F 00 5E 5E 2E 52 50 31 37 50  // P17PON_.^^.RP17P
   14AA8: 4F 4E 5F                                         // ON_

                    Case
   14AAB: A1 4B 08                                         // .K.

 (0x12)
                    {

   14AAE: A0 2B 93 5F 54 5F 30 0A 12                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP19.PON))
                        {
                            ^^RP19.PON ()
                        }
                    }

   14AB7: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14AC7: 50 31 39 50 4F 4E 5F 00 5E 5E 2E 52 50 31 39 50  // P19PON_.^^.RP19P
   14AD7: 4F 4E 5F                                         // ON_

                    Case
   14ADA: A1 4C 05                                         // .L.

 (0x14)
                    {

   14ADD: A0 2B 93 5F 54 5F 30 0A 14                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP21.PON))
                        {
                            ^^RP21.PON ()
                        }
                    }

   14AE6: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14AF6: 50 32 31 50 4F 4E 5F 00 5E 5E 2E 52 50 32 31 50  // P21PON_.^^.RP21P
   14B06: 4F 4E 5F                                         // ON_

                    Case
   14B09: A1 2D                                            // .-

 (0x16)
                    {

   14B0B: A0 2B 93 5F 54 5F 30 0A 16                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP23.PON))
                        {
                            ^^RP23.PON ()
                        }
                    }


   14B14: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14B24: 50 32 33 50 4F 4E 5F 00 5E 5E 2E 52 50 32 33 50  // P23PON_.^^.RP23P
   14B34: 4F 4E 5F                                         // ON_

                }
            }


   14B37: A5                                               // .

            Method (RSOF, 1, Serialized)
            {

   14B38: 14 4A 1E 52 53 4F 46 09                          // .J.RSOF.


   14B40: 08 5F 54 5F 30 00                                // ._T_0.

                Switch (Arg0)
                {

   14B46: A2 4C 1D 01 70 68 5F 54 5F 30                    // .L..ph_T_0

                    Case (0x04)
                    {

   14B50: A0 2B 93 5F 54 5F 30 0A 04                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP05.POFF))
                        {
                            ^^RP05.POFF ()
                        }
                    }

   14B59: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14B69: 50 30 35 50 4F 46 46 00 5E 5E 2E 52 50 30 35 50  // P05POFF.^^.RP05P
   14B79: 4F 46 46                                         // OFF

                    Case
   14B7C: A1 45 1A                                         // .E.

 (0x06)
                    {

   14B7F: A0 2B 93 5F 54 5F 30 0A 06                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP07.POFF))
                        {
                            ^^RP07.POFF ()
                        }
                    }

   14B88: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14B98: 50 30 37 50 4F 46 46 00 5E 5E 2E 52 50 30 37 50  // P07POFF.^^.RP07P
   14BA8: 4F 46 46                                         // OFF

                    Case
   14BAB: A1 46 17                                         // .F.

 (0x08)
                    {

   14BAE: A0 2B 93 5F 54 5F 30 0A 08                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP09.POFF))
                        {
                            ^^RP09.POFF ()
                        }
                    }

   14BB7: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14BC7: 50 30 39 50 4F 46 46 00 5E 5E 2E 52 50 30 39 50  // P09POFF.^^.RP09P
   14BD7: 4F 46 46                                         // OFF

                    Case
   14BDA: A1 47 14                                         // .G.

 (0x0A)
                    {

   14BDD: A0 2B 93 5F 54 5F 30 0A 0A                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP11.POFF))
                        {
                            ^^RP11.POFF ()
                        }
                    }

   14BE6: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14BF6: 50 31 31 50 4F 46 46 00 5E 5E 2E 52 50 31 31 50  // P11POFF.^^.RP11P
   14C06: 4F 46 46                                         // OFF

                    Case
   14C09: A1 48 11                                         // .H.

 (0x0C)
                    {

   14C0C: A0 2B 93 5F 54 5F 30 0A 0C                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP13.POFF))
                        {
                            ^^RP13.POFF ()
                        }
                    }

   14C15: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14C25: 50 31 33 50 4F 46 46 00 5E 5E 2E 52 50 31 33 50  // P13POFF.^^.RP13P
   14C35: 4F 46 46                                         // OFF

                    Case
   14C38: A1 49 0E                                         // .I.

 (0x0E)
                    {

   14C3B: A0 2B 93 5F 54 5F 30 0A 0E                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP15.POFF))
                        {
                            ^^RP15.POFF ()
                        }
                    }

   14C44: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14C54: 50 31 35 50 4F 46 46 00 5E 5E 2E 52 50 31 35 50  // P15POFF.^^.RP15P
   14C64: 4F 46 46                                         // OFF

                    Case
   14C67: A1 4A 0B                                         // .J.

 (0x10)
                    {

   14C6A: A0 2B 93 5F 54 5F 30 0A 10                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP17.POFF))
                        {
                            ^^RP17.POFF ()
                        }
                    }

   14C73: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14C83: 50 31 37 50 4F 46 46 00 5E 5E 2E 52 50 31 37 50  // P17POFF.^^.RP17P
   14C93: 4F 46 46                                         // OFF

                    Case
   14C96: A1 4B 08                                         // .K.

 (0x12)
                    {

   14C99: A0 2B 93 5F 54 5F 30 0A 12                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP19.POFF))
                        {
                            ^^RP19.POFF ()
                        }
                    }

   14CA2: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14CB2: 50 31 39 50 4F 46 46 00 5E 5E 2E 52 50 31 39 50  // P19POFF.^^.RP19P
   14CC2: 4F 46 46                                         // OFF

                    Case
   14CC5: A1 4C 05                                         // .L.

 (0x14)
                    {

   14CC8: A0 2B 93 5F 54 5F 30 0A 14                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP21.POFF))
                        {
                            ^^RP21.POFF ()
                        }
                    }

   14CD1: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14CE1: 50 32 31 50 4F 46 46 00 5E 5E 2E 52 50 32 31 50  // P21POFF.^^.RP21P
   14CF1: 4F 46 46                                         // OFF

                    Case
   14CF4: A1 2D                                            // .-

 (0x16)
                    {

   14CF6: A0 2B 93 5F 54 5F 30 0A 16                       // .+._T_0..

                        If (CondRefOf (\_SB.PCI0.RP23.POFF))
                        {
                            ^^RP23.POFF ()
                        }
                    }


   14CFF: A0 22 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // ."[.\/._SB_PCI0R
   14D0F: 50 32 33 50 4F 46 46 00 5E 5E 2E 52 50 32 33 50  // P23POFF.^^.RP23P
   14D1F: 4F 46 46                                         // OFF

                }
            }


   14D22: A5                                               // .

            Name (VL0M, Zero)

   14D23: 08 56 4C 30 4D 00                                // .VL0M.

            Name (VL1M, Zero)

   14D29: 08 56 4C 31 4D 00                                // .VL1M.

            Name (VL2M, Zero)

   14D2F: 08 56 4C 32 4D 00                                // .VL2M.

            Name (VR3A, One)

   14D35: 08 56 52 33 41 01                                // .VR3A.

            Method (IRM, 1, NotSerialized)
            {

   14D3B: 14 2F 49 52 4D 5F 01                             // ./IRM_.

                If (And (VL0M, Arg0))
                {

   14D42: A0 0A 7B 56 4C 30 4D 68 00                       // ..{VL0Mh.

                    Return (One)
                }

   14D4B: A4 01                                            // ..

                ElseIf
   14D4D: A1 1D                                            // ..

 (And (VL1M, Arg0))
                {

   14D4F: A0 0A 7B 56 4C 31 4D 68 00                       // ..{VL1Mh.

                    Return (One)
                }

   14D58: A4 01                                            // ..

                ElseIf
   14D5A: A1 10                                            // ..

 (And (VL2M, Arg0))
                {

   14D5C: A0 0A 7B 56 4C 32 4D 68 00                       // ..{VL2Mh.

                    Return (One)
                }

   14D65: A4 01                                            // ..

                Else
                {

   14D67: A1 03                                            // ..

                    Return (Zero)
                }
            }


   14D69: A4 00                                            // ..

            Method (PD3C, 1, NotSerialized)
            {

   14D6B: 14 12 50 44 33 43 01                             // ..PD3C.

                Return (
   14D72: A4                                               // .

LOr (LNot (VR3A), IRM (Arg0)))
            }


   14D73: 91 92 56 52 33 41 49 52 4D 5F 68                 // ..VR3AIRM_h

            Scope (PRT0)
            {

   14D7E: 10 12 50 52 54 30                                // ..PRT0

                Method (IR3D, 0, NotSerialized)
                {

   14D84: 14 0C 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (One))
                }
            }


   14D8B: A4 50 44 33 43 01                                // .PD3C.

            Scope (PRT1)
            {

   14D91: 10 13 50 52 54 31                                // ..PRT1

                Method (IR3D, 0, NotSerialized)
                {

   14D97: 14 0D 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x02))
                }
            }


   14D9E: A4 50 44 33 43 0A 02                             // .PD3C..

            Scope (PRT2)
            {

   14DA5: 10 13 50 52 54 32                                // ..PRT2

                Method (IR3D, 0, NotSerialized)
                {

   14DAB: 14 0D 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x04))
                }
            }


   14DB2: A4 50 44 33 43 0A 04                             // .PD3C..

            Scope (PRT3)
            {

   14DB9: 10 13 50 52 54 33                                // ..PRT3

                Method (IR3D, 0, NotSerialized)
                {

   14DBF: 14 0D 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x08))
                }
            }


   14DC6: A4 50 44 33 43 0A 08                             // .PD3C..

            Scope (PRT4)
            {

   14DCD: 10 13 50 52 54 34                                // ..PRT4

                Method (IR3D, 0, NotSerialized)
                {

   14DD3: 14 0D 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x10))
                }
            }


   14DDA: A4 50 44 33 43 0A 10                             // .PD3C..

            Scope (PRT5)
            {

   14DE1: 10 13 50 52 54 35                                // ..PRT5

                Method (IR3D, 0, NotSerialized)
                {

   14DE7: 14 0D 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x20))
                }
            }


   14DEE: A4 50 44 33 43 0A 20                             // .PD3C. 

            Scope (NVM1)
            {

   14DF5: 10 14 4E 56 4D 31                                // ..NVM1

                Method (IR3D, 0, NotSerialized)
                {

   14DFB: 14 0E 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x0100))
                }
            }


   14E02: A4 50 44 33 43 0B 00 01                          // .PD3C...

            Scope (NVM2)
            {

   14E0A: 10 14 4E 56 4D 32                                // ..NVM2

                Method (IR3D, 0, NotSerialized)
                {

   14E10: 14 0E 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x0200))
                }
            }


   14E17: A4 50 44 33 43 0B 00 02                          // .PD3C...

            Scope (NVM3)
            {

   14E1F: 10 14 4E 56 4D 33                                // ..NVM3

                Method (IR3D, 0, NotSerialized)
                {

   14E25: 14 0E 49 52 33 44 00                             // ..IR3D.

                    Return (PD3C (0x0400))
                }
            }


   14E2C: A4 50 44 33 43 0B 00 04                          // .PD3C...

            Method (RSTD, 5, Serialized)
            {

   14E34: 14 4B 16 52 53 54 44 0D                          // .K.RSTD.


   14E3C: 08 5F 54 5F 30 00                                // ._T_0.

                If (LEqual (Arg0, 
   14E42: A0 46 15 93 68                                   // .F..h

ToUUID ("e03e3431-e510-4fa2-abc0-2d7e901245fe") /* Unknown UUID */))
                {

   14E47: 11 13 0A 10 31 34 3E E0 10 E5 A2 4F AB C0 2D 7E  // ....14>....O..-~
   14E57: 90 12 45 FE                                      // ..E.

                    Switch (ToInteger (Arg2))
                    {

   14E5B: A2 4D 13 01 70 99 6A 00 5F 54 5F 30              // .M..p.j._T_0

                        Case (Zero)
                        {

   14E67: A0 26 93 5F 54 5F 30 00                          // .&._T_0.

                            Name (RBUF, 
   14E6F: 08 52 42 55 46                                   // .RBUF

Buffer (One)
                            {
                                 0x00                                             // .
                            })

   14E74: 11 03 01 00                                      // ....

                            CreateByteField (RBUF, Zero, SFUN)
                            Store (0x3F, SFUN) /* \_SB_.PCI0.SAT0.RSTD.SFUN */

   14E78: 8C 52 42 55 46 00 53 46 55 4E 70 0A 3F 53 46 55  // .RBUF.SFUNp.?SFU
   14E88: 4E                                               // N

                            Return (RBUF) /* \_SB_.PCI0.SAT0.RSTD.RBUF */
                        }

   14E89: A4 52 42 55 46                                   // .RBUF

                        Case
   14E8E: A1 49 10                                         // .I.

 (One)
                        {
                            Store (DerefOf (
   14E91: A0 2E 93 5F 54 5F 30 01 70 83                    // ..._T_0.p.

Index (Arg3, Zero)), Arg4)
                            Store (DerefOf (
   14E9B: 88 6B 00 00 6C 70 83                             // .k..lp.

Index (Arg3, Zero)), Local0)
                            ADBG (
   14EA2: 88 6B 00 00 60 41 44 42 47                       // .k..`ADBG

Concatenate ("RSTD.SET:", ToHexString (Local0)))

   14EAB: 73 0D 52 53 54 44 2E 53 45 54 3A 00 98 60 00 00  // s.RSTD.SET:..`..

                            Return (
   14EBB: A4                                               // .

Package (0x01)
                            {
                                Zero
                            })
                        }

   14EBC: 12 03 01 00                                      // ....

                        Case
   14EC0: A1 47 0D                                         // .G.

 (0x02)
                        {
                            Store (DerefOf (
   14EC3: A0 2C 93 5F 54 5F 30 0A 02 70 83                 // .,._T_0..p.

Index (Arg3, Zero)), Local0)
                            ADBG (
   14ECE: 88 6B 00 00 60 41 44 42 47                       // .k..`ADBG

Concatenate ("RSTD.ON:", ToHexString (Local0)))
                            CPON (Local0)

   14ED7: 73 0D 52 53 54 44 2E 4F 4E 3A 00 98 60 00 00 43  // s.RSTD.ON:..`..C
   14EE7: 50 4F 4E 60                                      // PON`

                            Return (
   14EEB: A4                                               // .

Package (0x01)
                            {
                                Zero
                            })
                        }

   14EEC: 12 03 01 00                                      // ....

                        Case
   14EF0: A1 47 0A                                         // .G.

 (0x03)
                        {
                            Store (DerefOf (
   14EF3: A0 2D 93 5F 54 5F 30 0A 03 70 83                 // .-._T_0..p.

Index (Arg3, Zero)), Local0)
                            ADBG (
   14EFE: 88 6B 00 00 60 41 44 42 47                       // .k..`ADBG

Concatenate ("RSTD.OFF:", ToHexString (Local0)))
                            CPOF (Local0)

   14F07: 73 0D 52 53 54 44 2E 4F 46 46 3A 00 98 60 00 00  // s.RSTD.OFF:..`..
   14F17: 43 50 4F 46 60                                   // CPOF`

                            Return (
   14F1C: A4                                               // .

Package (0x01)
                            {
                                Zero
                            })
                        }

   14F1D: 12 03 01 00                                      // ....

                        Case
   14F21: A1 46 07                                         // .F.

 (0x04)
                        {

   14F24: A0 3D 93 5F 54 5F 30 0A 04                       // .=._T_0..

                            Name (GETM, 
   14F2D: 08 47 45 54 4D                                   // .GETM

Buffer (One)
                            {
                                 0x00                                             // .
                            })

   14F32: 11 03 01 00                                      // ....

                            CreateByteField (GETM, Zero, GMSK)
                            Store (Arg4, GMSK) /* \_SB_.PCI0.SAT0.RSTD.GMSK */
                            ADBG (
   14F36: 8C 47 45 54 4D 00 47 4D 53 4B 70 6C 47 4D 53 4B  // .GETM.GMSKplGMSK
   14F46: 41 44 42 47                                      // ADBG

Concatenate ("RSTD.GET:", ToHexString (GMSK)))

   14F4A: 73 0D 52 53 54 44 2E 47 45 54 3A 00 98 47 4D 53  // s.RSTD.GET:..GMS
   14F5A: 4B 00 00                                         // K..

                            Return (GETM) /* \_SB_.PCI0.SAT0.RSTD.GETM */
                        }

   14F5D: A4 47 45 54 4D                                   // .GETM

                        Case
   14F62: A1 35                                            // .5

 (0x05)
                        {
                            Store (DerefOf (
   14F64: A0 2B 93 5F 54 5F 30 0A 05 70 83                 // .+._T_0..p.

Index (Arg3, Zero)), VR3A) /* \_SB_.PCI0.SAT0.VR3A */
                            ADBG (
   14F6F: 88 6B 00 00 56 52 33 41 41 44 42 47              // .k..VR3AADBG

Concatenate ("RSTD.D3A:", ToHexString (VR3A)))

   14F7B: 73 0D 52 53 54 44 2E 44 33 41 3A 00 98 56 52 33  // s.RSTD.D3A:..VR3
   14F8B: 41 00 00                                         // A..

                            Return (Zero)
                        }

   14F8E: A4 00                                            // ..

                        Default
                        {

   14F90: A1 07                                            // ..

                            Return (
   14F92: A4                                               // .

Package (0x01)
                            {
                                0x02
                            })
                        }


   14F93: 12 04 01 0A 02                                   // .....

                    }
                }

   14F98: A5                                               // .

                Else
                {

   14F99: A1 06                                            // ..

                    Return (
   14F9B: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }


   14F9C: 11 03 01 00                                      // ....

            Method (CPON, 1, Serialized)
            {

   14FA0: 14 4C 21 43 50 4F 4E 09                          // .L!CPON.

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT0.SPON), 
   14FA8: A0 2A 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .*.[.\/._SB_PCI0
   14FB8: 53 41 54 30 50 52 54 30 53 50 4F 4E 00           // SAT0PRT0SPON.

And (Arg0, One)))
                {
                    ^PRT0.SPON ()
                }


   14FC5: 7B 68 01 00 5E 2E 50 52 54 30 53 50 4F 4E        // {h..^.PRT0SPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT1.SPON), 
   14FD3: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   14FE3: 53 41 54 30 50 52 54 31 53 50 4F 4E 00           // SAT0PRT1SPON.

And (Arg0, 0x02)))
                {
                    ^PRT1.SPON ()
                }


   14FF0: 7B 68 0A 02 00 5E 2E 50 52 54 31 53 50 4F 4E     // {h...^.PRT1SPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT2.SPON), 
   14FFF: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   1500F: 53 41 54 30 50 52 54 32 53 50 4F 4E 00           // SAT0PRT2SPON.

And (Arg0, 0x04)))
                {
                    ^PRT2.SPON ()
                }


   1501C: 7B 68 0A 04 00 5E 2E 50 52 54 32 53 50 4F 4E     // {h...^.PRT2SPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT3.SPON), 
   1502B: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   1503B: 53 41 54 30 50 52 54 33 53 50 4F 4E 00           // SAT0PRT3SPON.

And (Arg0, 0x08)))
                {
                    ^PRT3.SPON ()
                }


   15048: 7B 68 0A 08 00 5E 2E 50 52 54 33 53 50 4F 4E     // {h...^.PRT3SPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT4.SPON), 
   15057: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   15067: 53 41 54 30 50 52 54 34 53 50 4F 4E 00           // SAT0PRT4SPON.

And (Arg0, 0x10)))
                {
                    ^PRT4.SPON ()
                }


   15074: 7B 68 0A 10 00 5E 2E 50 52 54 34 53 50 4F 4E     // {h...^.PRT4SPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT5.SPON), 
   15083: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   15093: 53 41 54 30 50 52 54 35 53 50 4F 4E 00           // SAT0PRT5SPON.

And (Arg0, 0x20)))
                {
                    ^PRT5.SPON ()
                }


   150A0: 7B 68 0A 20 00 5E 2E 50 52 54 35 53 50 4F 4E     // {h. .^.PRT5SPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM1.RPON), 
   150AF: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   150BF: 53 41 54 30 4E 56 4D 31 52 50 4F 4E 00           // SAT0NVM1RPON.

And (Arg0, 0x0100)))
                {
                    ^NVM1.RPON ()
                }


   150CC: 7B 68 0B 00 01 00 5E 2E 4E 56 4D 31 52 50 4F 4E  // {h....^.NVM1RPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM1.NVD0), 
   150DC: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   150EC: 53 41 54 30 4E 56 4D 31 4E 56 44 30 00           // SAT0NVM1NVD0.

And (Arg0, 0x0100)))
                {
                    ^NVM1.NVD0 ()
                }


   150F9: 7B 68 0B 00 01 00 5E 2E 4E 56 4D 31 4E 56 44 30  // {h....^.NVM1NVD0

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM2.RPON), 
   15109: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15119: 53 41 54 30 4E 56 4D 32 52 50 4F 4E 00           // SAT0NVM2RPON.

And (Arg0, 0x0200)))
                {
                    ^NVM2.RPON ()
                }


   15126: 7B 68 0B 00 02 00 5E 2E 4E 56 4D 32 52 50 4F 4E  // {h....^.NVM2RPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM2.NVD0), 
   15136: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15146: 53 41 54 30 4E 56 4D 32 4E 56 44 30 00           // SAT0NVM2NVD0.

And (Arg0, 0x0200)))
                {
                    ^NVM2.NVD0 ()
                }


   15153: 7B 68 0B 00 02 00 5E 2E 4E 56 4D 32 4E 56 44 30  // {h....^.NVM2NVD0

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM3.RPON), 
   15163: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15173: 53 41 54 30 4E 56 4D 33 52 50 4F 4E 00           // SAT0NVM3RPON.

And (Arg0, 0x0400)))
                {
                    ^NVM3.RPON ()
                }


   15180: 7B 68 0B 00 04 00 5E 2E 4E 56 4D 33 52 50 4F 4E  // {h....^.NVM3RPON

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM3.NVD0), 
   15190: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   151A0: 53 41 54 30 4E 56 4D 33 4E 56 44 30 00           // SAT0NVM3NVD0.

And (Arg0, 0x0400)))
                {
                    ^NVM3.NVD0 ()
                }
            }


   151AD: 7B 68 0B 00 04 00 5E 2E 4E 56 4D 33 4E 56 44 30  // {h....^.NVM3NVD0

            Method (CPOF, 1, Serialized)
            {

   151BD: 14 4C 21 43 50 4F 46 09                          // .L!CPOF.

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT0.SPOF), 
   151C5: A0 2A 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .*.[.\/._SB_PCI0
   151D5: 53 41 54 30 50 52 54 30 53 50 4F 46 00           // SAT0PRT0SPOF.

And (Arg0, One)))
                {
                    ^PRT0.SPOF ()
                }


   151E2: 7B 68 01 00 5E 2E 50 52 54 30 53 50 4F 46        // {h..^.PRT0SPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT1.SPOF), 
   151F0: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   15200: 53 41 54 30 50 52 54 31 53 50 4F 46 00           // SAT0PRT1SPOF.

And (Arg0, 0x02)))
                {
                    ^PRT1.SPOF ()
                }


   1520D: 7B 68 0A 02 00 5E 2E 50 52 54 31 53 50 4F 46     // {h...^.PRT1SPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT2.SPOF), 
   1521C: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   1522C: 53 41 54 30 50 52 54 32 53 50 4F 46 00           // SAT0PRT2SPOF.

And (Arg0, 0x04)))
                {
                    ^PRT2.SPOF ()
                }


   15239: 7B 68 0A 04 00 5E 2E 50 52 54 32 53 50 4F 46     // {h...^.PRT2SPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT3.SPOF), 
   15248: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   15258: 53 41 54 30 50 52 54 33 53 50 4F 46 00           // SAT0PRT3SPOF.

And (Arg0, 0x08)))
                {
                    ^PRT3.SPOF ()
                }


   15265: 7B 68 0A 08 00 5E 2E 50 52 54 33 53 50 4F 46     // {h...^.PRT3SPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT4.SPOF), 
   15274: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   15284: 53 41 54 30 50 52 54 34 53 50 4F 46 00           // SAT0PRT4SPOF.

And (Arg0, 0x10)))
                {
                    ^PRT4.SPOF ()
                }


   15291: 7B 68 0A 10 00 5E 2E 50 52 54 34 53 50 4F 46     // {h...^.PRT4SPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.PRT5.SPOF), 
   152A0: A0 2B 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .+.[.\/._SB_PCI0
   152B0: 53 41 54 30 50 52 54 35 53 50 4F 46 00           // SAT0PRT5SPOF.

And (Arg0, 0x20)))
                {
                    ^PRT5.SPOF ()
                }


   152BD: 7B 68 0A 20 00 5E 2E 50 52 54 35 53 50 4F 46     // {h. .^.PRT5SPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM1.NVD3), 
   152CC: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   152DC: 53 41 54 30 4E 56 4D 31 4E 56 44 33 00           // SAT0NVM1NVD3.

And (Arg0, 0x0100)))
                {
                    ^NVM1.NVD3 ()
                }


   152E9: 7B 68 0B 00 01 00 5E 2E 4E 56 4D 31 4E 56 44 33  // {h....^.NVM1NVD3

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM1.RPOF), 
   152F9: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15309: 53 41 54 30 4E 56 4D 31 52 50 4F 46 00           // SAT0NVM1RPOF.

And (Arg0, 0x0100)))
                {
                    ^NVM1.RPOF ()
                }


   15316: 7B 68 0B 00 01 00 5E 2E 4E 56 4D 31 52 50 4F 46  // {h....^.NVM1RPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM2.NVD3), 
   15326: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15336: 53 41 54 30 4E 56 4D 32 4E 56 44 33 00           // SAT0NVM2NVD3.

And (Arg0, 0x0200)))
                {
                    ^NVM2.NVD3 ()
                }


   15343: 7B 68 0B 00 02 00 5E 2E 4E 56 4D 32 4E 56 44 33  // {h....^.NVM2NVD3

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM2.RPOF), 
   15353: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15363: 53 41 54 30 4E 56 4D 32 52 50 4F 46 00           // SAT0NVM2RPOF.

And (Arg0, 0x0200)))
                {
                    ^NVM2.RPOF ()
                }


   15370: 7B 68 0B 00 02 00 5E 2E 4E 56 4D 32 52 50 4F 46  // {h....^.NVM2RPOF

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM3.NVD3), 
   15380: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   15390: 53 41 54 30 4E 56 4D 33 4E 56 44 33 00           // SAT0NVM3NVD3.

And (Arg0, 0x0400)))
                {
                    ^NVM3.NVD3 ()
                }


   1539D: 7B 68 0B 00 04 00 5E 2E 4E 56 4D 33 4E 56 44 33  // {h....^.NVM3NVD3

                If (LAnd (CondRefOf (\_SB.PCI0.SAT0.NVM3.RPOF), 
   153AD: A0 2C 90 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30  // .,.[.\/._SB_PCI0
   153BD: 53 41 54 30 4E 56 4D 33 52 50 4F 46 00           // SAT0NVM3RPOF.

And (Arg0, 0x0400)))
                {
                    ^NVM3.RPOF ()
                }
            }


   153CA: 7B 68 0B 00 04 00 5E 2E 4E 56 4D 33 52 50 4F 46  // {h....^.NVM3RPOF

            Device (VOL0)
            {

   153DA: 5B 82 45 0E 56 4F 4C 30                          // [.E.VOL0

                Name (_ADR, 0x0080FFFF)  // _ADR: Address

   153E2: 08 5F 41 44 52 0C FF FF 80 00                    // ._ADR.....

                Name (_PR0, 
   153EC: 08 5F 50 52 30                                   // ._PR0

Package (0x01)  // _PR0: Power Resources for D0
                {
                    V0PR, 
                })

   153F1: 12 06 01 56 30 50 52                             // ...V0PR

                Name (_PR3, 
   153F8: 08 5F 50 52 33                                   // ._PR3

Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    V0PR, 
                })

   153FD: 12 06 01 56 30 50 52                             // ...V0PR

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15404: 14 14 5F 44 53 4D 0C                             // .._DSM.

                    Return (RSTD (Arg0, Arg1, Arg2, Arg3, 
   1540B: A4 52 53 54 44 68 69 6A 6B                       // .RSTDhijk

RefOf (VL0M)))
                }


   15414: 71 56 4C 30 4D                                   // qVL0M

                PowerResource (V0PR, 0x00, 0x0000)
                {

   15419: 5B 84 46 0A 56 30 50 52 00 00 00                 // [.F.V0PR...

                    Name (_STA, One)  // _STA: Status

   15424: 08 5F 53 54 41 01                                // ._STA.

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG (
   1542A: 14 4A 04 5F 4F 4E 5F 00 41 44 42 47              // .J._ON_.ADBG

Concatenate ("VOL0._ON:", ToHexString (VL0M)))

   15436: 73 0D 56 4F 4C 30 2E 5F 4F 4E 3A 00 98 56 4C 30  // s.VOL0._ON:..VL0
   15446: 4D 00 00                                         // M..

                        If (VR3A)
                        {
                            CPON (VL0M)

   15449: A0 13 56 52 33 41 43 50 4F 4E 56 4C 30 4D        // ..VR3ACPONVL0M

                            Store (One, _STA) /* \_SB_.PCI0.SAT0.VOL0.V0PR._STA */
                        }

   15457: 70 01 5F 53 54 41                                // p._STA

                        Else
                        {
                            ADBG ("Global RTD3 lock")
                        }
                    }


   1545D: A1 17 41 44 42 47 0D 47 6C 6F 62 61 6C 20 52 54  // ..ADBG.Global RT
   1546D: 44 33 20 6C 6F 63 6B 00                          // D3 lock.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG (
   15475: 14 4B 04 5F 4F 46 46 00 41 44 42 47              // .K._OFF.ADBG

Concatenate ("VOL0._OFF:", ToHexString (VL0M)))

   15481: 73 0D 56 4F 4C 30 2E 5F 4F 46 46 3A 00 98 56 4C  // s.VOL0._OFF:..VL
   15491: 30 4D 00 00                                      // 0M..

                        If (VR3A)
                        {
                            CPOF (VL0M)

   15495: A0 13 56 52 33 41 43 50 4F 46 56 4C 30 4D        // ..VR3ACPOFVL0M

                            Store (Zero, _STA) /* \_SB_.PCI0.SAT0.VOL0.V0PR._STA */
                        }

   154A3: 70 00 5F 53 54 41                                // p._STA

                        Else
                        {
                            ADBG ("Global RTD3 lock")
                        }
                    }
                }
            }


   154A9: A1 17 41 44 42 47 0D 47 6C 6F 62 61 6C 20 52 54  // ..ADBG.Global RT
   154B9: 44 33 20 6C 6F 63 6B 00                          // D3 lock.

            Device (VOL1)
            {

   154C1: 5B 82 45 0E 56 4F 4C 31                          // [.E.VOL1

                Name (_ADR, 0x0081FFFF)  // _ADR: Address

   154C9: 08 5F 41 44 52 0C FF FF 81 00                    // ._ADR.....

                Name (_PR0, 
   154D3: 08 5F 50 52 30                                   // ._PR0

Package (0x01)  // _PR0: Power Resources for D0
                {
                    V1PR, 
                })

   154D8: 12 06 01 56 31 50 52                             // ...V1PR

                Name (_PR3, 
   154DF: 08 5F 50 52 33                                   // ._PR3

Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    V1PR, 
                })

   154E4: 12 06 01 56 31 50 52                             // ...V1PR

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   154EB: 14 14 5F 44 53 4D 0C                             // .._DSM.

                    Return (RSTD (Arg0, Arg1, Arg2, Arg3, 
   154F2: A4 52 53 54 44 68 69 6A 6B                       // .RSTDhijk

RefOf (VL1M)))
                }


   154FB: 71 56 4C 31 4D                                   // qVL1M

                PowerResource (V1PR, 0x00, 0x0000)
                {

   15500: 5B 84 46 0A 56 31 50 52 00 00 00                 // [.F.V1PR...

                    Name (_STA, One)  // _STA: Status

   1550B: 08 5F 53 54 41 01                                // ._STA.

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG (
   15511: 14 4A 04 5F 4F 4E 5F 00 41 44 42 47              // .J._ON_.ADBG

Concatenate ("VOL1._ON:", ToHexString (VL1M)))

   1551D: 73 0D 56 4F 4C 31 2E 5F 4F 4E 3A 00 98 56 4C 31  // s.VOL1._ON:..VL1
   1552D: 4D 00 00                                         // M..

                        If (VR3A)
                        {
                            CPON (VL1M)

   15530: A0 13 56 52 33 41 43 50 4F 4E 56 4C 31 4D        // ..VR3ACPONVL1M

                            Store (One, _STA) /* \_SB_.PCI0.SAT0.VOL1.V1PR._STA */
                        }

   1553E: 70 01 5F 53 54 41                                // p._STA

                        Else
                        {
                            ADBG ("Global RTD3 lock")
                        }
                    }


   15544: A1 17 41 44 42 47 0D 47 6C 6F 62 61 6C 20 52 54  // ..ADBG.Global RT
   15554: 44 33 20 6C 6F 63 6B 00                          // D3 lock.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG (
   1555C: 14 4B 04 5F 4F 46 46 00 41 44 42 47              // .K._OFF.ADBG

Concatenate ("VOL1._OFF:", ToHexString (VL1M)))

   15568: 73 0D 56 4F 4C 31 2E 5F 4F 46 46 3A 00 98 56 4C  // s.VOL1._OFF:..VL
   15578: 31 4D 00 00                                      // 1M..

                        If (VR3A)
                        {
                            CPOF (VL1M)

   1557C: A0 13 56 52 33 41 43 50 4F 46 56 4C 31 4D        // ..VR3ACPOFVL1M

                            Store (Zero, _STA) /* \_SB_.PCI0.SAT0.VOL1.V1PR._STA */
                        }

   1558A: 70 00 5F 53 54 41                                // p._STA

                        Else
                        {
                            ADBG ("Global RTD3 lock")
                        }
                    }
                }
            }


   15590: A1 17 41 44 42 47 0D 47 6C 6F 62 61 6C 20 52 54  // ..ADBG.Global RT
   155A0: 44 33 20 6C 6F 63 6B 00                          // D3 lock.

            Device (VOL2)
            {

   155A8: 5B 82 45 0E 56 4F 4C 32                          // [.E.VOL2

                Name (_ADR, 0x0082FFFF)  // _ADR: Address

   155B0: 08 5F 41 44 52 0C FF FF 82 00                    // ._ADR.....

                Name (_PR0, 
   155BA: 08 5F 50 52 30                                   // ._PR0

Package (0x01)  // _PR0: Power Resources for D0
                {
                    V2PR, 
                })

   155BF: 12 06 01 56 32 50 52                             // ...V2PR

                Name (_PR3, 
   155C6: 08 5F 50 52 33                                   // ._PR3

Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    V2PR, 
                })

   155CB: 12 06 01 56 32 50 52                             // ...V2PR

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   155D2: 14 14 5F 44 53 4D 0C                             // .._DSM.

                    Return (RSTD (Arg0, Arg1, Arg2, Arg3, 
   155D9: A4 52 53 54 44 68 69 6A 6B                       // .RSTDhijk

RefOf (VL2M)))
                }


   155E2: 71 56 4C 32 4D                                   // qVL2M

                PowerResource (V2PR, 0x00, 0x0000)
                {

   155E7: 5B 84 46 0A 56 32 50 52 00 00 00                 // [.F.V2PR...

                    Name (_STA, One)  // _STA: Status

   155F2: 08 5F 53 54 41 01                                // ._STA.

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG (
   155F8: 14 4A 04 5F 4F 4E 5F 00 41 44 42 47              // .J._ON_.ADBG

Concatenate ("VOL2._ON:", ToHexString (VL2M)))

   15604: 73 0D 56 4F 4C 32 2E 5F 4F 4E 3A 00 98 56 4C 32  // s.VOL2._ON:..VL2
   15614: 4D 00 00                                         // M..

                        If (VR3A)
                        {
                            CPON (VL2M)

   15617: A0 13 56 52 33 41 43 50 4F 4E 56 4C 32 4D        // ..VR3ACPONVL2M

                            Store (One, _STA) /* \_SB_.PCI0.SAT0.VOL2.V2PR._STA */
                        }

   15625: 70 01 5F 53 54 41                                // p._STA

                        Else
                        {
                            ADBG ("Global RTD3 lock")
                        }
                    }


   1562B: A1 17 41 44 42 47 0D 47 6C 6F 62 61 6C 20 52 54  // ..ADBG.Global RT
   1563B: 44 33 20 6C 6F 63 6B 00                          // D3 lock.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG (
   15643: 14 4B 04 5F 4F 46 46 00 41 44 42 47              // .K._OFF.ADBG

Concatenate ("VOL2._OFF:", ToHexString (VL2M)))

   1564F: 73 0D 56 4F 4C 32 2E 5F 4F 46 46 3A 00 98 56 4C  // s.VOL2._OFF:..VL
   1565F: 32 4D 00 00                                      // 2M..

                        If (VR3A)
                        {
                            CPOF (VL2M)

   15663: A0 13 56 52 33 41 43 50 4F 46 56 4C 32 4D        // ..VR3ACPOFVL2M

                            Store (Zero, _STA) /* \_SB_.PCI0.SAT0.VOL2.V2PR._STA */
                        }

   15671: 70 00 5F 53 54 41                                // p._STA

                        Else
                        {
                            ADBG ("Global RTD3 lock")
                        }
                    }
                }
            }
        }


   15677: A1 17 41 44 42 47 0D 47 6C 6F 62 61 6C 20 52 54  // ..ADBG.Global RT
   15687: 44 33 20 6C 6F 63 6B 00                          // D3 lock.

        Scope (\_SB.PCI0)
        {

   1568F: 10 45 11 5C 2E 5F 53 42 5F 50 43 49 30           // .E.\._SB_PCI0

            Device (GPI0)
            {

   1569C: 5B 82 47 10 47 50 49 30                          // [.G.GPI0

                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {

   156A4: 14 22 5F 48 49 44 00                             // ."_HID.

                    If (LEqual (GPEN, One))
                    {

   156AB: A0 11 93 47 50 45 4E 01                          // ...GPEN.

                        Return ("PNP0C02")
                    }


   156B3: A4 0D 50 4E 50 30 43 30 32 00                    // ..PNP0C02.

                    Return ("INT3451")
                }


   156BD: A4 0D 49 4E 54 33 34 35 31 00                    // ..INT3451.

                Name (LINK, "\\_SB.PCI0.GPI0")

   156C7: 08 4C 49 4E 4B 0D 5C 5F 53 42 2E 50 43 49 30 2E  // .LINK.\_SB.PCI0.
   156D7: 47 50 49 30 00                                   // GPI0.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   156DC: 14 49 0A 5F 43 52 53 00                          // .I._CRS.

                    Name (RBUF, 
   156E4: 08 52 42 55 46                                   // .RBUF

Buffer (0x2F)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x01, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                        /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                        /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0020 */  0x00, 0x00, 0x01, 0x00, 0x89, 0x06, 0x00, 0x0D,  // ........
                        /* 0028 */  0x01, 0x0E, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                    })

   156E9: 11 32 0A 2F 86 09 00 01 00 00 00 00 00 00 01 00  // .2./............
   156F9: 86 09 00 01 00 00 00 00 00 00 01 00 86 09 00 01  // ................
   15709: 00 00 00 00 00 00 01 00 89 06 00 0D 01 0E 00 00  // ................
   15719: 00 79 00                                         // .y.

                    CreateDWordField (RBUF, 0x04, COM0)

   1571C: 8A 52 42 55 46 0A 04 43 4F 4D 30                 // .RBUF..COM0

                    CreateDWordField (RBUF, 0x10, COM1)

   15727: 8A 52 42 55 46 0A 10 43 4F 4D 31                 // .RBUF..COM1

                    CreateDWordField (RBUF, 0x29, IRQN)
                    Store (Add (SBRG, 0x00AF0000), COM0) /* \_SB_.PCI0.GPI0._CRS.COM0 */
                    Store (Add (SBRG, 0x00AE0000), COM1) /* \_SB_.PCI0.GPI0._CRS.COM1 */

   15732: 8A 52 42 55 46 0A 29 49 52 51 4E 70 72 53 42 52  // .RBUF.)IRQNprSBR
   15742: 47 0C 00 00 AF 00 00 43 4F 4D 30 70 72 53 42 52  // G......COM0prSBR
   15752: 47 0C 00 00 AE 00 00 43 4F 4D 31                 // G......COM1

                    CreateDWordField (RBUF, 0x1C, COM3)
                    Store (Add (SBRG, 0x00AC0000), COM3) /* \_SB_.PCI0.GPI0._CRS.COM3 */
                    Store (SGIR, IRQN) /* \_SB_.PCI0.GPI0._CRS.IRQN */

   1575D: 8A 52 42 55 46 0A 1C 43 4F 4D 33 70 72 53 42 52  // .RBUF..COM3prSBR
   1576D: 47 0C 00 00 AC 00 00 43 4F 4D 33 70 53 47 49 52  // G......COM3pSGIR
   1577D: 49 52 51 4E                                      // IRQN

                    Return (RBUF) /* \_SB_.PCI0.GPI0._CRS.RBUF */
                }


   15781: A4 52 42 55 46                                   // .RBUF

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   15786: 14 1E 5F 53 54 41 00                             // .._STA.

                    If (LEqual (SBRG, Zero))
                    {

   1578D: A0 09 93 53 42 52 47 00                          // ...SBRG.

                        Return (Zero)
                    }


   15795: A4 00                                            // ..

                    If (LEqual (GPEN, One))
                    {

   15797: A0 0A 93 47 50 45 4E 01                          // ...GPEN.

                        Return (0x03)
                    }


   1579F: A4 0A 03                                         // ...

                    Return (0x0F)
                }
            }
        }


   157A2: A4 0A 0F                                         // ...

        Device (TERM)
        {

   157A5: 5B 82 48 07 54 45 52 4D                          // [.H.TERM

            Name (_HID, "INT343D")  // _HID: Hardware ID

   157AD: 08 5F 48 49 44 0D 49 4E 54 33 34 33 44 00        // ._HID.INT343D.

            Name (_UID, One)  // _UID: Unique ID

   157BB: 08 5F 55 49 44 01                                // ._UID.

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {

   157C1: 14 3F 5F 43 52 53 00                             // .?_CRS.

                Name (RBUF, 
   157C8: 08 52 42 55 46                                   // .RBUF

Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xC0, 0x03, 0xFE,  // ........
                    /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x89, 0x06, 0x00, 0x0D,  // ........
                    /* 0010 */  0x01, 0x12, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })

   157CD: 11 1A 0A 17 86 09 00 01 00 C0 03 FE 00 10 00 00  // ................
   157DD: 89 06 00 0D 01 12 00 00 00 79 00                 // .........y.

                CreateDWordField (RBUF, 0x11, IRQN)
                Store (TIRQ, IRQN) /* \_SB_.PCI0.TERM._CRS.IRQN */

   157E8: 8A 52 42 55 46 0A 11 49 52 51 4E 70 54 49 52 51  // .RBUF..IRQNpTIRQ
   157F8: 49 52 51 4E                                      // IRQN

                Return (RBUF) /* \_SB_.PCI0.TERM._CRS.RBUF */
            }


   157FC: A4 52 42 55 46                                   // .RBUF

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   15801: 14 1D 5F 53 54 41 00                             // .._STA.

                If (LEqual (TAEN, Zero))
                {

   15808: A0 09 93 54 41 45 4E 00                          // ...TAEN.

                    Return (Zero)
                }


   15810: A4 00                                            // ..

                If (LEqual (TIRQ, Zero))
                {

   15812: A0 09 93 54 49 52 51 00                          // ...TIRQ.

                    Return (Zero)
                }


   1581A: A4 00                                            // ..

                Return (0x0F)
            }
        }
    }


   1581C: A4 0A 0F                                         // ...

    Scope (_SB)
    {

   1581F: 10 48 0B 5F 53 42 5F                             // .H._SB_

        Name (HDAA, Zero)

   15826: 08 48 44 41 41 00                                // .HDAA.

        Name (DISA, One)

   1582C: 08 44 49 53 41 01                                // .DISA.

        Method (DION, 0, NotSerialized)
        {
            VMMH (One, One)
        }


   15832: 14 0C 44 49 4F 4E 00 56 4D 4D 48 01 01           // ..DION.VMMH..

        Method (DIOF, 0, NotSerialized)
        {
            VMMH (One, Zero)
        }


   1583F: 14 0C 44 49 4F 46 00 56 4D 4D 48 01 00           // ..DIOF.VMMH..

        Method (VMMH, 2, Serialized)
        {

   1584C: 14 4B 08 56 4D 4D 48 0A                          // .K.VMMH.


   15854: 08 5F 54 5F 30 00                                // ._T_0.

            If (LOr (LNot (
   1585A: A0 20 91 92                                      // . ..

CondRefOf (\_SB.VMON)), 
   1585E: 5B 12 5C 2E 5F 53 42 5F 56 4D 4F 4E 00           // [.\._SB_VMON.

LNot (
   1586B: 92                                               // .

CondRefOf (\_SB.VMOF))))
            {

   1586C: 5B 12 5C 2E 5F 53 42 5F 56 4D 4F 46 00           // [.\._SB_VMOF.

                Return (Zero)
            }


   15879: A4 00                                            // ..

            Switch (ToInteger (Arg0))
            {

   1587B: A2 2D 01 70 99 68 00 5F 54 5F 30                 // .-.p.h._T_0

                Case (Zero)
                {

   15886: A0 0D 93 5F 54 5F 30 00                          // ..._T_0.

                    Store (Arg1, HDAA) /* \_SB_.HDAA */
                }

   1588E: 70 69 48 44 41 41                                // piHDAA

                Case
   15894: A1 13                                            // ..

 (One)
                {

   15896: A0 0D 93 5F 54 5F 30 01                          // ..._T_0.

                    Store (Arg1, DISA) /* \_SB_.DISA */
                }

   1589E: 70 69 44 49 53 41                                // piDISA

                Default
                {

   158A4: A1 03                                            // ..

                    Return (Zero)
                }


   158A6: A4 00                                            // ..

            }


   158A8: A5                                               // .

            If (LAnd (LNot (DISA), 
   158A9: A0 1C 90 92 44 49 53 41                          // ....DISA

LNot (HDAA)))
            {
                Store (Zero, XSQD) /* \XSQD */
                Store (One, SLS0) /* \SLS0 */
                VMON ()
            }

   158B1: 92 48 44 41 41 70 00 58 53 51 44 70 01 53 4C 53  // .HDAAp.XSQDp.SLS
   158C1: 30 56 4D 4F 4E                                   // 0VMON

            Else
            {
                Store (One, XSQD) /* \XSQD */
                Store (Zero, SLS0) /* \SLS0 */
                VMOF ()
            }
        }
    }


   158C6: A1 11 70 01 58 53 51 44 70 00 53 4C 53 30 56 4D  // ..p.XSQDp.SLS0VM
   158D6: 4F 46                                            // OF

    Scope (_SB.PCI0)
    {

   158D8: 10 48 06 2E 5F 53 42 5F 50 43 49 30              // .H.._SB_PCI0

        Method (SOD3, 3, Serialized)
        {

   158E4: 14 4C 05 53 4F 44 33 0B                          // .L.SOD3.

            Name (STMP, Zero)

   158EC: 08 53 54 4D 50 00                                // .STMP.

            OperationRegion (ICB1, SystemMemory, Add (GPCB (), Arg0), 0x88)

   158F2: 5B 80 49 43 42 31 00 72 47 50 43 42 68 00 0A 88  // [.ICB1.rGPCBh...

            If (Arg1)
            {

   15902: A0 22 69                                         // ."i

                Field (ICB1, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    PMEC,   8
                }

                Store (0x03, PMEC) /* \_SB_.PCI0.SOD3.PMEC */

   15905: 5B 81 0E 49 43 42 31 01 00 40 42 50 4D 45 43 08  // [..ICB1..@BPMEC.
   15915: 70 0A 03 50 4D 45 43                             // p..PMEC

                Store (PMEC, STMP) /* \_SB_.PCI0.SOD3.STMP */
            }


   1591C: 70 50 4D 45 43 53 54 4D 50                       // pPMECSTMP

            If (LAnd (Arg1, Arg2))
            {

   15925: A0 1B 90 69 6A                                   // ...ij

                Field (ICB1, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    BAR0,   64
                }


   1592A: 5B 81 0F 49 43 42 31 03 00 40 08 42 41 52 30 40  // [..ICB1..@.BAR0@
   1593A: 04                                               // .

                Store (Zero, BAR0) /* \_SB_.PCI0.SOD3.BAR0 */
            }
        }
    }


   1593B: 70 00 42 41 52 30                                // p.BAR0

    Scope (_SB.PCI0)
    {

   15941: 10 48 1C 2E 5F 53 42 5F 50 43 49 30              // .H.._SB_PCI0

        Method (SPIH, 1, Serialized)
        {

   1594D: 14 40 0A 53 50 49 48 09                          // .@.SPIH.

            OperationRegion (ICB1, SystemMemory, Arg0, 0x20)

   15955: 5B 80 49 43 42 31 00 68 0A 20                    // [.ICB1.h. 

            Field (ICB1, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                BAR0,   64, 
                BAR1,   64
            }


   1595F: 5B 81 15 49 43 42 31 03 00 40 08 42 41 52 30 40  // [..ICB1..@.BAR0@
   1596F: 04 42 41 52 31 40 04                             // .BAR1@.

            Name (BUF0, 
   15976: 08 42 55 46 30                                   // .BUF0

Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })

   1597B: 11 11 0A 0E 86 09 00 01 00 00 00 00 00 10 00 00  // ................
   1598B: 79 00                                            // y.

            Name (BUF1, 
   1598D: 08 42 55 46 31                                   // .BUF1

Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })

   15992: 11 11 0A 0E 86 09 00 01 00 00 00 00 00 10 00 00  // ................
   159A2: 79 00                                            // y.

            CreateDWordField (BUF0, 0x04, ADR0)

   159A4: 8A 42 55 46 30 0A 04 41 44 52 30                 // .BUF0..ADR0

            CreateDWordField (BUF1, 0x04, ADR1)
            Store (And (BAR0, 0xFFFFFFFFFFFFF000), ADR0) /* \_SB_.PCI0.SPIH.ADR0 */
            Store (And (BAR1, 0xFFFFFFFFFFFFF000), ADR1) /* \_SB_.PCI0.SPIH.ADR1 */
            ConcatenateResTemplate (BUF0, BUF1, Local0)

   159AF: 8A 42 55 46 31 0A 04 41 44 52 31 70 7B 42 41 52  // .BUF1..ADR1p{BAR
   159BF: 30 0E 00 F0 FF FF FF FF FF FF 00 41 44 52 30 70  // 0..........ADR0p
   159CF: 7B 42 41 52 31 0E 00 F0 FF FF FF FF FF FF 00 41  // {BAR1..........A
   159DF: 44 52 31 84 42 55 46 30 42 55 46 31 60           // DR1.BUF0BUF1`

            Return (Local0)
        }


   159EC: A4 60                                            // .`

        Device (SPI0)
        {

   159EE: 5B 82 4C 08 53 50 49 30                          // [.L.SPI0

            If (LEqual (SM00, 0x02))
            {

   159F6: A0 2D 93 53 4D 30 30 0A 02                       // .-.SM00..

                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID

   159FF: 08 5F 48 49 44 0D 50 4E 50 30 43 30 32 00        // ._HID.PNP0C02.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   15A0D: 14 0F 5F 43 52 53 00                             // .._CRS.

                    Return (SPIH (SC00))
                }


   15A14: A4 53 50 49 48 53 43 30 30                       // .SPIHSC00

                Name (_STA, 0x03)  // _STA: Status
            }


   15A1D: 08 5F 53 54 41 0A 03                             // ._STA..

            If (LEqual (SM00, One))
            {

   15A24: A0 3B 93 53 4D 30 30 01                          // .;.SM00.

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15A2C: 14 1B 5F 44 53 4D 0C                             // .._DSM.

                    If (PCIC (Arg0))
                    {

   15A33: A0 0F 50 43 49 43 68                             // ..PCICh

                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }


   15A3A: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                    Return (
   15A43: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   15A44: 11 03 01 00                                      // ....

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    SOD3 (SC00, One, One)
                }


   15A48: 14 10 5F 50 53 33 00 53 4F 44 33 53 43 30 30 01  // .._PS3.SOD3SC00.
   15A58: 01                                               // .

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }
            }


   15A59: 14 06 5F 50 53 30 00                             // .._PS0.

            If (LOr (LEqual (SM00, One), 
   15A60: A0 1B 91 93 53 4D 30 30 01                       // ....SM00.

LEqual (SM00, Zero)))
            {

   15A69: 93 53 4D 30 30 00                                // .SM00.

                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {

   15A6F: 14 0C 5F 41 44 52 00                             // .._ADR.

                    Return (0x001E0002)
                }
            }
        }


   15A76: A4 0C 02 00 1E 00                                // ......

        Device (SPI1)
        {

   15A7C: 5B 82 4C 08 53 50 49 31                          // [.L.SPI1

            If (LEqual (SM01, 0x02))
            {

   15A84: A0 2D 93 53 4D 30 31 0A 02                       // .-.SM01..

                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID

   15A8D: 08 5F 48 49 44 0D 50 4E 50 30 43 30 32 00        // ._HID.PNP0C02.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   15A9B: 14 0F 5F 43 52 53 00                             // .._CRS.

                    Return (SPIH (SC01))
                }


   15AA2: A4 53 50 49 48 53 43 30 31                       // .SPIHSC01

                Name (_STA, 0x03)  // _STA: Status
            }


   15AAB: 08 5F 53 54 41 0A 03                             // ._STA..

            If (LEqual (SM01, One))
            {

   15AB2: A0 3B 93 53 4D 30 31 01                          // .;.SM01.

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15ABA: 14 1B 5F 44 53 4D 0C                             // .._DSM.

                    If (PCIC (Arg0))
                    {

   15AC1: A0 0F 50 43 49 43 68                             // ..PCICh

                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }


   15AC8: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                    Return (
   15AD1: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   15AD2: 11 03 01 00                                      // ....

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    SOD3 (SC01, One, One)
                }


   15AD6: 14 10 5F 50 53 33 00 53 4F 44 33 53 43 30 31 01  // .._PS3.SOD3SC01.
   15AE6: 01                                               // .

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }
            }


   15AE7: 14 06 5F 50 53 30 00                             // .._PS0.

            If (LOr (LEqual (SM01, One), 
   15AEE: A0 1B 91 93 53 4D 30 31 01                       // ....SM01.

LEqual (SM01, Zero)))
            {

   15AF7: 93 53 4D 30 31 00                                // .SM01.

                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {

   15AFD: 14 0C 5F 41 44 52 00                             // .._ADR.

                    Return (0x001E0003)
                }
            }
        }
    }


   15B04: A4 0C 03 00 1E 00                                // ......

    Scope (_SB.PCI0)
    {

   15B0A: 10 44 2E 2E 5F 53 42 5F 50 43 49 30              // .D.._SB_PCI0

        Method (I2CH, 1, Serialized)
        {

   15B16: 14 40 0A 49 32 43 48 09                          // .@.I2CH.

            OperationRegion (ICB1, SystemMemory, Arg0, 0x20)

   15B1E: 5B 80 49 43 42 31 00 68 0A 20                    // [.ICB1.h. 

            Field (ICB1, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                BAR0,   64, 
                BAR1,   64
            }


   15B28: 5B 81 15 49 43 42 31 03 00 40 08 42 41 52 30 40  // [..ICB1..@.BAR0@
   15B38: 04 42 41 52 31 40 04                             // .BAR1@.

            Name (BUF0, 
   15B3F: 08 42 55 46 30                                   // .BUF0

Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })

   15B44: 11 11 0A 0E 86 09 00 01 00 00 00 00 00 10 00 00  // ................
   15B54: 79 00                                            // y.

            Name (BUF1, 
   15B56: 08 42 55 46 31                                   // .BUF1

Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })

   15B5B: 11 11 0A 0E 86 09 00 01 00 00 00 00 00 10 00 00  // ................
   15B6B: 79 00                                            // y.

            CreateDWordField (BUF0, 0x04, ADR0)

   15B6D: 8A 42 55 46 30 0A 04 41 44 52 30                 // .BUF0..ADR0

            CreateDWordField (BUF1, 0x04, ADR1)
            Store (And (BAR0, 0xFFFFFFFFFFFFF000), ADR0) /* \_SB_.PCI0.I2CH.ADR0 */
            Store (And (BAR1, 0xFFFFFFFFFFFFF000), ADR1) /* \_SB_.PCI0.I2CH.ADR1 */
            ConcatenateResTemplate (BUF0, BUF1, Local0)

   15B78: 8A 42 55 46 31 0A 04 41 44 52 31 70 7B 42 41 52  // .BUF1..ADR1p{BAR
   15B88: 30 0E 00 F0 FF FF FF FF FF FF 00 41 44 52 30 70  // 0..........ADR0p
   15B98: 7B 42 41 52 31 0E 00 F0 FF FF FF FF FF FF 00 41  // {BAR1..........A
   15BA8: 44 52 31 84 42 55 46 30 42 55 46 31 60           // DR1.BUF0BUF1`

            Return (Local0)
        }


   15BB5: A4 60                                            // .`

        Device (I2C0)
        {

   15BB7: 5B 82 4C 08 49 32 43 30                          // [.L.I2C0

            If (LEqual (IM00, 0x02))
            {

   15BBF: A0 2D 93 49 4D 30 30 0A 02                       // .-.IM00..

                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID

   15BC8: 08 5F 48 49 44 0D 50 4E 50 30 43 30 32 00        // ._HID.PNP0C02.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   15BD6: 14 0F 5F 43 52 53 00                             // .._CRS.

                    Return (I2CH (IC00))
                }


   15BDD: A4 49 32 43 48 49 43 30 30                       // .I2CHIC00

                Name (_STA, 0x03)  // _STA: Status
            }


   15BE6: 08 5F 53 54 41 0A 03                             // ._STA..

            If (LEqual (IM00, One))
            {

   15BED: A0 3B 93 49 4D 30 30 01                          // .;.IM00.

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15BF5: 14 1B 5F 44 53 4D 0C                             // .._DSM.

                    If (PCIC (Arg0))
                    {

   15BFC: A0 0F 50 43 49 43 68                             // ..PCICh

                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }


   15C03: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                    Return (
   15C0C: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   15C0D: 11 03 01 00                                      // ....

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    SOD3 (IC00, One, One)
                }


   15C11: 14 10 5F 50 53 33 00 53 4F 44 33 49 43 30 30 01  // .._PS3.SOD3IC00.
   15C21: 01                                               // .

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }
            }


   15C22: 14 06 5F 50 53 30 00                             // .._PS0.

            If (LOr (LEqual (IM00, One), 
   15C29: A0 1B 91 93 49 4D 30 30 01                       // ....IM00.

LEqual (IM00, Zero)))
            {

   15C32: 93 49 4D 30 30 00                                // .IM00.

                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {

   15C38: 14 0C 5F 41 44 52 00                             // .._ADR.

                    Return (0x00150000)
                }
            }
        }


   15C3F: A4 0C 00 00 15 00                                // ......

        Device (I2C1)
        {

   15C45: 5B 82 4C 08 49 32 43 31                          // [.L.I2C1

            If (LEqual (IM01, 0x02))
            {

   15C4D: A0 2D 93 49 4D 30 31 0A 02                       // .-.IM01..

                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID

   15C56: 08 5F 48 49 44 0D 50 4E 50 30 43 30 32 00        // ._HID.PNP0C02.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   15C64: 14 0F 5F 43 52 53 00                             // .._CRS.

                    Return (I2CH (IC01))
                }


   15C6B: A4 49 32 43 48 49 43 30 31                       // .I2CHIC01

                Name (_STA, 0x03)  // _STA: Status
            }


   15C74: 08 5F 53 54 41 0A 03                             // ._STA..

            If (LEqual (IM01, One))
            {

   15C7B: A0 3B 93 49 4D 30 31 01                          // .;.IM01.

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15C83: 14 1B 5F 44 53 4D 0C                             // .._DSM.

                    If (PCIC (Arg0))
                    {

   15C8A: A0 0F 50 43 49 43 68                             // ..PCICh

                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }


   15C91: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                    Return (
   15C9A: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   15C9B: 11 03 01 00                                      // ....

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    SOD3 (IC01, One, One)
                }


   15C9F: 14 10 5F 50 53 33 00 53 4F 44 33 49 43 30 31 01  // .._PS3.SOD3IC01.
   15CAF: 01                                               // .

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }
            }


   15CB0: 14 06 5F 50 53 30 00                             // .._PS0.

            If (LOr (LEqual (IM01, One), 
   15CB7: A0 1B 91 93 49 4D 30 31 01                       // ....IM01.

LEqual (IM01, Zero)))
            {

   15CC0: 93 49 4D 30 31 00                                // .IM01.

                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {

   15CC6: 14 0C 5F 41 44 52 00                             // .._ADR.

                    Return (0x00150001)
                }
            }
        }


   15CCD: A4 0C 01 00 15 00                                // ......

        Device (I2C2)
        {

   15CD3: 5B 82 4C 08 49 32 43 32                          // [.L.I2C2

            If (LEqual (IM02, 0x02))
            {

   15CDB: A0 2D 93 49 4D 30 32 0A 02                       // .-.IM02..

                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID

   15CE4: 08 5F 48 49 44 0D 50 4E 50 30 43 30 32 00        // ._HID.PNP0C02.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   15CF2: 14 0F 5F 43 52 53 00                             // .._CRS.

                    Return (I2CH (IC02))
                }


   15CF9: A4 49 32 43 48 49 43 30 32                       // .I2CHIC02

                Name (_STA, 0x03)  // _STA: Status
            }


   15D02: 08 5F 53 54 41 0A 03                             // ._STA..

            If (LEqual (IM02, One))
            {

   15D09: A0 3B 93 49 4D 30 32 01                          // .;.IM02.

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15D11: 14 1B 5F 44 53 4D 0C                             // .._DSM.

                    If (PCIC (Arg0))
                    {

   15D18: A0 0F 50 43 49 43 68                             // ..PCICh

                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }


   15D1F: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                    Return (
   15D28: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   15D29: 11 03 01 00                                      // ....

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    SOD3 (IC02, One, One)
                }


   15D2D: 14 10 5F 50 53 33 00 53 4F 44 33 49 43 30 32 01  // .._PS3.SOD3IC02.
   15D3D: 01                                               // .

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }
            }


   15D3E: 14 06 5F 50 53 30 00                             // .._PS0.

            If (LOr (LEqual (IM02, One), 
   15D45: A0 1B 91 93 49 4D 30 32 01                       // ....IM02.

LEqual (IM02, Zero)))
            {

   15D4E: 93 49 4D 30 32 00                                // .IM02.

                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {

   15D54: 14 0C 5F 41 44 52 00                             // .._ADR.

                    Return (0x00150002)
                }
            }
        }


   15D5B: A4 0C 02 00 15 00                                // ......

        Device (I2C3)
        {

   15D61: 5B 82 4C 08 49 32 43 33                          // [.L.I2C3

            If (LEqual (IM03, 0x02))
            {

   15D69: A0 2D 93 49 4D 30 33 0A 02                       // .-.IM03..

                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID

   15D72: 08 5F 48 49 44 0D 50 4E 50 30 43 30 32 00        // ._HID.PNP0C02.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   15D80: 14 0F 5F 43 52 53 00                             // .._CRS.

                    Return (I2CH (IC03))
                }


   15D87: A4 49 32 43 48 49 43 30 33                       // .I2CHIC03

                Name (_STA, 0x03)  // _STA: Status
            }


   15D90: 08 5F 53 54 41 0A 03                             // ._STA..

            If (LEqual (IM03, One))
            {

   15D97: A0 3B 93 49 4D 30 33 01                          // .;.IM03.

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   15D9F: 14 1B 5F 44 53 4D 0C                             // .._DSM.

                    If (PCIC (Arg0))
                    {

   15DA6: A0 0F 50 43 49 43 68                             // ..PCICh

                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }


   15DAD: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                    Return (
   15DB6: A4                                               // .

Buffer (One)
                    {
                         0x00                                             // .
                    })
                }


   15DB7: 11 03 01 00                                      // ....

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    SOD3 (IC03, One, One)
                }


   15DBB: 14 10 5F 50 53 33 00 53 4F 44 33 49 43 30 33 01  // .._PS3.SOD3IC03.
   15DCB: 01                                               // .

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }
            }


   15DCC: 14 06 5F 50 53 30 00                             // .._PS0.

            If (LOr (LEqual (IM03, One), 
   15DD3: A0 1B 91 93 49 4D 30 33 01                       // ....IM03.

LEqual (IM03, Zero)))
            {

   15DDC: 93 49 4D 30 33 00                                // .IM03.

                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {

   15DE2: 14 0C 5F 41 44 52 00                             // .._ADR.

                    Return (0x00150003)
                }
            }
        }
    }


   15DE9: A4 0C 03 00 15 00                                // ......

    Scope (_SB.PCI0)
    {

   15DEF: 10 46 18 2E 5F 53 42 5F 50 43 49 30              // .F.._SB_PCI0

        Method (UDSM, 1, Serialized)
        {

   15DFB: 14 22 55 44 53 4D 09                             // ."UDSM.

            If (LEqual (Arg0, 
   15E02: A0 19 93 68                                      // ...h

ToUUID ("f7af8347-a966-49fe-9022-7a9deeebdb27") /* Unknown UUID */))
            {

   15E06: 11 13 0A 10 47 83 AF F7 66 A9 FE 49 90 22 7A 9D  // ....G...f..I."z.
   15E16: EE EB DB 27                                      // ...'

                Return (One)
            }


   15E1A: A4 01                                            // ..

            Return (Zero)
        }


   15E1C: A4 00                                            // ..

        Method (UDMA, 2, Serialized)
        {

   15E1E: 14 49 04 55 44 4D 41 0A                          // .I.UDMA.


   15E26: 08 5F 54 5F 30 00                                // ._T_0.

            Switch (ToInteger (Arg0))
            {

   15E2C: A2 2E 01 70 99 68 00 5F 54 5F 30                 // ...p.h._T_0

                Case (Zero)
                {

   15E37: A0 14 93 5F 54 5F 30 00                          // ..._T_0.

                    Return (
   15E3F: A4                                               // .

Buffer (0x08)
                    {
                         0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    })
                }

   15E40: 11 0B 0A 08 03 00 00 00 00 00 00 00              // ............

                Case
   15E4C: A1 0D                                            // ..

 (One)
                {

   15E4E: A0 0B 93 5F 54 5F 30 01                          // ..._T_0.

                    Return (
   15E56: A4                                               // .

ToInteger (Arg1))
                }


   15E57: 99 69 00                                         // .i.

            }


   15E5A: A5                                               // .

            Return (
   15E5B: A4                                               // .

Buffer (0x08)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
            })
        }


   15E5C: 11 0B 0A 08 00 00 00 00 00 00 00 00              // ............

        Device (UA00)
        {

   15E68: 5B 82 48 05 55 41 30 30                          // [.H.UA00

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {

   15E70: 14 2C 5F 44 53 4D 0C                             // .,_DSM.

                If (PCIC (Arg0))
                {

   15E77: A0 0F 50 43 49 43 68                             // ..PCICh

                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }


   15E7E: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                If (UDSM (Arg0))
                {

   15E87: A0 10 55 44 53 4D 68                             // ..UDSMh

                    Return (UDMA (Arg2, UD00))
                }


   15E8E: A4 55 44 4D 41 6A 55 44 30 30                    // .UDMAjUD00

                Return (
   15E98: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }


   15E99: 11 03 01 00                                      // ....

            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {

   15E9D: 14 0C 5F 41 44 52 00                             // .._ADR.

                Return (0x001E0000)
            }


   15EA4: A4 0C 00 00 1E 00                                // ......

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                SOD3 (UC00, One, One)
            }


   15EAA: 14 10 5F 50 53 33 00 53 4F 44 33 55 43 30 30 01  // .._PS3.SOD3UC00.
   15EBA: 01                                               // .

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }
        }


   15EBB: 14 06 5F 50 53 30 00                             // .._PS0.

        Device (UA01)
        {

   15EC2: 5B 82 48 05 55 41 30 31                          // [.H.UA01

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {

   15ECA: 14 2C 5F 44 53 4D 0C                             // .,_DSM.

                If (PCIC (Arg0))
                {

   15ED1: A0 0F 50 43 49 43 68                             // ..PCICh

                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }


   15ED8: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                If (UDSM (Arg0))
                {

   15EE1: A0 10 55 44 53 4D 68                             // ..UDSMh

                    Return (UDMA (Arg2, UD01))
                }


   15EE8: A4 55 44 4D 41 6A 55 44 30 31                    // .UDMAjUD01

                Return (
   15EF2: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }


   15EF3: 11 03 01 00                                      // ....

            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {

   15EF7: 14 0C 5F 41 44 52 00                             // .._ADR.

                Return (0x001E0001)
            }


   15EFE: A4 0C 01 00 1E 00                                // ......

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                SOD3 (UC01, One, One)
            }


   15F04: 14 10 5F 50 53 33 00 53 4F 44 33 55 43 30 31 01  // .._PS3.SOD3UC01.
   15F14: 01                                               // .

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }
        }


   15F15: 14 06 5F 50 53 30 00                             // .._PS0.

        Device (UA02)
        {

   15F1C: 5B 82 48 05 55 41 30 32                          // [.H.UA02

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {

   15F24: 14 2C 5F 44 53 4D 0C                             // .,_DSM.

                If (PCIC (Arg0))
                {

   15F2B: A0 0F 50 43 49 43 68                             // ..PCICh

                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }


   15F32: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                If (UDSM (Arg0))
                {

   15F3B: A0 10 55 44 53 4D 68                             // ..UDSMh

                    Return (UDMA (Arg2, UD02))
                }


   15F42: A4 55 44 4D 41 6A 55 44 30 32                    // .UDMAjUD02

                Return (
   15F4C: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }


   15F4D: 11 03 01 00                                      // ....

            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {

   15F51: 14 0C 5F 41 44 52 00                             // .._ADR.

                Return (0x00190000)
            }


   15F58: A4 0C 00 00 19 00                                // ......

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                SOD3 (UC02, One, One)
            }


   15F5E: 14 10 5F 50 53 33 00 53 4F 44 33 55 43 30 32 01  // .._PS3.SOD3UC02.
   15F6E: 01                                               // .

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }
        }
    }


   15F6F: 14 06 5F 50 53 30 00                             // .._PS0.

    Scope (_SB)
    {

   15F76: 10 4C 5F 5F 53 42 5F                             // .L__SB_

        Device (URSC)
        {

   15F7D: 5B 82 4E 12 55 52 53 43                          // [.N.URSC

            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID

   15F85: 08 5F 48 49 44 0C 41 D0 0C 02                    // ._HID.A...

            Name (_STA, 0x03)  // _STA: Status

   15F8F: 08 5F 53 54 41 0A 03                             // ._STA..

            Name (_UID, 0x05)  // _UID: Unique ID

   15F96: 08 5F 55 49 44 0A 05                             // ._UID..

            Method (UARB, 2, Serialized)
            {
                Store (
   15F9D: 14 4B 0B 55 41 52 42 0A 70                       // .K.UARB.p

Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }, Local0)

   15FA6: 11 05 0A 02 79 00 60                             // ....y.`

                If (LOr (LEqual (Arg0, 0x02), 
   15FAD: A0 49 0A 91 93 68 0A 02                          // .I...h..

LEqual (Arg0, 0x03)))
                {

   15FB5: 93 68 0A 03                                      // .h..

                    OperationRegion (UACF, SystemMemory, Arg1, 0x20)

   15FB9: 5B 80 55 41 43 46 00 69 0A 20                    // [.UACF.i. 

                    Field (UACF, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x10), 
                        BAR0,   64, 
                        BAR1,   64
                    }


   15FC3: 5B 81 15 55 41 43 46 03 00 40 08 42 41 52 30 40  // [..UACF..@.BAR0@
   15FD3: 04 42 41 52 31 40 04                             // .BAR1@.

                    Name (BUF1, 
   15FDA: 08 42 55 46 31                                   // .BUF1

Buffer (0x0E)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0xF8, 0x0F, 0x00, 0x00, 0x79, 0x00               // ....y.
                    })

   15FDF: 11 11 0A 0E 86 09 00 01 00 00 00 00 F8 0F 00 00  // ................
   15FEF: 79 00                                            // y.

                    Name (BUF2, 
   15FF1: 08 42 55 46 32                                   // .BUF2

Buffer (0x0E)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
                    })

   15FF6: 11 11 0A 0E 86 09 00 01 00 00 00 00 00 10 00 00  // ................
   16006: 79 00                                            // y.

                    CreateDWordField (BUF1, 0x04, ADR1)

   16008: 8A 42 55 46 31 0A 04 41 44 52 31                 // .BUF1..ADR1

                    CreateDWordField (BUF2, 0x04, ADR2)
                    Store (And (BAR0, 0xFFFFFFFFFFFFF000), Local1)
                    Store (Add (Local1, 0x08), ADR1) /* \_SB_.URSC.UARB.ADR1 */
                    Store (And (BAR1, 0xFFFFFFFFFFFFF000), ADR2) /* \_SB_.URSC.UARB.ADR2 */

   16013: 8A 42 55 46 32 0A 04 41 44 52 32 70 7B 42 41 52  // .BUF2..ADR2p{BAR
   16023: 30 0E 00 F0 FF FF FF FF FF FF 00 61 70 72 61 0A  // 0..........apra.
   16033: 08 00 41 44 52 31 70 7B 42 41 52 31 0E 00 F0 FF  // ..ADR1p{BAR1....
   16043: FF FF FF FF FF 00 41 44 52 32                    // ......ADR2

                    ConcatenateResTemplate (BUF1, BUF2, Local0)
                }


   1604D: 84 42 55 46 31 42 55 46 32 60                    // .BUF1BUF2`

                Return (Local0)
            }


   16057: A4 60                                            // .`

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Store (
   16059: 14 43 05 5F 43 52 53 08 70                       // .C._CRS.p

Buffer (0x0E)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x80, 0x03, 0xFE,  // ........
                        /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
                    }, Local0)
                ConcatenateResTemplate (Local0, UARB (UM00, UC00), Local1)
                Store (Local1, Local0)
                ConcatenateResTemplate (Local0, UARB (UM01, UC01), Local1)
                Store (Local1, Local0)
                ConcatenateResTemplate (Local0, UARB (UM02, UC02), Local1)
                Store (Local1, Local0)

   16062: 11 11 0A 0E 86 09 00 01 00 80 03 FE 00 10 00 00  // ................
   16072: 79 00 60 84 60 55 41 52 42 55 4D 30 30 55 43 30  // y.`.`UARBUM00UC0
   16082: 30 61 70 61 60 84 60 55 41 52 42 55 4D 30 31 55  // 0apa`.`UARBUM01U
   16092: 43 30 31 61 70 61 60 84 60 55 41 52 42 55 4D 30  // C01apa`.`UARBUM0
   160A2: 32 55 43 30 32 61 70 61 60                       // 2UC02apa`

                Return (Local0)
            }
        }


   160AB: A4 60                                            // .`

        Method (UARH, 2, Serialized)
        {

   160AD: 14 4C 08 55 41 52 48 0A                          // .L.UARH.

            OperationRegion (UACF, SystemMemory, Arg0, 0x18)

   160B5: 5B 80 55 41 43 46 00 68 0A 18                    // [.UACF.h..

            Field (UACF, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                BAR0,   64
            }


   160BF: 5B 81 0F 55 41 43 46 03 00 40 08 42 41 52 30 40  // [..UACF..@.BAR0@
   160CF: 04                                               // .

            Name (BUF0, 
   160D0: 08 42 55 46 30                                   // .BUF0

Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x08, 0x00, 0x00, 0x00, 0x79, 0x00               // ....y.
            })

   160D5: 11 11 0A 0E 86 09 00 01 00 00 00 00 08 00 00 00  // ................
   160E5: 79 00                                            // y.

            Name (IBUF, 
   160E7: 08 49 42 55 46                                   // .IBUF

Buffer (0x0B)
            {
                /* 0000 */  0x89, 0x06, 0x00, 0x0D, 0x01, 0x14, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x79, 0x00                                 // .y.
            })

   160EC: 11 0E 0A 0B 89 06 00 0D 01 14 00 00 00 79 00     // .............y.

            CreateDWordField (BUF0, 0x04, ADR0)

   160FB: 8A 42 55 46 30 0A 04 41 44 52 30                 // .BUF0..ADR0

            CreateDWordField (IBUF, 0x05, IRQN)
            Store (And (BAR0, 0xFFFFFFFFFFFFF000), Local0)
            Store (Local0, ADR0) /* \_SB_.UARH.ADR0 */
            Store (Arg1, IRQN) /* \_SB_.UARH.IRQN */
            ConcatenateResTemplate (BUF0, IBUF, Local1)

   16106: 8A 49 42 55 46 0A 05 49 52 51 4E 70 7B 42 41 52  // .IBUF..IRQNp{BAR
   16116: 30 0E 00 F0 FF FF FF FF FF FF 00 60 70 60 41 44  // 0..........`p`AD
   16126: 52 30 70 69 49 52 51 4E 84 42 55 46 30 49 42 55  // R0piIRQN.BUF0IBU
   16136: 46 61                                            // Fa

            Return (Local1)
        }


   16138: A4 61                                            // .a

        Method (UAPG, 3, Serialized)
        {

   1613A: 14 4F 06 55 41 50 47 0B                          // .O.UAPG.

            If (
   16142: A0 08 92                                         // ...

LNotEqual (Arg1, 0x02))
            {

   16145: 93 69 0A 02                                      // .i..

                Return (Arg1)
            }


   16149: A4 69                                            // .i

            OperationRegion (UACF, SystemMemory, Arg2, 0x18)

   1614B: 5B 80 55 41 43 46 00 6A 0A 18                    // [.UACF.j..

            Field (UACF, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                BAR0,   64
            }


   16155: 5B 81 0F 55 41 43 46 03 00 40 08 42 41 52 30 40  // [..UACF..@.BAR0@
   16165: 04                                               // .

            OperationRegion (UAB0, SystemMemory, And (BAR0, 0xFFFFFFFFFFFFF000), 0x10)

   16166: 5B 80 55 41 42 30 00 7B 42 41 52 30 0E 00 F0 FF  // [.UAB0.{BAR0....
   16176: FF FF FF FF FF 00 0A 10                          // ........

            Field (UAB0, ByteAcc, Lock, Preserve)
            {
                DLL,    8, 
                DLH,    8, 
                FCR,    8, 
                LCR,    8
            }

            Store (LCR, Local0)

   1617E: 5B 81 1A 55 41 42 30 11 44 4C 4C 5F 08 44 4C 48  // [..UAB0.DLL_.DLH
   1618E: 5F 08 46 43 52 5F 08 4C 43 52 5F 08 70 4C 43 52  // _.FCR_.LCR_.pLCR
   1619E: 5F 60                                            // _`

            If (LAnd (Local0, 0x7F))
            {

   161A0: A0 07 90 60 0A 7F                                // ...`..

                Return (Zero)
            }


   161A6: A4 00                                            // ..

            Return (One)
        }


   161A8: A4 01                                            // ..

        Method (UHID, 1, Serialized)
        {

   161AA: 14 18 55 48 49 44 09                             // ..UHID.

            If (LEqual (Arg0, 0x03))
            {

   161B1: A0 0B 93 68 0A 03                                // ...h..

                Return (0x0105D041)
            }


   161B7: A4 0C 41 D0 05 01                                // ..A...

            Return (0x020CD041)
        }


   161BD: A4 0C 41 D0 0C 02                                // ..A...

        Method (UPS3, 2, Serialized)
        {

   161C3: 14 4C 07 55 50 53 33 0A                          // .L.UPS3.

            Name (STMP, Zero)

   161CB: 08 53 54 4D 50 00                                // .STMP.

            If (LEqual (Arg0, One))
            {

   161D1: A0 4E 06 93 68 01                                // .N..h.

                OperationRegion (UACF, SystemMemory, Arg1, 0x88)

   161D7: 5B 80 55 41 43 46 00 69 0A 88                    // [.UACF.i..

                Field (UACF, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    BAR0,   64
                }


   161E1: 5B 81 0F 55 41 43 46 03 00 40 08 42 41 52 30 40  // [..UACF..@.BAR0@
   161F1: 04                                               // .

                Field (UACF, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    PMEC,   8
                }


   161F2: 5B 81 0E 55 41 43 46 01 00 40 42 50 4D 45 43 08  // [..UACF..@BPMEC.

                OperationRegion (UAB0, SystemMemory, And (BAR0, 0xFFFFFFFFFFFFF000), 0x82)

   16202: 5B 80 55 41 42 30 00 7B 42 41 52 30 0E 00 F0 FF  // [.UAB0.{BAR0....
   16212: FF FF FF FF FF 00 0A 82                          // ........

                Field (UAB0, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x81), 
                    PPRR,   8
                }

                Store (Zero, PPRR) /* \_SB_.UPS3.PPRR */
                Store (0x03, PMEC) /* \_SB_.UPS3.PMEC */

   1621A: 5B 81 0E 55 41 42 30 01 00 48 40 50 50 52 52 08  // [..UAB0..H@PPRR.
   1622A: 70 00 50 50 52 52 70 0A 03 50 4D 45 43           // p.PPRRp..PMEC

                Store (PMEC, STMP) /* \_SB_.UPS3.STMP */
            }
        }


   16237: 70 50 4D 45 43 53 54 4D 50                       // pPMECSTMP

        Method (UPS0, 2, Serialized)
        {

   16240: 14 4C 07 55 50 53 30 0A                          // .L.UPS0.

            Name (STMP, Zero)

   16248: 08 53 54 4D 50 00                                // .STMP.

            If (LEqual (Arg0, One))
            {

   1624E: A0 4E 06 93 68 01                                // .N..h.

                OperationRegion (UACF, SystemMemory, Arg1, 0x88)

   16254: 5B 80 55 41 43 46 00 69 0A 88                    // [.UACF.i..

                Field (UACF, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    BAR0,   64
                }


   1625E: 5B 81 0F 55 41 43 46 03 00 40 08 42 41 52 30 40  // [..UACF..@.BAR0@
   1626E: 04                                               // .

                Field (UACF, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    PMEC,   8
                }

                Store (Zero, PMEC) /* \_SB_.UPS0.PMEC */
                Store (PMEC, STMP) /* \_SB_.UPS0.STMP */

   1626F: 5B 81 0E 55 41 43 46 01 00 40 42 50 4D 45 43 08  // [..UACF..@BPMEC.
   1627F: 70 00 50 4D 45 43 70 50 4D 45 43 53 54 4D 50     // p.PMECpPMECSTMP

                OperationRegion (UAB0, SystemMemory, And (BAR0, 0xFFFFFFFFFFFFF000), 0x82)

   1628E: 5B 80 55 41 42 30 00 7B 42 41 52 30 0E 00 F0 FF  // [.UAB0.{BAR0....
   1629E: FF FF FF FF FF 00 0A 82                          // ........

                Field (UAB0, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x81), 
                    PPRR,   8
                }


   162A6: 5B 81 0E 55 41 42 30 01 00 48 40 50 50 52 52 08  // [..UAB0..H@PPRR.

                Store (0x07, PPRR) /* \_SB_.UPS0.PPRR */
            }
        }


   162B6: 70 0A 07 50 50 52 52                             // p..PPRR

        Method (UPSC, 1, Serialized)
        {

   162BD: 14 2A 55 50 53 43 09                             // .*UPSC.

            OperationRegion (UACF, SystemMemory, Add (Arg0, 0x84), 0x04)

   162C4: 5B 80 55 41 43 46 00 72 68 0A 84 00 0A 04        // [.UACF.rh.....

            Field (UACF, ByteAcc, NoLock, Preserve)
            {
                PMEC,   8
            }


   162D2: 5B 81 0B 55 41 43 46 01 50 4D 45 43 08           // [..UACF.PMEC.

            Return (
   162DF: A4                                               // .

And (PMEC, 0x03))
        }


   162E0: 7B 50 4D 45 43 0A 03 00                          // {PMEC...

        If (LOr (LEqual (UM00, 0x02), 
   162E8: A0 48 0D 91 93 55 4D 30 30 0A 02                 // .H...UM00..

LEqual (UM00, 0x03)))
        {

   162F3: 93 55 4D 30 30 0A 03                             // .UM00..

            Device (UAH0)
            {

   162FA: 5B 82 45 0C 55 41 48 30                          // [.E.UAH0

                Name (_DDN, "SerialIoUart0")  // _DDN: DOS Device Name

   16302: 08 5F 44 44 4E 0D 53 65 72 69 61 6C 49 6F 55 61  // ._DDN.SerialIoUa
   16312: 72 74 30 00                                      // rt0.

                Name (_UID, "SerialIoUart0")  // _UID: Unique ID

   16316: 08 5F 55 49 44 0D 53 65 72 69 61 6C 49 6F 55 61  // ._UID.SerialIoUa
   16326: 72 74 30 00                                      // rt0.

                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {

   1632A: 14 0F 5F 48 49 44 00                             // .._HID.

                    Return (UHID (UM00))
                }


   16331: A4 55 48 49 44 55 4D 30 30                       // .UHIDUM00

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   1633A: 14 13 5F 43 52 53 00                             // .._CRS.

                    Return (UARH (UC00, UI00))
                }


   16341: A4 55 41 52 48 55 43 30 30 55 49 30 30           // .UARHUC00UI00

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   1634E: 14 33 5F 53 54 41 00                             // .3_STA.

                    If (LEqual (UM00, 0x03))
                    {

   16355: A0 29 93 55 4D 30 30 0A 03                       // .).UM00..

                        If (LEqual (UP00, 0x02))
                        {

   1635E: A0 1D 93 55 50 30 30 0A 02                       // ...UP00..

                            Store (UAPG (UM00, UP00, UC00), UP00) /* \UP00 */
                        }


   16367: 70 55 41 50 47 55 4D 30 30 55 50 30 30 55 43 30  // pUAPGUM00UP00UC0
   16377: 30 55 50 30 30                                   // 0UP00

                        Return (0x0F)
                    }


   1637C: A4 0A 0F                                         // ...

                    Return (0x03)
                }


   1637F: A4 0A 03                                         // ...

                If (LEqual (UM00, 0x03))
                {

   16382: A0 3E 93 55 4D 30 30 0A 03                       // .>.UM00..

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {

   1638B: 14 0F 5F 50 53 43 00                             // .._PSC.

                        Return (UPSC (UC00))
                    }


   16392: A4 55 50 53 43 55 43 30 30                       // .UPSCUC00

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        UPS3 (UP00, UC00)
                    }


   1639B: 14 12 5F 50 53 33 00 55 50 53 33 55 50 30 30 55  // .._PS3.UPS3UP00U
   163AB: 43 30 30                                         // C00

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        UPS0 (UP00, UC00)
                    }
                }
            }
        }


   163AE: 14 12 5F 50 53 30 00 55 50 53 30 55 50 30 30 55  // .._PS0.UPS0UP00U
   163BE: 43 30 30                                         // C00

        If (LOr (LEqual (UM01, 0x02), 
   163C1: A0 48 0D 91 93 55 4D 30 31 0A 02                 // .H...UM01..

LEqual (UM01, 0x03)))
        {

   163CC: 93 55 4D 30 31 0A 03                             // .UM01..

            Device (UAH1)
            {

   163D3: 5B 82 45 0C 55 41 48 31                          // [.E.UAH1

                Name (_DDN, "SerialIoUart1")  // _DDN: DOS Device Name

   163DB: 08 5F 44 44 4E 0D 53 65 72 69 61 6C 49 6F 55 61  // ._DDN.SerialIoUa
   163EB: 72 74 31 00                                      // rt1.

                Name (_UID, "SerialIoUart1")  // _UID: Unique ID

   163EF: 08 5F 55 49 44 0D 53 65 72 69 61 6C 49 6F 55 61  // ._UID.SerialIoUa
   163FF: 72 74 31 00                                      // rt1.

                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {

   16403: 14 0F 5F 48 49 44 00                             // .._HID.

                    Return (UHID (UM01))
                }


   1640A: A4 55 48 49 44 55 4D 30 31                       // .UHIDUM01

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   16413: 14 13 5F 43 52 53 00                             // .._CRS.

                    Return (UARH (UC01, UI01))
                }


   1641A: A4 55 41 52 48 55 43 30 31 55 49 30 31           // .UARHUC01UI01

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   16427: 14 33 5F 53 54 41 00                             // .3_STA.

                    If (LEqual (UM01, 0x03))
                    {

   1642E: A0 29 93 55 4D 30 31 0A 03                       // .).UM01..

                        If (LEqual (UP01, 0x02))
                        {

   16437: A0 1D 93 55 50 30 31 0A 02                       // ...UP01..

                            Store (UAPG (UM01, UP01, UC01), UP01) /* \UP01 */
                        }


   16440: 70 55 41 50 47 55 4D 30 31 55 50 30 31 55 43 30  // pUAPGUM01UP01UC0
   16450: 31 55 50 30 31                                   // 1UP01

                        Return (0x0F)
                    }


   16455: A4 0A 0F                                         // ...

                    Return (0x03)
                }


   16458: A4 0A 03                                         // ...

                If (LEqual (UM01, 0x03))
                {

   1645B: A0 3E 93 55 4D 30 31 0A 03                       // .>.UM01..

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {

   16464: 14 0F 5F 50 53 43 00                             // .._PSC.

                        Return (UPSC (UC01))
                    }


   1646B: A4 55 50 53 43 55 43 30 31                       // .UPSCUC01

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        UPS3 (UP01, UC01)
                    }


   16474: 14 12 5F 50 53 33 00 55 50 53 33 55 50 30 31 55  // .._PS3.UPS3UP01U
   16484: 43 30 31                                         // C01

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        UPS0 (UP01, UC01)
                    }
                }
            }
        }


   16487: 14 12 5F 50 53 30 00 55 50 53 30 55 50 30 31 55  // .._PS0.UPS0UP01U
   16497: 43 30 31                                         // C01

        If (LOr (LEqual (UM02, 0x02), 
   1649A: A0 48 0D 91 93 55 4D 30 32 0A 02                 // .H...UM02..

LEqual (UM02, 0x03)))
        {

   164A5: 93 55 4D 30 32 0A 03                             // .UM02..

            Device (UAH2)
            {

   164AC: 5B 82 45 0C 55 41 48 32                          // [.E.UAH2

                Name (_DDN, "SerialIoUart2")  // _DDN: DOS Device Name

   164B4: 08 5F 44 44 4E 0D 53 65 72 69 61 6C 49 6F 55 61  // ._DDN.SerialIoUa
   164C4: 72 74 32 00                                      // rt2.

                Name (_UID, "SerialIoUart2")  // _UID: Unique ID

   164C8: 08 5F 55 49 44 0D 53 65 72 69 61 6C 49 6F 55 61  // ._UID.SerialIoUa
   164D8: 72 74 32 00                                      // rt2.

                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {

   164DC: 14 0F 5F 48 49 44 00                             // .._HID.

                    Return (UHID (UM02))
                }


   164E3: A4 55 48 49 44 55 4D 30 32                       // .UHIDUM02

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   164EC: 14 13 5F 43 52 53 00                             // .._CRS.

                    Return (UARH (UC02, UI02))
                }


   164F3: A4 55 41 52 48 55 43 30 32 55 49 30 32           // .UARHUC02UI02

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   16500: 14 33 5F 53 54 41 00                             // .3_STA.

                    If (LEqual (UM02, 0x03))
                    {

   16507: A0 29 93 55 4D 30 32 0A 03                       // .).UM02..

                        If (LEqual (UP02, 0x02))
                        {

   16510: A0 1D 93 55 50 30 32 0A 02                       // ...UP02..

                            Store (UAPG (UM02, UP02, UC02), UP02) /* \UP02 */
                        }


   16519: 70 55 41 50 47 55 4D 30 32 55 50 30 32 55 43 30  // pUAPGUM02UP02UC0
   16529: 32 55 50 30 32                                   // 2UP02

                        Return (0x0F)
                    }


   1652E: A4 0A 0F                                         // ...

                    Return (0x03)
                }


   16531: A4 0A 03                                         // ...

                If (LEqual (UM02, 0x03))
                {

   16534: A0 3E 93 55 4D 30 32 0A 03                       // .>.UM02..

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {

   1653D: 14 0F 5F 50 53 43 00                             // .._PSC.

                        Return (UPSC (UC02))
                    }


   16544: A4 55 50 53 43 55 43 30 32                       // .UPSCUC02

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        UPS3 (UP02, UC02)
                    }


   1654D: 14 12 5F 50 53 33 00 55 50 53 33 55 50 30 32 55  // .._PS3.UPS3UP02U
   1655D: 43 30 32                                         // C02

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        UPS0 (UP02, UC02)
                    }
                }
            }
        }
    }


   16560: 14 12 5F 50 53 30 00 55 50 53 30 55 50 30 32 55  // .._PS0.UPS0UP02U
   16570: 43 30 32                                         // C02

    Scope (_SB.PCI0)
    {

   16573: 10 4B 05 2E 5F 53 42 5F 50 43 49 30              // .K.._SB_PCI0

        Device (ISHD)
        {

   1657F: 5B 82 4E 04 49 53 48 44                          // [.N.ISHD

            Name (_ADR, 0x00130000)  // _ADR: Address

   16587: 08 5F 41 44 52 0C 00 00 13 00                    // ._ADR.....

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   16591: 14 3D 5F 44 53 4D 04                             // .=_DSM.

                If (PCIC (Arg0))
                {

   16598: A0 0F 50 43 49 43 68                             // ..PCICh

                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }


   1659F: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                If (CondRefOf (HIWC))
                {

   165A8: A0 21 5B 12 48 49 57 43 00                       // .![.HIWC.

                    If (HIWC (Arg0))
                    {

   165B1: A0 18 48 49 57 43 68                             // ..HIWCh

                        If (CondRefOf (HIDW))
                        {

   165B8: A0 11 5B 12 48 49 44 57 00                       // ..[.HIDW.

                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }


   165C1: A4 48 49 44 57 68 69 6A 6B                       // .HIDWhijk

                Return (
   165CA: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }


   165CB: 11 03 01 00                                      // ....

    Scope (_SB.PCI0)
    {

   165CF: 10 4B 05 2E 5F 53 42 5F 50 43 49 30              // .K.._SB_PCI0

        Device (HECI)
        {

   165DB: 5B 82 4E 04 48 45 43 49                          // [.N.HECI

            Name (_ADR, 0x00160000)  // _ADR: Address

   165E3: 08 5F 41 44 52 0C 00 00 16 00                    // ._ADR.....

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {

   165ED: 14 3D 5F 44 53 4D 04                             // .=_DSM.

                If (PCIC (Arg0))
                {

   165F4: A0 0F 50 43 49 43 68                             // ..PCICh

                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }


   165FB: A4 50 43 49 44 68 69 6A 6B                       // .PCIDhijk

                If (CondRefOf (HIWC))
                {

   16604: A0 21 5B 12 48 49 57 43 00                       // .![.HIWC.

                    If (HIWC (Arg0))
                    {

   1660D: A0 18 48 49 57 43 68                             // ..HIWCh

                        If (CondRefOf (HIDW))
                        {

   16614: A0 11 5B 12 48 49 44 57 00                       // ..[.HIDW.

                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }


   1661D: A4 48 49 44 57 68 69 6A 6B                       // .HIDWhijk

                Return (
   16626: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }


   16627: 11 03 01 00                                      // ....

    Scope (_SB.PCI0.LPCB)
    {

   1662B: 10 49 2B 2F 03 5F 53 42 5F 50 43 49 30 4C 50 43  // .I+/._SB_PCI0LPC
   1663B: 42                                               // B

        Device (HPET)
        {

   1663C: 5B 82 45 06 48 50 45 54                          // [.E.HPET

            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID

   16644: 08 5F 48 49 44 0C 41 D0 01 03                    // ._HID.A...

            Name (_UID, Zero)  // _UID: Unique ID

   1664E: 08 5F 55 49 44 00                                // ._UID.

            Name (BUF0, 
   16654: 08 42 55 46 30                                   // .BUF0

Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD0, 0xFE,  // ........
                /* 0008 */  0x00, 0x04, 0x00, 0x00, 0x79, 0x00               // ....y.
            })

   16659: 11 11 0A 0E 86 09 00 01 00 00 D0 FE 00 04 00 00  // ................
   16669: 79 00                                            // y.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   1666B: 14 11 5F 53 54 41 00                             // .._STA.

                If (HPTE)
                {

   16672: A0 08 48 50 54 45                                // ..HPTE

                    Return (0x0F)
                }


   16678: A4 0A 0F                                         // ...

                Return (Zero)
            }


   1667B: A4 00                                            // ..

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {

   1667D: 14 25 5F 43 52 53 08                             // .%_CRS.

                If (HPTE)
                {

   16684: A0 19 48 50 54 45                                // ..HPTE

                    CreateDWordField (BUF0, 0x04, HPT0)

   1668A: 8A 42 55 46 30 0A 04 48 50 54 30                 // .BUF0..HPT0

                    Store (HPTB, HPT0) /* \_SB_.PCI0.LPCB.HPET._CRS.HPT0 */
                }


   16695: 70 48 50 54 42 48 50 54 30                       // pHPTBHPT0

                Return (BUF0) /* \_SB_.PCI0.LPCB.HPET.BUF0 */
            }
        }


   1669E: A4 42 55 46 30                                   // .BUF0

        Device (IPIC)
        {

   166A3: 5B 82 45 0A 49 50 49 43                          // [.E.IPIC

            Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID

   166AB: 08 5F 48 49 44 0B 41 D0                          // ._HID.A.

            Name (_CRS, 
   166B3: 08 5F 43 52 53                                   // ._CRS

Buffer (0x8D)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x20, 0x00, 0x20, 0x00, 0x01, 0x02,  // G. . ...
                /* 0008 */  0x47, 0x01, 0x24, 0x00, 0x24, 0x00, 0x01, 0x02,  // G.$.$...
                /* 0010 */  0x47, 0x01, 0x28, 0x00, 0x28, 0x00, 0x01, 0x02,  // G.(.(...
                /* 0018 */  0x47, 0x01, 0x2C, 0x00, 0x2C, 0x00, 0x01, 0x02,  // G.,.,...
                /* 0020 */  0x47, 0x01, 0x30, 0x00, 0x30, 0x00, 0x01, 0x02,  // G.0.0...
                /* 0028 */  0x47, 0x01, 0x34, 0x00, 0x34, 0x00, 0x01, 0x02,  // G.4.4...
                /* 0030 */  0x47, 0x01, 0x38, 0x00, 0x38, 0x00, 0x01, 0x02,  // G.8.8...
                /* 0038 */  0x47, 0x01, 0x3C, 0x00, 0x3C, 0x00, 0x01, 0x02,  // G.<.<...
                /* 0040 */  0x47, 0x01, 0xA0, 0x00, 0xA0, 0x00, 0x01, 0x02,  // G.......
                /* 0048 */  0x47, 0x01, 0xA4, 0x00, 0xA4, 0x00, 0x01, 0x02,  // G.......
                /* 0050 */  0x47, 0x01, 0xA8, 0x00, 0xA8, 0x00, 0x01, 0x02,  // G.......
                /* 0058 */  0x47, 0x01, 0xAC, 0x00, 0xAC, 0x00, 0x01, 0x02,  // G.......
                /* 0060 */  0x47, 0x01, 0xB0, 0x00, 0xB0, 0x00, 0x01, 0x02,  // G.......
                /* 0068 */  0x47, 0x01, 0xB4, 0x00, 0xB4, 0x00, 0x01, 0x02,  // G.......
                /* 0070 */  0x47, 0x01, 0xB8, 0x00, 0xB8, 0x00, 0x01, 0x02,  // G.......
                /* 0078 */  0x47, 0x01, 0xBC, 0x00, 0xBC, 0x00, 0x01, 0x02,  // G.......
                /* 0080 */  0x47, 0x01, 0xD0, 0x04, 0xD0, 0x04, 0x01, 0x02,  // G.......
                /* 0088 */  0x22, 0x04, 0x00, 0x79, 0x00                     // "..y.
            })
        }


   166B8: 11 41 09 0A 8D 47 01 20 00 20 00 01 02 47 01 24  // .A...G. . ...G.$
   166C8: 00 24 00 01 02 47 01 28 00 28 00 01 02 47 01 2C  // .$...G.(.(...G.,
   166D8: 00 2C 00 01 02 47 01 30 00 30 00 01 02 47 01 34  // .,...G.0.0...G.4
   166E8: 00 34 00 01 02 47 01 38 00 38 00 01 02 47 01 3C  // .4...G.8.8...G.<
   166F8: 00 3C 00 01 02 47 01 A0 00 A0 00 01 02 47 01 A4  // .<...G.......G..
   16708: 00 A4 00 01 02 47 01 A8 00 A8 00 01 02 47 01 AC  // .....G.......G..
   16718: 00 AC 00 01 02 47 01 B0 00 B0 00 01 02 47 01 B4  // .....G.......G..
   16728: 00 B4 00 01 02 47 01 B8 00 B8 00 01 02 47 01 BC  // .....G.......G..
   16738: 00 BC 00 01 02 47 01 D0 04 D0 04 01 02 22 04 00  // .....G......."..
   16748: 79 00                                            // y.

        Device (MATH)
        {

   1674A: 5B 82 3E 4D 41 54 48                             // [.>MATH

            Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID

   16751: 08 5F 48 49 44 0C 41 D0 0C 04                    // ._HID.A...

            Name (_CRS, 
   1675B: 08 5F 43 52 53                                   // ._CRS

Buffer (0x0D)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0xF0, 0x00, 0xF0, 0x00, 0x01, 0x01,  // G.......
                /* 0008 */  0x22, 0x00, 0x20, 0x79, 0x00                     // ". y.
            })

   16760: 11 10 0A 0D 47 01 F0 00 F0 00 01 01 22 00 20 79  // ....G.......". y
   16770: 00                                               // .

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   16771: 14 18 5F 53 54 41 00                             // .._STA.

                If (LEqual (PCHS, PCHH))
                {

   16778: A0 0D 93 50 43 48 53 50 43 48 48                 // ...PCHSPCHH

                    Return (0x1F)
                }

   16783: A4 0A 1F                                         // ...

                Else
                {

   16786: A1 03                                            // ..

                    Return (Zero)
                }
            }
        }


   16788: A4 00                                            // ..

        Device (LDRC)
        {

   1678A: 5B 82 4B 07 4C 44 52 43                          // [.K.LDRC

            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID

   16792: 08 5F 48 49 44 0C 41 D0 0C 02                    // ._HID.A...

            Name (_UID, 0x02)  // _UID: Unique ID

   1679C: 08 5F 55 49 44 0A 02                             // ._UID..

            Name (_CRS, 
   167A3: 08 5F 43 52 53                                   // ._CRS

Buffer (0x5A)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x2E, 0x00, 0x2E, 0x00, 0x01, 0x02,  // G.......
                /* 0008 */  0x47, 0x01, 0x4E, 0x00, 0x4E, 0x00, 0x01, 0x02,  // G.N.N...
                /* 0010 */  0x47, 0x01, 0x61, 0x00, 0x61, 0x00, 0x01, 0x01,  // G.a.a...
                /* 0018 */  0x47, 0x01, 0x63, 0x00, 0x63, 0x00, 0x01, 0x01,  // G.c.c...
                /* 0020 */  0x47, 0x01, 0x65, 0x00, 0x65, 0x00, 0x01, 0x01,  // G.e.e...
                /* 0028 */  0x47, 0x01, 0x67, 0x00, 0x67, 0x00, 0x01, 0x01,  // G.g.g...
                /* 0030 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x01,  // G.p.p...
                /* 0038 */  0x47, 0x01, 0x80, 0x00, 0x80, 0x00, 0x01, 0x01,  // G.......
                /* 0040 */  0x47, 0x01, 0x92, 0x00, 0x92, 0x00, 0x01, 0x01,  // G.......
                /* 0048 */  0x47, 0x01, 0xB2, 0x00, 0xB2, 0x00, 0x01, 0x02,  // G.......
                /* 0050 */  0x47, 0x01, 0x80, 0x06, 0x80, 0x06, 0x01, 0x20,  // G...... 
                /* 0058 */  0x79, 0x00                                       // y.
            })
        }


   167A8: 11 4E 05 0A 5A 47 01 2E 00 2E 00 01 02 47 01 4E  // .N..ZG.......G.N
   167B8: 00 4E 00 01 02 47 01 61 00 61 00 01 01 47 01 63  // .N...G.a.a...G.c
   167C8: 00 63 00 01 01 47 01 65 00 65 00 01 01 47 01 67  // .c...G.e.e...G.g
   167D8: 00 67 00 01 01 47 01 70 00 70 00 01 01 47 01 80  // .g...G.p.p...G..
   167E8: 00 80 00 01 01 47 01 92 00 92 00 01 01 47 01 B2  // .....G.......G..
   167F8: 00 B2 00 01 02 47 01 80 06 80 06 01 20 79 00     // .....G...... y.

        Device (RTC)
        {

   16807: 5B 82 3B 52 54 43 5F                             // [.;RTC_

            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID

   1680E: 08 5F 48 49 44 0C 41 D0 0B 00                    // ._HID.A...

            Name (_CRS, 
   16818: 08 5F 43 52 53                                   // ._CRS

Buffer (0x0D)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x08,  // G.p.p...
                /* 0008 */  0x22, 0x00, 0x01, 0x79, 0x00                     // "..y.
            })

   1681D: 11 10 0A 0D 47 01 70 00 70 00 01 08 22 00 01 79  // ....G.p.p..."..y
   1682D: 00                                               // .

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   1682E: 14 15 5F 53 54 41 00                             // .._STA.

                If (LEqual (STAS, One))
                {

   16835: A0 0A 93 53 54 41 53 01                          // ...STAS.

                    Return (0x0F)
                }

   1683D: A4 0A 0F                                         // ...

                Else
                {

   16840: A1 03                                            // ..

                    Return (Zero)
                }
            }
        }


   16842: A4 00                                            // ..

        Device (TIMR)
        {

   16844: 5B 82 2D 54 49 4D 52                             // [.-TIMR

            Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID

   1684B: 08 5F 48 49 44 0C 41 D0 01 00                    // ._HID.A...

            Name (_CRS, 
   16855: 08 5F 43 52 53                                   // ._CRS

Buffer (0x15)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x40, 0x00, 0x40, 0x00, 0x01, 0x04,  // G.@.@...
                /* 0008 */  0x47, 0x01, 0x50, 0x00, 0x50, 0x00, 0x10, 0x04,  // G.P.P...
                /* 0010 */  0x22, 0x01, 0x00, 0x79, 0x00                     // "..y.
            })
        }


   1685A: 11 18 0A 15 47 01 40 00 40 00 01 04 47 01 50 00  // ....G.@.@...G.P.
   1686A: 50 00 10 04 22 01 00 79 00                       // P..."..y.

        Device (CWDT)
        {

   16873: 5B 82 40 07 43 57 44 54                          // [.@.CWDT

            Name (_HID, EisaId ("INT3F0D") /* ACPI Motherboard Resources */)  // _HID: Hardware ID

   1687B: 08 5F 48 49 44 0C 25 D4 3F 0D                    // ._HID.%.?.

            Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID

   16885: 08 5F 43 49 44 0C 41 D0 0C 02                    // ._CID.A...

            Method (_STA, 0, Serialized)  // _STA: Status
            {

   1688F: 14 09 5F 53 54 41 08                             // .._STA.

                Return (0x0F)
            }


   16896: A4 0A 0F                                         // ...

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {

   16899: 14 4B 04 5F 43 52 53 00                          // .K._CRS.

                Name (RBUF, 
   168A1: 08 52 42 55 46                                   // .RBUF

Buffer (0x0A)
                {
                    /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04,  // G.......
                    /* 0008 */  0x79, 0x00                                       // y.
                })

   168A6: 11 0D 0A 0A 47 01 00 00 00 00 04 04 79 00        // ....G.......y.

                CreateWordField (RBUF, 0x02, OMIN)

   168B4: 8B 52 42 55 46 0A 02 4F 4D 49 4E                 // .RBUF..OMIN

                CreateWordField (RBUF, 0x04, OMAX)
                Add (PMBS, 0x54, OMIN) /* \_SB_.PCI0.LPCB.CWDT._CRS.OMIN */
                Add (PMBS, 0x54, OMAX) /* \_SB_.PCI0.LPCB.CWDT._CRS.OMAX */

   168BF: 8B 52 42 55 46 0A 04 4F 4D 41 58 72 50 4D 42 53  // .RBUF..OMAXrPMBS
   168CF: 0A 54 4F 4D 49 4E 72 50 4D 42 53 0A 54 4F 4D 41  // .TOMINrPMBS.TOMA
   168DF: 58                                               // X

                Return (RBUF) /* \_SB_.PCI0.LPCB.CWDT._CRS.RBUF */
            }
        }
    }


   168E0: A4 52 42 55 46                                   // .RBUF

    Name (ECUP, One)

   168E5: 08 45 43 55 50 01                                // .ECUP.

    Mutex (EHLD, 0x00)

   168EB: 5B 01 45 48 4C 44 00                             // [.EHLD.

    Name (TBTS, Zero)

   168F2: 08 54 42 54 53 00                                // .TBTS.

    Name (RPS0, Zero)

   168F8: 08 52 50 53 30 00                                // .RPS0.

    Name (RPS1, Zero)

   168FE: 08 52 50 53 31 00                                // .RPS1.

    Scope (\)
    {

   16904: 10 44 0A 5C 00                                   // .D.\.

        Device (CHUB)
        {

   16909: 5B 82 4E 09 43 48 55 42                          // [.N.CHUB

            Name (_HID, EisaId ("INT339B"))  // _HID: Hardware ID

   16911: 08 5F 48 49 44 0C 25 D4 33 9B                    // ._HID.%.3.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   1691B: 14 13 5F 53 54 41 00                             // .._STA.

                If (LEqual (CHEN, One))
                {

   16922: A0 0A 93 43 48 45 4E 01                          // ...CHEN.

                    Return (0x0F)
                }


   1692A: A4 0A 0F                                         // ...

                Return (Zero)
            }


   1692D: A4 00                                            // ..

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {

   1692F: 14 49 07 5F 44 53 4D 0C                          // .I._DSM.


   16937: 08 5F 54 5F 31 00                                // ._T_1.


   1693D: 08 5F 54 5F 30 00                                // ._T_0.

                If (LEqual (Arg0, 
   16943: A0 40 06 93 68                                   // .@..h

ToUUID ("1730e71d-e5dd-4a34-be57-4d76b6a2fe37") /* Unknown UUID */))
                {

   16948: 11 13 0A 10 1D E7 30 17 DD E5 34 4A BE 57 4D 76  // ......0...4J.WMv
   16958: B6 A2 FE 37                                      // ...7

                    If (
   1695C: A0 45 04 92                                      // .E..

LGreaterEqual (ToInteger (Arg1), Zero))
                    {

   16960: 95 99 69 00 00                                   // ..i..

                        Switch (ToInteger (Arg2))
                        {

   16965: A2 3A 01 70 99 6A 00 5F 54 5F 30                 // .:.p.j._T_0

                            Case (Zero)
                            {

   16970: A0 0C 93 5F 54 5F 30 00                          // ..._T_0.

                                Return (
   16978: A4                                               // .

Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }

   16979: 11 03 01 03                                      // ....

                            Case
   1697D: A1 21                                            // .!

 (One)
                            {

   1697F: A0 1F 93 5F 54 5F 30 01                          // ..._T_0.

                                Switch (ToInteger (DerefOf (
   16987: A2 17 01 70 99 83                                // ...p..

Index (Arg3, Zero))))
                                {

   1698D: 88 6B 00 00 00 5F 54 5F 31                       // .k..._T_1

                                    Case (
   16996: A0 07                                            // ..

Zero)
                                    {
                                    }


   16998: 93 5F 54 5F 31 00                                // ._T_1.

                                }
                            }


   1699E: A5                                               // .

                        }


   1699F: A5                                               // .

                        Return (Zero)
                    }


   169A0: A4 00                                            // ..

                    Return (Zero)
                }


   169A2: A4 00                                            // ..

                Return (
   169A4: A4                                               // .

Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }


   169A5: 11 03 01 00                                      // ....

    Mutex (MUTX, 0x00)

   169A9: 5B 01 4D 55 54 58 00                             // [.MUTX.

    OperationRegion (PRT0, SystemIO, 0x80, 0x02)

   169B0: 5B 80 50 52 54 30 01 0A 80 0A 02                 // [.PRT0.....

    Field (PRT0, WordAcc, Lock, Preserve)
    {
        P80B,   16
    }


   169BB: 5B 81 0B 50 52 54 30 12 50 38 30 42 10           // [..PRT0.P80B.

    Name (P80T, Zero)

   169C8: 08 50 38 30 54 00                                // .P80T.

    Method (D8XH, 2, Serialized)
    {

   169CE: 14 3E 44 38 58 48 0A                             // .>D8XH.

        If (LEqual (Arg0, Zero))
        {

   169D5: A0 15 93 68 00                                   // ...h.

            Store (Or (And (P80T, 0xFF00), Arg1), P80T) /* \P80T */
        }


   169DA: 70 7D 7B 50 38 30 54 0B 00 FF 00 69 00 50 38 30  // p}{P80T....i.P80
   169EA: 54                                               // T

        If (LEqual (Arg0, One))
        {

   169EB: A0 18 93 68 01                                   // ...h.

            Store (Or (And (P80T, 0xFF), ShiftLeft (Arg1, 0x08)), P80T) /* \P80T */
        }


   169F0: 70 7D 7B 50 38 30 54 0A FF 00 79 69 0A 08 00 00  // p}{P80T...yi....
   16A00: 50 38 30 54                                      // P80T

        Store (P80T, P80B) /* \P80B */
    }


   16A04: 70 50 38 30 54 50 38 30 42                       // pP80TP80B

    Method (P8XH, 2, Serialized)
    {

   16A0D: 14 15 50 38 58 48 0A                             // ..P8XH.

        If (CondRefOf (MDBG))
        {
            D8XH (Arg0, Arg1)
        }
    }


   16A14: A0 0E 5B 12 4D 44 42 47 00 44 38 58 48 68 69     // ..[.MDBG.D8XHhi

    Method (SDBG, 1, Serialized)
    {

   16A23: 14 49 08 53 44 42 47 09                          // .I.SDBG.

        OperationRegion (U3F8, SystemIO, 0x03F8, 0x10)

   16A2B: 5B 80 55 33 46 38 01 0B F8 03 0A 10              // [.U3F8......

        Field (U3F8, ByteAcc, Lock, Preserve)
        {
            TXBF,   8, 
            DLM,    8, 
            FCR,    8, 
            LCR,    8
        }

        Store (0x83, LCR) /* \SDBG.LCR_ */
        Store (One, TXBF) /* \SDBG.TXBF */
        Store (Zero, DLM) /* \SDBG.DLM_ */
        Store (0xE1, FCR) /* \SDBG.FCR_ */
        Store (0x03, LCR) /* \SDBG.LCR_ */
        Store (Zero, DLM) /* \SDBG.DLM_ */
        ToHexString (Arg0, Local3)
        Store (SizeOf (Local3), Local4)
        Store (Zero, Local5)

   16A37: 5B 81 1A 55 33 46 38 11 54 58 42 46 08 44 4C 4D  // [..U3F8.TXBF.DLM
   16A47: 5F 08 46 43 52 5F 08 4C 43 52 5F 08 70 0A 83 4C  // _.FCR_.LCR_.p..L
   16A57: 43 52 5F 70 01 54 58 42 46 70 00 44 4C 4D 5F 70  // CR_p.TXBFp.DLM_p
   16A67: 0A E1 46 43 52 5F 70 0A 03 4C 43 52 5F 70 00 44  // ..FCR_p..LCR_p.D
   16A77: 4C 4D 5F 98 68 63 70 87 63 64 70 00 65           // LM_.hcp.cdp.e

        While (LLess (Local5, Local4))
        {
            Mid (Local3, Local5, One, TXBF) /* \SDBG.TXBF */
            Stall (0x64)

   16A84: A2 12 95 65 64 9E 63 65 01 54 58 42 46 5B 21 0A  // ...ed.ce.TXBF[!.
   16A94: 64                                               // d

            Increment (Local5)
        }

        Stall (0x64)
        Store (0x0D, TXBF) /* \SDBG.TXBF */
        Stall (0x64)

   16A95: 75 65 5B 21 0A 64 70 0A 0D 54 58 42 46 5B 21 0A  // ue[!.dp..TXBF[!.
   16AA5: 64                                               // d

        Store (0x0A, TXBF) /* \SDBG.TXBF */
    }


   16AA6: 70 0A 0A 54 58 42 46                             // p..TXBF

    Method (ADBG, 1, Serialized)
    {

   16AAD: 14 2D 41 44 42 47 09                             // .-ADBG.

        If (CondRefOf (SRLD))
        {

   16AB4: A0 15 5B 12 53 52 4C 44 00                       // ..[.SRLD.

            If (LEqual (SRLD, One))
            {
                SDBG (Arg0)
            }
        }


   16ABD: A0 0C 93 53 52 4C 44 01 53 44 42 47 68           // ...SRLD.SDBGh

        If (CondRefOf (MDBG))
        {

   16ACA: A0 0E 5B 12 4D 44 42 47 00                       // ..[.MDBG.

            Return (MDBG (Arg0))
        }


   16AD3: A4 4D 44 42 47 68                                // .MDBGh

        Return (Zero)
    }


   16AD9: A4 00                                            // ..

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)

   16ADB: 5B 80 53 50 52 54 01 0A B2 0A 02                 // [.SPRT.....

    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }


   16AE6: 5B 81 0B 53 50 52 54 11 53 53 4D 50 08           // [..SPRT.SSMP.

    Name (AM00, 
   16AF3: 08 41 4D 30 30                                   // .AM00

Package (0x02)
    {
        Zero, 
        Zero
    })

   16AF8: 12 04 02 00 00                                   // .....

    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC) /* \GPIC */

   16AFD: 14 12 5F 50 49 43 01 70 68 47 50 49 43           // .._PIC.phGPIC

        Store (Arg0, PICM) /* \PICM */
    }


   16B0A: 70 68 50 49 43 4D                                // phPICM

    Method (RPTS, 1, NotSerialized)
    {
        D8XH (Zero, Arg0)
        D8XH (One, Zero)
        ADBG (
   16B10: 14 40 09 52 50 54 53 01 44 38 58 48 00 68 44 38  // .@.RPTS.D8XH.hD8
   16B20: 58 48 01 00 41 44 42 47                          // XH..ADBG

Concatenate ("_PTS=", ToHexString (Arg0)))

   16B28: 73 0D 5F 50 54 53 3D 00 98 68 00 00              // s._PTS=..h..

        If (LEqual (Arg0, 0x03))
        {

   16B34: A0 2F 93 68 0A 03                                // ./.h..

            If (CondRefOf (\_SB.DTSE))
            {

   16B3A: A0 29 5B 12 5C 2E 5F 53 42 5F 44 54 53 45 00     // .)[.\._SB_DTSE.

                If (LAnd (\_SB.DTSE, 
   16B49: A0 1A 90 5C 2E 5F 53 42 5F 44 54 53 45           // ...\._SB_DTSE

LGreater (TCNT, One)))
                {
                    TRAP (0x02, 0x1E)
                }
            }
        }


   16B56: 94 54 43 4E 54 01 54 52 41 50 0A 02 0A 1E        // .TCNT.TRAP....

        If (CondRefOf (\_SB.TPM.PTS))
        {
            \_SB.TPM.PTS (Arg0)
        }


   16B64: A0 23 5B 12 5C 2F 03 5F 53 42 5F 54 50 4D 5F 50  // .#[.\/._SB_TPM_P
   16B74: 54 53 5F 00 5C 2F 03 5F 53 42 5F 54 50 4D 5F 50  // TS_.\/._SB_TPM_P
   16B84: 54 53 5F 68                                      // TS_h

        If (LOr (LOr (LEqual (Arg0, 0x03), 
   16B88: A0 18 91 91 93 68 0A 03                          // .....h..

LEqual (Arg0, 0x04)), 
   16B90: 93 68 0A 04                                      // .h..

LEqual (Arg0, 0x05)))
        {

   16B94: 93 68 0A 05                                      // .h..

            If (
   16B98: A0 08                                            // ..

LEqual (PFLV, 0x02)){}
        }
    }


   16B9A: 93 50 46 4C 56 0A 02                             // .PFLV..

    Method (PBCL, 0, NotSerialized)
    {

   16BA1: 14 48 0D 50 42 43 4C 00                          // .H.PBCL.

        Return (
   16BA9: A4                                               // .

Package (0x67)
        {
            0x50, 
            0x32, 
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
    }


   16BAA: 12 4F 0C 67 0A 50 0A 32 00 01 0A 02 0A 03 0A 04  // .O.g.P.2........
   16BBA: 0A 05 0A 06 0A 07 0A 08 0A 09 0A 0A 0A 0B 0A 0C  // ................
   16BCA: 0A 0D 0A 0E 0A 0F 0A 10 0A 11 0A 12 0A 13 0A 14  // ................
   16BDA: 0A 15 0A 16 0A 17 0A 18 0A 19 0A 1A 0A 1B 0A 1C  // ................
   16BEA: 0A 1D 0A 1E 0A 1F 0A 20 0A 21 0A 22 0A 23 0A 24  // ....... .!.".#.$
   16BFA: 0A 25 0A 26 0A 27 0A 28 0A 29 0A 2A 0A 2B 0A 2C  // .%.&.'.(.).*.+.,
   16C0A: 0A 2D 0A 2E 0A 2F 0A 30 0A 31 0A 32 0A 33 0A 34  // .-.../.0.1.2.3.4
   16C1A: 0A 35 0A 36 0A 37 0A 38 0A 39 0A 3A 0A 3B 0A 3C  // .5.6.7.8.9.:.;.<
   16C2A: 0A 3D 0A 3E 0A 3F 0A 40 0A 41 0A 42 0A 43 0A 44  // .=.>.?.@.A.B.C.D
   16C3A: 0A 45 0A 46 0A 47 0A 48 0A 49 0A 4A 0A 4B 0A 4C  // .E.F.G.H.I.J.K.L
   16C4A: 0A 4D 0A 4E 0A 4F 0A 50 0A 51 0A 52 0A 53 0A 54  // .M.N.O.P.Q.R.S.T
   16C5A: 0A 55 0A 56 0A 57 0A 58 0A 59 0A 5A 0A 5B 0A 5C  // .U.V.W.X.Y.Z.[.\
   16C6A: 0A 5D 0A 5E 0A 5F 0A 60 0A 61 0A 62 0A 63 0A 64  // .].^._.`.a.b.c.d

    Method (RWAK, 1, Serialized)
    {
        D8XH (Zero, 
   16C7A: 14 42 62 52 57 41 4B 09 44 38 58 48 00           // .BbRWAK.D8XH.

ShiftLeft (Arg0, 0x04))
        ADBG ("_WAK")

   16C87: 79 68 0A 04 00 41 44 42 47 0D 5F 57 41 4B 00     // yh...ADBG._WAK.

        If (NEXP)
        {

   16C96: A0 20 4E 45 58 50                                // . NEXP

            If (And (OSCC, One))
            {
                NHPG ()
            }


   16C9C: A0 0C 7B 4F 53 43 43 01 00 4E 48 50 47           // ..{OSCC..NHPG

            If (And (OSCC, 0x04))
            {
                NPME ()
            }
        }


   16CA9: A0 0D 7B 4F 53 43 43 0A 04 00 4E 50 4D 45        // ..{OSCC...NPME

        If (LEqual (Arg0, 0x03))
        {

   16CB7: A0 46 04 93 68 0A 03                             // .F..h..

            If (LEqual (Zero, ACTT))
            {

   16CBE: A0 3F 93 00 41 43 54 54                          // .?..ACTT

                If (LEqual (ECON, One))
                {
                    \_SB.PCI0.LPCB.H_EC.ECWT (Zero, 
   16CC6: A0 37 93 45 43 4F 4E 01 5C 2F 05 5F 53 42 5F 50  // .7.ECON.\/._SB_P
   16CD6: 43 49 30 4C 50 43 42 48 5F 45 43 45 43 57 54 00  // CI0LPCBH_ECECWT.

RefOf (\_SB.PCI0.LPCB.H_EC.CFAN))
                }
            }
        }


   16CE6: 71 5C 2F 05 5F 53 42 5F 50 43 49 30 4C 50 43 42  // q\/._SB_PCI0LPCB
   16CF6: 48 5F 45 43 43 46 41 4E                          // H_ECCFAN

        If (LOr (LEqual (Arg0, 0x03), 
   16CFE: A0 47 40 91 93 68 0A 03                          // .G@..h..

LEqual (Arg0, 0x04)))
        {

   16D06: 93 68 0A 04                                      // .h..

            If (And (GBSX, 0x40))
            {
                \_SB.PCI0.GFX0.IUEH (0x06)
            }


   16D0A: A0 1E 7B 47 42 53 58 0A 40 00 5C 2F 04 5F 53 42  // ..{GBSX.@.\/._SB
   16D1A: 5F 50 43 49 30 47 46 58 30 49 55 45 48 0A 06     // _PCI0GFX0IUEH..

            If (And (GBSX, 0x80))
            {
                \_SB.PCI0.GFX0.IUEH (0x07)
            }


   16D29: A0 1E 7B 47 42 53 58 0A 80 00 5C 2F 04 5F 53 42  // ..{GBSX...\/._SB
   16D39: 5F 50 43 49 30 47 46 58 30 49 55 45 48 0A 07     // _PCI0GFX0IUEH..

            If (CondRefOf (\_SB.DTSE))
            {

   16D48: A0 29 5B 12 5C 2E 5F 53 42 5F 44 54 53 45 00     // .)[.\._SB_DTSE.

                If (LAnd (\_SB.DTSE, 
   16D57: A0 1A 90 5C 2E 5F 53 42 5F 44 54 53 45           // ...\._SB_DTSE

LGreater (TCNT, One)))
                {
                    TRAP (0x02, 0x14)
                }
            }


   16D64: 94 54 43 4E 54 01 54 52 41 50 0A 02 0A 14        // .TCNT.TRAP....

            If (
   16D72: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP01.VDID, 0xFFFFFFFF))
            {

   16D75: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 31  // .\/._SB_PCI0RP01
   16D85: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP01, Zero) // Bus Check
            }


   16D8E: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 31  // .\/._SB_PCI0RP01
   16D9E: 00                                               // .

            If (
   16D9F: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP02.VDID, 0xFFFFFFFF))
            {

   16DA2: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 32  // .\/._SB_PCI0RP02
   16DB2: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP02, Zero) // Bus Check
            }


   16DBB: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 32  // .\/._SB_PCI0RP02
   16DCB: 00                                               // .

            If (
   16DCC: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP03.VDID, 0xFFFFFFFF))
            {

   16DCF: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 33  // .\/._SB_PCI0RP03
   16DDF: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP03, Zero) // Bus Check
            }


   16DE8: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 33  // .\/._SB_PCI0RP03
   16DF8: 00                                               // .

            If (
   16DF9: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP04.VDID, 0xFFFFFFFF))
            {

   16DFC: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 34  // .\/._SB_PCI0RP04
   16E0C: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP04, Zero) // Bus Check
            }


   16E15: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 34  // .\/._SB_PCI0RP04
   16E25: 00                                               // .

            If (
   16E26: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP05.VDID, 0xFFFFFFFF))
            {

   16E29: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 35  // .\/._SB_PCI0RP05
   16E39: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP05, Zero) // Bus Check
            }


   16E42: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 35  // .\/._SB_PCI0RP05
   16E52: 00                                               // .

            If (
   16E53: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP06.VDID, 0xFFFFFFFF))
            {

   16E56: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 36  // .\/._SB_PCI0RP06
   16E66: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP06, Zero) // Bus Check
            }


   16E6F: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 36  // .\/._SB_PCI0RP06
   16E7F: 00                                               // .

            If (
   16E80: A0 34 92                                         // .4.

LNotEqual (\_SB.PCI0.RP07.VDID, 0xFFFFFFFF))
            {

   16E83: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 37  // .\/._SB_PCI0RP07
   16E93: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                If (LEqual (DSTS, Zero))
                {

   16E9C: A0 18 93 44 53 54 53 00                          // ...DSTS.

                    Notify (\_SB.PCI0.RP07, Zero) // Bus Check
                }
            }


   16EA4: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 37  // .\/._SB_PCI0RP07
   16EB4: 00                                               // .

            If (
   16EB5: A0 34 92                                         // .4.

LNotEqual (\_SB.PCI0.RP08.VDID, 0xFFFFFFFF))
            {

   16EB8: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 38  // .\/._SB_PCI0RP08
   16EC8: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                If (LEqual (DSTS, Zero))
                {

   16ED1: A0 18 93 44 53 54 53 00                          // ...DSTS.

                    Notify (\_SB.PCI0.RP08, Zero) // Bus Check
                }
            }


   16ED9: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 38  // .\/._SB_PCI0RP08
   16EE9: 00                                               // .

            If (
   16EEA: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP09.VDID, 0xFFFFFFFF))
            {

   16EED: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 39  // .\/._SB_PCI0RP09
   16EFD: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP09, Zero) // Bus Check
            }


   16F06: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 39  // .\/._SB_PCI0RP09
   16F16: 00                                               // .

            If (
   16F17: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP10.VDID, 0xFFFFFFFF))
            {

   16F1A: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 30  // .\/._SB_PCI0RP10
   16F2A: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP10, Zero) // Bus Check
            }


   16F33: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 30  // .\/._SB_PCI0RP10
   16F43: 00                                               // .

            If (
   16F44: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP11.VDID, 0xFFFFFFFF))
            {

   16F47: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 31  // .\/._SB_PCI0RP11
   16F57: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP11, Zero) // Bus Check
            }


   16F60: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 31  // .\/._SB_PCI0RP11
   16F70: 00                                               // .

            If (
   16F71: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP12.VDID, 0xFFFFFFFF))
            {

   16F74: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 32  // .\/._SB_PCI0RP12
   16F84: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP12, Zero) // Bus Check
            }


   16F8D: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 32  // .\/._SB_PCI0RP12
   16F9D: 00                                               // .

            If (
   16F9E: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP13.VDID, 0xFFFFFFFF))
            {

   16FA1: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 33  // .\/._SB_PCI0RP13
   16FB1: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP13, Zero) // Bus Check
            }


   16FBA: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 33  // .\/._SB_PCI0RP13
   16FCA: 00                                               // .

            If (
   16FCB: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP14.VDID, 0xFFFFFFFF))
            {

   16FCE: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 34  // .\/._SB_PCI0RP14
   16FDE: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP14, Zero) // Bus Check
            }


   16FE7: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 34  // .\/._SB_PCI0RP14
   16FF7: 00                                               // .

            If (
   16FF8: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP15.VDID, 0xFFFFFFFF))
            {

   16FFB: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 35  // .\/._SB_PCI0RP15
   1700B: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP15, Zero) // Bus Check
            }


   17014: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 35  // .\/._SB_PCI0RP15
   17024: 00                                               // .

            If (
   17025: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP16.VDID, 0xFFFFFFFF))
            {

   17028: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 36  // .\/._SB_PCI0RP16
   17038: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP16, Zero) // Bus Check
            }


   17041: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 36  // .\/._SB_PCI0RP16
   17051: 00                                               // .

            If (
   17052: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP17.VDID, 0xFFFFFFFF))
            {

   17055: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 37  // .\/._SB_PCI0RP17
   17065: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP17, Zero) // Bus Check
            }


   1706E: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 37  // .\/._SB_PCI0RP17
   1707E: 00                                               // .

            If (
   1707F: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP18.VDID, 0xFFFFFFFF))
            {

   17082: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 38  // .\/._SB_PCI0RP18
   17092: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP18, Zero) // Bus Check
            }


   1709B: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 38  // .\/._SB_PCI0RP18
   170AB: 00                                               // .

            If (
   170AC: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP19.VDID, 0xFFFFFFFF))
            {

   170AF: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 39  // .\/._SB_PCI0RP19
   170BF: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP19, Zero) // Bus Check
            }


   170C8: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 39  // .\/._SB_PCI0RP19
   170D8: 00                                               // .

            If (
   170D9: A0 2C 92                                         // .,.

LNotEqual (\_SB.PCI0.RP20.VDID, 0xFFFFFFFF))
            {

   170DC: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 30  // .\/._SB_PCI0RP20
   170EC: 56 44 49 44 0C FF FF FF FF                       // VDID.....

                Notify (\_SB.PCI0.RP20, Zero) // Bus Check
            }
        }


   170F5: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 32 30  // .\/._SB_PCI0RP20
   17105: 00                                               // .

        If (LOr (LEqual (Arg0, 0x03), 
   17106: A0 36 91 93 68 0A 03                             // .6..h..

LEqual (Arg0, 0x04)))
        {

   1710D: 93 68 0A 04                                      // .h..

            If (LEqual (\_SB.PWRB.PBST, One))
            {

   17111: A0 2B 93 5C 2F 03 5F 53 42 5F 50 57 52 42 50 42  // .+.\/._SB_PWRBPB
   17121: 53 54 01                                         // ST.

                If (PBSS)
                {
                    Notify (\_SB.PWRB, 0x02) // Device Wake

   17124: A0 18 50 42 53 53 86 5C 2E 5F 53 42 5F 50 57 52  // ..PBSS.\._SB_PWR
   17134: 42 0A 02                                         // B..

                    Store (One, PBSS) /* \PBSS */
                }
            }
        }


   17137: 70 01 50 42 53 53                                // p.PBSS

        If (LOr (LEqual (Arg0, 0x03), 
   1713D: A0 3E 91 93 68 0A 03                             // .>..h..

LEqual (Arg0, 0x04)))
        {

   17144: 93 68 0A 04                                      // .h..

            If (CondRefOf (\_SB.PCI0.PEG0.PEGP.INIO))
            {
                \_SB.PCI0.PEG0.PEGP.INIO (Arg0)
            }
        }


   17148: A0 33 5B 12 5C 2F 05 5F 53 42 5F 50 43 49 30 50  // .3[.\/._SB_PCI0P
   17158: 45 47 30 50 45 47 50 49 4E 49 4F 00 5C 2F 05 5F  // EG0PEGPINIO.\/._
   17168: 53 42 5F 50 43 49 30 50 45 47 30 50 45 47 50 49  // SB_PCI0PEG0PEGPI
   17178: 4E 49 4F 68                                      // NIOh

        If (LEqual (Arg0, 0x03))
        {

   1717C: A0 43 04 93 68 0A 03                             // .C..h..

            OperationRegion (SMBD, SystemMemory, 0xE00FC004, 0x04)

   17183: 5B 80 53 4D 42 44 00 0C 04 C0 0F E0 0A 04        // [.SMBD........

            Field (SMBD, DWordAcc, NoLock, Preserve)
            {
                DCMD,   8
            }


   17191: 5B 81 0B 53 4D 42 44 03 44 43 4D 44 08           // [..SMBD.DCMD.

            Name (TEMP, Zero)
            Store (DCMD, TEMP) /* \RWAK.TEMP */
            Or (TEMP, One, TEMP) /* \RWAK.TEMP */

   1719E: 08 54 45 4D 50 00 70 44 43 4D 44 54 45 4D 50 7D  // .TEMP.pDCMDTEMP}
   171AE: 54 45 4D 50 01 54 45 4D 50                       // TEMP.TEMP

            Store (TEMP, DCMD) /* \RWAK.DCMD */
        }


   171B7: 70 54 45 4D 50 44 43 4D 44                       // pTEMPDCMD

        If (LEqual (Arg0, 0x04))
        {

   171C0: A0 4C 08 93 68 0A 04                             // .L..h..

            If (LAnd (CondRefOf (\_SB.AWAC), 
   171C7: A0 46 07 90 5B 12 5C 2E 5F 53 42 5F 41 57 41 43  // .F..[.\._SB_AWAC
   171D7: 00                                               // .

CondRefOf (TADW)))
            {
                ADBG ("TADW")
                ADBG (TADW)

   171D8: 5B 12 54 41 44 57 00 41 44 42 47 0D 54 41 44 57  // [.TADW.ADBG.TADW
   171E8: 00 41 44 42 47 54 41 44 57                       // .ADBGTADW

                If (LEqual (TADW, One))
                {
                    Store (One, \_SB.AWAC.WAST)
                    Notify (\_SB.AWAC, 0x02) // Device Wake
                    ADBG ("Notify AWAC of Alarm Device Wake")
                }
            }


   171F1: A0 4C 04 93 54 41 44 57 01 70 01 5C 2F 03 5F 53  // .L..TADW.p.\/._S
   17201: 42 5F 41 57 41 43 57 41 53 54 86 5C 2E 5F 53 42  // B_AWACWAST.\._SB
   17211: 5F 41 57 41 43 0A 02 41 44 42 47 0D 4E 6F 74 69  // _AWAC..ADBG.Noti
   17221: 66 79 20 41 57 41 43 20 6F 66 20 41 6C 61 72 6D  // fy AWAC of Alarm
   17231: 20 44 65 76 69 63 65 20 57 61 6B 65 00           //  Device Wake.

            If (CondRefOf (TADW))
            {

   1723E: A0 0E 5B 12 54 41 44 57 00                       // ..[.TADW.

                Store (Zero, TADW) /* \TADW */
            }
        }


   17247: 70 00 54 41 44 57                                // p.TADW

        If (LEqual (\_SB.ITBM, One))
        {

   1724D: A0 49 04 93 5C 2E 5F 53 42 5F 49 54 42 4D 01     // .I..\._SB_ITBM.

            If (LAnd (LAnd (
   1725C: A0 3A 90 90 92                                   // .:...

LNotEqual (\_SB.ITBP, Zero), 
   17261: 93 5C 2E 5F 53 42 5F 49 54 42 50 00              // .\._SB_ITBP.

And (\_SB.OSCP, 0x1000)), 
   1726D: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 10 00     // {\._SB_OSCP....

LEqual (
                \_SB.OCLK, Zero)))
            {

   1727C: 93 5C 2E 5F 53 42 5F 4F 43 4C 4B 00              // .\._SB_OCLK.

                Store (\_SB.ITBS, SSMP) /* \SSMP */
            }
        }


   17288: 70 5C 2E 5F 53 42 5F 49 54 42 53 53 53 4D 50     // p\._SB_ITBSSSMP

        Return (
   17297: A4                                               // .

Package (0x02)
        {
            Zero, 
            Zero
        })
    }


   17298: 12 04 02 00 00                                   // .....

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)

   1729D: 14 1E 47 45 54 42 0B 77 68 0A 08 60 77 69 0A 08  // ..GETB.wh..`wi..
   172AD: 61                                               // a

        CreateField (Arg2, Local0, Local1, TBF3)

   172AE: 5B 13 6A 60 61 54 42 46 33                       // [.j`aTBF3

        Return (TBF3) /* \GETB.TBF3 */
    }


   172B7: A4 54 42 46 33                                   // .TBF3

    Method (PNOT, 0, Serialized)
    {

   172BC: 14 41 51 50 4E 4F 54 08                          // .AQPNOT.

        If (LGreater (TCNT, One))
        {

   172C4: A0 44 1D 94 54 43 4E 54 01                       // .D..TCNT.

            If (And (PC00, 0x08))
            {

   172CD: A0 16 7B 50 43 30 30 0A 08 00                    // ..{PC00...

                Notify (\_SB.PR00, 0x80) // Performance Capability Change
            }


   172D7: 86 5C 2E 5F 53 42 5F 50 52 30 30 0A 80           // .\._SB_PR00..

            If (And (PC01, 0x08))
            {

   172E4: A0 16 7B 50 43 30 31 0A 08 00                    // ..{PC01...

                Notify (\_SB.PR01, 0x80) // Performance Capability Change
            }


   172EE: 86 5C 2E 5F 53 42 5F 50 52 30 31 0A 80           // .\._SB_PR01..

            If (And (PC02, 0x08))
            {

   172FB: A0 16 7B 50 43 30 32 0A 08 00                    // ..{PC02...

                Notify (\_SB.PR02, 0x80) // Performance Capability Change
            }


   17305: 86 5C 2E 5F 53 42 5F 50 52 30 32 0A 80           // .\._SB_PR02..

            If (And (PC03, 0x08))
            {

   17312: A0 16 7B 50 43 30 33 0A 08 00                    // ..{PC03...

                Notify (\_SB.PR03, 0x80) // Performance Capability Change
            }


   1731C: 86 5C 2E 5F 53 42 5F 50 52 30 33 0A 80           // .\._SB_PR03..

            If (And (PC04, 0x08))
            {

   17329: A0 16 7B 50 43 30 34 0A 08 00                    // ..{PC04...

                Notify (\_SB.PR04, 0x80) // Performance Capability Change
            }


   17333: 86 5C 2E 5F 53 42 5F 50 52 30 34 0A 80           // .\._SB_PR04..

            If (And (PC05, 0x08))
            {

   17340: A0 16 7B 50 43 30 35 0A 08 00                    // ..{PC05...

                Notify (\_SB.PR05, 0x80) // Performance Capability Change
            }


   1734A: 86 5C 2E 5F 53 42 5F 50 52 30 35 0A 80           // .\._SB_PR05..

            If (And (PC06, 0x08))
            {

   17357: A0 16 7B 50 43 30 36 0A 08 00                    // ..{PC06...

                Notify (\_SB.PR06, 0x80) // Performance Capability Change
            }


   17361: 86 5C 2E 5F 53 42 5F 50 52 30 36 0A 80           // .\._SB_PR06..

            If (And (PC07, 0x08))
            {

   1736E: A0 16 7B 50 43 30 37 0A 08 00                    // ..{PC07...

                Notify (\_SB.PR07, 0x80) // Performance Capability Change
            }


   17378: 86 5C 2E 5F 53 42 5F 50 52 30 37 0A 80           // .\._SB_PR07..

            If (And (PC08, 0x08))
            {

   17385: A0 16 7B 50 43 30 38 0A 08 00                    // ..{PC08...

                Notify (\_SB.PR08, 0x80) // Performance Capability Change
            }


   1738F: 86 5C 2E 5F 53 42 5F 50 52 30 38 0A 80           // .\._SB_PR08..

            If (And (PC09, 0x08))
            {

   1739C: A0 16 7B 50 43 30 39 0A 08 00                    // ..{PC09...

                Notify (\_SB.PR09, 0x80) // Performance Capability Change
            }


   173A6: 86 5C 2E 5F 53 42 5F 50 52 30 39 0A 80           // .\._SB_PR09..

            If (And (PC10, 0x08))
            {

   173B3: A0 16 7B 50 43 31 30 0A 08 00                    // ..{PC10...

                Notify (\_SB.PR10, 0x80) // Performance Capability Change
            }


   173BD: 86 5C 2E 5F 53 42 5F 50 52 31 30 0A 80           // .\._SB_PR10..

            If (And (PC11, 0x08))
            {

   173CA: A0 16 7B 50 43 31 31 0A 08 00                    // ..{PC11...

                Notify (\_SB.PR11, 0x80) // Performance Capability Change
            }


   173D4: 86 5C 2E 5F 53 42 5F 50 52 31 31 0A 80           // .\._SB_PR11..

            If (And (PC12, 0x08))
            {

   173E1: A0 16 7B 50 43 31 32 0A 08 00                    // ..{PC12...

                Notify (\_SB.PR12, 0x80) // Performance Capability Change
            }


   173EB: 86 5C 2E 5F 53 42 5F 50 52 31 32 0A 80           // .\._SB_PR12..

            If (And (PC13, 0x08))
            {

   173F8: A0 16 7B 50 43 31 33 0A 08 00                    // ..{PC13...

                Notify (\_SB.PR13, 0x80) // Performance Capability Change
            }


   17402: 86 5C 2E 5F 53 42 5F 50 52 31 33 0A 80           // .\._SB_PR13..

            If (And (PC14, 0x08))
            {

   1740F: A0 16 7B 50 43 31 34 0A 08 00                    // ..{PC14...

                Notify (\_SB.PR14, 0x80) // Performance Capability Change
            }


   17419: 86 5C 2E 5F 53 42 5F 50 52 31 34 0A 80           // .\._SB_PR14..

            If (And (PC15, 0x08))
            {

   17426: A0 16 7B 50 43 31 35 0A 08 00                    // ..{PC15...

                Notify (\_SB.PR15, 0x80) // Performance Capability Change
            }


   17430: 86 5C 2E 5F 53 42 5F 50 52 31 35 0A 80           // .\._SB_PR15..

            If (And (PC16, 0x08))
            {

   1743D: A0 16 7B 50 43 31 36 0A 08 00                    // ..{PC16...

                Notify (\_SB.PR16, 0x80) // Performance Capability Change
            }


   17447: 86 5C 2E 5F 53 42 5F 50 52 31 36 0A 80           // .\._SB_PR16..

            If (And (PC17, 0x08))
            {

   17454: A0 16 7B 50 43 31 37 0A 08 00                    // ..{PC17...

                Notify (\_SB.PR17, 0x80) // Performance Capability Change
            }


   1745E: 86 5C 2E 5F 53 42 5F 50 52 31 37 0A 80           // .\._SB_PR17..

            If (And (PC18, 0x08))
            {

   1746B: A0 16 7B 50 43 31 38 0A 08 00                    // ..{PC18...

                Notify (\_SB.PR18, 0x80) // Performance Capability Change
            }


   17475: 86 5C 2E 5F 53 42 5F 50 52 31 38 0A 80           // .\._SB_PR18..

            If (And (PC19, 0x08))
            {

   17482: A0 16 7B 50 43 31 39 0A 08 00                    // ..{PC19...

                Notify (\_SB.PR19, 0x80) // Performance Capability Change
            }
        }

   1748C: 86 5C 2E 5F 53 42 5F 50 52 31 39 0A 80           // .\._SB_PR19..

        Else
        {

   17499: A1 0E                                            // ..

            Notify (\_SB.PR00, 0x80) // Performance Capability Change
        }


   1749B: 86 5C 2E 5F 53 42 5F 50 52 30 30 0A 80           // .\._SB_PR00..

        If (LGreater (TCNT, One))
        {

   174A8: A0 48 28 94 54 43 4E 54 01                       // .H(.TCNT.

            If (LAnd (And (PC00, 0x08), 
   174B1: A0 1F 90 7B 50 43 30 30 0A 08 00                 // ...{PC00...

And (PC00, 0x10)))
            {

   174BC: 7B 50 43 30 30 0A 10 00                          // {PC00...

                Notify (\_SB.PR00, 0x81) // C-State Change
            }


   174C4: 86 5C 2E 5F 53 42 5F 50 52 30 30 0A 81           // .\._SB_PR00..

            If (LAnd (And (PC01, 0x08), 
   174D1: A0 1F 90 7B 50 43 30 31 0A 08 00                 // ...{PC01...

And (PC01, 0x10)))
            {

   174DC: 7B 50 43 30 31 0A 10 00                          // {PC01...

                Notify (\_SB.PR01, 0x81) // C-State Change
            }


   174E4: 86 5C 2E 5F 53 42 5F 50 52 30 31 0A 81           // .\._SB_PR01..

            If (LAnd (And (PC02, 0x08), 
   174F1: A0 1F 90 7B 50 43 30 32 0A 08 00                 // ...{PC02...

And (PC02, 0x10)))
            {

   174FC: 7B 50 43 30 32 0A 10 00                          // {PC02...

                Notify (\_SB.PR02, 0x81) // C-State Change
            }


   17504: 86 5C 2E 5F 53 42 5F 50 52 30 32 0A 81           // .\._SB_PR02..

            If (LAnd (And (PC03, 0x08), 
   17511: A0 1F 90 7B 50 43 30 33 0A 08 00                 // ...{PC03...

And (PC03, 0x10)))
            {

   1751C: 7B 50 43 30 33 0A 10 00                          // {PC03...

                Notify (\_SB.PR03, 0x81) // C-State Change
            }


   17524: 86 5C 2E 5F 53 42 5F 50 52 30 33 0A 81           // .\._SB_PR03..

            If (LAnd (And (PC04, 0x08), 
   17531: A0 1F 90 7B 50 43 30 34 0A 08 00                 // ...{PC04...

And (PC04, 0x10)))
            {

   1753C: 7B 50 43 30 34 0A 10 00                          // {PC04...

                Notify (\_SB.PR04, 0x81) // C-State Change
            }


   17544: 86 5C 2E 5F 53 42 5F 50 52 30 34 0A 81           // .\._SB_PR04..

            If (LAnd (And (PC05, 0x08), 
   17551: A0 1F 90 7B 50 43 30 35 0A 08 00                 // ...{PC05...

And (PC05, 0x10)))
            {

   1755C: 7B 50 43 30 35 0A 10 00                          // {PC05...

                Notify (\_SB.PR05, 0x81) // C-State Change
            }


   17564: 86 5C 2E 5F 53 42 5F 50 52 30 35 0A 81           // .\._SB_PR05..

            If (LAnd (And (PC06, 0x08), 
   17571: A0 1F 90 7B 50 43 30 36 0A 08 00                 // ...{PC06...

And (PC06, 0x10)))
            {

   1757C: 7B 50 43 30 36 0A 10 00                          // {PC06...

                Notify (\_SB.PR06, 0x81) // C-State Change
            }


   17584: 86 5C 2E 5F 53 42 5F 50 52 30 36 0A 81           // .\._SB_PR06..

            If (LAnd (And (PC07, 0x08), 
   17591: A0 1F 90 7B 50 43 30 37 0A 08 00                 // ...{PC07...

And (PC07, 0x10)))
            {

   1759C: 7B 50 43 30 37 0A 10 00                          // {PC07...

                Notify (\_SB.PR07, 0x81) // C-State Change
            }


   175A4: 86 5C 2E 5F 53 42 5F 50 52 30 37 0A 81           // .\._SB_PR07..

            If (LAnd (And (PC08, 0x08), 
   175B1: A0 1F 90 7B 50 43 30 38 0A 08 00                 // ...{PC08...

And (PC08, 0x10)))
            {

   175BC: 7B 50 43 30 38 0A 10 00                          // {PC08...

                Notify (\_SB.PR08, 0x81) // C-State Change
            }


   175C4: 86 5C 2E 5F 53 42 5F 50 52 30 38 0A 81           // .\._SB_PR08..

            If (LAnd (And (PC09, 0x08), 
   175D1: A0 1F 90 7B 50 43 30 39 0A 08 00                 // ...{PC09...

And (PC09, 0x10)))
            {

   175DC: 7B 50 43 30 39 0A 10 00                          // {PC09...

                Notify (\_SB.PR09, 0x81) // C-State Change
            }


   175E4: 86 5C 2E 5F 53 42 5F 50 52 30 39 0A 81           // .\._SB_PR09..

            If (LAnd (And (PC10, 0x08), 
   175F1: A0 1F 90 7B 50 43 31 30 0A 08 00                 // ...{PC10...

And (PC10, 0x10)))
            {

   175FC: 7B 50 43 31 30 0A 10 00                          // {PC10...

                Notify (\_SB.PR10, 0x81) // C-State Change
            }


   17604: 86 5C 2E 5F 53 42 5F 50 52 31 30 0A 81           // .\._SB_PR10..

            If (LAnd (And (PC11, 0x08), 
   17611: A0 1F 90 7B 50 43 31 31 0A 08 00                 // ...{PC11...

And (PC11, 0x10)))
            {

   1761C: 7B 50 43 31 31 0A 10 00                          // {PC11...

                Notify (\_SB.PR11, 0x81) // C-State Change
            }


   17624: 86 5C 2E 5F 53 42 5F 50 52 31 31 0A 81           // .\._SB_PR11..

            If (LAnd (And (PC12, 0x08), 
   17631: A0 1F 90 7B 50 43 31 32 0A 08 00                 // ...{PC12...

And (PC12, 0x10)))
            {

   1763C: 7B 50 43 31 32 0A 10 00                          // {PC12...

                Notify (\_SB.PR12, 0x81) // C-State Change
            }


   17644: 86 5C 2E 5F 53 42 5F 50 52 31 32 0A 81           // .\._SB_PR12..

            If (LAnd (And (PC13, 0x08), 
   17651: A0 1F 90 7B 50 43 31 33 0A 08 00                 // ...{PC13...

And (PC13, 0x10)))
            {

   1765C: 7B 50 43 31 33 0A 10 00                          // {PC13...

                Notify (\_SB.PR13, 0x81) // C-State Change
            }


   17664: 86 5C 2E 5F 53 42 5F 50 52 31 33 0A 81           // .\._SB_PR13..

            If (LAnd (And (PC14, 0x08), 
   17671: A0 1F 90 7B 50 43 31 34 0A 08 00                 // ...{PC14...

And (PC14, 0x10)))
            {

   1767C: 7B 50 43 31 34 0A 10 00                          // {PC14...

                Notify (\_SB.PR14, 0x81) // C-State Change
            }


   17684: 86 5C 2E 5F 53 42 5F 50 52 31 34 0A 81           // .\._SB_PR14..

            If (LAnd (And (PC15, 0x08), 
   17691: A0 1F 90 7B 50 43 31 35 0A 08 00                 // ...{PC15...

And (PC15, 0x10)))
            {

   1769C: 7B 50 43 31 35 0A 10 00                          // {PC15...

                Notify (\_SB.PR15, 0x81) // C-State Change
            }


   176A4: 86 5C 2E 5F 53 42 5F 50 52 31 35 0A 81           // .\._SB_PR15..

            If (LAnd (And (PC16, 0x08), 
   176B1: A0 1F 90 7B 50 43 31 36 0A 08 00                 // ...{PC16...

And (PC16, 0x10)))
            {

   176BC: 7B 50 43 31 36 0A 10 00                          // {PC16...

                Notify (\_SB.PR16, 0x81) // C-State Change
            }


   176C4: 86 5C 2E 5F 53 42 5F 50 52 31 36 0A 81           // .\._SB_PR16..

            If (LAnd (And (PC17, 0x08), 
   176D1: A0 1F 90 7B 50 43 31 37 0A 08 00                 // ...{PC17...

And (PC17, 0x10)))
            {

   176DC: 7B 50 43 31 37 0A 10 00                          // {PC17...

                Notify (\_SB.PR17, 0x81) // C-State Change
            }


   176E4: 86 5C 2E 5F 53 42 5F 50 52 31 37 0A 81           // .\._SB_PR17..

            If (LAnd (And (PC18, 0x08), 
   176F1: A0 1F 90 7B 50 43 31 38 0A 08 00                 // ...{PC18...

And (PC18, 0x10)))
            {

   176FC: 7B 50 43 31 38 0A 10 00                          // {PC18...

                Notify (\_SB.PR18, 0x81) // C-State Change
            }


   17704: 86 5C 2E 5F 53 42 5F 50 52 31 38 0A 81           // .\._SB_PR18..

            If (LAnd (And (PC19, 0x08), 
   17711: A0 1F 90 7B 50 43 31 39 0A 08 00                 // ...{PC19...

And (PC19, 0x10)))
            {

   1771C: 7B 50 43 31 39 0A 10 00                          // {PC19...

                Notify (\_SB.PR19, 0x81) // C-State Change
            }
        }

   17724: 86 5C 2E 5F 53 42 5F 50 52 31 39 0A 81           // .\._SB_PR19..

        Else
        {

   17731: A1 0E                                            // ..

            Notify (\_SB.PR00, 0x81) // C-State Change
        }


   17733: 86 5C 2E 5F 53 42 5F 50 52 30 30 0A 81           // .\._SB_PR00..

        If (LEqual (ECON, One))
        {
            Notify (\_SB.PCI0.LPCB.H_EC.BAT0, 0x81) // Information Change
            Notify (\_SB.PCI0.LPCB.H_EC.BAT1, 0x81) // Information Change

   17740: A0 46 05 93 45 43 4F 4E 01 86 5C 2F 05 5F 53 42  // .F..ECON..\/._SB
   17750: 5F 50 43 49 30 4C 50 43 42 48 5F 45 43 42 41 54  // _PCI0LPCBH_ECBAT
   17760: 30 0A 81 86 5C 2F 05 5F 53 42 5F 50 43 49 30 4C  // 0...\/._SB_PCI0L
   17770: 50 43 42 48 5F 45 43 42 41 54 31 0A 81           // PCBH_ECBAT1..

            Notify (\_SB.PCI0.LPCB.H_EC.BAT2, 0x81) // Information Change
        }


   1777D: 86 5C 2F 05 5F 53 42 5F 50 43 49 30 4C 50 43 42  // .\/._SB_PCI0LPCB
   1778D: 48 5F 45 43 42 41 54 32 0A 81                    // H_ECBAT2..

        If (LEqual (DPTF, One))
        {
            Notify (\_SB.IETM, 0x86) // Device-Specific

   17797: A0 36 93 44 50 54 46 01 86 5C 2E 5F 53 42 5F 49  // .6.DPTF..\._SB_I
   177A7: 45 54 4D 0A 86                                   // ETM..

            If (LEqual (CHGE, One))
            {

   177AC: A0 21 93 43 48 47 45 01                          // .!.CHGE.

                Notify (\_SB.PCI0.LPCB.H_EC.CHRG, 0x80) // Status Change
            }
        }
    }


   177B4: 86 5C 2F 05 5F 53 42 5F 50 43 49 30 4C 50 43 42  // .\/._SB_PCI0LPCB
   177C4: 48 5F 45 43 43 48 52 47 0A 80                    // H_ECCHRG..

    OperationRegion (MBAR, SystemMemory, Add (\_SB.PCI0.GMHB (), 0x5000), 0x1000)

   177CE: 5B 80 4D 42 41 52 00 72 5C 2F 03 5F 53 42 5F 50  // [.MBAR.r\/._SB_P
   177DE: 43 49 30 47 4D 48 42 0B 00 50 00 0B 00 10        // CI0GMHB..P....

    Field (MBAR, ByteAcc, NoLock, Preserve)
    {
        Offset (0x938), 
        PWRU,   4, 
        Offset (0x9A0), 
        PPL1,   15, 
        PL1E,   1, 
        CLP1,   1
    }


   177EC: 5B 81 21 4D 42 41 52 01 00 80 9C 04 50 57 52 55  // [.!MBAR.....PWRU
   177FC: 04 00 4C 33 50 50 4C 31 0F 50 4C 31 45 01 43 4C  // ..L3PPL1.PL1E.CL
   1780C: 50 31 01                                         // P1.

    Name (CLMP, Zero)

   1780F: 08 43 4C 4D 50 00                                // .CLMP.

    Name (PLEN, Zero)

   17815: 08 50 4C 45 4E 00                                // .PLEN.

    Name (PLSV, 0x8000)

   1781B: 08 50 4C 53 56 0B 00 80                          // .PLSV...

    Name (CSEM, Zero)

   17823: 08 43 53 45 4D 00                                // .CSEM.

    Method (SPL1, 0, Serialized)
    {

   17829: 14 47 07 53 50 4C 31 08                          // .G.SPL1.

        Name (PPUU, Zero)

   17831: 08 50 50 55 55 00                                // .PPUU.

        If (LEqual (CSEM, One))
        {

   17837: A0 09 93 43 53 45 4D 01                          // ...CSEM.

            Return (Zero)
        }

        Store (One, CSEM) /* \CSEM */
        Store (PPL1, PLSV) /* \PLSV */
        Store (PL1E, PLEN) /* \PLEN */
        Store (CLP1, CLMP) /* \CLMP */

   1783F: A4 00 70 01 43 53 45 4D 70 50 50 4C 31 50 4C 53  // ..p.CSEMpPPL1PLS
   1784F: 56 70 50 4C 31 45 50 4C 45 4E 70 43 4C 50 31 43  // VpPL1EPLENpCLP1C
   1785F: 4C 4D 50                                         // LMP

        If (LEqual (PWRU, Zero))
        {

   17862: A0 0D 93 50 57 52 55 00                          // ...PWRU.

            Store (One, PPUU) /* \SPL1.PPUU */
        }

   1786A: 70 01 50 50 55 55                                // p.PPUU

        Else
        {

   17870: A1 0D                                            // ..

            ShiftLeft (Decrement (PWRU), 0x02, PPUU) /* \SPL1.PPUU */
        }

        Multiply (PLVL, PPUU, Local0)
        Divide (Local0, 0x03E8, , Local1)
        Store (Local1, PPL1) /* \PPL1 */
        Store (One, PL1E) /* \PL1E */

   17872: 79 76 50 57 52 55 0A 02 50 50 55 55 77 50 4C 56  // yvPWRU..PPUUwPLV
   17882: 4C 50 50 55 55 60 78 60 0B E8 03 00 61 70 61 50  // LPPUU`x`....apaP
   17892: 50 4C 31 70 01 50 4C 31 45                       // PL1p.PL1E

        Store (One, CLP1) /* \CLP1 */
    }


   1789B: 70 01 43 4C 50 31                                // p.CLP1

    Method (RPL1, 0, Serialized)
    {
        Store (PLSV, PPL1) /* \PPL1 */
        Store (PLEN, PL1E) /* \PL1E */
        Store (CLMP, CLP1) /* \CLP1 */

   178A1: 14 27 52 50 4C 31 08 70 50 4C 53 56 50 50 4C 31  // .'RPL1.pPLSVPPL1
   178B1: 70 50 4C 45 4E 50 4C 31 45 70 43 4C 4D 50 43 4C  // pPLENPL1EpCLMPCL
   178C1: 50 31                                            // P1

        Store (Zero, CSEM) /* \CSEM */
    }


   178C3: 70 00 43 53 45 4D                                // p.CSEM

    Name (UAMS, Zero)

   178C9: 08 55 41 4D 53 00                                // .UAMS.

    Name (GLCK, Zero)

   178CF: 08 47 4C 43 4B 00                                // .GLCK.

    Method (GUAM, 1, Serialized)
    {

   178D5: 14 4D 15 47 55 41 4D 09                          // .M.GUAM.


   178DD: 08 5F 54 5F 30 00                                // ._T_0.

        Switch (ToInteger (Arg0))
        {

   178E3: A2 4F 13 01 70 99 68 00 5F 54 5F 30              // .O..p.h._T_0

            Case (Zero)
            {

   178EF: A0 4E 06 93 5F 54 5F 30 00                       // .N.._T_0.

                If (LEqual (GLCK, One))
                {
                    Store (Zero, GLCK) /* \GLCK */
                    P8XH (Zero, 0xE1)
                    P8XH (One, 0xAB)
                    ADBG ("Exit Resiliency")

   178F8: A0 45 06 93 47 4C 43 4B 01 70 00 47 4C 43 4B 50  // .E..GLCK.p.GLCKP
   17908: 38 58 48 00 0A E1 50 38 58 48 01 0A AB 41 44 42  // 8XH...P8XH...ADB
   17918: 47 0D 45 78 69 74 20 52 65 73 69 6C 69 65 6E 63  // G.Exit Resilienc
   17928: 79 00                                            // y.

                    If (PSCP)
                    {

   1792A: A0 29 50 53 43 50                                // .)PSCP

                        If (CondRefOf (\_SB.PR00._PPC))
                        {
                            Store (Zero, \_SB.CPPC) /* External reference */
                            PNOT ()
                        }
                    }


   17930: A0 23 5B 12 5C 2F 03 5F 53 42 5F 50 52 30 30 5F  // .#[.\/._SB_PR00_
   17940: 50 50 43 00 70 00 5C 2E 5F 53 42 5F 43 50 50 43  // PPC.p.\._SB_CPPC
   17950: 50 4E 4F 54                                      // PNOT

                    If (PLCS)
                    {
                        RPL1 ()
                    }
                }
            }

   17954: A0 09 50 4C 43 53 52 50 4C 31                    // ..PLCSRPL1

            Case
   1795E: A1 43 0C                                         // .C.

 (One)
            {

   17961: A0 4C 0B 93 5F 54 5F 30 01                       // .L.._T_0.

                If (LEqual (GLCK, Zero))
                {
                    Store (One, GLCK) /* \GLCK */
                    P8XH (Zero, 0xE0)
                    P8XH (One, Zero)
                    ADBG ("Enter Resiliency")

   1796A: A0 43 0B 93 47 4C 43 4B 00 70 01 47 4C 43 4B 50  // .C..GLCK.p.GLCKP
   1797A: 38 58 48 00 0A E0 50 38 58 48 01 00 41 44 42 47  // 8XH...P8XH..ADBG
   1798A: 0D 45 6E 74 65 72 20 52 65 73 69 6C 69 65 6E 63  // .Enter Resilienc
   1799A: 79 00                                            // y.

                    If (PSCP)
                    {

   1799C: A0 47 07 50 53 43 50                             // .G.PSCP

                        If (LAnd (CondRefOf (\_SB.PR00._PSS), 
   179A3: A0 40 07 90 5B 12 5C 2F 03 5F 53 42 5F 50 52 30  // .@..[.\/._SB_PR0
   179B3: 30 5F 50 53 53 00                                // 0_PSS.

CondRefOf (\_SB.PR00._PPC)))
                        {

   179B9: 5B 12 5C 2F 03 5F 53 42 5F 50 52 30 30 5F 50 50  // [.\/._SB_PR00_PP
   179C9: 43 00                                            // C.

                            If (And (PC00, 0x0400))
                            {

   179CB: A0 26 7B 50 43 30 30 0B 00 04 00                 // .&{PC00....

                                Subtract (SizeOf (\_SB.PR00.TPSS), One, \_SB.CPPC) /* External reference */
                            }

   179D6: 74 87 5C 2F 03 5F 53 42 5F 50 52 30 30 54 50 53  // t.\/._SB_PR00TPS
   179E6: 53 01 5C 2E 5F 53 42 5F 43 50 50 43              // S.\._SB_CPPC

                            Else
                            {

   179F2: A1 1D                                            // ..

                                Subtract (SizeOf (\_SB.PR00.LPSS), One, \_SB.CPPC) /* External reference */
                            }

                            PNOT ()
                        }
                    }


   179F4: 74 87 5C 2F 03 5F 53 42 5F 50 52 30 30 4C 50 53  // t.\/._SB_PR00LPS
   17A04: 53 01 5C 2E 5F 53 42 5F 43 50 50 43 50 4E 4F 54  // S.\._SB_CPPCPNOT

                    If (PLCS)
                    {
                        SPL1 ()
                    }
                }
            }

   17A14: A0 09 50 4C 43 53 53 50 4C 31                    // ..PLCSSPL1

            Default
            {

   17A1E: A1 03                                            // ..

                Return (Zero)
            }


   17A20: A4 00                                            // ..

        }

        Store (LAnd (Arg0, 
   17A22: A5 70 90 68                                      // .p.h

LNot (PWRS)), UAMS) /* \UAMS */
        P_CS ()
    }


   17A26: 92 50 57 52 53 55 41 4D 53 50 5F 43 53           // .PWRSUAMSP_CS

    Method (P_CS, 0, Serialized)
    {

   17A33: 14 47 06 50 5F 43 53 08                          // .G.P_CS.

        If (CondRefOf (\_SB.PCI0.PAUD.PUAM))
        {
            \_SB.PCI0.PAUD.PUAM ()
        }


   17A3B: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 50  // .*[.\/._SB_PCI0P
   17A4B: 41 55 44 50 55 41 4D 00 5C 2F 04 5F 53 42 5F 50  // AUDPUAM.\/._SB_P
   17A5B: 43 49 30 50 41 55 44 50 55 41 4D                 // CI0PAUDPUAM

        If (LEqual (OSYS, 0x07DC))
        {

   17A66: A0 34 93 4F 53 59 53 0B DC 07                    // .4.OSYS...

            If (CondRefOf (\_SB.PCI0.XHC.DUAM))
            {
                \_SB.PCI0.XHC.DUAM ()
            }
        }
    }


   17A70: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 58  // .*[.\/._SB_PCI0X
   17A80: 48 43 5F 44 55 41 4D 00 5C 2F 04 5F 53 42 5F 50  // HC_DUAM.\/._SB_P
   17A90: 43 49 30 58 48 43 5F 44 55 41 4D                 // CI0XHC_DUAM

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF) /* \SMIF */

   17A9B: 14 4D 04 54 52 41 50 0A 70 69 53 4D 49 46        // .M.TRAP.piSMIF

        If (LEqual (Arg0, 0x02))
        {
            Store (Arg1, \_SB.DTSF) /* External reference */
            Store (Zero, \_SB.TRPD) /* External reference */

   17AA9: A0 28 93 68 0A 02 70 69 5C 2E 5F 53 42 5F 44 54  // .(.h..pi\._SB_DT
   17AB9: 53 46 70 00 5C 2E 5F 53 42 5F 54 52 50 44        // SFp.\._SB_TRPD

            Return (\_SB.DTSF) /* External reference */
        }


   17AC7: A4 5C 2E 5F 53 42 5F 44 54 53 46                 // .\._SB_DTSF

        If (LEqual (Arg0, 0x04))
        {

   17AD2: A0 11 93 68 0A 04                                // ...h..

            Store (Zero, \_SB.TRPF) /* External reference */
        }


   17AD8: 70 00 5C 2E 5F 53 42 5F 54 52 50 46              // p.\._SB_TRPF

        Return (SMIF) /* \SMIF */
    }


   17AE4: A4 53 4D 49 46                                   // .SMIF

    Scope (_SB.PCI0)
    {

   17AE9: 10 4E 16 2E 5F 53 42 5F 50 43 49 30              // .N.._SB_PCI0

        Method (PTMA, 0, NotSerialized)
        {

   17AF5: 14 0B 50 54 4D 41 00                             // ..PTMA.

            Return (BGMA) /* External reference */
        }


   17AFC: A4 42 47 4D 41                                   // .BGMA

        Method (PTMS, 0, NotSerialized)
        {

   17B01: 14 0B 50 54 4D 53 00                             // ..PTMS.

            Return (BGMS) /* External reference */
        }


   17B08: A4 42 47 4D 53                                   // .BGMS

        Method (PTIA, 0, NotSerialized)
        {

   17B0D: 14 0B 50 54 49 41 00                             // ..PTIA.

            Return (BGIA) /* External reference */
        }


   17B14: A4 42 47 49 41                                   // .BGIA

        Method (_INI, 0, Serialized)  // _INI: Initialize
        {
            Store (0x03E8, OSYS) /* \OSYS */

   17B19: 14 4E 13 5F 49 4E 49 08 70 0B E8 03 4F 53 59 53  // .N._INI.p...OSYS

            If (CondRefOf (\_OSI, Local0))
            {

   17B29: A0 40 11 5B 12 5C 5F 4F 53 49 60                 // .@.[.\_OSI`

                If (_OSI ("Windows 2001"))
                {

   17B34: A0 1B 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17B44: 30 30 31 00                                      // 001.

                    Store (0x07D1, OSYS) /* \OSYS */
                }


   17B48: 70 0B D1 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2001 SP1"))
                {

   17B50: A0 1F 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17B60: 30 30 31 20 53 50 31 00                          // 001 SP1.

                    Store (0x07D1, OSYS) /* \OSYS */
                }


   17B68: 70 0B D1 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2001 SP2"))
                {

   17B70: A0 1F 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17B80: 30 30 31 20 53 50 32 00                          // 001 SP2.

                    Store (0x07D2, OSYS) /* \OSYS */
                }


   17B88: 70 0B D2 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2001.1"))
                {

   17B90: A0 1D 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17BA0: 30 30 31 2E 31 00                                // 001.1.

                    Store (0x07D3, OSYS) /* \OSYS */
                }


   17BA6: 70 0B D3 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2006"))
                {

   17BAE: A0 1B 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17BBE: 30 30 36 00                                      // 006.

                    Store (0x07D6, OSYS) /* \OSYS */
                }


   17BC2: 70 0B D6 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2009"))
                {

   17BCA: A0 1B 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17BDA: 30 30 39 00                                      // 009.

                    Store (0x07D9, OSYS) /* \OSYS */
                }


   17BDE: 70 0B D9 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2012"))
                {

   17BE6: A0 1B 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17BF6: 30 31 32 00                                      // 012.

                    Store (0x07DC, OSYS) /* \OSYS */
                }


   17BFA: 70 0B DC 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2013"))
                {

   17C02: A0 1B 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17C12: 30 31 33 00                                      // 013.

                    Store (0x07DD, OSYS) /* \OSYS */
                }


   17C16: 70 0B DD 07 4F 53 59 53                          // p...OSYS

                If (_OSI ("Windows 2015"))
                {

   17C1E: A0 1B 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  // .._OSI.Windows 2
   17C2E: 30 31 35 00                                      // 015.

                    Store (0x07DF, OSYS) /* \OSYS */
                }
            }


   17C32: 70 0B DF 07 4F 53 59 53                          // p...OSYS

            If (CondRefOf (\_SB.DTSE))
            {

   17C3A: A0 1D 5B 12 5C 2E 5F 53 42 5F 44 54 53 45 00     // ..[.\._SB_DTSE.

                If (
   17C49: A0 0E 92                                         // ...

LGreaterEqual (DTSE, One))
                {

   17C4C: 95 44 54 53 45 01                                // .DTSE.

                    Store (One, DSAE) /* External reference */
                }
            }
        }
    }


   17C52: 70 01 44 53 41 45                                // p.DSAE

    Scope (\)
    {

   17C58: 10 49 8B 5C 00                                   // .I.\.

        Method (NHPG, 0, Serialized)
        {
            Store (Zero, \_SB.PCI0.RP01.HPEX)
            Store (Zero, \_SB.PCI0.RP02.HPEX)
            Store (Zero, \_SB.PCI0.RP03.HPEX)
            Store (Zero, \_SB.PCI0.RP04.HPEX)
            Store (Zero, \_SB.PCI0.RP05.HPEX)
            Store (Zero, \_SB.PCI0.RP06.HPEX)
            Store (Zero, \_SB.PCI0.RP07.HPEX)
            Store (Zero, \_SB.PCI0.RP08.HPEX)
            Store (Zero, \_SB.PCI0.RP09.HPEX)
            Store (Zero, \_SB.PCI0.RP10.HPEX)
            Store (Zero, \_SB.PCI0.RP11.HPEX)
            Store (Zero, \_SB.PCI0.RP12.HPEX)
            Store (Zero, \_SB.PCI0.RP13.HPEX)
            Store (Zero, \_SB.PCI0.RP14.HPEX)
            Store (Zero, \_SB.PCI0.RP15.HPEX)
            Store (Zero, \_SB.PCI0.RP16.HPEX)
            Store (Zero, \_SB.PCI0.RP17.HPEX)
            Store (Zero, \_SB.PCI0.RP18.HPEX)
            Store (Zero, \_SB.PCI0.RP19.HPEX)
            Store (Zero, \_SB.PCI0.RP20.HPEX)
            Store (Zero, \_SB.PCI0.RP21.HPEX)
            Store (Zero, \_SB.PCI0.RP22.HPEX)
            Store (Zero, \_SB.PCI0.RP23.HPEX)
            Store (Zero, \_SB.PCI0.RP24.HPEX)
            Store (One, \_SB.PCI0.RP01.HPSX)
            Store (One, \_SB.PCI0.RP02.HPSX)
            Store (One, \_SB.PCI0.RP03.HPSX)
            Store (One, \_SB.PCI0.RP04.HPSX)
            Store (One, \_SB.PCI0.RP05.HPSX)
            Store (One, \_SB.PCI0.RP06.HPSX)
            Store (One, \_SB.PCI0.RP07.HPSX)
            Store (One, \_SB.PCI0.RP08.HPSX)
            Store (One, \_SB.PCI0.RP09.HPSX)
            Store (One, \_SB.PCI0.RP10.HPSX)
            Store (One, \_SB.PCI0.RP11.HPSX)
            Store (One, \_SB.PCI0.RP12.HPSX)
            Store (One, \_SB.PCI0.RP13.HPSX)
            Store (One, \_SB.PCI0.RP14.HPSX)
            Store (One, \_SB.PCI0.RP15.HPSX)
            Store (One, \_SB.PCI0.RP16.HPSX)
            Store (One, \_SB.PCI0.RP17.HPSX)
            Store (One, \_SB.PCI0.RP18.HPSX)
            Store (One, \_SB.PCI0.RP19.HPSX)
            Store (One, \_SB.PCI0.RP20.HPSX)
            Store (One, \_SB.PCI0.RP21.HPSX)
            Store (One, \_SB.PCI0.RP22.HPSX)
            Store (One, \_SB.PCI0.RP23.HPSX)

   17C5D: 14 47 3F 4E 48 50 47 08 70 00 5C 2F 04 5F 53 42  // .G?NHPG.p.\/._SB
   17C6D: 5F 50 43 49 30 52 50 30 31 48 50 45 58 70 00 5C  // _PCI0RP01HPEXp.\
   17C7D: 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 32 48 50  // /._SB_PCI0RP02HP
   17C8D: 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // EXp.\/._SB_PCI0R
   17C9D: 50 30 33 48 50 45 58 70 00 5C 2F 04 5F 53 42 5F  // P03HPEXp.\/._SB_
   17CAD: 50 43 49 30 52 50 30 34 48 50 45 58 70 00 5C 2F  // PCI0RP04HPEXp.\/
   17CBD: 04 5F 53 42 5F 50 43 49 30 52 50 30 35 48 50 45  // ._SB_PCI0RP05HPE
   17CCD: 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // Xp.\/._SB_PCI0RP
   17CDD: 30 36 48 50 45 58 70 00 5C 2F 04 5F 53 42 5F 50  // 06HPEXp.\/._SB_P
   17CED: 43 49 30 52 50 30 37 48 50 45 58 70 00 5C 2F 04  // CI0RP07HPEXp.\/.
   17CFD: 5F 53 42 5F 50 43 49 30 52 50 30 38 48 50 45 58  // _SB_PCI0RP08HPEX
   17D0D: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   17D1D: 39 48 50 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43  // 9HPEXp.\/._SB_PC
   17D2D: 49 30 52 50 31 30 48 50 45 58 70 00 5C 2F 04 5F  // I0RP10HPEXp.\/._
   17D3D: 53 42 5F 50 43 49 30 52 50 31 31 48 50 45 58 70  // SB_PCI0RP11HPEXp
   17D4D: 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 32  // .\/._SB_PCI0RP12
   17D5D: 48 50 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49  // HPEXp.\/._SB_PCI
   17D6D: 30 52 50 31 33 48 50 45 58 70 00 5C 2F 04 5F 53  // 0RP13HPEXp.\/._S
   17D7D: 42 5F 50 43 49 30 52 50 31 34 48 50 45 58 70 00  // B_PCI0RP14HPEXp.
   17D8D: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 35 48  // \/._SB_PCI0RP15H
   17D9D: 50 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30  // PEXp.\/._SB_PCI0
   17DAD: 52 50 31 36 48 50 45 58 70 00 5C 2F 04 5F 53 42  // RP16HPEXp.\/._SB
   17DBD: 5F 50 43 49 30 52 50 31 37 48 50 45 58 70 00 5C  // _PCI0RP17HPEXp.\
   17DCD: 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 38 48 50  // /._SB_PCI0RP18HP
   17DDD: 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // EXp.\/._SB_PCI0R
   17DED: 50 31 39 48 50 45 58 70 00 5C 2F 04 5F 53 42 5F  // P19HPEXp.\/._SB_
   17DFD: 50 43 49 30 52 50 32 30 48 50 45 58 70 00 5C 2F  // PCI0RP20HPEXp.\/
   17E0D: 04 5F 53 42 5F 50 43 49 30 52 50 32 31 48 50 45  // ._SB_PCI0RP21HPE
   17E1D: 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // Xp.\/._SB_PCI0RP
   17E2D: 32 32 48 50 45 58 70 00 5C 2F 04 5F 53 42 5F 50  // 22HPEXp.\/._SB_P
   17E3D: 43 49 30 52 50 32 33 48 50 45 58 70 00 5C 2F 04  // CI0RP23HPEXp.\/.
   17E4D: 5F 53 42 5F 50 43 49 30 52 50 32 34 48 50 45 58  // _SB_PCI0RP24HPEX
   17E5D: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   17E6D: 31 48 50 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43  // 1HPSXp.\/._SB_PC
   17E7D: 49 30 52 50 30 32 48 50 53 58 70 01 5C 2F 04 5F  // I0RP02HPSXp.\/._
   17E8D: 53 42 5F 50 43 49 30 52 50 30 33 48 50 53 58 70  // SB_PCI0RP03HPSXp
   17E9D: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 34  // .\/._SB_PCI0RP04
   17EAD: 48 50 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49  // HPSXp.\/._SB_PCI
   17EBD: 30 52 50 30 35 48 50 53 58 70 01 5C 2F 04 5F 53  // 0RP05HPSXp.\/._S
   17ECD: 42 5F 50 43 49 30 52 50 30 36 48 50 53 58 70 01  // B_PCI0RP06HPSXp.
   17EDD: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 37 48  // \/._SB_PCI0RP07H
   17EED: 50 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30  // PSXp.\/._SB_PCI0
   17EFD: 52 50 30 38 48 50 53 58 70 01 5C 2F 04 5F 53 42  // RP08HPSXp.\/._SB
   17F0D: 5F 50 43 49 30 52 50 30 39 48 50 53 58 70 01 5C  // _PCI0RP09HPSXp.\
   17F1D: 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 30 48 50  // /._SB_PCI0RP10HP
   17F2D: 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // SXp.\/._SB_PCI0R
   17F3D: 50 31 31 48 50 53 58 70 01 5C 2F 04 5F 53 42 5F  // P11HPSXp.\/._SB_
   17F4D: 50 43 49 30 52 50 31 32 48 50 53 58 70 01 5C 2F  // PCI0RP12HPSXp.\/
   17F5D: 04 5F 53 42 5F 50 43 49 30 52 50 31 33 48 50 53  // ._SB_PCI0RP13HPS
   17F6D: 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // Xp.\/._SB_PCI0RP
   17F7D: 31 34 48 50 53 58 70 01 5C 2F 04 5F 53 42 5F 50  // 14HPSXp.\/._SB_P
   17F8D: 43 49 30 52 50 31 35 48 50 53 58 70 01 5C 2F 04  // CI0RP15HPSXp.\/.
   17F9D: 5F 53 42 5F 50 43 49 30 52 50 31 36 48 50 53 58  // _SB_PCI0RP16HPSX
   17FAD: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   17FBD: 37 48 50 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43  // 7HPSXp.\/._SB_PC
   17FCD: 49 30 52 50 31 38 48 50 53 58 70 01 5C 2F 04 5F  // I0RP18HPSXp.\/._
   17FDD: 53 42 5F 50 43 49 30 52 50 31 39 48 50 53 58 70  // SB_PCI0RP19HPSXp
   17FED: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 30  // .\/._SB_PCI0RP20
   17FFD: 48 50 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49  // HPSXp.\/._SB_PCI
   1800D: 30 52 50 32 31 48 50 53 58 70 01 5C 2F 04 5F 53  // 0RP21HPSXp.\/._S
   1801D: 42 5F 50 43 49 30 52 50 32 32 48 50 53 58 70 01  // B_PCI0RP22HPSXp.
   1802D: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 33 48  // \/._SB_PCI0RP23H
   1803D: 50 53 58                                         // PSX

            Store (One, \_SB.PCI0.RP24.HPSX)
        }


   18040: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   18050: 34 48 50 53 58                                   // 4HPSX

        Method (NPME, 0, Serialized)
        {
            Store (Zero, \_SB.PCI0.RP01.PMEX)
            Store (Zero, \_SB.PCI0.RP02.PMEX)
            Store (Zero, \_SB.PCI0.RP03.PMEX)
            Store (Zero, \_SB.PCI0.RP04.PMEX)
            Store (Zero, \_SB.PCI0.RP05.PMEX)
            Store (Zero, \_SB.PCI0.RP06.PMEX)
            Store (Zero, \_SB.PCI0.RP07.PMEX)
            Store (Zero, \_SB.PCI0.RP08.PMEX)
            Store (Zero, \_SB.PCI0.RP09.PMEX)
            Store (Zero, \_SB.PCI0.RP10.PMEX)
            Store (Zero, \_SB.PCI0.RP11.PMEX)
            Store (Zero, \_SB.PCI0.RP12.PMEX)
            Store (Zero, \_SB.PCI0.RP13.PMEX)
            Store (Zero, \_SB.PCI0.RP14.PMEX)
            Store (Zero, \_SB.PCI0.RP15.PMEX)
            Store (Zero, \_SB.PCI0.RP16.PMEX)
            Store (Zero, \_SB.PCI0.RP17.PMEX)
            Store (Zero, \_SB.PCI0.RP18.PMEX)
            Store (Zero, \_SB.PCI0.RP19.PMEX)
            Store (Zero, \_SB.PCI0.RP20.PMEX)
            Store (Zero, \_SB.PCI0.RP21.PMEX)
            Store (Zero, \_SB.PCI0.RP22.PMEX)
            Store (Zero, \_SB.PCI0.RP23.PMEX)
            Store (Zero, \_SB.PCI0.RP24.PMEX)
            Store (Zero, \_SB.PCI0.RP21.PMEX)
            Store (Zero, \_SB.PCI0.RP22.PMEX)
            Store (Zero, \_SB.PCI0.RP23.PMEX)
            Store (Zero, \_SB.PCI0.RP24.PMEX)
            Store (One, \_SB.PCI0.RP01.PMSX)
            Store (One, \_SB.PCI0.RP02.PMSX)
            Store (One, \_SB.PCI0.RP03.PMSX)
            Store (One, \_SB.PCI0.RP04.PMSX)
            Store (One, \_SB.PCI0.RP05.PMSX)
            Store (One, \_SB.PCI0.RP06.PMSX)
            Store (One, \_SB.PCI0.RP07.PMSX)
            Store (One, \_SB.PCI0.RP08.PMSX)
            Store (One, \_SB.PCI0.RP09.PMSX)
            Store (One, \_SB.PCI0.RP10.PMSX)
            Store (One, \_SB.PCI0.RP11.PMSX)
            Store (One, \_SB.PCI0.RP12.PMSX)
            Store (One, \_SB.PCI0.RP13.PMSX)
            Store (One, \_SB.PCI0.RP14.PMSX)
            Store (One, \_SB.PCI0.RP15.PMSX)
            Store (One, \_SB.PCI0.RP16.PMSX)
            Store (One, \_SB.PCI0.RP17.PMSX)
            Store (One, \_SB.PCI0.RP18.PMSX)
            Store (One, \_SB.PCI0.RP19.PMSX)
            Store (One, \_SB.PCI0.RP20.PMSX)
            Store (One, \_SB.PCI0.RP21.PMSX)
            Store (One, \_SB.PCI0.RP22.PMSX)
            Store (One, \_SB.PCI0.RP23.PMSX)

   18055: 14 4B 44 4E 50 4D 45 08 70 00 5C 2F 04 5F 53 42  // .KDNPME.p.\/._SB
   18065: 5F 50 43 49 30 52 50 30 31 50 4D 45 58 70 00 5C  // _PCI0RP01PMEXp.\
   18075: 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 32 50 4D  // /._SB_PCI0RP02PM
   18085: 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // EXp.\/._SB_PCI0R
   18095: 50 30 33 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F  // P03PMEXp.\/._SB_
   180A5: 50 43 49 30 52 50 30 34 50 4D 45 58 70 00 5C 2F  // PCI0RP04PMEXp.\/
   180B5: 04 5F 53 42 5F 50 43 49 30 52 50 30 35 50 4D 45  // ._SB_PCI0RP05PME
   180C5: 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // Xp.\/._SB_PCI0RP
   180D5: 30 36 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F 50  // 06PMEXp.\/._SB_P
   180E5: 43 49 30 52 50 30 37 50 4D 45 58 70 00 5C 2F 04  // CI0RP07PMEXp.\/.
   180F5: 5F 53 42 5F 50 43 49 30 52 50 30 38 50 4D 45 58  // _SB_PCI0RP08PMEX
   18105: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   18115: 39 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43  // 9PMEXp.\/._SB_PC
   18125: 49 30 52 50 31 30 50 4D 45 58 70 00 5C 2F 04 5F  // I0RP10PMEXp.\/._
   18135: 53 42 5F 50 43 49 30 52 50 31 31 50 4D 45 58 70  // SB_PCI0RP11PMEXp
   18145: 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 32  // .\/._SB_PCI0RP12
   18155: 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49  // PMEXp.\/._SB_PCI
   18165: 30 52 50 31 33 50 4D 45 58 70 00 5C 2F 04 5F 53  // 0RP13PMEXp.\/._S
   18175: 42 5F 50 43 49 30 52 50 31 34 50 4D 45 58 70 00  // B_PCI0RP14PMEXp.
   18185: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 35 50  // \/._SB_PCI0RP15P
   18195: 4D 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30  // MEXp.\/._SB_PCI0
   181A5: 52 50 31 36 50 4D 45 58 70 00 5C 2F 04 5F 53 42  // RP16PMEXp.\/._SB
   181B5: 5F 50 43 49 30 52 50 31 37 50 4D 45 58 70 00 5C  // _PCI0RP17PMEXp.\
   181C5: 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 38 50 4D  // /._SB_PCI0RP18PM
   181D5: 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // EXp.\/._SB_PCI0R
   181E5: 50 31 39 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F  // P19PMEXp.\/._SB_
   181F5: 50 43 49 30 52 50 32 30 50 4D 45 58 70 00 5C 2F  // PCI0RP20PMEXp.\/
   18205: 04 5F 53 42 5F 50 43 49 30 52 50 32 31 50 4D 45  // ._SB_PCI0RP21PME
   18215: 58 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // Xp.\/._SB_PCI0RP
   18225: 32 32 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F 50  // 22PMEXp.\/._SB_P
   18235: 43 49 30 52 50 32 33 50 4D 45 58 70 00 5C 2F 04  // CI0RP23PMEXp.\/.
   18245: 5F 53 42 5F 50 43 49 30 52 50 32 34 50 4D 45 58  // _SB_PCI0RP24PMEX
   18255: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   18265: 31 50 4D 45 58 70 00 5C 2F 04 5F 53 42 5F 50 43  // 1PMEXp.\/._SB_PC
   18275: 49 30 52 50 32 32 50 4D 45 58 70 00 5C 2F 04 5F  // I0RP22PMEXp.\/._
   18285: 53 42 5F 50 43 49 30 52 50 32 33 50 4D 45 58 70  // SB_PCI0RP23PMEXp
   18295: 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 34  // .\/._SB_PCI0RP24
   182A5: 50 4D 45 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49  // PMEXp.\/._SB_PCI
   182B5: 30 52 50 30 31 50 4D 53 58 70 01 5C 2F 04 5F 53  // 0RP01PMSXp.\/._S
   182C5: 42 5F 50 43 49 30 52 50 30 32 50 4D 53 58 70 01  // B_PCI0RP02PMSXp.
   182D5: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 33 50  // \/._SB_PCI0RP03P
   182E5: 4D 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30  // MSXp.\/._SB_PCI0
   182F5: 52 50 30 34 50 4D 53 58 70 01 5C 2F 04 5F 53 42  // RP04PMSXp.\/._SB
   18305: 5F 50 43 49 30 52 50 30 35 50 4D 53 58 70 01 5C  // _PCI0RP05PMSXp.\
   18315: 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 36 50 4D  // /._SB_PCI0RP06PM
   18325: 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // SXp.\/._SB_PCI0R
   18335: 50 30 37 50 4D 53 58 70 01 5C 2F 04 5F 53 42 5F  // P07PMSXp.\/._SB_
   18345: 50 43 49 30 52 50 30 38 50 4D 53 58 70 01 5C 2F  // PCI0RP08PMSXp.\/
   18355: 04 5F 53 42 5F 50 43 49 30 52 50 30 39 50 4D 53  // ._SB_PCI0RP09PMS
   18365: 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // Xp.\/._SB_PCI0RP
   18375: 31 30 50 4D 53 58 70 01 5C 2F 04 5F 53 42 5F 50  // 10PMSXp.\/._SB_P
   18385: 43 49 30 52 50 31 31 50 4D 53 58 70 01 5C 2F 04  // CI0RP11PMSXp.\/.
   18395: 5F 53 42 5F 50 43 49 30 52 50 31 32 50 4D 53 58  // _SB_PCI0RP12PMSX
   183A5: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   183B5: 33 50 4D 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43  // 3PMSXp.\/._SB_PC
   183C5: 49 30 52 50 31 34 50 4D 53 58 70 01 5C 2F 04 5F  // I0RP14PMSXp.\/._
   183D5: 53 42 5F 50 43 49 30 52 50 31 35 50 4D 53 58 70  // SB_PCI0RP15PMSXp
   183E5: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 36  // .\/._SB_PCI0RP16
   183F5: 50 4D 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49  // PMSXp.\/._SB_PCI
   18405: 30 52 50 31 37 50 4D 53 58 70 01 5C 2F 04 5F 53  // 0RP17PMSXp.\/._S
   18415: 42 5F 50 43 49 30 52 50 31 38 50 4D 53 58 70 01  // B_PCI0RP18PMSXp.
   18425: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 39 50  // \/._SB_PCI0RP19P
   18435: 4D 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30  // MSXp.\/._SB_PCI0
   18445: 52 50 32 30 50 4D 53 58 70 01 5C 2F 04 5F 53 42  // RP20PMSXp.\/._SB
   18455: 5F 50 43 49 30 52 50 32 31 50 4D 53 58 70 01 5C  // _PCI0RP21PMSXp.\
   18465: 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 32 50 4D  // /._SB_PCI0RP22PM
   18475: 53 58 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // SXp.\/._SB_PCI0R
   18485: 50 32 33 50 4D 53 58                             // P23PMSX

            Store (One, \_SB.PCI0.RP24.PMSX)
        }


   1848C: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1849C: 34 50 4D 53 58                                   // 4PMSX

        Name (PICM, Zero)

   184A1: 08 50 49 43 4D 00                                // .PICM.

        Name (PRWP, 
   184A7: 08 50 52 57 50                                   // .PRWP

Package (0x02)
        {
            Zero, 
            Zero
        })

   184AC: 12 04 02 00 00                                   // .....

        Method (GPRW, 2, NotSerialized)
        {
            Store (Arg0, 
   184B1: 14 40 06 47 50 52 57 02 70 68                    // .@.GPRW.ph

Index (PRWP, Zero))
            Store (ShiftLeft (SS1, One), Local0)
            Or (Local0, ShiftLeft (SS2, 0x02), Local0)
            Or (Local0, ShiftLeft (SS3, 0x03), Local0)
            Or (Local0, ShiftLeft (SS4, 0x04), Local0)

   184BB: 88 50 52 57 50 00 00 70 79 53 53 31 5F 01 00 60  // .PRWP..pySS1_..`
   184CB: 7D 60 79 53 53 32 5F 0A 02 00 60 7D 60 79 53 53  // }`ySS2_...`}`ySS
   184DB: 33 5F 0A 03 00 60 7D 60 79 53 53 34 5F 0A 04 00  // 3_...`}`ySS4_...
   184EB: 60                                               // `

            If (And (ShiftLeft (One, Arg1), Local0))
            {

   184EC: A0 11 7B 79 01 69 00 60 00                       // ..{y.i.`.

                Store (Arg1, 
   184F5: 70 69                                            // pi

Index (PRWP, One))
            }

   184F7: 88 50 52 57 50 01 00                             // .PRWP..

            Else
            {
                ShiftRight (Local0, One, Local0)

   184FE: A1 0E 7A 60 01 60                                // ..z`.`

                FindSetLeftBit (Local0, 
   18504: 81 60                                            // .`

Index (PRWP, One))
            }


   18506: 88 50 52 57 50 01 00                             // .PRWP..

            Return (PRWP) /* \PRWP */
        }
    }


   1850D: A4 50 52 57 50                                   // .PRWP

    Scope (_SB)
    {

   18512: 10 44 1F 5F 53 42 5F                             // .D._SB_

        Name (OSCI, Zero)

   18519: 08 4F 53 43 49 00                                // .OSCI.

        Name (OSCO, Zero)

   1851F: 08 4F 53 43 4F 00                                // .OSCO.

        Name (OSCP, Zero)

   18525: 08 4F 53 43 50 00                                // .OSCP.

        Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
        {

   1852B: 14 43 0B 5F 4F 53 43 0C                          // .C._OSC.

            CreateDWordField (Arg3, Zero, STS0)

   18533: 8A 6B 00 53 54 53 30                             // .k.STS0

            CreateDWordField (Arg3, 0x04, CAP0)

   1853A: 8A 6B 0A 04 43 41 50 30                          // .k..CAP0

            If (LEqual (Arg0, 
   18542: A0 4F 07 93 68                                   // .O..h

ToUUID ("0811b06e-4a27-44f9-8d60-3cbbc22e7b48") /* Platform-wide Capabilities */))
            {

   18547: 11 13 0A 10 6E B0 11 08 27 4A F9 44 8D 60 3C BB  // ....n...'J.D.`<.
   18557: C2 2E 7B 48                                      // ..{H

                If (LEqual (Arg1, One))
                {
                    Store (CAP0, OSCP) /* \_SB_.OSCP */

   1855B: A0 4B 04 93 69 01 70 43 41 50 30 4F 53 43 50     // .K..i.pCAP0OSCP

                    If (And (CAP0, 0x04))
                    {
                        Store (0x04, OSCO) /* \_SB_.OSCO */

   1856A: A0 3C 7B 43 41 50 30 0A 04 00 70 0A 04 4F 53 43  // .<{CAP0...p..OSC
   1857A: 4F                                               // O

                        If (
   1857B: A0 2B 92                                         // .+.

LNotEqual (And (SGMD, 0x0F), 0x02))
                        {

   1857E: 93 7B 53 47 4D 44 0A 0F 00 0A 02                 // .{SGMD.....

                            If (LEqual (RTD3, Zero))
                            {
                                And (CAP0, 0x3B, CAP0) /* \_SB_._OSC.CAP0 */

   18589: A0 1D 93 52 54 44 33 00 7B 43 41 50 30 0A 3B 43  // ...RTD3.{CAP0.;C
   18599: 41 50 30                                         // AP0

                                Or (STS0, 0x10, STS0) /* \_SB_._OSC.STS0 */
                            }
                        }
                    }
                }

   1859C: 7D 53 54 53 30 0A 10 53 54 53 30                 // }STS0..STS0

                Else
                {
                    And (STS0, 0xFFFFFF00, STS0) /* \_SB_._OSC.STS0 */

   185A7: A1 1A 7B 53 54 53 30 0C 00 FF FF FF 53 54 53 30  // ..{STS0.....STS0

                    Or (STS0, 0x0A, STS0) /* \_SB_._OSC.STS0 */
                }
            }

   185B7: 7D 53 54 53 30 0A 0A 53 54 53 30                 // }STS0..STS0

            Else
            {
                And (STS0, 0xFFFFFF00, STS0) /* \_SB_._OSC.STS0 */

   185C2: A1 1A 7B 53 54 53 30 0C 00 FF FF FF 53 54 53 30  // ..{STS0.....STS0

                Or (STS0, 0x06, STS0) /* \_SB_._OSC.STS0 */
            }


   185D2: 7D 53 54 53 30 0A 06 53 54 53 30                 // }STS0..STS0

            Return (Arg3)
        }


   185DD: A4 6B                                            // .k

        Device (EPC)
        {

   185DF: 5B 82 46 12 45 50 43 5F                          // [.F.EPC_

            Name (_HID, EisaId ("INT0E0C"))  // _HID: Hardware ID

   185E7: 08 5F 48 49 44 0C 25 D4 0E 0C                    // ._HID.%...

            Name (_STR, 
   185F1: 08 5F 53 54 52                                   // ._STR

Unicode ("Enclave Page Cache 1.0"))  // _STR: Description String

   185F6: 11 31 0A 2E 45 00 6E 00 63 00 6C 00 61 00 76 00  // .1..E.n.c.l.a.v.
   18606: 65 00 20 00 50 00 61 00 67 00 65 00 20 00 43 00  // e. .P.a.g.e. .C.
   18616: 61 00 63 00 68 00 65 00 20 00 31 00 2E 00 30 00  // a.c.h.e. .1...0.
   18626: 00 00                                            // ..

            Name (_MLS, 
   18628: 08 5F 4D 4C 53                                   // ._MLS

Package (0x01)  // _MLS: Multiple Language String
            {

   1862D: 12 3B 01                                         // .;.

                Package (0x02)
                {
                    "en", 

   18630: 12 38 02 0D 65 6E 00                             // .8..en.

                    Unicode ("Enclave Page Cache 1.0")
                }
            })

   18637: 11 31 0A 2E 45 00 6E 00 63 00 6C 00 61 00 76 00  // .1..E.n.c.l.a.v.
   18647: 65 00 20 00 50 00 61 00 67 00 65 00 20 00 43 00  // e. .P.a.g.e. .C.
   18657: 61 00 63 00 68 00 65 00 20 00 31 00 2E 00 30 00  // a.c.h.e. .1...0.
   18667: 00 00                                            // ..

            Name (RBUF, 
   18669: 08 52 42 55 46                                   // .RBUF

Buffer (0x30)
            {
                /* 0000 */  0x8A, 0x2B, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00,  // .+......
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79, 0x00   // ......y.
            })

   1866E: 11 33 0A 30 8A 2B 00 00 01 01 00 00 00 00 00 00  // .3.0.+..........
   1867E: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
   1868E: 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00  // ................
   1869E: 00 00 79 00                                      // ..y.

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {

   186A2: 14 4F 04 5F 43 52 53 00                          // .O._CRS.

                CreateQWordField (RBUF, 0x0E, EMIN)

   186AA: 8F 52 42 55 46 0A 0E 45 4D 49 4E                 // .RBUF..EMIN

                CreateQWordField (RBUF, 0x16, EMAX)

   186B5: 8F 52 42 55 46 0A 16 45 4D 41 58                 // .RBUF..EMAX

                CreateQWordField (RBUF, 0x26, ELEN)
                Store (EMNA, EMIN) /* \_SB_.EPC_._CRS.EMIN */
                Store (ELNG, ELEN) /* \_SB_.EPC_._CRS.ELEN */
                Subtract (Add (EMNA, ELNG), One, EMAX) /* \_SB_.EPC_._CRS.EMAX */

   186C0: 8F 52 42 55 46 0A 26 45 4C 45 4E 70 45 4D 4E 41  // .RBUF.&ELENpEMNA
   186D0: 45 4D 49 4E 70 45 4C 4E 47 45 4C 45 4E 74 72 45  // EMINpELNGELENtrE
   186E0: 4D 4E 41 45 4C 4E 47 00 01 45 4D 41 58           // MNAELNG..EMAX

                Return (RBUF) /* \_SB_.EPC_.RBUF */
            }


   186ED: A4 52 42 55 46                                   // .RBUF

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   186F2: 14 14 5F 53 54 41 00                             // .._STA.

                If (
   186F9: A0 0B 92                                         // ...

LNotEqual (EPCS, Zero))
                {

   186FC: 93 45 50 43 53 00                                // .EPCS.

                    Return (0x0F)
                }


   18702: A4 0A 0F                                         // ...

                Return (Zero)
            }
        }
    }


   18705: A4 00                                            // ..

    Scope (_SB)
    {

   18707: 10 1D 5F 53 42 5F                                // .._SB_

        Device (SLPB)
        {

   1870D: 5B 82 16 53 4C 50 42                             // [..SLPB

            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID

   18714: 08 5F 48 49 44 0C 41 D0 0C 0E                    // ._HID.A...

            Name (_STA, 0x0B)  // _STA: Status
        }
    }


   1871E: 08 5F 53 54 41 0A 0B                             // ._STA..

    If (LEqual (ENVM, One))
    {

   18725: A0 4B 09 93 45 4E 56 4D 01                       // .K..ENVM.

        Scope (_SB)
        {

   1872E: 10 42 09 5F 53 42 5F                             // .B._SB_

            Method (VMON, 0, Serialized)
            {
                ^PCI0.LPCB.H_EC.ECWT (0x7A, 
   18735: 14 45 04 56 4D 4F 4E 08 5E 2F 04 50 43 49 30 4C  // .E.VMON.^/.PCI0L
   18745: 50 43 42 48 5F 45 43 45 43 57 54 0A 7A           // PCBH_ECECWT.z

RefOf (^PCI0.LPCB.H_EC.PVOL))
                ^PCI0.LPCB.H_EC.ECMD (0x1D)
            }


   18752: 71 5E 2F 04 50 43 49 30 4C 50 43 42 48 5F 45 43  // q^/.PCI0LPCBH_EC
   18762: 50 56 4F 4C 5E 2F 04 50 43 49 30 4C 50 43 42 48  // PVOL^/.PCI0LPCBH
   18772: 5F 45 43 45 43 4D 44 0A 1D                       // _ECECMD..

            Method (VMOF, 0, Serialized)
            {
                ^PCI0.LPCB.H_EC.ECWT (0x3A, 
   1877B: 14 45 04 56 4D 4F 46 08 5E 2F 04 50 43 49 30 4C  // .E.VMOF.^/.PCI0L
   1878B: 50 43 42 48 5F 45 43 45 43 57 54 0A 3A           // PCBH_ECECWT.:

RefOf (^PCI0.LPCB.H_EC.PVOL))
                ^PCI0.LPCB.H_EC.ECMD (0x1D)
            }
        }
    }


   18798: 71 5E 2F 04 50 43 49 30 4C 50 43 42 48 5F 45 43  // q^/.PCI0LPCBH_EC
   187A8: 50 56 4F 4C 5E 2F 04 50 43 49 30 4C 50 43 42 48  // PVOL^/.PCI0LPCBH
   187B8: 5F 45 43 45 43 4D 44 0A 1D                       // _ECECMD..

    Scope (_SB.PCI0.I2C0)
    {

   187C1: 10 4D 11 2F 03 5F 53 42 5F 50 43 49 30 49 32 43  // .M./._SB_PCI0I2C
   187D1: 30                                               // 0

        If (LAnd (
   187D2: A0 4C 10 90 92                                   // .L...

LNotEqual (PLID, 0x14), 
   187D7: 93 50 4C 49 44 0A 14                             // .PLID..


   187DE: 92                                               // .

LNotEqual (PLID, 0x15)))
        {

   187DF: 93 50 4C 49 44 0A 15                             // .PLID..

            Device (PA01)
            {

   187E6: 5B 82 47 0F 50 41 30 31                          // [.G.PA01

                Name (_HID, "MAX34407")  // _HID: Hardware ID

   187EE: 08 5F 48 49 44 0D 4D 41 58 33 34 34 30 37 00     // ._HID.MAX34407.

                Name (_CID, "MAX34407")  // _CID: Compatible ID

   187FD: 08 5F 43 49 44 0D 4D 41 58 33 34 34 30 37 00     // ._CID.MAX34407.

                Name (_UID, One)  // _UID: Unique ID

   1880C: 08 5F 55 49 44 01                                // ._UID.

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {

   18812: 14 37 5F 43 52 53 00                             // .7_CRS.

                    Name (RBUF, 
   18819: 08 52 42 55 46                                   // .RBUF

Buffer (0x23)
                    {
                        /* 0000 */  0x8E, 0x1E, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                        /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                        /* 0010 */  0x10, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50,  // ..\_SB.P
                        /* 0018 */  0x43, 0x49, 0x30, 0x2E, 0x49, 0x32, 0x43, 0x30,  // CI0.I2C0
                        /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                    })

   1881E: 11 26 0A 23 8E 1E 00 01 00 01 02 00 00 01 06 00  // .&.#............
   1882E: 80 1A 06 00 10 00 5C 5F 53 42 2E 50 43 49 30 2E  // ......\_SB.PCI0.
   1883E: 49 32 43 30 00 79 00                             // I2C0.y.

                    Return (RBUF) /* \_SB_.PCI0.I2C0.PA01._CRS.RBUF */
                }


   18845: A4 52 42 55 46                                   // .RBUF

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {

   1884A: 14 11 5F 53 54 41 00                             // .._STA.

                    If (POME)
                    {

   18851: A0 08 50 4F 4D 45                                // ..POME

                        Return (0x0F)
                    }


   18857: A4 0A 0F                                         // ...

                    Return (Zero)
                }


   1885A: A4 00                                            // ..

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {

   1885C: 14 42 08 5F 44 53 4D 04                          // .B._DSM.

                    If (LEqual (Arg0, 
   18864: A0 43 07 93 68                                   // .C..h

ToUUID ("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7") /* Unknown UUID */))
                    {

   18869: 11 13 0A 10 36 A4 93 49 AC E1 C7 4D B4 F8 46 A5  // ....6..I...M..F.
   18879: 00 8F B9 E7                                      // ....

                        If (LEqual (Arg2, Zero))
                        {

   1887D: A0 09 93 6A 00                                   // ...j.

                            Return (
   18882: A4                                               // .

Buffer (One)
                            {
                                 0x07                                             // .
                            })
                        }


   18883: 11 03 01 07                                      // ....

                        If (LEqual (Arg2, One))
                        {

   18887: A0 2B 93 6A 01                                   // .+.j.

                            If (LEqual (Arg1, Zero))
                            {

   1888C: A0 1F 93 69 00                                   // ...i.

                                Name (PBUF, 
   18891: 08 50 42 55 46                                   // .PBUF

Package (0x08)
                                {
                                    "SYSTEM_PWR", 
                                    0x02
                                })

   18896: 12 10 08 0D 53 59 53 54 45 4D 5F 50 57 52 00 0A  // ....SYSTEM_PWR..
   188A6: 02                                               // .

                                Return (PBUF) /* \_SB_.PCI0.I2C0.PA01._DSM.PBUF */
                            }

   188A7: A4 50 42 55 46                                   // .PBUF

                            Else
                            {

   188AC: A1 06                                            // ..

                                Return (
   188AE: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                        }


   188AF: 11 03 01 00                                      // ....

                        If (LEqual (Arg2, 0x02))
                        {

   188B3: A0 1F 93 6A 0A 02                                // ...j..

                            If (LEqual (Arg1, Zero))
                            {

   188B9: A0 12 93 69 00                                   // ...i.

                                Name (CBUF, 
   188BE: 08 43 42 55 46                                   // .CBUF

Package (0x01)
                                {
                                    One
                                })

   188C3: 12 03 01 01                                      // ....

                                Return (CBUF) /* \_SB_.PCI0.I2C0.PA01._DSM.CBUF */
                            }

   188C7: A4 43 42 55 46                                   // .CBUF

                            Else
                            {

   188CC: A1 06                                            // ..

                                Return (
   188CE: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                        }


   188CF: 11 03 01 00                                      // ....

                        Return (
   188D3: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

   188D4: 11 03 01 00                                      // ....

                    Else
                    {

   188D8: A1 06                                            // ..

                        Return (
   188DA: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   188DB: 11 03 01 00                                      // ....

    Scope (_SB)
    {

   188DF: 10 4F 05 5F 53 42 5F                             // .O._SB_

        Device (COEX)
        {

   188E6: 5B 82 47 05 43 4F 45 58                          // [.G.COEX

            Name (_HID, EisaId ("INT3519"))  // _HID: Hardware ID

   188EE: 08 5F 48 49 44 0C 25 D4 35 19                    // ._HID.%.5.

            Name (_STR, 
   188F8: 08 5F 53 54 52                                   // ._STR

Unicode ("CoExistence Manager"))  // _STR: Description String

   188FD: 11 2B 0A 28 43 00 6F 00 45 00 78 00 69 00 73 00  // .+.(C.o.E.x.i.s.
   1890D: 74 00 65 00 6E 00 63 00 65 00 20 00 4D 00 61 00  // t.e.n.c.e. .M.a.
   1891D: 6E 00 61 00 67 00 65 00 72 00 00 00              // n.a.g.e.r...

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   18929: 14 15 5F 53 54 41 00                             // .._STA.

                If (LEqual (COEM, One))
                {

   18930: A0 0A 93 43 4F 45 4D 01                          // ...COEM.

                    Return (0x0F)
                }

   18938: A4 0A 0F                                         // ...

                Else
                {

   1893B: A1 03                                            // ..

                    Return (Zero)
                }
            }
        }
    }


   1893D: A4 00                                            // ..

    Scope (_SB)
    {

   1893F: 10 40 0C 5F 53 42 5F                             // .@._SB_

        Method (CGWR, 2, Serialized)
        {

   18946: 14 1B 43 47 57 52 0A                             // ..CGWR.

            If (CondRefOf (\_SB.SGOV))
            {
                SGOV (Arg0, Arg1)
            }
        }


   1894D: A0 14 5B 12 5C 2E 5F 53 42 5F 53 47 4F 56 00 53  // ..[.\._SB_SGOV.S
   1895D: 47 4F 56 68 69                                   // GOVhi

        Method (CGRD, 2, Serialized)
        {
            Store (One, Local0)

   18962: 14 44 04 43 47 52 44 0A 70 01 60                 // .D.CGRD.p.`

            If (LEqual (Arg1, Zero))
            {

   1896D: A0 1A 93 69 00                                   // ...i.

                If (CondRefOf (\_SB.GGOV))
                {

   18972: A0 15 5B 12 5C 2E 5F 53 42 5F 47 47 4F 56 00     // ..[.\._SB_GGOV.

                    Store (GGOV (Arg0), Local0)
                }
            }

   18981: 70 47 47 4F 56 68 60                             // pGGOVh`

            ElseIf
   18988: A1 1C                                            // ..

 (LEqual (Arg1, One))
            {

   1898A: A0 1A 93 69 01                                   // ...i.

                If (CondRefOf (\_SB.GGIV))
                {

   1898F: A0 15 5B 12 5C 2E 5F 53 42 5F 47 47 49 56 00     // ..[.\._SB_GGIV.

                    Store (GGIV (Arg0), Local0)
                }
            }


   1899E: 70 47 47 49 56 68 60                             // pGGIVh`

            Return (Local0)
        }


   189A5: A4 60                                            // .`

        Method (WRGP, 2, Serialized)
        {
            Store (Arg0, Local0)
            Store (Arg0, Local1)
            And (Local0, 0xFFFFFFFF, Local0)
            ShiftRight (Local1, 0x20, Local1)

   189A7: 14 28 57 52 47 50 0A 70 68 60 70 68 61 7B 60 0C  // .(WRGP.ph`pha{`.
   189B7: FF FF FF FF 60 7A 61 0A 20 61                    // ....`za. a

            If (LEqual (And (Local0, 0xFF), One))
            {
                CGWR (Local1, Arg1)
            }
        }


   189C1: A0 0E 93 7B 60 0A FF 00 01 43 47 57 52 61 69     // ...{`....CGWRai

        Method (RDGP, 2, Serialized)
        {
            Store (One, Local7)
            Store (Arg0, Local0)
            Store (Arg0, Local1)
            And (Local0, 0xFFFFFFFF, Local0)
            ShiftRight (Local1, 0x20, Local1)

   189D0: 14 2F 52 44 47 50 0A 70 01 67 70 68 60 70 68 61  // ./RDGP.p.gph`pha
   189E0: 7B 60 0C FF FF FF FF 60 7A 61 0A 20 61           // {`.....`za. a

            If (LEqual (And (Local0, 0xFF), One))
            {

   189ED: A0 10 93 7B 60 0A FF 00 01                       // ...{`....

                Store (CGRD (Local1, Arg1), Local7)
            }


   189F6: 70 43 47 52 44 61 69 67                          // pCGRDaig

            Return (Local7)
        }
    }


   189FE: A4 67                                            // .g

    Scope (_SB)
    {

   18A00: 10 4A 10 5F 53 42 5F                             // .J._SB_

        Processor (PR00, 0x01, 0x00001810, 0x06){}

   18A07: 5B 83 0B 50 52 30 30 01 10 18 00 00 06           // [..PR00......

        Processor (PR01, 0x02, 0x00001810, 0x06){}

   18A14: 5B 83 0B 50 52 30 31 02 10 18 00 00 06           // [..PR01......

        Processor (PR02, 0x03, 0x00001810, 0x06){}

   18A21: 5B 83 0B 50 52 30 32 03 10 18 00 00 06           // [..PR02......

        Processor (PR03, 0x04, 0x00001810, 0x06){}

   18A2E: 5B 83 0B 50 52 30 33 04 10 18 00 00 06           // [..PR03......

        Processor (PR04, 0x05, 0x00001810, 0x06){}

   18A3B: 5B 83 0B 50 52 30 34 05 10 18 00 00 06           // [..PR04......

        Processor (PR05, 0x06, 0x00001810, 0x06){}

   18A48: 5B 83 0B 50 52 30 35 06 10 18 00 00 06           // [..PR05......

        Processor (PR06, 0x07, 0x00001810, 0x06){}

   18A55: 5B 83 0B 50 52 30 36 07 10 18 00 00 06           // [..PR06......

        Processor (PR07, 0x08, 0x00001810, 0x06){}

   18A62: 5B 83 0B 50 52 30 37 08 10 18 00 00 06           // [..PR07......

        Processor (PR08, 0x09, 0x00001810, 0x06){}

   18A6F: 5B 83 0B 50 52 30 38 09 10 18 00 00 06           // [..PR08......

        Processor (PR09, 0x0A, 0x00001810, 0x06){}

   18A7C: 5B 83 0B 50 52 30 39 0A 10 18 00 00 06           // [..PR09......

        Processor (PR10, 0x0B, 0x00001810, 0x06){}

   18A89: 5B 83 0B 50 52 31 30 0B 10 18 00 00 06           // [..PR10......

        Processor (PR11, 0x0C, 0x00001810, 0x06){}

   18A96: 5B 83 0B 50 52 31 31 0C 10 18 00 00 06           // [..PR11......

        Processor (PR12, 0x0D, 0x00001810, 0x06){}

   18AA3: 5B 83 0B 50 52 31 32 0D 10 18 00 00 06           // [..PR12......

        Processor (PR13, 0x0E, 0x00001810, 0x06){}

   18AB0: 5B 83 0B 50 52 31 33 0E 10 18 00 00 06           // [..PR13......

        Processor (PR14, 0x0F, 0x00001810, 0x06){}

   18ABD: 5B 83 0B 50 52 31 34 0F 10 18 00 00 06           // [..PR14......

        Processor (PR15, 0x10, 0x00001810, 0x06){}

   18ACA: 5B 83 0B 50 52 31 35 10 10 18 00 00 06           // [..PR15......

        Processor (PR16, 0x11, 0x00001810, 0x06){}

   18AD7: 5B 83 0B 50 52 31 36 11 10 18 00 00 06           // [..PR16......

        Processor (PR17, 0x12, 0x00001810, 0x06){}

   18AE4: 5B 83 0B 50 52 31 37 12 10 18 00 00 06           // [..PR17......

        Processor (PR18, 0x13, 0x00001810, 0x06){}

   18AF1: 5B 83 0B 50 52 31 38 13 10 18 00 00 06           // [..PR18......

        Processor (PR19, 0x14, 0x00001810, 0x06){}
    }


   18AFE: 5B 83 0B 50 52 31 39 14 10 18 00 00 06           // [..PR19......

    Scope (_SB.PR00)
    {

   18B0B: 10 44 45 2E 5F 53 42 5F 50 52 30 30              // .DE._SB_PR00

        Name (CPC2, 
   18B17: 08 43 50 43 32                                   // .CPC2

Package (0x15)
        {
            0x15, 
            0x02, 

   18B1C: 12 4E 16 15 0A 15 0A 02                          // .N......

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18B24: 11 14 0A 11 82 0C 00 7F 08 00 04 71 07 00 00 00  // ...........q....
   18B34: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0xCE,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18B39: 11 14 0A 11 82 0C 00 7F 08 08 04 CE 00 00 00 00  // ................
   18B49: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18B4E: 11 14 0A 11 82 0C 00 7F 08 10 04 71 07 00 00 00  // ...........q....
   18B5E: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18B63: 11 14 0A 11 82 0C 00 7F 08 18 04 71 07 00 00 00  // ...........q....
   18B73: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18B78: 11 14 0A 11 82 0C 00 7F 08 08 04 71 07 00 00 00  // ...........q....
   18B88: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18B8D: 11 14 0A 11 82 0C 00 7F 08 10 04 74 07 00 00 00  // ...........t....
   18B9D: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18BA2: 11 14 0A 11 82 0C 00 7F 08 00 04 74 07 00 00 00  // ...........t....
   18BB2: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18BB7: 11 14 0A 11 82 0C 00 7F 08 08 04 74 07 00 00 00  // ...........t....
   18BC7: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18BCC: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18BDC: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18BE1: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18BF1: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18BF6: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18C06: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE7,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18C0B: 11 14 0A 11 82 0C 00 7F 40 00 04 E7 00 00 00 00  // ........@.......
   18C1B: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE8,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18C20: 11 14 0A 11 82 0C 00 7F 40 00 04 E8 00 00 00 00  // ........@.......
   18C30: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x02, 0x01, 0x04, 0x77,  // .......w
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18C35: 11 14 0A 11 82 0C 00 7F 02 01 04 77 07 00 00 00  // ...........w....
   18C45: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x01, 0x00, 0x04, 0x70,  // .......p
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            One, 

   18C4A: 11 14 0A 11 82 0C 00 7F 01 00 04 70 07 00 00 00  // ...........p....
   18C5A: 00 00 00 79 00 01                                // ...y..

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x0A, 0x20, 0x04, 0x74,  // ..... .t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18C60: 11 14 0A 11 82 0C 00 7F 0A 20 04 74 07 00 00 00  // ......... .t....
   18C70: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Zero
        })

   18C75: 11 14 0A 11 82 0C 00 7F 08 18 04 74 07 00 00 00  // ...........t....
   18C85: 00 00 00 79 00 00                                // ...y..

        Name (CPTB, 
   18C8B: 08 43 50 54 42                                   // .CPTB

Package (0x15)
        {
            0x15, 
            0x02, 

   18C90: 12 4E 16 15 0A 15 0A 02                          // .N......

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x01, 0x08, 0x00, 0x00, 0x20,  // ....... 
                /* 0008 */  0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18C98: 11 14 0A 11 82 0C 00 01 08 00 00 20 08 00 00 00  // ........... ....
   18CA8: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0xCE,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18CAD: 11 14 0A 11 82 0C 00 7F 08 08 04 CE 00 00 00 00  // ................
   18CBD: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18CC2: 11 14 0A 11 82 0C 00 7F 08 10 04 71 07 00 00 00  // ...........q....
   18CD2: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18CD7: 11 14 0A 11 82 0C 00 7F 08 18 04 71 07 00 00 00  // ...........q....
   18CE7: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18CEC: 11 14 0A 11 82 0C 00 7F 08 08 04 71 07 00 00 00  // ...........q....
   18CFC: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D01: 11 14 0A 11 82 0C 00 7F 08 10 04 74 07 00 00 00  // ...........t....
   18D11: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D16: 11 14 0A 11 82 0C 00 7F 08 00 04 74 07 00 00 00  // ...........t....
   18D26: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D2B: 11 14 0A 11 82 0C 00 7F 08 08 04 74 07 00 00 00  // ...........t....
   18D3B: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D40: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18D50: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D55: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18D65: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D6A: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18D7A: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE7,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D7F: 11 14 0A 11 82 0C 00 7F 40 00 04 E7 00 00 00 00  // ........@.......
   18D8F: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE8,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18D94: 11 14 0A 11 82 0C 00 7F 40 00 04 E8 00 00 00 00  // ........@.......
   18DA4: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x02, 0x01, 0x04, 0x77,  // .......w
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18DA9: 11 14 0A 11 82 0C 00 7F 02 01 04 77 07 00 00 00  // ...........w....
   18DB9: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x01, 0x00, 0x04, 0x70,  // .......p
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            One, 

   18DBE: 11 14 0A 11 82 0C 00 7F 01 00 04 70 07 00 00 00  // ...........p....
   18DCE: 00 00 00 79 00 01                                // ...y..

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x0A, 0x20, 0x04, 0x74,  // ..... .t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18DD4: 11 14 0A 11 82 0C 00 7F 0A 20 04 74 07 00 00 00  // ......... .t....
   18DE4: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Zero
        })

   18DE9: 11 14 0A 11 82 0C 00 7F 08 18 04 74 07 00 00 00  // ...........t....
   18DF9: 00 00 00 79 00 00                                // ...y..

        Name (CPOC, 
   18DFF: 08 43 50 4F 43                                   // .CPOC

Package (0x15)
        {
            0x15, 
            0x02, 
            0xFF, 

   18E04: 12 4B 15 15 0A 15 0A 02 0A FF                    // .K........

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0xCE,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E0E: 11 14 0A 11 82 0C 00 7F 08 08 04 CE 00 00 00 00  // ................
   18E1E: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E23: 11 14 0A 11 82 0C 00 7F 08 10 04 71 07 00 00 00  // ...........q....
   18E33: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E38: 11 14 0A 11 82 0C 00 7F 08 18 04 71 07 00 00 00  // ...........q....
   18E48: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E4D: 11 14 0A 11 82 0C 00 7F 08 08 04 71 07 00 00 00  // ...........q....
   18E5D: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E62: 11 14 0A 11 82 0C 00 7F 08 10 04 74 07 00 00 00  // ...........t....
   18E72: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E77: 11 14 0A 11 82 0C 00 7F 08 00 04 74 07 00 00 00  // ...........t....
   18E87: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18E8C: 11 14 0A 11 82 0C 00 7F 08 08 04 74 07 00 00 00  // ...........t....
   18E9C: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18EA1: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18EB1: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18EB6: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18EC6: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18ECB: 11 14 0A 11 82 0C 00 00 00 00 00 00 00 00 00 00  // ................
   18EDB: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE7,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18EE0: 11 14 0A 11 82 0C 00 7F 40 00 04 E7 00 00 00 00  // ........@.......
   18EF0: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE8,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18EF5: 11 14 0A 11 82 0C 00 7F 40 00 04 E8 00 00 00 00  // ........@.......
   18F05: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x02, 0x01, 0x04, 0x77,  // .......w
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18F0A: 11 14 0A 11 82 0C 00 7F 02 01 04 77 07 00 00 00  // ...........w....
   18F1A: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x01, 0x00, 0x04, 0x70,  // .......p
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            One, 

   18F1F: 11 14 0A 11 82 0C 00 7F 01 00 04 70 07 00 00 00  // ...........p....
   18F2F: 00 00 00 79 00 01                                // ...y..

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x0A, 0x20, 0x04, 0x74,  // ..... .t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 


   18F35: 11 14 0A 11 82 0C 00 7F 0A 20 04 74 07 00 00 00  // ......... .t....
   18F45: 00 00 00 79 00                                   // ...y.

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Zero
        })
    }


   18F4A: 11 14 0A 11 82 0C 00 7F 08 18 04 74 07 00 00 00  // ...........t....
   18F5A: 00 00 00 79 00 00                                // ...y..

    Scope (_SB)
    {

   18F60: 10 48 05 5F 53 42 5F                             // .H._SB_

        Device (PAGD)
        {

   18F67: 5B 82 40 05 50 41 47 44                          // [.@.PAGD

            Name (_HID, "ACPI000C" /* Processor Aggregator Device */)  // _HID: Hardware ID

   18F6F: 08 5F 48 49 44 0D 41 43 50 49 30 30 30 43 00     // ._HID.ACPI000C.

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

   18F7E: 14 30 5F 53 54 41 00                             // .0_STA.

                If (_OSI ("Processor Aggregator Device"))
                {

   18F85: A0 25 5F 4F 53 49 0D 50 72 6F 63 65 73 73 6F 72  // .%_OSI.Processor
   18F95: 20 41 67 67 72 65 67 61 74 6F 72 20 44 65 76 69  //  Aggregator Devi
   18FA5: 63 65 00                                         // ce.

                    Return (0x0F)
                }

   18FA8: A4 0A 0F                                         // ...

                Else
                {

   18FAB: A1 03                                            // ..

                    Return (Zero)
                }
            }


   18FAD: A4 00                                            // ..

            Name (_PUR, 
   18FAF: 08 5F 50 55 52                                   // ._PUR

Package (0x02)  // _PUR: Processor Utilization Request
            {
                One, 
                Zero
            })
        }
    }


   18FB4: 12 04 02 01 00                                   // .....

    Scope (_SB.PCI0)
    {

   18FB9: 10 46 14 2E 5F 53 42 5F 50 43 49 30              // .F.._SB_PCI0

        Device (PDRC)
        {

   18FC5: 5B 82 49 13 50 44 52 43                          // [.I.PDRC

            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID

   18FCD: 08 5F 48 49 44 0C 41 D0 0C 02                    // ._HID.A...

            Name (_UID, One)  // _UID: Unique ID

   18FD7: 08 5F 55 49 44 01                                // ._UID.

            Name (BUF0, 
   18FDD: 08 42 55 46 30                                   // .BUF0

Buffer (0x7A)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x80, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0030 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD2, 0xFE,  // ........
                /* 0038 */  0x00, 0x00, 0x02, 0x00, 0x86, 0x09, 0x00, 0x00,  // ........
                /* 0040 */  0x00, 0x00, 0xD9, 0xFE, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 0048 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x50, 0xD4, 0xFE,  // .....P..
                /* 0050 */  0x00, 0xB0, 0x04, 0x00, 0x86, 0x09, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x00, 0xE0, 0xFE, 0x00, 0x00, 0x10, 0x00,  // ........
                /* 0060 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0078 */  0x79, 0x00                                       // y.
            })

   18FE2: 11 4E 07 0A 7A 86 09 00 01 00 00 00 00 00 80 00  // .N..z...........
   18FF2: 00 86 09 00 01 00 00 00 00 00 10 00 00 86 09 00  // ................
   19002: 01 00 00 00 00 00 10 00 00 86 09 00 01 00 00 00  // ................
   19012: 00 00 00 00 00 86 09 00 01 00 00 D2 FE 00 00 02  // ................
   19022: 00 86 09 00 00 00 00 D9 FE 00 40 00 00 86 09 00  // ..........@.....
   19032: 01 00 50 D4 FE 00 B0 04 00 86 09 00 00 00 00 E0  // ..P.............
   19042: FE 00 00 10 00 86 09 00 01 00 00 00 00 00 00 00  // ................
   19052: 00 86 09 00 01 00 00 00 00 00 00 00 00 79 00     // .............y.

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {

   19061: 14 4E 09 5F 43 52 53 08                          // .N._CRS.

                CreateDWordField (BUF0, 0x04, MBR0)
                Store (GMHB (), MBR0) /* \_SB_.PCI0.PDRC._CRS.MBR0 */

   19069: 8A 42 55 46 30 0A 04 4D 42 52 30 70 47 4D 48 42  // .BUF0..MBR0pGMHB
   19079: 4D 42 52 30                                      // MBR0

                CreateDWordField (BUF0, 0x10, DBR0)
                Store (GDMB (), DBR0) /* \_SB_.PCI0.PDRC._CRS.DBR0 */

   1907D: 8A 42 55 46 30 0A 10 44 42 52 30 70 47 44 4D 42  // .BUF0..DBR0pGDMB
   1908D: 44 42 52 30                                      // DBR0

                CreateDWordField (BUF0, 0x1C, EBR0)
                Store (GEPB (), EBR0) /* \_SB_.PCI0.PDRC._CRS.EBR0 */

   19091: 8A 42 55 46 30 0A 1C 45 42 52 30 70 47 45 50 42  // .BUF0..EBR0pGEPB
   190A1: 45 42 52 30                                      // EBR0

                CreateDWordField (BUF0, 0x28, XBR0)
                Store (GPCB (), XBR0) /* \_SB_.PCI0.PDRC._CRS.XBR0 */

   190A5: 8A 42 55 46 30 0A 28 58 42 52 30 70 47 50 43 42  // .BUF0.(XBR0pGPCB
   190B5: 58 42 52 30                                      // XBR0

                CreateDWordField (BUF0, 0x2C, XSZ0)
                Store (GPCL (), XSZ0) /* \_SB_.PCI0.PDRC._CRS.XSZ0 */

   190B9: 8A 42 55 46 30 0A 2C 58 53 5A 30 70 47 50 43 4C  // .BUF0.,XSZ0pGPCL
   190C9: 58 53 5A 30                                      // XSZ0

                If (LNot (HPTE))
                {

   190CD: A0 2D 92 48 50 54 45                             // .-.HPTE

                    CreateDWordField (BUF0, 0x70, HBAS)

   190D4: 8A 42 55 46 30 0A 70 48 42 41 53                 // .BUF0.pHBAS

                    CreateDWordField (BUF0, 0x74, HLEN)
                    Store (HPTB, HBAS) /* \_SB_.PCI0.PDRC._CRS.HBAS */

   190DF: 8A 42 55 46 30 0A 74 48 4C 45 4E 70 48 50 54 42  // .BUF0.tHLENpHPTB
   190EF: 48 42 41 53                                      // HBAS

                    Store (0x0400, HLEN) /* \_SB_.PCI0.PDRC._CRS.HLEN */
                }


   190F3: 70 0B 00 04 48 4C 45 4E                          // p...HLEN

                Return (BUF0) /* \_SB_.PCI0.PDRC.BUF0 */
            }
        }
    }


   190FB: A4 42 55 46 30                                   // .BUF0

    Method (BRTN, 1, Serialized)
    {

   19100: 14 2A 42 52 54 4E 09                             // .*BRTN.

        If (LEqual (And (DIDX, 0x0F00), 0x0400))
        {

   19107: A0 23 93 7B 44 49 44 58 0B 00 0F 00 0B 00 04     // .#.{DIDX.......

            Notify (\_SB.PCI0.GFX0.DD1F, Arg0)
        }
    }


   19116: 86 5C 2F 04 5F 53 42 5F 50 43 49 30 47 46 58 30  // .\/._SB_PCI0GFX0
   19126: 44 44 31 46 68                                   // DD1Fh

    Scope (_GPE)
    {

   1912B: 10 82 DD 01 5F 47 50 45                          // ...._GPE

        Method (_L69, 0, Serialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            \_SB.PCI0.RP01.HPME ()
            \_SB.PCI0.RP02.HPME ()
            \_SB.PCI0.RP03.HPME ()
            \_SB.PCI0.RP04.HPME ()
            \_SB.PCI0.RP05.HPME ()
            \_SB.PCI0.RP06.HPME ()
            \_SB.PCI0.RP07.HPME ()
            \_SB.PCI0.RP08.HPME ()
            \_SB.PCI0.RP09.HPME ()
            \_SB.PCI0.RP10.HPME ()
            \_SB.PCI0.RP11.HPME ()
            \_SB.PCI0.RP12.HPME ()
            \_SB.PCI0.RP13.HPME ()
            \_SB.PCI0.RP14.HPME ()
            \_SB.PCI0.RP15.HPME ()
            \_SB.PCI0.RP16.HPME ()
            \_SB.PCI0.RP17.HPME ()
            \_SB.PCI0.RP18.HPME ()
            \_SB.PCI0.RP19.HPME ()
            \_SB.PCI0.RP20.HPME ()
            \_SB.PCI0.RP21.HPME ()
            \_SB.PCI0.RP22.HPME ()
            \_SB.PCI0.RP23.HPME ()
            \_SB.PCI0.RP24.HPME ()

   19133: 14 4E 28 5F 4C 36 39 08 5C 2F 04 5F 53 42 5F 50  // .N(_L69.\/._SB_P
   19143: 43 49 30 52 50 30 31 48 50 4D 45 5C 2F 04 5F 53  // CI0RP01HPME\/._S
   19153: 42 5F 50 43 49 30 52 50 30 32 48 50 4D 45 5C 2F  // B_PCI0RP02HPME\/
   19163: 04 5F 53 42 5F 50 43 49 30 52 50 30 33 48 50 4D  // ._SB_PCI0RP03HPM
   19173: 45 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 34  // E\/._SB_PCI0RP04
   19183: 48 50 4D 45 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // HPME\/._SB_PCI0R
   19193: 50 30 35 48 50 4D 45 5C 2F 04 5F 53 42 5F 50 43  // P05HPME\/._SB_PC
   191A3: 49 30 52 50 30 36 48 50 4D 45 5C 2F 04 5F 53 42  // I0RP06HPME\/._SB
   191B3: 5F 50 43 49 30 52 50 30 37 48 50 4D 45 5C 2F 04  // _PCI0RP07HPME\/.
   191C3: 5F 53 42 5F 50 43 49 30 52 50 30 38 48 50 4D 45  // _SB_PCI0RP08HPME
   191D3: 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 39 48  // \/._SB_PCI0RP09H
   191E3: 50 4D 45 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // PME\/._SB_PCI0RP
   191F3: 31 30 48 50 4D 45 5C 2F 04 5F 53 42 5F 50 43 49  // 10HPME\/._SB_PCI
   19203: 30 52 50 31 31 48 50 4D 45 5C 2F 04 5F 53 42 5F  // 0RP11HPME\/._SB_
   19213: 50 43 49 30 52 50 31 32 48 50 4D 45 5C 2F 04 5F  // PCI0RP12HPME\/._
   19223: 53 42 5F 50 43 49 30 52 50 31 33 48 50 4D 45 5C  // SB_PCI0RP13HPME\
   19233: 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 34 48 50  // /._SB_PCI0RP14HP
   19243: 4D 45 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // ME\/._SB_PCI0RP1
   19253: 35 48 50 4D 45 5C 2F 04 5F 53 42 5F 50 43 49 30  // 5HPME\/._SB_PCI0
   19263: 52 50 31 36 48 50 4D 45 5C 2F 04 5F 53 42 5F 50  // RP16HPME\/._SB_P
   19273: 43 49 30 52 50 31 37 48 50 4D 45 5C 2F 04 5F 53  // CI0RP17HPME\/._S
   19283: 42 5F 50 43 49 30 52 50 31 38 48 50 4D 45 5C 2F  // B_PCI0RP18HPME\/
   19293: 04 5F 53 42 5F 50 43 49 30 52 50 31 39 48 50 4D  // ._SB_PCI0RP19HPM
   192A3: 45 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 30  // E\/._SB_PCI0RP20
   192B3: 48 50 4D 45 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // HPME\/._SB_PCI0R
   192C3: 50 32 31 48 50 4D 45 5C 2F 04 5F 53 42 5F 50 43  // P21HPME\/._SB_PC
   192D3: 49 30 52 50 32 32 48 50 4D 45 5C 2F 04 5F 53 42  // I0RP22HPME\/._SB
   192E3: 5F 50 43 49 30 52 50 32 33 48 50 4D 45 5C 2F 04  // _PCI0RP23HPME\/.
   192F3: 5F 53 42 5F 50 43 49 30 52 50 32 34 48 50 4D 45  // _SB_PCI0RP24HPME

            If (LEqual (\_SB.PCI0.D1F0, One))
            {
                \_SB.PCI0.PEG0.HPME ()
                Notify (\_SB.PCI0.PEG0, 0x02) // Device Wake

   19303: A0 4E 04 93 5C 2F 03 5F 53 42 5F 50 43 49 30 44  // .N..\/._SB_PCI0D
   19313: 31 46 30 01 5C 2F 04 5F 53 42 5F 50 43 49 30 50  // 1F0.\/._SB_PCI0P
   19323: 45 47 30 48 50 4D 45 86 5C 2F 03 5F 53 42 5F 50  // EG0HPME.\/._SB_P
   19333: 43 49 30 50 45 47 30 0A 02                       // CI0PEG0..

                Notify (\_SB.PCI0.PEG0.PEGP, 0x02) // Device Wake
            }


   1933C: 86 5C 2F 04 5F 53 42 5F 50 43 49 30 50 45 47 30  // .\/._SB_PCI0PEG0
   1934C: 50 45 47 50 0A 02                                // PEGP..

            If (LEqual (\_SB.PCI0.D1F1, One))
            {
                \_SB.PCI0.PEG1.HPME ()

   19352: A0 37 93 5C 2F 03 5F 53 42 5F 50 43 49 30 44 31  // .7.\/._SB_PCI0D1
   19362: 46 31 01 5C 2F 04 5F 53 42 5F 50 43 49 30 50 45  // F1.\/._SB_PCI0PE
   19372: 47 31 48 50 4D 45                                // G1HPME

                Notify (\_SB.PCI0.PEG1, 0x02) // Device Wake
            }


   19378: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 50 45 47 31  // .\/._SB_PCI0PEG1
   19388: 0A 02                                            // ..

            If (LEqual (\_SB.PCI0.D1F2, One))
            {
                \_SB.PCI0.PEG2.HPME ()

   1938A: A0 37 93 5C 2F 03 5F 53 42 5F 50 43 49 30 44 31  // .7.\/._SB_PCI0D1
   1939A: 46 32 01 5C 2F 04 5F 53 42 5F 50 43 49 30 50 45  // F2.\/._SB_PCI0PE
   193AA: 47 32 48 50 4D 45                                // G2HPME

                Notify (\_SB.PCI0.PEG2, 0x02) // Device Wake
            }
        }


   193B0: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 50 45 47 32  // .\/._SB_PCI0PEG2
   193C0: 0A 02                                            // ..

        Method (_L61, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Add (L01C, One, L01C) /* \L01C */
            P8XH (Zero, One)
            P8XH (One, L01C)

   193C2: 14 82 97 01 5F 4C 36 31 00 72 4C 30 31 43 01 4C  // ...._L61.rL01C.L
   193D2: 30 31 43 50 38 58 48 00 01 50 38 58 48 01 4C 30  // 01CP8XH..P8XH.L0
   193E2: 31 43                                            // 1C

            If (LAnd (
   193E4: A0 49 0F 90 92                                   // .I...

LNotEqual (\_SB.PCI0.RP01.VDID, 0xFFFFFFFF), \_SB.PCI0.RP01.HPSX))
            {

   193E9: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 31  // .\/._SB_PCI0RP01
   193F9: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19409: 50 43 49 30 52 50 30 31 48 50 53 58              // PCI0RP01HPSX

                If (LOr (
   19415: A0 1C 91 92                                      // ....

LNotEqual (TBTS, One), 
   19419: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1941F: 91 92                                            // ..

LNotEqual (RPS0, One), 
   19421: 93 52 50 53 30 01                                // .RPS0.


   19427: 92                                               // .


                    LNotEqual (RPS1, One))))
                {

   19428: 93 52 50 53 31 01                                // .RPS1.

                    Sleep (0x64)
                }


   1942E: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP01.PDCX)
                {
                    Store (One, \_SB.PCI0.RP01.PDCX)
                    Store (One, \_SB.PCI0.RP01.HPSX)

   19432: A0 44 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .D.\/._SB_PCI0RP
   19442: 30 31 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 01PDCXp.\/._SB_P
   19452: 43 49 30 52 50 30 31 50 44 43 58 70 01 5C 2F 04  // CI0RP01PDCXp.\/.
   19462: 5F 53 42 5F 50 43 49 30 52 50 30 31 48 50 53 58  // _SB_PCI0RP01HPSX

                    If (LNot (\_SB.PCI0.RP01.PDSX))
                    {

   19472: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19482: 30 31 50 44 53 58                                // 01PDSX

                        Store (Zero, \_SB.PCI0.RP01.L0SE)
                    }


   19488: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19498: 31 4C 30 53 45                                   // 1L0SE

                    If (LOr (
   1949D: A0 29 91 92                                      // .)..

LNotEqual (TBTS, One), 
   194A1: 93 54 42 54 53 01                                // .TBTS.

LOr (
   194A7: 91 92                                            // ..

LNotEqual (RPS0, One), 
   194A9: 93 52 50 53 30 01                                // .RPS0.


   194AF: 92                                               // .


                        LNotEqual (RPS1, One))))
                    {

   194B0: 93 52 50 53 31 01                                // .RPS1.

                        Notify (\_SB.PCI0.RP01, Zero) // Bus Check
                    }
                }

   194B6: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 31  // .\/._SB_PCI0RP01
   194C6: 00                                               // .

                Else
                {

   194C7: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP01.HPSX)
                }
            }


   194C9: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   194D9: 31 48 50 53 58                                   // 1HPSX

            If (LAnd (
   194DE: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP02.VDID, 0xFFFFFFFF), \_SB.PCI0.RP02.HPSX))
            {

   194E3: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 32  // .\/._SB_PCI0RP02
   194F3: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19503: 50 43 49 30 52 50 30 32 48 50 53 58              // PCI0RP02HPSX

                If (LOr (
   1950F: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19513: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19519: 91 92                                            // ..

LNotEqual (RPS0, 0x02), 
   1951B: 93 52 50 53 30 0A 02                             // .RPS0..


   19522: 92                                               // .


                    LNotEqual (RPS1, 0x02))))
                {

   19523: 93 52 50 53 31 0A 02                             // .RPS1..

                    Sleep (0x64)
                }


   1952A: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP02.PDCX)
                {
                    Store (One, \_SB.PCI0.RP02.PDCX)
                    Store (One, \_SB.PCI0.RP02.HPSX)

   1952E: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1953E: 30 32 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 02PDCXp.\/._SB_P
   1954E: 43 49 30 52 50 30 32 50 44 43 58 70 01 5C 2F 04  // CI0RP02PDCXp.\/.
   1955E: 5F 53 42 5F 50 43 49 30 52 50 30 32 48 50 53 58  // _SB_PCI0RP02HPSX

                    If (LNot (\_SB.PCI0.RP02.PDSX))
                    {

   1956E: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1957E: 30 32 50 44 53 58                                // 02PDSX

                        Store (Zero, \_SB.PCI0.RP02.L0SE)
                    }


   19584: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19594: 32 4C 30 53 45                                   // 2L0SE

                    If (LOr (
   19599: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1959D: 93 54 42 54 53 01                                // .TBTS.

LOr (
   195A3: 91 92                                            // ..

LNotEqual (RPS0, 0x02), 
   195A5: 93 52 50 53 30 0A 02                             // .RPS0..


   195AC: 92                                               // .


                        LNotEqual (RPS1, 0x02))))
                    {

   195AD: 93 52 50 53 31 0A 02                             // .RPS1..

                        Notify (\_SB.PCI0.RP02, Zero) // Bus Check
                    }
                }

   195B4: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 32  // .\/._SB_PCI0RP02
   195C4: 00                                               // .

                Else
                {

   195C5: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP02.HPSX)
                }
            }


   195C7: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   195D7: 32 48 50 53 58                                   // 2HPSX

            If (LAnd (
   195DC: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP03.VDID, 0xFFFFFFFF), \_SB.PCI0.RP03.HPSX))
            {

   195E1: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 33  // .\/._SB_PCI0RP03
   195F1: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19601: 50 43 49 30 52 50 30 33 48 50 53 58              // PCI0RP03HPSX

                If (LOr (
   1960D: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19611: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19617: 91 92                                            // ..

LNotEqual (RPS0, 0x03), 
   19619: 93 52 50 53 30 0A 03                             // .RPS0..


   19620: 92                                               // .


                    LNotEqual (RPS1, 0x03))))
                {

   19621: 93 52 50 53 31 0A 03                             // .RPS1..

                    Sleep (0x64)
                }


   19628: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP03.PDCX)
                {
                    Store (One, \_SB.PCI0.RP03.PDCX)
                    Store (One, \_SB.PCI0.RP03.HPSX)

   1962C: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1963C: 30 33 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 03PDCXp.\/._SB_P
   1964C: 43 49 30 52 50 30 33 50 44 43 58 70 01 5C 2F 04  // CI0RP03PDCXp.\/.
   1965C: 5F 53 42 5F 50 43 49 30 52 50 30 33 48 50 53 58  // _SB_PCI0RP03HPSX

                    If (LNot (\_SB.PCI0.RP03.PDSX))
                    {

   1966C: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1967C: 30 33 50 44 53 58                                // 03PDSX

                        Store (Zero, \_SB.PCI0.RP03.L0SE)
                    }


   19682: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19692: 33 4C 30 53 45                                   // 3L0SE

                    If (LOr (
   19697: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1969B: 93 54 42 54 53 01                                // .TBTS.

LOr (
   196A1: 91 92                                            // ..

LNotEqual (RPS0, 0x03), 
   196A3: 93 52 50 53 30 0A 03                             // .RPS0..


   196AA: 92                                               // .


                        LNotEqual (RPS1, 0x03))))
                    {

   196AB: 93 52 50 53 31 0A 03                             // .RPS1..

                        Notify (\_SB.PCI0.RP03, Zero) // Bus Check
                    }
                }

   196B2: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 33  // .\/._SB_PCI0RP03
   196C2: 00                                               // .

                Else
                {

   196C3: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP03.HPSX)
                }
            }


   196C5: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   196D5: 33 48 50 53 58                                   // 3HPSX

            If (LAnd (
   196DA: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP04.VDID, 0xFFFFFFFF), \_SB.PCI0.RP04.HPSX))
            {

   196DF: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 34  // .\/._SB_PCI0RP04
   196EF: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   196FF: 50 43 49 30 52 50 30 34 48 50 53 58              // PCI0RP04HPSX

                If (LOr (
   1970B: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1970F: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19715: 91 92                                            // ..

LNotEqual (RPS0, 0x04), 
   19717: 93 52 50 53 30 0A 04                             // .RPS0..


   1971E: 92                                               // .


                    LNotEqual (RPS1, 0x04))))
                {

   1971F: 93 52 50 53 31 0A 04                             // .RPS1..

                    Sleep (0x64)
                }


   19726: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP04.PDCX)
                {
                    Store (One, \_SB.PCI0.RP04.PDCX)
                    Store (One, \_SB.PCI0.RP04.HPSX)

   1972A: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1973A: 30 34 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 04PDCXp.\/._SB_P
   1974A: 43 49 30 52 50 30 34 50 44 43 58 70 01 5C 2F 04  // CI0RP04PDCXp.\/.
   1975A: 5F 53 42 5F 50 43 49 30 52 50 30 34 48 50 53 58  // _SB_PCI0RP04HPSX

                    If (LNot (\_SB.PCI0.RP04.PDSX))
                    {

   1976A: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1977A: 30 34 50 44 53 58                                // 04PDSX

                        Store (Zero, \_SB.PCI0.RP04.L0SE)
                    }


   19780: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19790: 34 4C 30 53 45                                   // 4L0SE

                    If (LOr (
   19795: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19799: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1979F: 91 92                                            // ..

LNotEqual (RPS0, 0x04), 
   197A1: 93 52 50 53 30 0A 04                             // .RPS0..


   197A8: 92                                               // .


                        LNotEqual (RPS1, 0x04))))
                    {

   197A9: 93 52 50 53 31 0A 04                             // .RPS1..

                        Notify (\_SB.PCI0.RP04, Zero) // Bus Check
                    }
                }

   197B0: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 34  // .\/._SB_PCI0RP04
   197C0: 00                                               // .

                Else
                {

   197C1: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP04.HPSX)
                }
            }


   197C3: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   197D3: 34 48 50 53 58                                   // 4HPSX

            If (LAnd (
   197D8: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP05.VDID, 0xFFFFFFFF), \_SB.PCI0.RP05.HPSX))
            {

   197DD: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 35  // .\/._SB_PCI0RP05
   197ED: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   197FD: 50 43 49 30 52 50 30 35 48 50 53 58              // PCI0RP05HPSX

                If (LOr (
   19809: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1980D: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19813: 91 92                                            // ..

LNotEqual (RPS0, 0x05), 
   19815: 93 52 50 53 30 0A 05                             // .RPS0..


   1981C: 92                                               // .


                    LNotEqual (RPS1, 0x05))))
                {

   1981D: 93 52 50 53 31 0A 05                             // .RPS1..

                    Sleep (0x64)
                }


   19824: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP05.PDCX)
                {
                    Store (One, \_SB.PCI0.RP05.PDCX)
                    Store (One, \_SB.PCI0.RP05.HPSX)

   19828: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   19838: 30 35 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 05PDCXp.\/._SB_P
   19848: 43 49 30 52 50 30 35 50 44 43 58 70 01 5C 2F 04  // CI0RP05PDCXp.\/.
   19858: 5F 53 42 5F 50 43 49 30 52 50 30 35 48 50 53 58  // _SB_PCI0RP05HPSX

                    If (LNot (\_SB.PCI0.RP05.PDSX))
                    {

   19868: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19878: 30 35 50 44 53 58                                // 05PDSX

                        Store (Zero, \_SB.PCI0.RP05.L0SE)
                    }


   1987E: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   1988E: 35 4C 30 53 45                                   // 5L0SE

                    If (LOr (
   19893: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19897: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1989D: 91 92                                            // ..

LNotEqual (RPS0, 0x05), 
   1989F: 93 52 50 53 30 0A 05                             // .RPS0..


   198A6: 92                                               // .


                        LNotEqual (RPS1, 0x05))))
                    {

   198A7: 93 52 50 53 31 0A 05                             // .RPS1..

                        Notify (\_SB.PCI0.RP05, Zero) // Bus Check
                    }
                }

   198AE: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 35  // .\/._SB_PCI0RP05
   198BE: 00                                               // .

                Else
                {

   198BF: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP05.HPSX)
                }
            }


   198C1: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   198D1: 35 48 50 53 58                                   // 5HPSX

            If (LAnd (
   198D6: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP06.VDID, 0xFFFFFFFF), \_SB.PCI0.RP06.HPSX))
            {

   198DB: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 36  // .\/._SB_PCI0RP06
   198EB: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   198FB: 50 43 49 30 52 50 30 36 48 50 53 58              // PCI0RP06HPSX

                If (LOr (
   19907: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1990B: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19911: 91 92                                            // ..

LNotEqual (RPS0, 0x06), 
   19913: 93 52 50 53 30 0A 06                             // .RPS0..


   1991A: 92                                               // .


                    LNotEqual (RPS1, 0x06))))
                {

   1991B: 93 52 50 53 31 0A 06                             // .RPS1..

                    Sleep (0x64)
                }


   19922: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP06.PDCX)
                {
                    Store (One, \_SB.PCI0.RP06.PDCX)
                    Store (One, \_SB.PCI0.RP06.HPSX)

   19926: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   19936: 30 36 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 06PDCXp.\/._SB_P
   19946: 43 49 30 52 50 30 36 50 44 43 58 70 01 5C 2F 04  // CI0RP06PDCXp.\/.
   19956: 5F 53 42 5F 50 43 49 30 52 50 30 36 48 50 53 58  // _SB_PCI0RP06HPSX

                    If (LNot (\_SB.PCI0.RP06.PDSX))
                    {

   19966: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19976: 30 36 50 44 53 58                                // 06PDSX

                        Store (Zero, \_SB.PCI0.RP06.L0SE)
                    }


   1997C: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   1998C: 36 4C 30 53 45                                   // 6L0SE

                    If (LOr (
   19991: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19995: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1999B: 91 92                                            // ..

LNotEqual (RPS0, 0x06), 
   1999D: 93 52 50 53 30 0A 06                             // .RPS0..


   199A4: 92                                               // .


                        LNotEqual (RPS1, 0x06))))
                    {

   199A5: 93 52 50 53 31 0A 06                             // .RPS1..

                        Notify (\_SB.PCI0.RP06, Zero) // Bus Check
                    }
                }

   199AC: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 36  // .\/._SB_PCI0RP06
   199BC: 00                                               // .

                Else
                {

   199BD: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP06.HPSX)
                }
            }


   199BF: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   199CF: 36 48 50 53 58                                   // 6HPSX

            If (LAnd (
   199D4: A0 4A 13 90 92                                   // .J...

LNotEqual (\_SB.PCI0.RP07.VDID, 0xFFFFFFFF), \_SB.PCI0.RP07.HPSX))
            {

   199D9: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 37  // .\/._SB_PCI0RP07
   199E9: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   199F9: 50 43 49 30 52 50 30 37 48 50 53 58              // PCI0RP07HPSX

                If (LOr (
   19A05: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19A09: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19A0F: 91 92                                            // ..

LNotEqual (RPS0, 0x07), 
   19A11: 93 52 50 53 30 0A 07                             // .RPS0..


   19A18: 92                                               // .


                    LNotEqual (RPS1, 0x07))))
                {

   19A19: 93 52 50 53 31 0A 07                             // .RPS1..

                    Sleep (0x64)
                }


   19A20: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP07.PDCX)
                {
                    Store (One, \_SB.PCI0.RP07.PDCX)
                    Store (One, \_SB.PCI0.RP07.HPSX)

   19A24: A0 43 0D 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .C.\/._SB_PCI0RP
   19A34: 30 37 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 07PDCXp.\/._SB_P
   19A44: 43 49 30 52 50 30 37 50 44 43 58 70 01 5C 2F 04  // CI0RP07PDCXp.\/.
   19A54: 5F 53 42 5F 50 43 49 30 52 50 30 37 48 50 53 58  // _SB_PCI0RP07HPSX

                    If (LNot (\_SB.PCI0.RP07.PDSX))
                    {

   19A64: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19A74: 30 37 50 44 53 58                                // 07PDSX

                        Store (Zero, \_SB.PCI0.RP07.L0SE)
                    }


   19A7A: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19A8A: 37 4C 30 53 45                                   // 7L0SE

                    If (LEqual (PFLV, 0x02))
                    {

   19A8F: A0 34 93 50 46 4C 56 0A 02                       // .4.PFLV..

                        If (LOr (
   19A98: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19A9C: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19AA2: 91 92                                            // ..

LNotEqual (RPS0, 0x07), 
   19AA4: 93 52 50 53 30 0A 07                             // .RPS0..


   19AAB: 92                                               // .


                            LNotEqual (RPS1, 0x07))))
                        {

   19AAC: 93 52 50 53 31 0A 07                             // .RPS1..

                            Notify (\_SB.PCI0.RP07, Zero) // Bus Check
                        }
                    }

   19AB3: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 37  // .\/._SB_PCI0RP07
   19AC3: 00                                               // .

                    ElseIf
   19AC4: A1 33                                            // .3

 (ECON)
                    {

   19AC6: A0 31 45 43 4F 4E                                // .1ECON

                        If (LOr (
   19ACC: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19AD0: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19AD6: 91 92                                            // ..

LNotEqual (RPS0, 0x07), 
   19AD8: 93 52 50 53 30 0A 07                             // .RPS0..


   19ADF: 92                                               // .


                            LNotEqual (RPS1, 0x07))))
                        {

   19AE0: 93 52 50 53 31 0A 07                             // .RPS1..

                            Notify (\_SB.PCI0.RP07, Zero) // Bus Check
                        }
                    }
                }

   19AE7: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 37  // .\/._SB_PCI0RP07
   19AF7: 00                                               // .

                Else
                {

   19AF8: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP07.HPSX)
                }
            }


   19AFA: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19B0A: 37 48 50 53 58                                   // 7HPSX

            If (LAnd (
   19B0F: A0 4A 13 90 92                                   // .J...

LNotEqual (\_SB.PCI0.RP08.VDID, 0xFFFFFFFF), \_SB.PCI0.RP08.HPSX))
            {

   19B14: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 38  // .\/._SB_PCI0RP08
   19B24: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19B34: 50 43 49 30 52 50 30 38 48 50 53 58              // PCI0RP08HPSX

                If (LOr (
   19B40: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19B44: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19B4A: 91 92                                            // ..

LNotEqual (RPS0, 0x08), 
   19B4C: 93 52 50 53 30 0A 08                             // .RPS0..


   19B53: 92                                               // .


                    LNotEqual (RPS1, 0x08))))
                {

   19B54: 93 52 50 53 31 0A 08                             // .RPS1..

                    Sleep (0x64)
                }


   19B5B: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP08.PDCX)
                {
                    Store (One, \_SB.PCI0.RP08.PDCX)
                    Store (One, \_SB.PCI0.RP08.HPSX)

   19B5F: A0 43 0D 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .C.\/._SB_PCI0RP
   19B6F: 30 38 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 08PDCXp.\/._SB_P
   19B7F: 43 49 30 52 50 30 38 50 44 43 58 70 01 5C 2F 04  // CI0RP08PDCXp.\/.
   19B8F: 5F 53 42 5F 50 43 49 30 52 50 30 38 48 50 53 58  // _SB_PCI0RP08HPSX

                    If (LNot (\_SB.PCI0.RP08.PDSX))
                    {

   19B9F: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19BAF: 30 38 50 44 53 58                                // 08PDSX

                        Store (Zero, \_SB.PCI0.RP08.L0SE)
                    }


   19BB5: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19BC5: 38 4C 30 53 45                                   // 8L0SE

                    If (LEqual (PFLV, 0x02))
                    {

   19BCA: A0 34 93 50 46 4C 56 0A 02                       // .4.PFLV..

                        If (LOr (
   19BD3: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19BD7: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19BDD: 91 92                                            // ..

LNotEqual (RPS0, 0x08), 
   19BDF: 93 52 50 53 30 0A 08                             // .RPS0..


   19BE6: 92                                               // .


                            LNotEqual (RPS1, 0x08))))
                        {

   19BE7: 93 52 50 53 31 0A 08                             // .RPS1..

                            Notify (\_SB.PCI0.RP08, Zero) // Bus Check
                        }
                    }

   19BEE: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 38  // .\/._SB_PCI0RP08
   19BFE: 00                                               // .

                    ElseIf
   19BFF: A1 33                                            // .3

 (ECON)
                    {

   19C01: A0 31 45 43 4F 4E                                // .1ECON

                        If (LOr (
   19C07: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19C0B: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19C11: 91 92                                            // ..

LNotEqual (RPS0, 0x08), 
   19C13: 93 52 50 53 30 0A 08                             // .RPS0..


   19C1A: 92                                               // .


                            LNotEqual (RPS1, 0x08))))
                        {

   19C1B: 93 52 50 53 31 0A 08                             // .RPS1..

                            Notify (\_SB.PCI0.RP08, Zero) // Bus Check
                        }
                    }
                }

   19C22: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 38  // .\/._SB_PCI0RP08
   19C32: 00                                               // .

                Else
                {

   19C33: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP08.HPSX)
                }
            }


   19C35: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19C45: 38 48 50 53 58                                   // 8HPSX

            If (LAnd (
   19C4A: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP09.VDID, 0xFFFFFFFF), \_SB.PCI0.RP09.HPSX))
            {

   19C4F: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30 39  // .\/._SB_PCI0RP09
   19C5F: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19C6F: 50 43 49 30 52 50 30 39 48 50 53 58              // PCI0RP09HPSX

                If (LOr (
   19C7B: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19C7F: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19C85: 91 92                                            // ..

LNotEqual (RPS0, 0x09), 
   19C87: 93 52 50 53 30 0A 09                             // .RPS0..


   19C8E: 92                                               // .


                    LNotEqual (RPS1, 0x09))))
                {

   19C8F: 93 52 50 53 31 0A 09                             // .RPS1..

                    Sleep (0x64)
                }


   19C96: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP09.PDCX)
                {
                    Store (One, \_SB.PCI0.RP09.PDCX)
                    Store (One, \_SB.PCI0.RP09.HPSX)

   19C9A: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   19CAA: 30 39 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 09PDCXp.\/._SB_P
   19CBA: 43 49 30 52 50 30 39 50 44 43 58 70 01 5C 2F 04  // CI0RP09PDCXp.\/.
   19CCA: 5F 53 42 5F 50 43 49 30 52 50 30 39 48 50 53 58  // _SB_PCI0RP09HPSX

                    If (LNot (\_SB.PCI0.RP09.PDSX))
                    {

   19CDA: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19CEA: 30 39 50 44 53 58                                // 09PDSX

                        Store (Zero, \_SB.PCI0.RP09.L0SE)
                    }


   19CF0: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19D00: 39 4C 30 53 45                                   // 9L0SE

                    If (LOr (
   19D05: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19D09: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19D0F: 91 92                                            // ..

LNotEqual (RPS0, 0x09), 
   19D11: 93 52 50 53 30 0A 09                             // .RPS0..


   19D18: 92                                               // .


                        LNotEqual (RPS1, 0x09))))
                    {

   19D19: 93 52 50 53 31 0A 09                             // .RPS1..

                        Notify (\_SB.PCI0.RP09, Zero) // Bus Check
                    }
                }

   19D20: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 30 39  // .\/._SB_PCI0RP09
   19D30: 00                                               // .

                Else
                {

   19D31: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP09.HPSX)
                }
            }


   19D33: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // p.\/._SB_PCI0RP0
   19D43: 39 48 50 53 58                                   // 9HPSX

            If (LAnd (
   19D48: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP10.VDID, 0xFFFFFFFF), \_SB.PCI0.RP10.HPSX))
            {

   19D4D: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 30  // .\/._SB_PCI0RP10
   19D5D: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19D6D: 50 43 49 30 52 50 31 30 48 50 53 58              // PCI0RP10HPSX

                If (LOr (
   19D79: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19D7D: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19D83: 91 92                                            // ..

LNotEqual (RPS0, 0x0A), 
   19D85: 93 52 50 53 30 0A 0A                             // .RPS0..


   19D8C: 92                                               // .


                    LNotEqual (RPS1, 0x0A))))
                {

   19D8D: 93 52 50 53 31 0A 0A                             // .RPS1..

                    Sleep (0x64)
                }


   19D94: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP10.PDCX)
                {
                    Store (One, \_SB.PCI0.RP10.PDCX)
                    Store (One, \_SB.PCI0.RP10.HPSX)

   19D98: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   19DA8: 31 30 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 10PDCXp.\/._SB_P
   19DB8: 43 49 30 52 50 31 30 50 44 43 58 70 01 5C 2F 04  // CI0RP10PDCXp.\/.
   19DC8: 5F 53 42 5F 50 43 49 30 52 50 31 30 48 50 53 58  // _SB_PCI0RP10HPSX

                    If (LNot (\_SB.PCI0.RP10.PDSX))
                    {

   19DD8: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19DE8: 31 30 50 44 53 58                                // 10PDSX

                        Store (Zero, \_SB.PCI0.RP10.L0SE)
                    }


   19DEE: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   19DFE: 30 4C 30 53 45                                   // 0L0SE

                    If (LOr (
   19E03: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19E07: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19E0D: 91 92                                            // ..

LNotEqual (RPS0, 0x0A), 
   19E0F: 93 52 50 53 30 0A 0A                             // .RPS0..


   19E16: 92                                               // .


                        LNotEqual (RPS1, 0x0A))))
                    {

   19E17: 93 52 50 53 31 0A 0A                             // .RPS1..

                        Notify (\_SB.PCI0.RP10, Zero) // Bus Check
                    }
                }

   19E1E: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 30  // .\/._SB_PCI0RP10
   19E2E: 00                                               // .

                Else
                {

   19E2F: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP10.HPSX)
                }
            }


   19E31: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   19E41: 30 48 50 53 58                                   // 0HPSX

            If (LAnd (
   19E46: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP11.VDID, 0xFFFFFFFF), \_SB.PCI0.RP11.HPSX))
            {

   19E4B: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 31  // .\/._SB_PCI0RP11
   19E5B: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19E6B: 50 43 49 30 52 50 31 31 48 50 53 58              // PCI0RP11HPSX

                If (LOr (
   19E77: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19E7B: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19E81: 91 92                                            // ..

LNotEqual (RPS0, 0x0B), 
   19E83: 93 52 50 53 30 0A 0B                             // .RPS0..


   19E8A: 92                                               // .


                    LNotEqual (RPS1, 0x0B))))
                {

   19E8B: 93 52 50 53 31 0A 0B                             // .RPS1..

                    Sleep (0x64)
                }


   19E92: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP11.PDCX)
                {
                    Store (One, \_SB.PCI0.RP11.PDCX)
                    Store (One, \_SB.PCI0.RP11.HPSX)

   19E96: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   19EA6: 31 31 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 11PDCXp.\/._SB_P
   19EB6: 43 49 30 52 50 31 31 50 44 43 58 70 01 5C 2F 04  // CI0RP11PDCXp.\/.
   19EC6: 5F 53 42 5F 50 43 49 30 52 50 31 31 48 50 53 58  // _SB_PCI0RP11HPSX

                    If (LNot (\_SB.PCI0.RP11.PDSX))
                    {

   19ED6: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19EE6: 31 31 50 44 53 58                                // 11PDSX

                        Store (Zero, \_SB.PCI0.RP11.L0SE)
                    }


   19EEC: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   19EFC: 31 4C 30 53 45                                   // 1L0SE

                    If (LOr (
   19F01: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   19F05: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19F0B: 91 92                                            // ..

LNotEqual (RPS0, 0x0B), 
   19F0D: 93 52 50 53 30 0A 0B                             // .RPS0..


   19F14: 92                                               // .


                        LNotEqual (RPS1, 0x0B))))
                    {

   19F15: 93 52 50 53 31 0A 0B                             // .RPS1..

                        Notify (\_SB.PCI0.RP11, Zero) // Bus Check
                    }
                }

   19F1C: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 31  // .\/._SB_PCI0RP11
   19F2C: 00                                               // .

                Else
                {

   19F2D: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP11.HPSX)
                }
            }


   19F2F: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   19F3F: 31 48 50 53 58                                   // 1HPSX

            If (LAnd (
   19F44: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP12.VDID, 0xFFFFFFFF), \_SB.PCI0.RP12.HPSX))
            {

   19F49: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 32  // .\/._SB_PCI0RP12
   19F59: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   19F69: 50 43 49 30 52 50 31 32 48 50 53 58              // PCI0RP12HPSX

                If (LOr (
   19F75: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   19F79: 93 54 42 54 53 01                                // .TBTS.

LOr (
   19F7F: 91 92                                            // ..

LNotEqual (RPS0, 0x0C), 
   19F81: 93 52 50 53 30 0A 0C                             // .RPS0..


   19F88: 92                                               // .


                    LNotEqual (RPS1, 0x0C))))
                {

   19F89: 93 52 50 53 31 0A 0C                             // .RPS1..

                    Sleep (0x64)
                }


   19F90: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP12.PDCX)
                {
                    Store (One, \_SB.PCI0.RP12.PDCX)
                    Store (One, \_SB.PCI0.RP12.HPSX)

   19F94: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   19FA4: 31 32 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 12PDCXp.\/._SB_P
   19FB4: 43 49 30 52 50 31 32 50 44 43 58 70 01 5C 2F 04  // CI0RP12PDCXp.\/.
   19FC4: 5F 53 42 5F 50 43 49 30 52 50 31 32 48 50 53 58  // _SB_PCI0RP12HPSX

                    If (LNot (\_SB.PCI0.RP12.PDSX))
                    {

   19FD4: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   19FE4: 31 32 50 44 53 58                                // 12PDSX

                        Store (Zero, \_SB.PCI0.RP12.L0SE)
                    }


   19FEA: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   19FFA: 32 4C 30 53 45                                   // 2L0SE

                    If (LOr (
   19FFF: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A003: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A009: 91 92                                            // ..

LNotEqual (RPS0, 0x0C), 
   1A00B: 93 52 50 53 30 0A 0C                             // .RPS0..


   1A012: 92                                               // .


                        LNotEqual (RPS1, 0x0C))))
                    {

   1A013: 93 52 50 53 31 0A 0C                             // .RPS1..

                        Notify (\_SB.PCI0.RP12, Zero) // Bus Check
                    }
                }

   1A01A: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 32  // .\/._SB_PCI0RP12
   1A02A: 00                                               // .

                Else
                {

   1A02B: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP12.HPSX)
                }
            }


   1A02D: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A03D: 32 48 50 53 58                                   // 2HPSX

            If (LAnd (
   1A042: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP13.VDID, 0xFFFFFFFF), \_SB.PCI0.RP13.HPSX))
            {

   1A047: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 33  // .\/._SB_PCI0RP13
   1A057: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A067: 50 43 49 30 52 50 31 33 48 50 53 58              // PCI0RP13HPSX

                If (LOr (
   1A073: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A077: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A07D: 91 92                                            // ..

LNotEqual (RPS0, 0x0D), 
   1A07F: 93 52 50 53 30 0A 0D                             // .RPS0..


   1A086: 92                                               // .


                    LNotEqual (RPS1, 0x0D))))
                {

   1A087: 93 52 50 53 31 0A 0D                             // .RPS1..

                    Sleep (0x64)
                }


   1A08E: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP13.PDCX)
                {
                    Store (One, \_SB.PCI0.RP13.PDCX)
                    Store (One, \_SB.PCI0.RP13.HPSX)

   1A092: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A0A2: 31 33 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 13PDCXp.\/._SB_P
   1A0B2: 43 49 30 52 50 31 33 50 44 43 58 70 01 5C 2F 04  // CI0RP13PDCXp.\/.
   1A0C2: 5F 53 42 5F 50 43 49 30 52 50 31 33 48 50 53 58  // _SB_PCI0RP13HPSX

                    If (LNot (\_SB.PCI0.RP13.PDSX))
                    {

   1A0D2: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A0E2: 31 33 50 44 53 58                                // 13PDSX

                        Store (Zero, \_SB.PCI0.RP13.L0SE)
                    }


   1A0E8: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A0F8: 33 4C 30 53 45                                   // 3L0SE

                    If (LOr (
   1A0FD: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A101: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A107: 91 92                                            // ..

LNotEqual (RPS0, 0x0D), 
   1A109: 93 52 50 53 30 0A 0D                             // .RPS0..


   1A110: 92                                               // .


                        LNotEqual (RPS1, 0x0D))))
                    {

   1A111: 93 52 50 53 31 0A 0D                             // .RPS1..

                        Notify (\_SB.PCI0.RP13, Zero) // Bus Check
                    }
                }

   1A118: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 33  // .\/._SB_PCI0RP13
   1A128: 00                                               // .

                Else
                {

   1A129: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP13.HPSX)
                }
            }


   1A12B: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A13B: 33 48 50 53 58                                   // 3HPSX

            If (LAnd (
   1A140: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP14.VDID, 0xFFFFFFFF), \_SB.PCI0.RP14.HPSX))
            {

   1A145: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 34  // .\/._SB_PCI0RP14
   1A155: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A165: 50 43 49 30 52 50 31 34 48 50 53 58              // PCI0RP14HPSX

                If (LOr (
   1A171: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A175: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A17B: 91 92                                            // ..

LNotEqual (RPS0, 0x0E), 
   1A17D: 93 52 50 53 30 0A 0E                             // .RPS0..


   1A184: 92                                               // .


                    LNotEqual (RPS1, 0x0E))))
                {

   1A185: 93 52 50 53 31 0A 0E                             // .RPS1..

                    Sleep (0x64)
                }


   1A18C: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP14.PDCX)
                {
                    Store (One, \_SB.PCI0.RP14.PDCX)
                    Store (One, \_SB.PCI0.RP14.HPSX)

   1A190: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A1A0: 31 34 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 14PDCXp.\/._SB_P
   1A1B0: 43 49 30 52 50 31 34 50 44 43 58 70 01 5C 2F 04  // CI0RP14PDCXp.\/.
   1A1C0: 5F 53 42 5F 50 43 49 30 52 50 31 34 48 50 53 58  // _SB_PCI0RP14HPSX

                    If (LNot (\_SB.PCI0.RP14.PDSX))
                    {

   1A1D0: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A1E0: 31 34 50 44 53 58                                // 14PDSX

                        Store (Zero, \_SB.PCI0.RP14.L0SE)
                    }


   1A1E6: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A1F6: 34 4C 30 53 45                                   // 4L0SE

                    If (LOr (
   1A1FB: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A1FF: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A205: 91 92                                            // ..

LNotEqual (RPS0, 0x0E), 
   1A207: 93 52 50 53 30 0A 0E                             // .RPS0..


   1A20E: 92                                               // .


                        LNotEqual (RPS1, 0x0E))))
                    {

   1A20F: 93 52 50 53 31 0A 0E                             // .RPS1..

                        Notify (\_SB.PCI0.RP14, Zero) // Bus Check
                    }
                }

   1A216: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 34  // .\/._SB_PCI0RP14
   1A226: 00                                               // .

                Else
                {

   1A227: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP14.HPSX)
                }
            }


   1A229: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A239: 34 48 50 53 58                                   // 4HPSX

            If (LAnd (
   1A23E: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP15.VDID, 0xFFFFFFFF), \_SB.PCI0.RP15.HPSX))
            {

   1A243: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 35  // .\/._SB_PCI0RP15
   1A253: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A263: 50 43 49 30 52 50 31 35 48 50 53 58              // PCI0RP15HPSX

                If (LOr (
   1A26F: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A273: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A279: 91 92                                            // ..

LNotEqual (RPS0, 0x0F), 
   1A27B: 93 52 50 53 30 0A 0F                             // .RPS0..


   1A282: 92                                               // .


                    LNotEqual (RPS1, 0x0F))))
                {

   1A283: 93 52 50 53 31 0A 0F                             // .RPS1..

                    Sleep (0x64)
                }


   1A28A: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP15.PDCX)
                {
                    Store (One, \_SB.PCI0.RP15.PDCX)
                    Store (One, \_SB.PCI0.RP15.HPSX)

   1A28E: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A29E: 31 35 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 15PDCXp.\/._SB_P
   1A2AE: 43 49 30 52 50 31 35 50 44 43 58 70 01 5C 2F 04  // CI0RP15PDCXp.\/.
   1A2BE: 5F 53 42 5F 50 43 49 30 52 50 31 35 48 50 53 58  // _SB_PCI0RP15HPSX

                    If (LNot (\_SB.PCI0.RP15.PDSX))
                    {

   1A2CE: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A2DE: 31 35 50 44 53 58                                // 15PDSX

                        Store (Zero, \_SB.PCI0.RP15.L0SE)
                    }


   1A2E4: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A2F4: 35 4C 30 53 45                                   // 5L0SE

                    If (LOr (
   1A2F9: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A2FD: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A303: 91 92                                            // ..

LNotEqual (RPS0, 0x0F), 
   1A305: 93 52 50 53 30 0A 0F                             // .RPS0..


   1A30C: 92                                               // .


                        LNotEqual (RPS1, 0x0F))))
                    {

   1A30D: 93 52 50 53 31 0A 0F                             // .RPS1..

                        Notify (\_SB.PCI0.RP15, Zero) // Bus Check
                    }
                }

   1A314: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 35  // .\/._SB_PCI0RP15
   1A324: 00                                               // .

                Else
                {

   1A325: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP15.HPSX)
                }
            }


   1A327: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A337: 35 48 50 53 58                                   // 5HPSX

            If (LAnd (
   1A33C: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP16.VDID, 0xFFFFFFFF), \_SB.PCI0.RP16.HPSX))
            {

   1A341: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 36  // .\/._SB_PCI0RP16
   1A351: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A361: 50 43 49 30 52 50 31 36 48 50 53 58              // PCI0RP16HPSX

                If (LOr (
   1A36D: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A371: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A377: 91 92                                            // ..

LNotEqual (RPS0, 0x10), 
   1A379: 93 52 50 53 30 0A 10                             // .RPS0..


   1A380: 92                                               // .


                    LNotEqual (RPS1, 0x10))))
                {

   1A381: 93 52 50 53 31 0A 10                             // .RPS1..

                    Sleep (0x64)
                }


   1A388: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP16.PDCX)
                {
                    Store (One, \_SB.PCI0.RP16.PDCX)
                    Store (One, \_SB.PCI0.RP16.HPSX)

   1A38C: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A39C: 31 36 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 16PDCXp.\/._SB_P
   1A3AC: 43 49 30 52 50 31 36 50 44 43 58 70 01 5C 2F 04  // CI0RP16PDCXp.\/.
   1A3BC: 5F 53 42 5F 50 43 49 30 52 50 31 36 48 50 53 58  // _SB_PCI0RP16HPSX

                    If (LNot (\_SB.PCI0.RP16.PDSX))
                    {

   1A3CC: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A3DC: 31 36 50 44 53 58                                // 16PDSX

                        Store (Zero, \_SB.PCI0.RP16.L0SE)
                    }


   1A3E2: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A3F2: 36 4C 30 53 45                                   // 6L0SE

                    If (LOr (
   1A3F7: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A3FB: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A401: 91 92                                            // ..

LNotEqual (RPS0, 0x10), 
   1A403: 93 52 50 53 30 0A 10                             // .RPS0..


   1A40A: 92                                               // .


                        LNotEqual (RPS1, 0x10))))
                    {

   1A40B: 93 52 50 53 31 0A 10                             // .RPS1..

                        Notify (\_SB.PCI0.RP16, Zero) // Bus Check
                    }
                }

   1A412: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 36  // .\/._SB_PCI0RP16
   1A422: 00                                               // .

                Else
                {

   1A423: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP16.HPSX)
                }
            }


   1A425: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A435: 36 48 50 53 58                                   // 6HPSX

            If (LAnd (
   1A43A: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP17.VDID, 0xFFFFFFFF), \_SB.PCI0.RP17.HPSX))
            {

   1A43F: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 37  // .\/._SB_PCI0RP17
   1A44F: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A45F: 50 43 49 30 52 50 31 37 48 50 53 58              // PCI0RP17HPSX

                If (LOr (
   1A46B: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A46F: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A475: 91 92                                            // ..

LNotEqual (RPS0, 0x11), 
   1A477: 93 52 50 53 30 0A 11                             // .RPS0..


   1A47E: 92                                               // .


                    LNotEqual (RPS1, 0x11))))
                {

   1A47F: 93 52 50 53 31 0A 11                             // .RPS1..

                    Sleep (0x64)
                }


   1A486: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP17.PDCX)
                {
                    Store (One, \_SB.PCI0.RP17.PDCX)
                    Store (One, \_SB.PCI0.RP17.HPSX)

   1A48A: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A49A: 31 37 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 17PDCXp.\/._SB_P
   1A4AA: 43 49 30 52 50 31 37 50 44 43 58 70 01 5C 2F 04  // CI0RP17PDCXp.\/.
   1A4BA: 5F 53 42 5F 50 43 49 30 52 50 31 37 48 50 53 58  // _SB_PCI0RP17HPSX

                    If (LNot (\_SB.PCI0.RP17.PDSX))
                    {

   1A4CA: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A4DA: 31 37 50 44 53 58                                // 17PDSX

                        Store (Zero, \_SB.PCI0.RP17.L0SE)
                    }


   1A4E0: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A4F0: 37 4C 30 53 45                                   // 7L0SE

                    If (LOr (
   1A4F5: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A4F9: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A4FF: 91 92                                            // ..

LNotEqual (RPS0, 0x11), 
   1A501: 93 52 50 53 30 0A 11                             // .RPS0..


   1A508: 92                                               // .


                        LNotEqual (RPS1, 0x11))))
                    {

   1A509: 93 52 50 53 31 0A 11                             // .RPS1..

                        Notify (\_SB.PCI0.RP17, Zero) // Bus Check
                    }
                }

   1A510: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 37  // .\/._SB_PCI0RP17
   1A520: 00                                               // .

                Else
                {

   1A521: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP17.HPSX)
                }
            }


   1A523: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A533: 37 48 50 53 58                                   // 7HPSX

            If (LAnd (
   1A538: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP18.VDID, 0xFFFFFFFF), \_SB.PCI0.RP18.HPSX))
            {

   1A53D: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 38  // .\/._SB_PCI0RP18
   1A54D: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A55D: 50 43 49 30 52 50 31 38 48 50 53 58              // PCI0RP18HPSX

                If (LOr (
   1A569: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A56D: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A573: 91 92                                            // ..

LNotEqual (RPS0, 0x12), 
   1A575: 93 52 50 53 30 0A 12                             // .RPS0..


   1A57C: 92                                               // .


                    LNotEqual (RPS1, 0x12))))
                {

   1A57D: 93 52 50 53 31 0A 12                             // .RPS1..

                    Sleep (0x64)
                }


   1A584: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP18.PDCX)
                {
                    Store (One, \_SB.PCI0.RP18.PDCX)
                    Store (One, \_SB.PCI0.RP18.HPSX)

   1A588: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A598: 31 38 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 18PDCXp.\/._SB_P
   1A5A8: 43 49 30 52 50 31 38 50 44 43 58 70 01 5C 2F 04  // CI0RP18PDCXp.\/.
   1A5B8: 5F 53 42 5F 50 43 49 30 52 50 31 38 48 50 53 58  // _SB_PCI0RP18HPSX

                    If (LNot (\_SB.PCI0.RP18.PDSX))
                    {

   1A5C8: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A5D8: 31 38 50 44 53 58                                // 18PDSX

                        Store (Zero, \_SB.PCI0.RP18.L0SE)
                    }


   1A5DE: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A5EE: 38 4C 30 53 45                                   // 8L0SE

                    If (LOr (
   1A5F3: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A5F7: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A5FD: 91 92                                            // ..

LNotEqual (RPS0, 0x12), 
   1A5FF: 93 52 50 53 30 0A 12                             // .RPS0..


   1A606: 92                                               // .


                        LNotEqual (RPS1, 0x12))))
                    {

   1A607: 93 52 50 53 31 0A 12                             // .RPS1..

                        Notify (\_SB.PCI0.RP18, Zero) // Bus Check
                    }
                }

   1A60E: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 38  // .\/._SB_PCI0RP18
   1A61E: 00                                               // .

                Else
                {

   1A61F: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP18.HPSX)
                }
            }


   1A621: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A631: 38 48 50 53 58                                   // 8HPSX

            If (LAnd (
   1A636: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP19.VDID, 0xFFFFFFFF), \_SB.PCI0.RP19.HPSX))
            {

   1A63B: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31 39  // .\/._SB_PCI0RP19
   1A64B: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A65B: 50 43 49 30 52 50 31 39 48 50 53 58              // PCI0RP19HPSX

                If (LOr (
   1A667: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A66B: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A671: 91 92                                            // ..

LNotEqual (RPS0, 0x13), 
   1A673: 93 52 50 53 30 0A 13                             // .RPS0..


   1A67A: 92                                               // .


                    LNotEqual (RPS1, 0x13))))
                {

   1A67B: 93 52 50 53 31 0A 13                             // .RPS1..

                    Sleep (0x64)
                }


   1A682: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP19.PDCX)
                {
                    Store (One, \_SB.PCI0.RP19.PDCX)
                    Store (One, \_SB.PCI0.RP19.HPSX)

   1A686: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A696: 31 39 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 19PDCXp.\/._SB_P
   1A6A6: 43 49 30 52 50 31 39 50 44 43 58 70 01 5C 2F 04  // CI0RP19PDCXp.\/.
   1A6B6: 5F 53 42 5F 50 43 49 30 52 50 31 39 48 50 53 58  // _SB_PCI0RP19HPSX

                    If (LNot (\_SB.PCI0.RP19.PDSX))
                    {

   1A6C6: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A6D6: 31 39 50 44 53 58                                // 19PDSX

                        Store (Zero, \_SB.PCI0.RP19.L0SE)
                    }


   1A6DC: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A6EC: 39 4C 30 53 45                                   // 9L0SE

                    If (LOr (
   1A6F1: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A6F5: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A6FB: 91 92                                            // ..

LNotEqual (RPS0, 0x13), 
   1A6FD: 93 52 50 53 30 0A 13                             // .RPS0..


   1A704: 92                                               // .


                        LNotEqual (RPS1, 0x13))))
                    {

   1A705: 93 52 50 53 31 0A 13                             // .RPS1..

                        Notify (\_SB.PCI0.RP19, Zero) // Bus Check
                    }
                }

   1A70C: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 31 39  // .\/._SB_PCI0RP19
   1A71C: 00                                               // .

                Else
                {

   1A71D: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP19.HPSX)
                }
            }


   1A71F: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 31  // p.\/._SB_PCI0RP1
   1A72F: 39 48 50 53 58                                   // 9HPSX

            If (LAnd (
   1A734: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP20.VDID, 0xFFFFFFFF), \_SB.PCI0.RP20.HPSX))
            {

   1A739: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 30  // .\/._SB_PCI0RP20
   1A749: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A759: 50 43 49 30 52 50 32 30 48 50 53 58              // PCI0RP20HPSX

                If (LOr (
   1A765: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A769: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A76F: 91 92                                            // ..

LNotEqual (RPS0, 0x14), 
   1A771: 93 52 50 53 30 0A 14                             // .RPS0..


   1A778: 92                                               // .


                    LNotEqual (RPS1, 0x14))))
                {

   1A779: 93 52 50 53 31 0A 14                             // .RPS1..

                    Sleep (0x64)
                }


   1A780: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP20.PDCX)
                {
                    Store (One, \_SB.PCI0.RP20.PDCX)
                    Store (One, \_SB.PCI0.RP20.HPSX)

   1A784: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A794: 32 30 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 20PDCXp.\/._SB_P
   1A7A4: 43 49 30 52 50 32 30 50 44 43 58 70 01 5C 2F 04  // CI0RP20PDCXp.\/.
   1A7B4: 5F 53 42 5F 50 43 49 30 52 50 32 30 48 50 53 58  // _SB_PCI0RP20HPSX

                    If (LNot (\_SB.PCI0.RP20.PDSX))
                    {

   1A7C4: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A7D4: 32 30 50 44 53 58                                // 20PDSX

                        Store (Zero, \_SB.PCI0.RP20.L0SE)
                    }


   1A7DA: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1A7EA: 30 4C 30 53 45                                   // 0L0SE

                    If (LOr (
   1A7EF: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A7F3: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A7F9: 91 92                                            // ..

LNotEqual (RPS0, 0x14), 
   1A7FB: 93 52 50 53 30 0A 14                             // .RPS0..


   1A802: 92                                               // .


                        LNotEqual (RPS1, 0x14))))
                    {

   1A803: 93 52 50 53 31 0A 14                             // .RPS1..

                        Notify (\_SB.PCI0.RP20, Zero) // Bus Check
                    }
                }

   1A80A: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 32 30  // .\/._SB_PCI0RP20
   1A81A: 00                                               // .

                Else
                {

   1A81B: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP20.HPSX)
                }
            }


   1A81D: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1A82D: 30 48 50 53 58                                   // 0HPSX

            If (LAnd (
   1A832: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP21.VDID, 0xFFFFFFFF), \_SB.PCI0.RP21.HPSX))
            {

   1A837: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 31  // .\/._SB_PCI0RP21
   1A847: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A857: 50 43 49 30 52 50 32 31 48 50 53 58              // PCI0RP21HPSX

                If (LOr (
   1A863: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A867: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A86D: 91 92                                            // ..

LNotEqual (RPS0, 0x15), 
   1A86F: 93 52 50 53 30 0A 15                             // .RPS0..


   1A876: 92                                               // .


                    LNotEqual (RPS1, 0x15))))
                {

   1A877: 93 52 50 53 31 0A 15                             // .RPS1..

                    Sleep (0x64)
                }


   1A87E: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP21.PDCX)
                {
                    Store (One, \_SB.PCI0.RP21.PDCX)
                    Store (One, \_SB.PCI0.RP21.HPSX)

   1A882: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A892: 32 31 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 21PDCXp.\/._SB_P
   1A8A2: 43 49 30 52 50 32 31 50 44 43 58 70 01 5C 2F 04  // CI0RP21PDCXp.\/.
   1A8B2: 5F 53 42 5F 50 43 49 30 52 50 32 31 48 50 53 58  // _SB_PCI0RP21HPSX

                    If (LNot (\_SB.PCI0.RP21.PDSX))
                    {

   1A8C2: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A8D2: 32 31 50 44 53 58                                // 21PDSX

                        Store (Zero, \_SB.PCI0.RP21.L0SE)
                    }


   1A8D8: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1A8E8: 31 4C 30 53 45                                   // 1L0SE

                    If (LOr (
   1A8ED: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A8F1: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A8F7: 91 92                                            // ..

LNotEqual (RPS0, 0x15), 
   1A8F9: 93 52 50 53 30 0A 15                             // .RPS0..


   1A900: 92                                               // .


                        LNotEqual (RPS1, 0x15))))
                    {

   1A901: 93 52 50 53 31 0A 15                             // .RPS1..

                        Notify (\_SB.PCI0.RP21, Zero) // Bus Check
                    }
                }

   1A908: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 32 31  // .\/._SB_PCI0RP21
   1A918: 00                                               // .

                Else
                {

   1A919: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP21.HPSX)
                }
            }


   1A91B: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1A92B: 31 48 50 53 58                                   // 1HPSX

            If (LAnd (
   1A930: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP22.VDID, 0xFFFFFFFF), \_SB.PCI0.RP22.HPSX))
            {

   1A935: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 32  // .\/._SB_PCI0RP22
   1A945: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1A955: 50 43 49 30 52 50 32 32 48 50 53 58              // PCI0RP22HPSX

                If (LOr (
   1A961: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1A965: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A96B: 91 92                                            // ..

LNotEqual (RPS0, 0x16), 
   1A96D: 93 52 50 53 30 0A 16                             // .RPS0..


   1A974: 92                                               // .


                    LNotEqual (RPS1, 0x16))))
                {

   1A975: 93 52 50 53 31 0A 16                             // .RPS1..

                    Sleep (0x64)
                }


   1A97C: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP22.PDCX)
                {
                    Store (One, \_SB.PCI0.RP22.PDCX)
                    Store (One, \_SB.PCI0.RP22.HPSX)

   1A980: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1A990: 32 32 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 22PDCXp.\/._SB_P
   1A9A0: 43 49 30 52 50 32 32 50 44 43 58 70 01 5C 2F 04  // CI0RP22PDCXp.\/.
   1A9B0: 5F 53 42 5F 50 43 49 30 52 50 32 32 48 50 53 58  // _SB_PCI0RP22HPSX

                    If (LNot (\_SB.PCI0.RP22.PDSX))
                    {

   1A9C0: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1A9D0: 32 32 50 44 53 58                                // 22PDSX

                        Store (Zero, \_SB.PCI0.RP22.L0SE)
                    }


   1A9D6: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1A9E6: 32 4C 30 53 45                                   // 2L0SE

                    If (LOr (
   1A9EB: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1A9EF: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1A9F5: 91 92                                            // ..

LNotEqual (RPS0, 0x16), 
   1A9F7: 93 52 50 53 30 0A 16                             // .RPS0..


   1A9FE: 92                                               // .


                        LNotEqual (RPS1, 0x16))))
                    {

   1A9FF: 93 52 50 53 31 0A 16                             // .RPS1..

                        Notify (\_SB.PCI0.RP22, Zero) // Bus Check
                    }
                }

   1AA06: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 32 32  // .\/._SB_PCI0RP22
   1AA16: 00                                               // .

                Else
                {

   1AA17: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP22.HPSX)
                }
            }


   1AA19: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1AA29: 32 48 50 53 58                                   // 2HPSX

            If (LAnd (
   1AA2E: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP23.VDID, 0xFFFFFFFF), \_SB.PCI0.RP23.HPSX))
            {

   1AA33: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 33  // .\/._SB_PCI0RP23
   1AA43: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1AA53: 50 43 49 30 52 50 32 33 48 50 53 58              // PCI0RP23HPSX

                If (LOr (
   1AA5F: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1AA63: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1AA69: 91 92                                            // ..

LNotEqual (RPS0, 0x17), 
   1AA6B: 93 52 50 53 30 0A 17                             // .RPS0..


   1AA72: 92                                               // .


                    LNotEqual (RPS1, 0x17))))
                {

   1AA73: 93 52 50 53 31 0A 17                             // .RPS1..

                    Sleep (0x64)
                }


   1AA7A: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP23.PDCX)
                {
                    Store (One, \_SB.PCI0.RP23.PDCX)
                    Store (One, \_SB.PCI0.RP23.HPSX)

   1AA7E: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1AA8E: 32 33 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 23PDCXp.\/._SB_P
   1AA9E: 43 49 30 52 50 32 33 50 44 43 58 70 01 5C 2F 04  // CI0RP23PDCXp.\/.
   1AAAE: 5F 53 42 5F 50 43 49 30 52 50 32 33 48 50 53 58  // _SB_PCI0RP23HPSX

                    If (LNot (\_SB.PCI0.RP23.PDSX))
                    {

   1AABE: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1AACE: 32 33 50 44 53 58                                // 23PDSX

                        Store (Zero, \_SB.PCI0.RP23.L0SE)
                    }


   1AAD4: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1AAE4: 33 4C 30 53 45                                   // 3L0SE

                    If (LOr (
   1AAE9: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1AAED: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1AAF3: 91 92                                            // ..

LNotEqual (RPS0, 0x17), 
   1AAF5: 93 52 50 53 30 0A 17                             // .RPS0..


   1AAFC: 92                                               // .


                        LNotEqual (RPS1, 0x17))))
                    {

   1AAFD: 93 52 50 53 31 0A 17                             // .RPS1..

                        Notify (\_SB.PCI0.RP23, Zero) // Bus Check
                    }
                }

   1AB04: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 32 33  // .\/._SB_PCI0RP23
   1AB14: 00                                               // .

                Else
                {

   1AB15: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP23.HPSX)
                }
            }


   1AB17: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1AB27: 33 48 50 53 58                                   // 3HPSX

            If (LAnd (
   1AB2C: A0 4D 0F 90 92                                   // .M...

LNotEqual (\_SB.PCI0.RP24.VDID, 0xFFFFFFFF), \_SB.PCI0.RP24.HPSX))
            {

   1AB31: 93 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32 34  // .\/._SB_PCI0RP24
   1AB41: 56 44 49 44 0C FF FF FF FF 5C 2F 04 5F 53 42 5F  // VDID.....\/._SB_
   1AB51: 50 43 49 30 52 50 32 34 48 50 53 58              // PCI0RP24HPSX

                If (LOr (
   1AB5D: A0 1E 91 92                                      // ....

LNotEqual (TBTS, One), 
   1AB61: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1AB67: 91 92                                            // ..

LNotEqual (RPS0, 0x18), 
   1AB69: 93 52 50 53 30 0A 18                             // .RPS0..


   1AB70: 92                                               // .


                    LNotEqual (RPS1, 0x18))))
                {

   1AB71: 93 52 50 53 31 0A 18                             // .RPS1..

                    Sleep (0x64)
                }


   1AB78: 5B 22 0A 64                                      // [".d

                If (\_SB.PCI0.RP24.PDCX)
                {
                    Store (One, \_SB.PCI0.RP24.PDCX)
                    Store (One, \_SB.PCI0.RP24.HPSX)

   1AB7C: A0 46 09 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .F.\/._SB_PCI0RP
   1AB8C: 32 34 50 44 43 58 70 01 5C 2F 04 5F 53 42 5F 50  // 24PDCXp.\/._SB_P
   1AB9C: 43 49 30 52 50 32 34 50 44 43 58 70 01 5C 2F 04  // CI0RP24PDCXp.\/.
   1ABAC: 5F 53 42 5F 50 43 49 30 52 50 32 34 48 50 53 58  // _SB_PCI0RP24HPSX

                    If (LNot (\_SB.PCI0.RP24.PDSX))
                    {

   1ABBC: A0 2A 92 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50  // .*.\/._SB_PCI0RP
   1ABCC: 32 34 50 44 53 58                                // 24PDSX

                        Store (Zero, \_SB.PCI0.RP24.L0SE)
                    }


   1ABD2: 70 00 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1ABE2: 34 4C 30 53 45                                   // 4L0SE

                    If (LOr (
   1ABE7: A0 2B 91 92                                      // .+..

LNotEqual (TBTS, One), 
   1ABEB: 93 54 42 54 53 01                                // .TBTS.

LOr (
   1ABF1: 91 92                                            // ..

LNotEqual (RPS0, 0x18), 
   1ABF3: 93 52 50 53 30 0A 18                             // .RPS0..


   1ABFA: 92                                               // .


                        LNotEqual (RPS1, 0x18))))
                    {

   1ABFB: 93 52 50 53 31 0A 18                             // .RPS1..

                        Notify (\_SB.PCI0.RP24, Zero) // Bus Check
                    }
                }

   1AC02: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 52 50 32 34  // .\/._SB_PCI0RP24
   1AC12: 00                                               // .

                Else
                {

   1AC13: A1 16                                            // ..

                    Store (One, \_SB.PCI0.RP24.HPSX)
                }
            }


   1AC15: 70 01 5C 2F 04 5F 53 42 5F 50 43 49 30 52 50 32  // p.\/._SB_PCI0RP2
   1AC25: 34 48 50 53 58                                   // 4HPSX

            If (LEqual (TBTS, One))
            {

   1AC2A: A0 4A 10 93 54 42 54 53 01                       // .J..TBTS.

                If (CondRefOf (\_SB.PCI0.RP01.HPRP))
                {
                    \_SB.PCI0.RP01.HPRP ()
                }


   1AC33: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // .*[.\/._SB_PCI0R
   1AC43: 50 30 31 48 50 52 50 00 5C 2F 04 5F 53 42 5F 50  // P01HPRP.\/._SB_P
   1AC53: 43 49 30 52 50 30 31 48 50 52 50                 // CI0RP01HPRP

                If (CondRefOf (\_SB.PCI0.RP05.HPRP))
                {
                    \_SB.PCI0.RP05.HPRP ()
                }


   1AC5E: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // .*[.\/._SB_PCI0R
   1AC6E: 50 30 35 48 50 52 50 00 5C 2F 04 5F 53 42 5F 50  // P05HPRP.\/._SB_P
   1AC7E: 43 49 30 52 50 30 35 48 50 52 50                 // CI0RP05HPRP

                If (CondRefOf (\_SB.PCI0.RP09.HPRP))
                {
                    \_SB.PCI0.RP09.HPRP ()
                }


   1AC89: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // .*[.\/._SB_PCI0R
   1AC99: 50 30 39 48 50 52 50 00 5C 2F 04 5F 53 42 5F 50  // P09HPRP.\/._SB_P
   1ACA9: 43 49 30 52 50 30 39 48 50 52 50                 // CI0RP09HPRP

                If (CondRefOf (\_SB.PCI0.RP13.HPRP))
                {
                    \_SB.PCI0.RP13.HPRP ()
                }


   1ACB4: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // .*[.\/._SB_PCI0R
   1ACC4: 50 31 33 48 50 52 50 00 5C 2F 04 5F 53 42 5F 50  // P13HPRP.\/._SB_P
   1ACD4: 43 49 30 52 50 31 33 48 50 52 50                 // CI0RP13HPRP

                If (CondRefOf (\_SB.PCI0.RP17.HPRP))
                {
                    \_SB.PCI0.RP17.HPRP ()
                }


   1ACDF: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // .*[.\/._SB_PCI0R
   1ACEF: 50 31 37 48 50 52 50 00 5C 2F 04 5F 53 42 5F 50  // P17HPRP.\/._SB_P
   1ACFF: 43 49 30 52 50 31 37 48 50 52 50                 // CI0RP17HPRP

                If (CondRefOf (\_SB.PCI0.RP21.HPRP))
                {
                    \_SB.PCI0.RP21.HPRP ()
                }
            }
        }


   1AD0A: A0 2A 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30 52  // .*[.\/._SB_PCI0R
   1AD1A: 50 32 31 48 50 52 50 00 5C 2F 04 5F 53 42 5F 50  // P21HPRP.\/._SB_P
   1AD2A: 43 49 30 52 50 32 31 48 50 52 50                 // CI0RP21HPRP

        Method (_L62, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Store (Zero, GPEC) /* \GPEC */

   1AD35: 14 4D 0A 5F 4C 36 32 00 70 00 47 50 45 43        // .M._L62.p.GPEC

            If (CondRefOf (\_SB.DTSE))
            {

   1AD43: A0 45 04 5B 12 5C 2E 5F 53 42 5F 44 54 53 45 00  // .E.[.\._SB_DTSE.

                If (
   1AD53: A0 35 92                                         // .5.

LGreaterEqual (\_SB.DTSE, One))
                {

   1AD56: 95 5C 2E 5F 53 42 5F 44 54 53 45 01              // .\._SB_DTSE.

                    If (LEqual (\_SB.DTSI, One))
                    {
                        Notify (\_TZ.TZ00, 0x80) // Status Change

   1AD62: A0 26 93 5C 2E 5F 53 42 5F 44 54 53 49 01 86 5C  // .&.\._SB_DTSI..\
   1AD72: 2E 5F 54 5A 5F 54 5A 30 30 0A 80                 // ._TZ_TZ00..

                        Store (Zero, \_SB.DTSI) /* External reference */
                    }
                }
            }


   1AD7D: 70 00 5C 2E 5F 53 42 5F 44 54 53 49              // p.\._SB_DTSI

            If (LEqual (\_SB.HWPI, One))
            {

   1AD89: A0 2C 93 5C 2E 5F 53 42 5F 48 57 50 49 01        // .,.\._SB_HWPI.

                If (CondRefOf (\_GPE.HLVT))
                {
                    HLVT ()
                }


   1AD97: A0 12 5B 12 5C 2E 5F 47 50 45 48 4C 56 54 00 48  // ..[.\._GPEHLVT.H
   1ADA7: 4C 56 54                                         // LVT

                Store (Zero, \_SB.HWPI) /* External reference */
            }


   1ADAA: 70 00 5C 2E 5F 53 42 5F 48 57 50 49              // p.\._SB_HWPI

            If (LEqual (\_SB.ITBI, One))
            {

   1ADB6: A0 2C 93 5C 2E 5F 53 42 5F 49 54 42 49 01        // .,.\._SB_ITBI.

                If (CondRefOf (\_GPE.ITBH))
                {
                    ITBH ()
                }


   1ADC4: A0 12 5B 12 5C 2E 5F 47 50 45 49 54 42 48 00 49  // ..[.\._GPEITBH.I
   1ADD4: 54 42 48                                         // TBH

                Store (Zero, \_SB.ITBI) /* External reference */
            }
        }


   1ADD7: 70 00 5C 2E 5F 53 42 5F 49 54 42 49              // p.\._SB_ITBI

        Method (_L66, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {

   1ADE3: 14 34 5F 4C 36 36 00                             // .4_L66.

            If (LAnd (\_SB.PCI0.GFX0.GSSE, 
   1ADEA: A0 2D 90 5C 2F 04 5F 53 42 5F 50 43 49 30 47 46  // .-.\/._SB_PCI0GF
   1ADFA: 58 30 47 53 53 45                                // X0GSSE

LNot (GSMI)))
            {
                \_SB.PCI0.GFX0.GSCI ()
            }
        }


   1AE00: 92 47 53 4D 49 5C 2F 04 5F 53 42 5F 50 43 49 30  // .GSMI\/._SB_PCI0
   1AE10: 47 46 58 30 47 53 43 49                          // GFX0GSCI

        Name (PRES, One)

   1AE18: 08 50 52 45 53 01                                // .PRES.

        Method (_L6F, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {

   1AE1E: 14 43 07 5F 4C 36 46 00                          // .C._L6F.

            If (LEqual (RTD3, One))
            {

   1AE26: A0 1A 93 52 54 44 33 01                          // ...RTD3.

                If (CondRefOf (\_GPE.AL6F))
                {
                    AL6F ()
                }
            }


   1AE2E: A0 12 5B 12 5C 2E 5F 47 50 45 41 4C 36 46 00 41  // ..[.\._GPEAL6F.A
   1AE3E: 4C 36 46                                         // L6F

            If (LEqual (SGGP, One))
            {

   1AE41: A0 1A 93 53 47 47 50 01                          // ...SGGP.

                If (CondRefOf (\_GPE.P0L6))
                {
                    P0L6 ()
                }
            }


   1AE49: A0 12 5B 12 5C 2E 5F 47 50 45 50 30 4C 36 00 50  // ..[.\._GPEP0L6.P
   1AE59: 30 4C 36                                         // 0L6

            If (LEqual (P1GP, One))
            {

   1AE5C: A0 1A 93 50 31 47 50 01                          // ...P1GP.

                If (CondRefOf (\_GPE.P1L6))
                {
                    P1L6 ()
                }
            }


   1AE64: A0 12 5B 12 5C 2E 5F 47 50 45 50 31 4C 36 00 50  // ..[.\._GPEP1L6.P
   1AE74: 31 4C 36                                         // 1L6

            If (LEqual (P2GP, One))
            {

   1AE77: A0 1A 93 50 32 47 50 01                          // ...P2GP.

                If (CondRefOf (\_GPE.P2L6))
                {
                    P2L6 ()
                }
            }
        }


   1AE7F: A0 12 5B 12 5C 2E 5F 47 50 45 50 32 4C 36 00 50  // ..[.\._GPEP2L6.P
   1AE8F: 32 4C 36                                         // 2L6

        Method (_L38, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {

   1AE92: 14 37 5F 4C 33 38 00                             // .7_L38.

            If (LAnd (
   1AE99: A0 30 90 92                                      // .0..

LNotEqual (WLGP, Zero), 
   1AE9D: 93 57 4C 47 50 00                                // .WLGP.

LEqual (WLRP, 0x04)))
            {
                Notify (\_SB.PCI0.RP04, 0x02) // Device Wake
                \_SB.CAGS (WLGP)
            }
        }


   1AEA3: 93 57 4C 52 50 0A 04 86 5C 2F 03 5F 53 42 5F 50  // .WLRP...\/._SB_P
   1AEB3: 43 49 30 52 50 30 34 0A 02 5C 2E 5F 53 42 5F 43  // CI0RP04..\._SB_C
   1AEC3: 41 47 53 57 4C 47 50                             // AGSWLGP

        Method (_L72, 0, Serialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {

   1AECA: 14 33 5F 4C 37 32 08                             // .3_L72.

            If (CondRefOf (\_SB.AWAC))
            {
                Store (One, \_SB.AWAC.WAST)

   1AED1: A0 2C 5B 12 5C 2E 5F 53 42 5F 41 57 41 43 00 70  // .,[.\._SB_AWAC.p
   1AEE1: 01 5C 2F 03 5F 53 42 5F 41 57 41 43 57 41 53 54  // .\/._SB_AWACWAST

                Notify (\_SB.AWAC, 0x02) // Device Wake
            }
        }
    }


   1AEF1: 86 5C 2E 5F 53 42 5F 41 57 41 43 0A 02           // .\._SB_AWAC..

    If (CondRefOf (\_SB.PCI0.RP01.PXSX))
    {

   1AEFE: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1AF0E: 52 50 30 31 50 58 53 58 00                       // RP01PXSX.

        Scope (_SB.PCI0.RP01.PXSX)
        {

   1AF17: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1AF27: 31 50 58 53 58                                   // 1PXSX

            Name (_DSD, 
   1AF2C: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1AF31: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1AF34: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1AF44: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1AF48: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1AF4B: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1AF5B: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1AF60: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   32
            }


   1AF6A: 5B 81 0B 52 50 58 58 00 56 44 49 44 20           // [..RPXX.VDID 

            OperationRegion (FLDR, PCI_Config, 0x44, 0x06)

   1AF77: 5B 80 46 4C 44 52 02 0A 44 0A 06                 // [.FLDR..D..

            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }


   1AF82: 5B 81 10 46 4C 44 52 01 44 43 41 50 20 44 43 54  // [..FLDR.DCAP DCT
   1AF92: 52 10                                            // R.

            Method (WIST, 0, Serialized)
            {

   1AF94: 14 49 13 57 49 53 54 08                          // .I.WIST.


   1AF9C: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1AFA2: A0 47 12 5B 12 56 44 49 44 00                    // .G.[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1AFAC: A2 4D 11 01 70 99 56 44 49 44 00 5F 54 5F 30     // .M..p.VDID._T_0

                        Case (0x095A8086)
                        {

   1AFBB: A0 0D 93 5F 54 5F 30 0C 86 80 5A 09              // ..._T_0...Z.

                            Return (One)
                        }

   1AFC7: A4 01                                            // ..

                        Case
   1AFC9: A1 4F 0F                                         // .O.

 (0x095B8086)
                        {

   1AFCC: A0 0D 93 5F 54 5F 30 0C 86 80 5B 09              // ..._T_0...[.

                            Return (One)
                        }

   1AFD8: A4 01                                            // ..

                        Case
   1AFDA: A1 4E 0E                                         // .N.

 (0x31658086)
                        {

   1AFDD: A0 0D 93 5F 54 5F 30 0C 86 80 65 31              // ..._T_0...e1

                            Return (One)
                        }

   1AFE9: A4 01                                            // ..

                        Case
   1AFEB: A1 4D 0D                                         // .M.

 (0x31668086)
                        {

   1AFEE: A0 0D 93 5F 54 5F 30 0C 86 80 66 31              // ..._T_0...f1

                            Return (One)
                        }

   1AFFA: A4 01                                            // ..

                        Case
   1AFFC: A1 4C 0C                                         // .L.

 (0x08B18086)
                        {

   1AFFF: A0 0D 93 5F 54 5F 30 0C 86 80 B1 08              // ..._T_0.....

                            Return (One)
                        }

   1B00B: A4 01                                            // ..

                        Case
   1B00D: A1 4B 0B                                         // .K.

 (0x08B28086)
                        {

   1B010: A0 0D 93 5F 54 5F 30 0C 86 80 B2 08              // ..._T_0.....

                            Return (One)
                        }

   1B01C: A4 01                                            // ..

                        Case
   1B01E: A1 4A 0A                                         // .J.

 (0x08B38086)
                        {

   1B021: A0 0D 93 5F 54 5F 30 0C 86 80 B3 08              // ..._T_0.....

                            Return (One)
                        }

   1B02D: A4 01                                            // ..

                        Case
   1B02F: A1 49 09                                         // .I.

 (0x08B48086)
                        {

   1B032: A0 0D 93 5F 54 5F 30 0C 86 80 B4 08              // ..._T_0.....

                            Return (One)
                        }

   1B03E: A4 01                                            // ..

                        Case
   1B040: A1 48 08                                         // .H.

 (0x24F38086)
                        {

   1B043: A0 0D 93 5F 54 5F 30 0C 86 80 F3 24              // ..._T_0....$

                            Return (One)
                        }

   1B04F: A4 01                                            // ..

                        Case
   1B051: A1 47 07                                         // .G.

 (0x24F48086)
                        {

   1B054: A0 0D 93 5F 54 5F 30 0C 86 80 F4 24              // ..._T_0....$

                            Return (One)
                        }

   1B060: A4 01                                            // ..

                        Case
   1B062: A1 46 06                                         // .F.

 (0x24F58086)
                        {

   1B065: A0 0D 93 5F 54 5F 30 0C 86 80 F5 24              // ..._T_0....$

                            Return (One)
                        }

   1B071: A4 01                                            // ..

                        Case
   1B073: A1 45 05                                         // .E.

 (0x24F68086)
                        {

   1B076: A0 0D 93 5F 54 5F 30 0C 86 80 F6 24              // ..._T_0....$

                            Return (One)
                        }

   1B082: A4 01                                            // ..

                        Case
   1B084: A1 44 04                                         // .D.

 (0x24FD8086)
                        {

   1B087: A0 0D 93 5F 54 5F 30 0C 86 80 FD 24              // ..._T_0....$

                            Return (One)
                        }

   1B093: A4 01                                            // ..

                        Case
   1B095: A1 33                                            // .3

 (0x24FB8086)
                        {

   1B097: A0 0D 93 5F 54 5F 30 0C 86 80 FB 24              // ..._T_0....$

                            Return (One)
                        }

   1B0A3: A4 01                                            // ..

                        Case
   1B0A5: A1 23                                            // .#

 (0x25268086)
                        {

   1B0A7: A0 0D 93 5F 54 5F 30 0C 86 80 26 25              // ..._T_0...&%

                            Return (One)
                        }

   1B0B3: A4 01                                            // ..

                        Case
   1B0B5: A1 13                                            // ..

 (0x27238086)
                        {

   1B0B7: A0 0D 93 5F 54 5F 30 0C 86 80 23 27              // ..._T_0...#'

                            Return (One)
                        }

   1B0C3: A4 01                                            // ..

                        Default
                        {

   1B0C5: A1 03                                            // ..

                            Return (Zero)
                        }


   1B0C7: A4 00                                            // ..

                    }
                }

   1B0C9: A5                                               // .

                Else
                {

   1B0CA: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1B0CC: A4 00                                            // ..

            Method (WWST, 0, Serialized)
            {

   1B0CE: 14 4B 04 57 57 53 54 08                          // .K.WWST.


   1B0D6: 08 5F 54 5F 30 00                                // ._T_0.

                If (CondRefOf (VDID))
                {

   1B0DC: A0 39 5B 12 56 44 49 44 00                       // .9[.VDID.

                    Switch (ToInteger (VDID))
                    {

   1B0E5: A2 30 01 70 99 56 44 49 44 00 5F 54 5F 30        // .0.p.VDID._T_0

                        Case (0x73608086)
                        {

   1B0F3: A0 0D 93 5F 54 5F 30 0C 86 80 60 73              // ..._T_0...`s

                            Return (One)
                        }

   1B0FF: A4 01                                            // ..

                        Case
   1B101: A1 13                                            // ..

 (0x75608086)
                        {

   1B103: A0 0D 93 5F 54 5F 30 0C 86 80 60 75              // ..._T_0...`u

                            Return (One)
                        }

   1B10F: A4 01                                            // ..

                        Default
                        {

   1B111: A1 03                                            // ..

                            Return (Zero)
                        }


   1B113: A4 00                                            // ..

                    }
                }

   1B115: A5                                               // .

                Else
                {

   1B116: A1 03                                            // ..

                    Return (Zero)
                }
            }


   1B118: A4 00                                            // ..

            If (WIST ())
            {

   1B11A: A0 40 95 57 49 53 54                             // .@.WIST

                PowerResource (WRST, 0x05, 0x0000)
                {

   1B121: 5B 84 4D 08 57 52 53 54 05 00 00                 // [.M.WRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("Wifi PR _STA")

   1B12C: 14 1A 5F 53 54 41 00 41 44 42 47 0D 57 69 66 69  // .._STA.ADBG.Wifi
   1B13C: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1B145: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("Wifi PR _ON")
                    }


   1B147: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 57 69 66 69  // .._ON_.ADBG.Wifi
   1B157: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("Wifi PR _OFF")
                    }


   1B15F: 14 18 5F 4F 46 46 00 41 44 42 47 0D 57 69 66 69  // .._OFF.ADBG.Wifi
   1B16F: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("Wifi PR _RST")

   1B178: 14 37 5F 52 53 54 00 41 44 42 47 0D 57 69 66 69  // .7_RST.ADBG.Wifi
   1B188: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1B191: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1B1A1: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP01.PXSX.DCTR */
                        }
                    }
                }


   1B1AA: 70 60 44 43 54 52                                // p`DCTR

                Name (SPLX, 
   1B1B0: 08 53 50 4C 58                                   // .SPLX

Package (0x02)
                {
                    Zero, 

   1B1B5: 12 15 02 00                                      // ....

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1B1B9: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1B1C9: 00 80                                            // ..

                Method (SPLC, 0, Serialized)
                {
                    Store (DOM1, 
   1B1CB: 14 3C 53 50 4C 43 08 70 44 4F 4D 31              // .<SPLC.pDOM1

Index (DerefOf (
   1B1D7: 88 83                                            // ..

Index (SPLX, One)), Zero))
                    Store (LIM1, 
   1B1D9: 88 53 50 4C 58 01 00 00 00 70 4C 49 4D 31        // .SPLX....pLIM1

Index (DerefOf (
   1B1E7: 88 83                                            // ..

Index (SPLX, One)), One))
                    Store (TIM1, 
   1B1E9: 88 53 50 4C 58 01 00 01 00 70 54 49 4D 31        // .SPLX....pTIM1

Index (DerefOf (
   1B1F7: 88 83                                            // ..

Index (SPLX, One)), 0x02))

   1B1F9: 88 53 50 4C 58 01 00 0A 02 00                    // .SPLX.....

                    Return (SPLX) /* \_SB_.PCI0.RP01.PXSX.SPLX */
                }


   1B203: A4 53 50 4C 58                                   // .SPLX

                Name (WANX, 
   1B208: 08 57 41 4E 58                                   // .WANX

Package (0x03)
                {
                    Zero, 

   1B20D: 12 27 03 00                                      // .'..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }, 


   1B211: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1B221: 00 80                                            // ..

                    Package (0x03)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    }
                })

   1B223: 12 11 03 0C 00 00 00 80 0C 00 00 00 80 0C 00 00  // ................
   1B233: 00 80                                            // ..

                Method (WAND, 0, Serialized)
                {
                    Store (Zero, 
   1B235: 14 4B 06 57 41 4E 44 08 70 00                    // .K.WAND.p.

Index (DerefOf (
   1B23F: 88 83                                            // ..

Index (WANX, One)), Zero))
                    Store (TRD0, 
   1B241: 88 57 41 4E 58 01 00 00 00 70 54 52 44 30        // .WANX....pTRD0

Index (DerefOf (
   1B24F: 88 83                                            // ..

Index (WANX, One)), One))
                    Store (TRL0, 
   1B251: 88 57 41 4E 58 01 00 01 00 70 54 52 4C 30        // .WANX....pTRL0

Index (DerefOf (
   1B25F: 88 83                                            // ..

Index (WANX, One)), 0x02))
                    Store (One, 
   1B261: 88 57 41 4E 58 01 00 0A 02 00 70 01              // .WANX.....p.

Index (DerefOf (
   1B26D: 88 83                                            // ..

Index (WANX, 0x02)), Zero))
                    Store (TRD1, 
   1B26F: 88 57 41 4E 58 0A 02 00 00 00 70 54 52 44 31     // .WANX.....pTRD1

Index (DerefOf (
   1B27E: 88 83                                            // ..

Index (WANX, 0x02)), One))
                    Store (TRL1, 
   1B280: 88 57 41 4E 58 0A 02 00 01 00 70 54 52 4C 31     // .WANX.....pTRL1

Index (DerefOf (
   1B28F: 88 83                                            // ..

Index (WANX, 0x02)), 0x02))

   1B291: 88 57 41 4E 58 0A 02 00 0A 02 00                 // .WANX......

                    Return (WANX) /* \_SB_.PCI0.RP01.PXSX.WANX */
                }


   1B29C: A4 57 41 4E 58                                   // .WANX

                Name (WRDX, 
   1B2A1: 08 57 52 44 58                                   // .WRDX

Package (0x02)
                {
                    Zero, 

   1B2A6: 12 0E 02 00                                      // ....

                    Package (0x02)
                    {
                        0x80000000, 
                        0x8000
                    }
                })

   1B2AA: 12 0A 02 0C 00 00 00 80 0B 00 80                 // ...........

                Method (WRDD, 0, Serialized)
                {
                    Store (WDM1, 
   1B2B5: 14 2B 57 52 44 44 08 70 57 44 4D 31              // .+WRDD.pWDM1

Index (DerefOf (
   1B2C1: 88 83                                            // ..

Index (WRDX, One)), Zero))
                    Store (CID1, 
   1B2C3: 88 57 52 44 58 01 00 00 00 70 43 49 44 31        // .WRDX....pCID1

Index (DerefOf (
   1B2D1: 88 83                                            // ..

Index (WRDX, One)), One))

   1B2D3: 88 57 52 44 58 01 00 01 00                       // .WRDX....

                    Return (WRDX) /* \_SB_.PCI0.RP01.PXSX.WRDX */
                }


   1B2DC: A4 57 52 44 58                                   // .WRDX

                Name (WRDY, 
   1B2E1: 08 57 52 44 59                                   // .WRDY

Package (0x02)
                {
                    Zero, 

   1B2E6: 12 1E 02 00                                      // ....

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

   1B2EA: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1B2FA: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (WRDS, 0, Serialized)
                {
                    Store (STXE, 
   1B305: 14 46 0C 57 52 44 53 08 70 53 54 58 45           // .F.WRDS.pSTXE

Index (DerefOf (
   1B312: 88 83                                            // ..

Index (WRDY, One)), One))
                    Store (ST10, 
   1B314: 88 57 52 44 59 01 00 01 00 70 53 54 31 30        // .WRDY....pST10

Index (DerefOf (
   1B322: 88 83                                            // ..

Index (WRDY, One)), 0x02))
                    Store (ST11, 
   1B324: 88 57 52 44 59 01 00 0A 02 00 70 53 54 31 31     // .WRDY.....pST11

Index (DerefOf (
   1B333: 88 83                                            // ..

Index (WRDY, One)), 0x03))
                    Store (ST12, 
   1B335: 88 57 52 44 59 01 00 0A 03 00 70 53 54 31 32     // .WRDY.....pST12

Index (DerefOf (
   1B344: 88 83                                            // ..

Index (WRDY, One)), 0x04))
                    Store (ST13, 
   1B346: 88 57 52 44 59 01 00 0A 04 00 70 53 54 31 33     // .WRDY.....pST13

Index (DerefOf (
   1B355: 88 83                                            // ..

Index (WRDY, One)), 0x05))
                    Store (ST14, 
   1B357: 88 57 52 44 59 01 00 0A 05 00 70 53 54 31 34     // .WRDY.....pST14

Index (DerefOf (
   1B366: 88 83                                            // ..

Index (WRDY, One)), 0x06))
                    Store (ST15, 
   1B368: 88 57 52 44 59 01 00 0A 06 00 70 53 54 31 35     // .WRDY.....pST15

Index (DerefOf (
   1B377: 88 83                                            // ..

Index (WRDY, One)), 0x07))
                    Store (ST16, 
   1B379: 88 57 52 44 59 01 00 0A 07 00 70 53 54 31 36     // .WRDY.....pST16

Index (DerefOf (
   1B388: 88 83                                            // ..

Index (WRDY, One)), 0x08))
                    Store (ST17, 
   1B38A: 88 57 52 44 59 01 00 0A 08 00 70 53 54 31 37     // .WRDY.....pST17

Index (DerefOf (
   1B399: 88 83                                            // ..

Index (WRDY, One)), 0x09))
                    Store (ST18, 
   1B39B: 88 57 52 44 59 01 00 0A 09 00 70 53 54 31 38     // .WRDY.....pST18

Index (DerefOf (
   1B3AA: 88 83                                            // ..

Index (WRDY, One)), 0x0A))
                    Store (ST19, 
   1B3AC: 88 57 52 44 59 01 00 0A 0A 00 70 53 54 31 39     // .WRDY.....pST19

Index (DerefOf (
   1B3BB: 88 83                                            // ..

Index (WRDY, One)), 0x0B))

   1B3BD: 88 57 52 44 59 01 00 0A 0B 00                    // .WRDY.....

                    Return (WRDY) /* \_SB_.PCI0.RP01.PXSX.WRDY */
                }


   1B3C7: A4 57 52 44 59                                   // .WRDY

                Name (EWRY, 
   1B3CC: 08 45 57 52 59                                   // .EWRY

Package (0x02)
                {
                    Zero, 

   1B3D1: 12 4A 04 02 00                                   // .J...

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

   1B3D6: 12 45 04 21 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80  // .E.!............
   1B3E6: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1B3F6: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1B406: 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80  // ................
   1B416: 0A 80 0A 80 0A 80                                // ......

                Method (EWRD, 0, Serialized)
                {
                    Store (STDE, 
   1B41C: 14 4B 22 45 57 52 44 08 70 53 54 44 45           // .K"EWRD.pSTDE

Index (DerefOf (
   1B429: 88 83                                            // ..

Index (EWRY, One)), One))
                    Store (STRS, 
   1B42B: 88 45 57 52 59 01 00 01 00 70 53 54 52 53        // .EWRY....pSTRS

Index (DerefOf (
   1B439: 88 83                                            // ..

Index (EWRY, One)), 0x02))
                    Store (ST20, 
   1B43B: 88 45 57 52 59 01 00 0A 02 00 70 53 54 32 30     // .EWRY.....pST20

Index (DerefOf (
   1B44A: 88 83                                            // ..

Index (EWRY, One)), 0x03))
                    Store (ST21, 
   1B44C: 88 45 57 52 59 01 00 0A 03 00 70 53 54 32 31     // .EWRY.....pST21

Index (DerefOf (
   1B45B: 88 83                                            // ..

Index (EWRY, One)), 0x04))
                    Store (ST22, 
   1B45D: 88 45 57 52 59 01 00 0A 04 00 70 53 54 32 32     // .EWRY.....pST22

Index (DerefOf (
   1B46C: 88 83                                            // ..

Index (EWRY, One)), 0x05))
                    Store (ST23, 
   1B46E: 88 45 57 52 59 01 00 0A 05 00 70 53 54 32 33     // .EWRY.....pST23

Index (DerefOf (
   1B47D: 88 83                                            // ..

Index (EWRY, One)), 0x06))
                    Store (ST24, 
   1B47F: 88 45 57 52 59 01 00 0A 06 00 70 53 54 32 34     // .EWRY.....pST24

Index (DerefOf (
   1B48E: 88 83                                            // ..

Index (EWRY, One)), 0x07))
                    Store (ST25, 
   1B490: 88 45 57 52 59 01 00 0A 07 00 70 53 54 32 35     // .EWRY.....pST25

Index (DerefOf (
   1B49F: 88 83                                            // ..

Index (EWRY, One)), 0x08))
                    Store (ST26, 
   1B4A1: 88 45 57 52 59 01 00 0A 08 00 70 53 54 32 36     // .EWRY.....pST26

Index (DerefOf (
   1B4B0: 88 83                                            // ..

Index (EWRY, One)), 0x09))
                    Store (ST27, 
   1B4B2: 88 45 57 52 59 01 00 0A 09 00 70 53 54 32 37     // .EWRY.....pST27

Index (DerefOf (
   1B4C1: 88 83                                            // ..

Index (EWRY, One)), 0x0A))
                    Store (ST28, 
   1B4C3: 88 45 57 52 59 01 00 0A 0A 00 70 53 54 32 38     // .EWRY.....pST28

Index (DerefOf (
   1B4D2: 88 83                                            // ..

Index (EWRY, One)), 0x0B))
                    Store (ST29, 
   1B4D4: 88 45 57 52 59 01 00 0A 0B 00 70 53 54 32 39     // .EWRY.....pST29

Index (DerefOf (
   1B4E3: 88 83                                            // ..

Index (EWRY, One)), 0x0C))
                    Store (ST30, 
   1B4E5: 88 45 57 52 59 01 00 0A 0C 00 70 53 54 33 30     // .EWRY.....pST30

Index (DerefOf (
   1B4F4: 88 83                                            // ..

Index (EWRY, One)), 0x0D))
                    Store (ST31, 
   1B4F6: 88 45 57 52 59 01 00 0A 0D 00 70 53 54 33 31     // .EWRY.....pST31

Index (DerefOf (
   1B505: 88 83                                            // ..

Index (EWRY, One)), 0x0E))
                    Store (ST32, 
   1B507: 88 45 57 52 59 01 00 0A 0E 00 70 53 54 33 32     // .EWRY.....pST32

Index (DerefOf (
   1B516: 88 83                                            // ..

Index (EWRY, One)), 0x0F))
                    Store (ST33, 
   1B518: 88 45 57 52 59 01 00 0A 0F 00 70 53 54 33 33     // .EWRY.....pST33

Index (DerefOf (
   1B527: 88 83                                            // ..

Index (EWRY, One)), 0x10))
                    Store (ST34, 
   1B529: 88 45 57 52 59 01 00 0A 10 00 70 53 54 33 34     // .EWRY.....pST34

Index (DerefOf (
   1B538: 88 83                                            // ..

Index (EWRY, One)), 0x11))
                    Store (ST35, 
   1B53A: 88 45 57 52 59 01 00 0A 11 00 70 53 54 33 35     // .EWRY.....pST35

Index (DerefOf (
   1B549: 88 83                                            // ..

Index (EWRY, One)), 0x12))
                    Store (ST36, 
   1B54B: 88 45 57 52 59 01 00 0A 12 00 70 53 54 33 36     // .EWRY.....pST36

Index (DerefOf (
   1B55A: 88 83                                            // ..

Index (EWRY, One)), 0x13))
                    Store (ST37, 
   1B55C: 88 45 57 52 59 01 00 0A 13 00 70 53 54 33 37     // .EWRY.....pST37

Index (DerefOf (
   1B56B: 88 83                                            // ..

Index (EWRY, One)), 0x14))
                    Store (ST38, 
   1B56D: 88 45 57 52 59 01 00 0A 14 00 70 53 54 33 38     // .EWRY.....pST38

Index (DerefOf (
   1B57C: 88 83                                            // ..

Index (EWRY, One)), 0x15))
                    Store (ST39, 
   1B57E: 88 45 57 52 59 01 00 0A 15 00 70 53 54 33 39     // .EWRY.....pST39

Index (DerefOf (
   1B58D: 88 83                                            // ..

Index (EWRY, One)), 0x16))
                    Store (ST40, 
   1B58F: 88 45 57 52 59 01 00 0A 16 00 70 53 54 34 30     // .EWRY.....pST40

Index (DerefOf (
   1B59E: 88 83                                            // ..

Index (EWRY, One)), 0x17))
                    Store (ST41, 
   1B5A0: 88 45 57 52 59 01 00 0A 17 00 70 53 54 34 31     // .EWRY.....pST41

Index (DerefOf (
   1B5AF: 88 83                                            // ..

Index (EWRY, One)), 0x18))
                    Store (ST42, 
   1B5B1: 88 45 57 52 59 01 00 0A 18 00 70 53 54 34 32     // .EWRY.....pST42

Index (DerefOf (
   1B5C0: 88 83                                            // ..

Index (EWRY, One)), 0x19))
                    Store (ST43, 
   1B5C2: 88 45 57 52 59 01 00 0A 19 00 70 53 54 34 33     // .EWRY.....pST43

Index (DerefOf (
   1B5D1: 88 83                                            // ..

Index (EWRY, One)), 0x1A))
                    Store (ST44, 
   1B5D3: 88 45 57 52 59 01 00 0A 1A 00 70 53 54 34 34     // .EWRY.....pST44

Index (DerefOf (
   1B5E2: 88 83                                            // ..

Index (EWRY, One)), 0x1B))
                    Store (ST45, 
   1B5E4: 88 45 57 52 59 01 00 0A 1B 00 70 53 54 34 35     // .EWRY.....pST45

Index (DerefOf (
   1B5F3: 88 83                                            // ..

Index (EWRY, One)), 0x1C))
                    Store (ST46, 
   1B5F5: 88 45 57 52 59 01 00 0A 1C 00 70 53 54 34 36     // .EWRY.....pST46

Index (DerefOf (
   1B604: 88 83                                            // ..

Index (EWRY, One)), 0x1D))
                    Store (ST47, 
   1B606: 88 45 57 52 59 01 00 0A 1D 00 70 53 54 34 37     // .EWRY.....pST47

Index (DerefOf (
   1B615: 88 83                                            // ..

Index (EWRY, One)), 0x1E))
                    Store (ST48, 
   1B617: 88 45 57 52 59 01 00 0A 1E 00 70 53 54 34 38     // .EWRY.....pST48

Index (DerefOf (
   1B626: 88 83                                            // ..

Index (EWRY, One)), 0x1F))
                    Store (ST49, 
   1B628: 88 45 57 52 59 01 00 0A 1F 00 70 53 54 34 39     // .EWRY.....pST49

Index (DerefOf (
   1B637: 88 83                                            // ..

Index (EWRY, One)), 0x20))

   1B639: 88 45 57 52 59 01 00 0A 20 00                    // .EWRY... .

                    Return (EWRY) /* \_SB_.PCI0.RP01.PXSX.EWRY */
                }


   1B643: A4 45 57 52 59                                   // .EWRY

                Name (WGDY, 
   1B648: 08 57 47 44 59                                   // .WGDY

Package (0x02)
                {
                    Zero, 

   1B64D: 12 2C 02 00                                      // .,..

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

   1B651: 12 28 13 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // .(..............
   1B661: 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1B671: 80 0A 80 0A 80 0A 80 0A 80                       // .........

                Method (WGDS, 0, Serialized)
                {
                    Store (SD11, 
   1B67A: 14 4D 13 57 47 44 53 08 70 53 44 31 31           // .M.WGDS.pSD11

Index (DerefOf (
   1B687: 88 83                                            // ..

Index (WGDY, One)), One))
                    Store (SD12, 
   1B689: 88 57 47 44 59 01 00 01 00 70 53 44 31 32        // .WGDY....pSD12

Index (DerefOf (
   1B697: 88 83                                            // ..

Index (WGDY, One)), 0x02))
                    Store (SD13, 
   1B699: 88 57 47 44 59 01 00 0A 02 00 70 53 44 31 33     // .WGDY.....pSD13

Index (DerefOf (
   1B6A8: 88 83                                            // ..

Index (WGDY, One)), 0x03))
                    Store (SD14, 
   1B6AA: 88 57 47 44 59 01 00 0A 03 00 70 53 44 31 34     // .WGDY.....pSD14

Index (DerefOf (
   1B6B9: 88 83                                            // ..

Index (WGDY, One)), 0x04))
                    Store (SD15, 
   1B6BB: 88 57 47 44 59 01 00 0A 04 00 70 53 44 31 35     // .WGDY.....pSD15

Index (DerefOf (
   1B6CA: 88 83                                            // ..

Index (WGDY, One)), 0x05))
                    Store (SD16, 
   1B6CC: 88 57 47 44 59 01 00 0A 05 00 70 53 44 31 36     // .WGDY.....pSD16

Index (DerefOf (
   1B6DB: 88 83                                            // ..

Index (WGDY, One)), 0x06))
                    Store (SD21, 
   1B6DD: 88 57 47 44 59 01 00 0A 06 00 70 53 44 32 31     // .WGDY.....pSD21

Index (DerefOf (
   1B6EC: 88 83                                            // ..

Index (WGDY, One)), 0x07))
                    Store (SD22, 
   1B6EE: 88 57 47 44 59 01 00 0A 07 00 70 53 44 32 32     // .WGDY.....pSD22

Index (DerefOf (
   1B6FD: 88 83                                            // ..

Index (WGDY, One)), 0x08))
                    Store (SD23, 
   1B6FF: 88 57 47 44 59 01 00 0A 08 00 70 53 44 32 33     // .WGDY.....pSD23

Index (DerefOf (
   1B70E: 88 83                                            // ..

Index (WGDY, One)), 0x09))
                    Store (SD24, 
   1B710: 88 57 47 44 59 01 00 0A 09 00 70 53 44 32 34     // .WGDY.....pSD24

Index (DerefOf (
   1B71F: 88 83                                            // ..

Index (WGDY, One)), 0x0A))
                    Store (SD25, 
   1B721: 88 57 47 44 59 01 00 0A 0A 00 70 53 44 32 35     // .WGDY.....pSD25

Index (DerefOf (
   1B730: 88 83                                            // ..

Index (WGDY, One)), 0x0B))
                    Store (SD26, 
   1B732: 88 57 47 44 59 01 00 0A 0B 00 70 53 44 32 36     // .WGDY.....pSD26

Index (DerefOf (
   1B741: 88 83                                            // ..

Index (WGDY, One)), 0x0C))
                    Store (SD31, 
   1B743: 88 57 47 44 59 01 00 0A 0C 00 70 53 44 33 31     // .WGDY.....pSD31

Index (DerefOf (
   1B752: 88 83                                            // ..

Index (WGDY, One)), 0x0D))
                    Store (SD32, 
   1B754: 88 57 47 44 59 01 00 0A 0D 00 70 53 44 33 32     // .WGDY.....pSD32

Index (DerefOf (
   1B763: 88 83                                            // ..

Index (WGDY, One)), 0x0E))
                    Store (SD33, 
   1B765: 88 57 47 44 59 01 00 0A 0E 00 70 53 44 33 33     // .WGDY.....pSD33

Index (DerefOf (
   1B774: 88 83                                            // ..

Index (WGDY, One)), 0x0F))
                    Store (SD34, 
   1B776: 88 57 47 44 59 01 00 0A 0F 00 70 53 44 33 34     // .WGDY.....pSD34

Index (DerefOf (
   1B785: 88 83                                            // ..

Index (WGDY, One)), 0x10))
                    Store (SD35, 
   1B787: 88 57 47 44 59 01 00 0A 10 00 70 53 44 33 35     // .WGDY.....pSD35

Index (DerefOf (
   1B796: 88 83                                            // ..

Index (WGDY, One)), 0x11))
                    Store (SD36, 
   1B798: 88 57 47 44 59 01 00 0A 11 00 70 53 44 33 36     // .WGDY.....pSD36

Index (DerefOf (
   1B7A7: 88 83                                            // ..

Index (WGDY, One)), 0x12))

   1B7A9: 88 57 47 44 59 01 00 0A 12 00                    // .WGDY.....

                    Return (WGDY) /* \_SB_.PCI0.RP01.PXSX.WGDY */
                }


   1B7B3: A4 57 47 44 59                                   // .WGDY

                Name (PPAY, 
   1B7B8: 08 50 50 41 59                                   // .PPAY

Package (0x02)
                {
                    Zero, 

   1B7BD: 12 1E 02 00                                      // ....

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

   1B7C1: 12 1A 0C 0A 07 0A 80 0A 80 0A 80 0A 80 0A 80 0A  // ................
   1B7D1: 80 0A 80 0A 80 0A 80 0A 80 0A 80                 // ...........

                Method (PPAG, 0, Serialized)
                {
                    Store (WAGE, 
   1B7DC: 14 46 0C 50 50 41 47 08 70 57 41 47 45           // .F.PPAG.pWAGE

Index (DerefOf (
   1B7E9: 88 83                                            // ..

Index (PPAY, One)), One))
                    Store (AGA1, 
   1B7EB: 88 50 50 41 59 01 00 01 00 70 41 47 41 31        // .PPAY....pAGA1

Index (DerefOf (
   1B7F9: 88 83                                            // ..

Index (PPAY, One)), 0x02))
                    Store (AGA2, 
   1B7FB: 88 50 50 41 59 01 00 0A 02 00 70 41 47 41 32     // .PPAY.....pAGA2

Index (DerefOf (
   1B80A: 88 83                                            // ..

Index (PPAY, One)), 0x03))
                    Store (AGA3, 
   1B80C: 88 50 50 41 59 01 00 0A 03 00 70 41 47 41 33     // .PPAY.....pAGA3

Index (DerefOf (
   1B81B: 88 83                                            // ..

Index (PPAY, One)), 0x04))
                    Store (AGA4, 
   1B81D: 88 50 50 41 59 01 00 0A 04 00 70 41 47 41 34     // .PPAY.....pAGA4

Index (DerefOf (
   1B82C: 88 83                                            // ..

Index (PPAY, One)), 0x05))
                    Store (AGA5, 
   1B82E: 88 50 50 41 59 01 00 0A 05 00 70 41 47 41 35     // .PPAY.....pAGA5

Index (DerefOf (
   1B83D: 88 83                                            // ..

Index (PPAY, One)), 0x06))
                    Store (AGB1, 
   1B83F: 88 50 50 41 59 01 00 0A 06 00 70 41 47 42 31     // .PPAY.....pAGB1

Index (DerefOf (
   1B84E: 88 83                                            // ..

Index (PPAY, One)), 0x07))
                    Store (AGB2, 
   1B850: 88 50 50 41 59 01 00 0A 07 00 70 41 47 42 32     // .PPAY.....pAGB2

Index (DerefOf (
   1B85F: 88 83                                            // ..

Index (PPAY, One)), 0x08))
                    Store (AGB3, 
   1B861: 88 50 50 41 59 01 00 0A 08 00 70 41 47 42 33     // .PPAY.....pAGB3

Index (DerefOf (
   1B870: 88 83                                            // ..

Index (PPAY, One)), 0x09))
                    Store (AGB4, 
   1B872: 88 50 50 41 59 01 00 0A 09 00 70 41 47 42 34     // .PPAY.....pAGB4

Index (DerefOf (
   1B881: 88 83                                            // ..

Index (PPAY, One)), 0x0A))
                    Store (AGB5, 
   1B883: 88 50 50 41 59 01 00 0A 0A 00 70 41 47 42 35     // .PPAY.....pAGB5

Index (DerefOf (
   1B892: 88 83                                            // ..

Index (PPAY, One)), 0x0B))

   1B894: 88 50 50 41 59 01 00 0A 0B 00                    // .PPAY.....

                    Return (PPAY) /* \_SB_.PCI0.RP01.PXSX.PPAY */
                }


   1B89E: A4 50 50 41 59                                   // .PPAY

                Name (ECKY, 
   1B8A3: 08 45 43 4B 59                                   // .ECKY

Package (0x02)
                {
                    Zero, 

   1B8A8: 12 09 02 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        Zero
                    }
                })

   1B8AC: 12 05 02 0A 07 00                                // ......

                Method (ECKV, 0, Serialized)
                {
                    Store (CECV, 
   1B8B2: 14 1B 45 43 4B 56 08 70 43 45 43 56              // ..ECKV.pCECV

Index (DerefOf (
   1B8BE: 88 83                                            // ..

Index (ECKY, One)), One))

   1B8C0: 88 45 43 4B 59 01 00 01 00                       // .ECKY....

                    Return (ECKY) /* \_SB_.PCI0.RP01.PXSX.ECKY */
                }


   1B8C9: A4 45 43 4B 59                                   // .ECKY

                Name (SADX, 
   1B8CE: 08 53 41 44 58                                   // .SADX

Package (0x03)
                {
                    Zero, 

   1B8D3: 12 17 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 
                        0x80000000
                    }, 


   1B8D7: 12 09 02 0A 07 0C 00 00 00 80                    // ..........

                    Package (0x02)
                    {
                        0x12, 
                        0x80000000
                    }
                })

   1B8E1: 12 09 02 0A 12 0C 00 00 00 80                    // ..........

                Method (SADS, 0, Serialized)
                {
                    Store (ATDV, 
   1B8EB: 14 2C 53 41 44 53 08 70 41 54 44 56              // .,SADS.pATDV

Index (DerefOf (
   1B8F7: 88 83                                            // ..

Index (SADX, One)), One))
                    Store (ATDV, 
   1B8F9: 88 53 41 44 58 01 00 01 00 70 41 54 44 56        // .SADX....pATDV

Index (DerefOf (
   1B907: 88 83                                            // ..

Index (SADX, 0x02)), One))

   1B909: 88 53 41 44 58 0A 02 00 01 00                    // .SADX.....

                    Return (SADX) /* \_SB_.PCI0.RP01.PXSX.SADX */
                }


   1B913: A4 53 41 44 58                                   // .SADX

                Name (GPCX, 
   1B918: 08 47 50 43 58                                   // .GPCX

Package (0x03)
                {
                    Zero, 

   1B91D: 12 19 03 00                                      // ....

                    Package (0x02)
                    {
                        0x07, 

   1B921: 12 0A 02 0A 07                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 


   1B926: 12 05 03 00 00 00                                // ......

                    Package (0x02)
                    {
                        0x12, 

   1B92C: 12 0A 02 0A 12                                   // .....

                        Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                })

   1B931: 12 05 03 00 00 00                                // ......

                Method (GPC, 0, Serialized)
                {

   1B937: 14 0B 47 50 43 5F 08                             // ..GPC_.

                    Return (GPCX) /* \_SB_.PCI0.RP01.PXSX.GPCX */
                }


   1B93E: A4 47 50 43 58                                   // .GPCX

                PowerResource (DRST, 0x05, 0x0000)
                {

   1B943: 5B 84 4D 08 44 52 53 54 05 00 00                 // [.M.DRST...

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ADBG ("PXSX PR _STA")

   1B94E: 14 1A 5F 53 54 41 00 41 44 42 47 0D 50 58 53 58  // .._STA.ADBG.PXSX
   1B95E: 20 50 52 20 5F 53 54 41 00                       //  PR _STA.

                        Return (One)
                    }


   1B967: A4 01                                            // ..

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        ADBG ("PXSX PR _ON")
                    }


   1B969: 14 17 5F 4F 4E 5F 00 41 44 42 47 0D 50 58 53 58  // .._ON_.ADBG.PXSX
   1B979: 20 50 52 20 5F 4F 4E 00                          //  PR _ON.

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        ADBG ("PXSX PR _OFF")
                    }


   1B981: 14 18 5F 4F 46 46 00 41 44 42 47 0D 50 58 53 58  // .._OFF.ADBG.PXSX
   1B991: 20 50 52 20 5F 4F 46 46 00                       //  PR _OFF.

                    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                    {
                        ADBG ("PXSX PR _RST")

   1B99A: 14 37 5F 52 53 54 00 41 44 42 47 0D 50 58 53 58  // .7_RST.ADBG.PXSX
   1B9AA: 20 50 52 20 5F 52 53 54 00                       //  PR _RST.

                        If (And (DCAP, 0x10000000))
                        {
                            Store (DCTR, Local0)
                            Or (Local0, 0x8000, Local0)

   1B9B3: A0 1E 7B 44 43 41 50 0C 00 00 00 10 00 70 44 43  // ..{DCAP......pDC
   1B9C3: 54 52 60 7D 60 0B 00 80 60                       // TR`}`...`

                            Store (Local0, DCTR) /* \_SB_.PCI0.RP01.PXSX.DCTR */
                        }
                    }
                }


   1B9CC: 70 60 44 43 54 52                                // p`DCTR

                Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                {

   1B9D2: 14 25 5F 50 52 52 00                             // .%_PRR.

                    If (WIST ())
                    {

   1B9D9: A0 16 57 49 53 54                                // ..WIST

                        If (CondRefOf (WRST))
                        {

   1B9DF: A0 10 5B 12 57 52 53 54 00                       // ..[.WRST.

                            Return (
   1B9E8: A4                                               // .

Package (0x01)
                            {
                                WRST, 
                            })
                        }
                    }


   1B9E9: 12 06 01 57 52 53 54                             // ...WRST

                    Return (
   1B9F0: A4                                               // .

Package (0x01)
                    {
                        DRST, 
                    })
                }


   1B9F1: 12 06 01 44 52 53 54                             // ...DRST

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {

   1B9F8: 14 42 07 5F 44 53 4D 0C                          // .B._DSM.


   1BA00: 08 5F 54 5F 31 00                                // ._T_1.


   1BA06: 08 5F 54 5F 30 00                                // ._T_0.

                    If (LEqual (Arg0, 
   1BA0C: A0 47 05 93 68                                   // .G..h

ToUUID ("079ff457-64a8-44be-bd8a-6955052b9b92") /* Unknown UUID */))
                    {

   1BA11: 11 13 0A 10 57 F4 9F 07 A8 64 BE 44 BD 8A 69 55  // ....W....d.D..iU
   1BA21: 05 2B 9B 92                                      // .+..

                        Switch (ToInteger (Arg2))
                        {

   1BA25: A2 3E 01 70 99 6A 00 5F 54 5F 30                 // .>.p.j._T_0

                            Case (Zero)
                            {

   1BA30: A0 23 93 5F 54 5F 30 00                          // .#._T_0.

                                Switch (Arg1)
                                {

   1BA38: A2 16 01 70 69 5F 54 5F 31                       // ...pi_T_1

                                    Case (One)
                                    {

   1BA41: A0 0C 93 5F 54 5F 31 01                          // ..._T_1.

                                        Return (
   1BA49: A4                                               // .

Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }


   1BA4A: 11 03 01 03                                      // ....

                                }


   1BA4E: A5                                               // .

                                Return (
   1BA4F: A4                                               // .

Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

   1BA50: 11 03 01 00                                      // ....

                            Case
   1BA54: A1 0E                                            // ..

 (One)
                            {

   1BA56: A0 0C 93 5F 54 5F 30 01                          // ..._T_0.

                                Return (RMRC) /* \RMRC */
                            }


   1BA5E: A4 52 4D 52 43                                   // .RMRC

                        }
                    }

   1BA63: A5                                               // .

                    Else
                    {

   1BA64: A1 06                                            // ..

                        Return (
   1BA66: A4                                               // .

Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }
        }
    }


   1BA67: 11 03 01 00                                      // ....

    If (CondRefOf (\_SB.PCI0.RP02.PXSX))
    {

   1BA6B: A0 4C B6 5B 12 5C 2F 04 5F 53 42 5F 50 43 49 30  // .L.[.\/._SB_PCI0
   1BA7B: 52 50 30 32 50 58 53 58 00                       // RP02PXSX.

        Scope (_SB.PCI0.RP02.PXSX)
        {

   1BA84: 10 43 B5 2F 04 5F 53 42 5F 50 43 49 30 52 50 30  // .C./._SB_PCI0RP0
   1BA94: 32 50 58 53 58                                   // 2PXSX

            Name (_DSD, 
   1BA99: 08 5F 44 53 44                                   // ._DSD

Package (0x02)  // _DSD: Device-Specific Data
            {

   1BA9E: 12 2E 02                                         // ...

                ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 

   1BAA1: 11 13 0A 10 0F 03 25 50 2F 84 B4 4A A5 61 99 A5  // ......%P/..J.a..
   1BAB1: 18 97 62 D0                                      // ..b.

                Package (0x01)
                {

   1BAB5: 12 17 01                                         // ...

                    Package (0x02)
                    {
                        "StorageD3Enable", 
                        One
                    }
                }
            })

   1BAB8: 12 14 02 0D 53 74 6F 72 61 67 65 44 33 45 6E 61  // ....StorageD3Ena
   1BAC8: 62 6C 65 00 01                                   // ble..

            OperationRegion (RPXX, PCI_Config, Zero, 0x10)

   1BACD: 5B 80 52 50 58 58 02 00 0A 10                    // [.RPXX....

