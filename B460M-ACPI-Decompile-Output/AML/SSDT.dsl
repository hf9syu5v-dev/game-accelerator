{
    External (_SB_.OSCP, IntObj)
    External (_SB_.PR00, DeviceObj)
    External (_SB_.PR01, DeviceObj)
    External (_SB_.PR02, DeviceObj)
    External (_SB_.PR03, DeviceObj)
    External (_SB_.PR04, DeviceObj)
    External (_SB_.PR05, DeviceObj)
    External (_SB_.PR06, DeviceObj)
    External (_SB_.PR07, DeviceObj)
    External (_SB_.PR08, DeviceObj)
    External (_SB_.PR09, DeviceObj)
    External (_SB_.PR10, DeviceObj)
    External (_SB_.PR11, DeviceObj)
    External (_SB_.PR12, DeviceObj)
    External (_SB_.PR13, DeviceObj)
    External (_SB_.PR14, DeviceObj)
    External (_SB_.PR15, DeviceObj)
    External (_SB_.PR16, DeviceObj)
    External (_SB_.PR17, DeviceObj)
    External (_SB_.PR18, DeviceObj)
    External (_SB_.PR19, DeviceObj)
    External (OSYS, UnknownObj)


    0024: A0 4B 11 00 15 5C 2E 5F 53 42 5F 4F 53 43 50 01  // .K...\._SB_OSCP.
    0034: 00 15 5C 2E 5F 53 42 5F 50 52 30 30 06 00 15 5C  // ..\._SB_PR00...\
    0044: 2E 5F 53 42 5F 50 52 30 31 06 00 15 5C 2E 5F 53  // ._SB_PR01...\._S
    0054: 42 5F 50 52 30 32 06 00 15 5C 2E 5F 53 42 5F 50  // B_PR02...\._SB_P
    0064: 52 30 33 06 00 15 5C 2E 5F 53 42 5F 50 52 30 34  // R03...\._SB_PR04
    0074: 06 00 15 5C 2E 5F 53 42 5F 50 52 30 35 06 00 15  // ...\._SB_PR05...
    0084: 5C 2E 5F 53 42 5F 50 52 30 36 06 00 15 5C 2E 5F  // \._SB_PR06...\._
    0094: 53 42 5F 50 52 30 37 06 00 15 5C 2E 5F 53 42 5F  // SB_PR07...\._SB_
    00A4: 50 52 30 38 06 00 15 5C 2E 5F 53 42 5F 50 52 30  // PR08...\._SB_PR0
    00B4: 39 06 00 15 5C 2E 5F 53 42 5F 50 52 31 30 06 00  // 9...\._SB_PR10..
    00C4: 15 5C 2E 5F 53 42 5F 50 52 31 31 06 00 15 5C 2E  // .\._SB_PR11...\.
    00D4: 5F 53 42 5F 50 52 31 32 06 00 15 5C 2E 5F 53 42  // _SB_PR12...\._SB
    00E4: 5F 50 52 31 33 06 00 15 5C 2E 5F 53 42 5F 50 52  // _PR13...\._SB_PR
    00F4: 31 34 06 00 15 5C 2E 5F 53 42 5F 50 52 31 35 06  // 14...\._SB_PR15.
    0104: 00 15 5C 2E 5F 53 42 5F 50 52 31 36 06 00 15 5C  // ..\._SB_PR16...\
    0114: 2E 5F 53 42 5F 50 52 31 37 06 00 15 5C 2E 5F 53  // ._SB_PR17...\._S
    0124: 42 5F 50 52 31 38 06 00 15 5C 2E 5F 53 42 5F 50  // B_PR18...\._SB_P
    0134: 52 31 39 06 00 15 4F 53 59 53 00 00              // R19...OSYS..

    Scope (\)
    {

    0140: 10 44 1A 5C 00                                   // .D.\.

        Name (SSDT, 
    0145: 08 53 53 44 54                                   // .SSDT

Package (0x1B)
        {
            "CPU0IST ", 
            0x5D0B8298, 
            0x00000605, 
            "APIST   ", 
            0x5D080018, 
            0x00000778, 
            "CPU0CST ", 
            0x5D07E018, 
            0x00000400, 
            "APCST   ", 
            0x5D080A98, 
            0x000003CA, 
            "CPU0HWP ", 
            0x5D0B8A98, 
            0x0000016C, 
            "APHWP   ", 
            0x5D07E698, 
            0x000003D7, 
            "HWPLVT  ", 
            0x5D081018, 
            0x00000BEA, 
            "CPU0PSD ", 
            0x5D0B8918, 
            0x000000FC, 
            "APPSD   ", 
            0x5D07F018, 
            0x00000D22
        })

    014A: 12 47 0B 1B 0D 43 50 55 30 49 53 54 20 00 0C 98  // .G...CPU0IST ...
    015A: 82 0B 5D 0C 05 06 00 00 0D 41 50 49 53 54 20 20  // ..]......APIST  
    016A: 20 00 0C 18 00 08 5D 0C 78 07 00 00 0D 43 50 55  //  .....].x....CPU
    017A: 30 43 53 54 20 00 0C 18 E0 07 5D 0C 00 04 00 00  // 0CST .....].....
    018A: 0D 41 50 43 53 54 20 20 20 00 0C 98 0A 08 5D 0C  // .APCST   .....].
    019A: CA 03 00 00 0D 43 50 55 30 48 57 50 20 00 0C 98  // .....CPU0HWP ...
    01AA: 8A 0B 5D 0C 6C 01 00 00 0D 41 50 48 57 50 20 20  // ..].l....APHWP  
    01BA: 20 00 0C 98 E6 07 5D 0C D7 03 00 00 0D 48 57 50  //  .....]......HWP
    01CA: 4C 56 54 20 20 00 0C 18 10 08 5D 0C EA 0B 00 00  // LVT  .....].....
    01DA: 0D 43 50 55 30 50 53 44 20 00 0C 18 89 0B 5D 0C  // .CPU0PSD .....].
    01EA: FC 00 00 00 0D 41 50 50 53 44 20 20 20 00 0C 18  // .....APPSD   ...
    01FA: F0 07 5D 0C 22 0D 00 00                          // ..]."...

        Name (\PC00, 0x80000000)

    0202: 08 5C 50 43 30 30 0C 00 00 00 80                 // .\PC00.....

        Name (\PC01, 0x80000000)

    020D: 08 5C 50 43 30 31 0C 00 00 00 80                 // .\PC01.....

        Name (\PC02, 0x80000000)

    0218: 08 5C 50 43 30 32 0C 00 00 00 80                 // .\PC02.....

        Name (\PC03, 0x80000000)

    0223: 08 5C 50 43 30 33 0C 00 00 00 80                 // .\PC03.....

        Name (\PC04, 0x80000000)

    022E: 08 5C 50 43 30 34 0C 00 00 00 80                 // .\PC04.....

        Name (\PC05, 0x80000000)

    0239: 08 5C 50 43 30 35 0C 00 00 00 80                 // .\PC05.....

        Name (\PC06, 0x80000000)

    0244: 08 5C 50 43 30 36 0C 00 00 00 80                 // .\PC06.....

        Name (\PC07, 0x80000000)

    024F: 08 5C 50 43 30 37 0C 00 00 00 80                 // .\PC07.....

        Name (\PC08, 0x80000000)

    025A: 08 5C 50 43 30 38 0C 00 00 00 80                 // .\PC08.....

        Name (\PC09, 0x80000000)

    0265: 08 5C 50 43 30 39 0C 00 00 00 80                 // .\PC09.....

        Name (\PC10, 0x80000000)

    0270: 08 5C 50 43 31 30 0C 00 00 00 80                 // .\PC10.....

        Name (\PC11, 0x80000000)

    027B: 08 5C 50 43 31 31 0C 00 00 00 80                 // .\PC11.....

        Name (\PC12, 0x80000000)

    0286: 08 5C 50 43 31 32 0C 00 00 00 80                 // .\PC12.....

        Name (\PC13, 0x80000000)

    0291: 08 5C 50 43 31 33 0C 00 00 00 80                 // .\PC13.....

        Name (\PC14, 0x80000000)

    029C: 08 5C 50 43 31 34 0C 00 00 00 80                 // .\PC14.....

        Name (\PC15, 0x80000000)

    02A7: 08 5C 50 43 31 35 0C 00 00 00 80                 // .\PC15.....

        Name (\PC16, 0x80000000)

    02B2: 08 5C 50 43 31 36 0C 00 00 00 80                 // .\PC16.....

        Name (\PC17, 0x80000000)

    02BD: 08 5C 50 43 31 37 0C 00 00 00 80                 // .\PC17.....

        Name (\PC18, 0x80000000)

    02C8: 08 5C 50 43 31 38 0C 00 00 00 80                 // .\PC18.....

        Name (\PC19, 0x80000000)

    02D3: 08 5C 50 43 31 39 0C 00 00 00 80                 // .\PC19.....

        Name (\SDTL, Zero)
    }


    02DE: 08 5C 53 44 54 4C 00                             // .\SDTL.

    Scope (\_SB)
    {

    02E5: 10 4C 1C 5C 5F 53 42 5F                          // .L.\_SB_

        Name (CTPC, Zero)

    02ED: 08 43 54 50 43 00                                // .CTPC.

        OperationRegion (PNVS, SystemMemory, 0x4E61F000, 0x0074)

    02F3: 5B 80 50 4E 56 53 00 0C 00 F0 61 4E 0B 74 00     // [.PNVS....aN.t.

        Field (PNVS, AnyAcc, Lock, Preserve)
        {
            PGRV,   8, 
            CFGD,   32, 
            Offset (0x06), 
            ACRT,   8, 
            APSV,   8, 
            AAC0,   8, 
            CPID,   32, 
            CPPC,   8, 
            CLVL,   8, 
            CBMI,   8, 
            PL10,   16, 
            PL11,   16, 
            PL12,   16, 
            PL20,   16, 
            PL21,   16, 
            PL22,   16, 
            PLW0,   8, 
            PLW1,   8, 
            PLW2,   8, 
            CTC0,   8, 
            CTC1,   8, 
            CTC2,   8, 
            TAR0,   8, 
            TAR1,   8, 
            TAR2,   8, 
            PPC0,   8, 
            PPC1,   8, 
            PPC2,   8, 
            Offset (0x29), 
            C6MW,   8, 
            C7MW,   8, 
            CDMW,   8, 
            Offset (0x2E), 
            C6LT,   16, 
            C7LT,   16, 
            CDLT,   16, 
            CDLV,   16, 
            CDPW,   16, 
            MPMF,   8, 
            DTSE,   8, 
            Offset (0x3C), 
            DTSF,   8, 
            PDTS,   8, 
            PKGA,   8, 
            Offset (0x41), 
            BGMA,   64, 
            BGMS,   8, 
            BGIA,   16, 
            BGIL,   16, 
            DSIA,   16, 
            DSIL,   8, 
            DSAE,   8, 
            EPCS,   8, 
            EMNA,   64, 
            ELNG,   64, 
            HWPV,   8, 
            HWPI,   8, 
            DTSI,   8, 
            HWPS,   8, 
            LMPS,   8, 
            ITBM,   8, 
            ITBD,   8, 
            ITBI,   8, 
            ITBS,   8, 
            OBIN,   8, 
            TXTE,   8, 
            C3MW,   8, 
            C3LT,   16, 
            HWPE,   8, 
            OCLK,   8, 
            ITBP,   8
        }


    0302: 5B 81 4E 15 50 4E 56 53 10 50 47 52 56 08 43 46  // [.N.PNVS.PGRV.CF
    0312: 47 44 20 00 08 41 43 52 54 08 41 50 53 56 08 41  // GD ..ACRT.APSV.A
    0322: 41 43 30 08 43 50 49 44 20 43 50 50 43 08 43 4C  // AC0.CPID CPPC.CL
    0332: 56 4C 08 43 42 4D 49 08 50 4C 31 30 10 50 4C 31  // VL.CBMI.PL10.PL1
    0342: 31 10 50 4C 31 32 10 50 4C 32 30 10 50 4C 32 31  // 1.PL12.PL20.PL21
    0352: 10 50 4C 32 32 10 50 4C 57 30 08 50 4C 57 31 08  // .PL22.PLW0.PLW1.
    0362: 50 4C 57 32 08 43 54 43 30 08 43 54 43 31 08 43  // PLW2.CTC0.CTC1.C
    0372: 54 43 32 08 54 41 52 30 08 54 41 52 31 08 54 41  // TC2.TAR0.TAR1.TA
    0382: 52 32 08 50 50 43 30 08 50 50 43 31 08 50 50 43  // R2.PPC0.PPC1.PPC
    0392: 32 08 00 08 43 36 4D 57 08 43 37 4D 57 08 43 44  // 2...C6MW.C7MW.CD
    03A2: 4D 57 08 00 10 43 36 4C 54 10 43 37 4C 54 10 43  // MW...C6LT.C7LT.C
    03B2: 44 4C 54 10 43 44 4C 56 10 43 44 50 57 10 4D 50  // DLT.CDLV.CDPW.MP
    03C2: 4D 46 08 44 54 53 45 08 00 10 44 54 53 46 08 50  // MF.DTSE...DTSF.P
    03D2: 44 54 53 08 50 4B 47 41 08 00 10 42 47 4D 41 40  // DTS.PKGA...BGMA@
    03E2: 04 42 47 4D 53 08 42 47 49 41 10 42 47 49 4C 10  // .BGMS.BGIA.BGIL.
    03F2: 44 53 49 41 10 44 53 49 4C 08 44 53 41 45 08 45  // DSIA.DSIL.DSAE.E
    0402: 50 43 53 08 45 4D 4E 41 40 04 45 4C 4E 47 40 04  // PCS.EMNA@.ELNG@.
    0412: 48 57 50 56 08 48 57 50 49 08 44 54 53 49 08 48  // HWPV.HWPI.DTSI.H
    0422: 57 50 53 08 4C 4D 50 53 08 49 54 42 4D 08 49 54  // WPS.LMPS.ITBM.IT
    0432: 42 44 08 49 54 42 49 08 49 54 42 53 08 4F 42 49  // BD.ITBI.ITBS.OBI
    0442: 4E 08 54 58 54 45 08 43 33 4D 57 08 43 33 4C 54  // N.TXTE.C3MW.C3LT
    0452: 10 48 57 50 45 08 4F 43 4C 4B 08 49 54 42 50 08  // .HWPE.OCLK.ITBP.

        OperationRegion (IO_D, SystemIO, \_SB.DSIA, \_SB.DSIL)

    0462: 5B 80 49 4F 5F 44 01 5C 2E 5F 53 42 5F 44 53 49  // [.IO_D.\._SB_DSI
    0472: 41 5C 2E 5F 53 42 5F 44 53 49 4C                 // A\._SB_DSIL

        Field (IO_D, ByteAcc, NoLock, Preserve)
        {
            TRPD,   8
        }


    047D: 5B 81 0B 49 4F 5F 44 01 54 52 50 44 08           // [..IO_D.TRPD.

        OperationRegion (IO_P, SystemIO, \_SB.BGIA, \_SB.BGIL)

    048A: 5B 80 49 4F 5F 50 01 5C 2E 5F 53 42 5F 42 47 49  // [.IO_P.\._SB_BGI
    049A: 41 5C 2E 5F 53 42 5F 42 47 49 4C                 // A\._SB_BGIL

        Field (IO_P, ByteAcc, NoLock, Preserve)
        {
            TRPF,   8
        }
    }


    04A5: 5B 81 0B 49 4F 5F 50 01 54 52 50 46 08           // [..IO_P.TRPF.

    Scope (\_SB.PR00)
    {

    04B2: 10 4F 3F 5C 2E 5F 53 42 5F 50 52 30 30           // .O?\._SB_PR00

        Name (HI0, Zero)

    04BF: 08 48 49 30 5F 00                                // .HI0_.

        Name (HC0, Zero)

    04C5: 08 48 43 30 5F 00                                // .HC0_.

        Name (HW0, Zero)

    04CB: 08 48 57 30 5F 00                                // .HW0_.

        Name (HW2, Zero)

    04D1: 08 48 57 32 5F 00                                // .HW2_.

        Name (HP0, Zero)

    04D7: 08 48 50 30 5F 00                                // .HP0_.

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    04DD: 14 12 5F 50 44 43 01 70 43 50 44 43 68 60 47 43  // .._PDC.pCPDCh`GC
    04ED: 41 50 60                                         // AP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    04F0: 14 17 5F 4F 53 43 04 70 43 4F 53 43 68 69 6A 6B  // .._OSC.pCOSChijk
    0500: 60 47 43 41 50 60                                // `GCAP`

            Return (Local0)
        }


    0506: A4 60                                            // .`

        Method (CPDC, 1, NotSerialized)
        {

    0508: 14 42 06 43 50 44 43 01                          // .B.CPDC.

            CreateDWordField (Arg0, Zero, REVS)

    0510: 8A 68 00 52 45 56 53                             // .h.REVS

            CreateDWordField (Arg0, 0x04, SIZE)
            Store (SizeOf (Arg0), Local0)
            Store (Subtract (Local0, 0x08), Local1)

    0517: 8A 68 0A 04 53 49 5A 45 70 87 68 60 70 74 60 0A  // .h..SIZEp.h`pt`.
    0527: 08 00 61                                         // ..a

            CreateField (Arg0, 0x40, Multiply (Local1, 0x08), TEMP)
            Store (
    052A: 5B 13 68 0A 40 77 61 0A 08 00 54 45 4D 50 70     // [.h.@wa...TEMPp

Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                           // ....
                }, Local3)
            Concatenate (Local3, TEMP, Local2)

    0539: 11 07 0A 04 00 00 00 00 63 73 63 54 45 4D 50 62  // ........cscTEMPb

            Return (COSC (
    0549: A4 43 4F 53 43                                   // .COSC

ToUUID ("4077a616-290c-47be-9ebd-d87058713953") /* Unknown UUID */, REVS, SIZE, Local2))
        }


    054E: 11 13 0A 10 16 A6 77 40 0C 29 BE 47 9E BD D8 70  // ......w@.).G...p
    055E: 58 71 39 53 52 45 56 53 53 49 5A 45 62           // Xq9SREVSSIZEb

        Method (COSC, 4, NotSerialized)
        {

    056B: 14 46 0A 43 4F 53 43 04                          // .F.COSC.

            CreateDWordField (Arg3, Zero, STS0)

    0573: 8A 6B 00 53 54 53 30                             // .k.STS0

            CreateDWordField (Arg0, Zero, IID0)

    057A: 8A 68 00 49 49 44 30                             // .h.IID0

            CreateDWordField (Arg0, 0x04, IID1)

    0581: 8A 68 0A 04 49 49 44 31                          // .h..IID1

            CreateDWordField (Arg0, 0x08, IID2)

    0589: 8A 68 0A 08 49 49 44 32                          // .h..IID2

            CreateDWordField (Arg0, 0x0C, IID3)
            Store (
    0591: 8A 68 0A 0C 49 49 44 33 70                       // .h..IID3p

ToUUID ("4077a616-290c-47be-9ebd-d87058713953") /* Unknown UUID */, Local0)

    059A: 11 13 0A 10 16 A6 77 40 0C 29 BE 47 9E BD D8 70  // ......w@.).G...p
    05AA: 58 71 39 53 60                                   // Xq9S`

            CreateDWordField (Local0, Zero, EID0)

    05AF: 8A 60 00 45 49 44 30                             // .`.EID0

            CreateDWordField (Local0, 0x04, EID1)

    05B6: 8A 60 0A 04 45 49 44 31                          // .`..EID1

            CreateDWordField (Local0, 0x08, EID2)

    05BE: 8A 60 0A 08 45 49 44 32                          // .`..EID2

            CreateDWordField (Local0, 0x0C, EID3)

    05C6: 8A 60 0A 0C 45 49 44 33                          // .`..EID3

            If (LNot (
    05CE: A0 32 92                                         // .2.

LAnd (LAnd (LEqual (IID0, EID0), 
    05D1: 90 90 93 49 49 44 30 45 49 44 30                 // ...IID0EID0

LEqual (IID1, EID1)), 
    05DC: 93 49 49 44 31 45 49 44 31                       // .IID1EID1

LAnd (LEqual (
                IID2, EID2), 
    05E5: 90 93 49 49 44 32 45 49 44 32                    // ..IID2EID2

LEqual (IID3, EID3)))))
            {
                Store (0x06, STS0) /* \_SB_.PR00.COSC.STS0 */

    05EF: 93 49 49 44 33 45 49 44 33 70 0A 06 53 54 53 30  // .IID3EID3p..STS0

                Return (Arg3)
            }


    05FF: A4 6B                                            // .k

            If (
    0601: A0 0E 92                                         // ...

LNotEqual (Arg1, One))
            {
                Store (0x0A, STS0) /* \_SB_.PR00.COSC.STS0 */

    0604: 93 69 01 70 0A 0A 53 54 53 30                    // .i.p..STS0

                Return (Arg3)
            }


    060E: A4 6B                                            // .k

            Return (Arg3)
        }


    0610: A4 6B                                            // .k

        Method (GCAP, 1, Serialized)
        {

    0612: 14 4F 29 47 43 41 50 09                          // .O)GCAP.

            CreateDWordField (Arg0, Zero, STS0)

    061A: 8A 68 00 53 54 53 30                             // .h.STS0

            CreateDWordField (Arg0, 0x04, CAP0)

    0621: 8A 68 0A 04 43 41 50 30                          // .h..CAP0

            If (LOr (LEqual (STS0, 0x06), 
    0629: A0 12 91 93 53 54 53 30 0A 06                    // ....STS0..

LEqual (STS0, 0x0A)))
            {

    0633: 93 53 54 53 30 0A 0A                             // .STS0..

                Return (Zero)
            }


    063A: A4 00                                            // ..

            If (And (STS0, One))
            {
                And (CAP0, 0x0BFF, CAP0) /* \_SB_.PR00.GCAP.CAP0 */

    063C: A0 16 7B 53 54 53 30 01 00 7B 43 41 50 30 0B FF  // ..{STS0..{CAP0..
    064C: 0B 43 41 50 30                                   // .CAP0

                Return (Zero)
            }

            Or (And (PC00, 0x7FFFFFFF), CAP0, PC00) /* \PC00 */

    0651: A4 00 7D 7B 50 43 30 30 0C FF FF FF 7F 00 43 41  // ..}{PC00......CA
    0661: 50 30 50 43 30 30                                // P0PC00

            If (And (CFGD, 0x7A))
            {

    0667: A0 47 05 7B 43 46 47 44 0A 7A 00                 // .G.{CFGD.z.

                If (LAnd (LAnd (And (CFGD, 0x0200), 
    0672: A0 4C 04 90 90 7B 43 46 47 44 0B 00 02 00        // .L...{CFGD....

And (PC00, 0x18)), 
    0680: 7B 50 43 30 30 0A 18 00                          // {PC00...

LNot (
    0688: 92                                               // .


                    And (SDTL, 0x02))))
                {
                    Or (SDTL, 0x02, SDTL) /* \SDTL */

    0689: 7B 53 44 54 4C 0A 02 00 7D 53 44 54 4C 0A 02 53  // {SDTL...}SDTL..S
    0699: 44 54 4C                                         // DTL

                    OperationRegion (CST0, SystemMemory, DerefOf (
    069C: 5B 80 43 53 54 30 00 83                          // [.CST0..

Index (SSDT, 0x07)), 
    06A4: 88 53 53 44 54 0A 07 00                          // .SSDT...

DerefOf (
    06AC: 83                                               // .

Index (SSDT, 0x08)))

    06AD: 88 53 53 44 54 0A 08 00                          // .SSDT...

                    Load (CST0, HC0) /* \_SB_.PR00.HC0_ */
                }
            }


    06B5: 5B 20 43 53 54 30 48 43 30 5F                    // [ CST0HC0_

            If (LEqual (And (PC00, 0x09), 0x09))
            {

    06BF: A0 4D 04 93 7B 50 43 30 30 0A 09 00 0A 09        // .M..{PC00.....

                If (LAnd (And (CFGD, One), 
    06CD: A0 3F 90 7B 43 46 47 44 01 00                    // .?.{CFGD..

LNot (
    06D7: 92                                               // .

And (SDTL, 0x08))))
                {
                    Or (SDTL, 0x08, SDTL) /* \SDTL */

    06D8: 7B 53 44 54 4C 0A 08 00 7D 53 44 54 4C 0A 08 53  // {SDTL...}SDTL..S
    06E8: 44 54 4C                                         // DTL

                    OperationRegion (IST0, SystemMemory, DerefOf (
    06EB: 5B 80 49 53 54 30 00 83                          // [.IST0..

Index (SSDT, One)), 
    06F3: 88 53 53 44 54 01 00                             // .SSDT..

DerefOf (
    06FA: 83                                               // .

Index (SSDT, 0x02)))

    06FB: 88 53 53 44 54 0A 02 00                          // .SSDT...

                    Load (IST0, HI0) /* \_SB_.PR00.HI0_ */
                }
            }


    0703: 5B 20 49 53 54 30 48 49 30 5F                    // [ IST0HI0_

            If (LAnd (LOr (And (CFGD, One), 
    070D: A0 4F 04 90 91 7B 43 46 47 44 01 00              // .O...{CFGD..

And (CFGD, 0x00400000)), 
    0719: 7B 43 46 47 44 0C 00 00 40 00 00                 // {CFGD...@..

LNot (
    0724: 92                                               // .


                And (SDTL, 0x0100))))
            {
                Or (SDTL, 0x0100, SDTL) /* \SDTL */

    0725: 7B 53 44 54 4C 0B 00 01 00 7D 53 44 54 4C 0B 00  // {SDTL....}SDTL..
    0735: 01 53 44 54 4C                                   // .SDTL

                OperationRegion (PSD0, SystemMemory, DerefOf (
    073A: 5B 80 50 53 44 30 00 83                          // [.PSD0..

Index (SSDT, 0x16)), 
    0742: 88 53 53 44 54 0A 16 00                          // .SSDT...

DerefOf (
    074A: 83                                               // .

Index (SSDT, 0x17)))

    074B: 88 53 53 44 54 0A 17 00                          // .SSDT...

                Load (PSD0, HP0) /* \_SB_.PR00.HP0_ */
            }


    0753: 5B 20 50 53 44 30 48 50 30 5F                    // [ PSD0HP0_

            If (
    075D: A0 40 0D 92                                      // .@..

LGreaterEqual (OSYS, 0x07DF))
            {

    0761: 95 4F 53 59 53 0B DF 07                          // .OSYS...

                If (LAnd (And (CFGD, 0x00400000), 
    0769: A0 44 0C 90 7B 43 46 47 44 0C 00 00 40 00 00     // .D..{CFGD...@..

LNot (
    0778: 92                                               // .

And (SDTL, 0x40))))
                {

    0779: 7B 53 44 54 4C 0A 40 00                          // {SDTL.@.

                    If (And (\_SB.OSCP, 0x40))
                    {
                        Or (SDTL, 0x40, SDTL) /* \SDTL */

    0781: A0 4E 06 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 40  // .N.{\._SB_OSCP.@
    0791: 00 7D 53 44 54 4C 0A 40 53 44 54 4C              // .}SDTL.@SDTL

                        OperationRegion (HWP0, SystemMemory, DerefOf (
    079D: 5B 80 48 57 50 30 00 83                          // [.HWP0..

Index (SSDT, 0x0D)), 
    07A5: 88 53 53 44 54 0A 0D 00                          // .SSDT...

DerefOf (
    07AD: 83                                               // .

Index (SSDT, 0x0E)))
                        Load (HWP0, HW0) /* \_SB_.PR00.HW0_ */

    07AE: 88 53 53 44 54 0A 0E 00 5B 20 48 57 50 30 48 57  // .SSDT...[ HWP0HW
    07BE: 30 5F                                            // 0_

                        If (And (CFGD, 0x00800000))
                        {

    07C0: A0 2F 7B 43 46 47 44 0C 00 00 80 00 00           // ./{CFGD......

                            OperationRegion (HWPL, SystemMemory, DerefOf (
    07CD: 5B 80 48 57 50 4C 00 83                          // [.HWPL..

Index (SSDT, 0x13)), 
    07D5: 88 53 53 44 54 0A 13 00                          // .SSDT...

DerefOf (
    07DD: 83                                               // .

Index (SSDT, 0x14)))

    07DE: 88 53 53 44 54 0A 14 00                          // .SSDT...

                            Load (HWPL, HW2) /* \_SB_.PR00.HW2_ */
                        }
                    }


    07E6: 5B 20 48 57 50 4C 48 57 32 5F                    // [ HWPLHW2_

                    If (And (\_SB.OSCP, 0x20))
                    {

    07F0: A0 26 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // .&{\._SB_OSCP. .

                        If (LNot (
    0800: A0 16 92                                         // ...

And (\_SB.OSCP, 0x40)))
                        {

    0803: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 40 00        // {\._SB_OSCP.@.

                            Store (Zero, HWPV) /* \_SB_.HWPV */
                        }
                    }


    0811: 70 00 48 57 50 56                                // p.HWPV

                    If (And (\_SB.OSCP, 0x40))
                    {

    0817: A0 16 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 40 00  // ..{\._SB_OSCP.@.

                        Store (0x02, HWPV) /* \_SB_.HWPV */
                    }
                }
            }


    0827: 70 0A 02 48 57 50 56                             // p..HWPV

            OperationRegion (SMIP, SystemIO, 0xB2, One)

    082E: 5B 80 53 4D 49 50 01 0A B2 01                    // [.SMIP....

            Field (SMIP, ByteAcc, NoLock, Preserve)
            {
                IOB2,   8
            }


    0838: 5B 81 0B 53 4D 49 50 01 49 4F 42 32 08           // [..SMIP.IOB2.

            If (LNot (
    0845: A0 14 92                                         // ...

And (PC00, 0x1000)))
            {

    0848: 7B 50 43 30 30 0B 00 10 00                       // {PC00....

                Store (HWPS, IOB2) /* \_SB_.PR00.GCAP.IOB2 */
            }


    0851: 70 48 57 50 53 49 4F 42 32                       // pHWPSIOB2

            If (LAnd (LEqual (\_SB.ITBM, One), 
    085A: A0 45 05 90 93 5C 2E 5F 53 42 5F 49 54 42 4D 01  // .E...\._SB_ITBM.

And (\_SB.CFGD, 0x00400000)))
            {

    086A: 7B 5C 2E 5F 53 42 5F 43 46 47 44 0C 00 00 40 00  // {\._SB_CFGD...@.
    087A: 00                                               // .

                If (LAnd (LAnd (
    087B: A0 34 90 90 92                                   // .4...

LNotEqual (\_SB.ITBP, Zero), 
    0880: 93 5C 2E 5F 53 42 5F 49 54 42 50 00              // .\._SB_ITBP.

And (\_SB.OSCP, 0x1000)), 
    088C: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 10 00     // {\._SB_OSCP....

LEqual (
                    \_SB.OCLK, Zero)))
                {

    089B: 93 5C 2E 5F 53 42 5F 4F 43 4C 4B 00              // .\._SB_OCLK.

                    Store (ITBS, IOB2) /* \_SB_.PR00.GCAP.IOB2 */
                }
            }


    08A7: 70 49 54 42 53 49 4F 42 32                       // pITBSIOB2

            Return (Zero)
        }
    }


    08B0: A4 00                                            // ..

    Scope (\_SB.PR01)
    {

    08B2: 10 4F 25 5C 2E 5F 53 42 5F 50 52 30 31           // .O%\._SB_PR01

        Name (HI1, Zero)

    08BF: 08 48 49 31 5F 00                                // .HI1_.

        Name (HC1, Zero)

    08C5: 08 48 43 31 5F 00                                // .HC1_.

        Name (HW1, Zero)

    08CB: 08 48 57 31 5F 00                                // .HW1_.

        Name (HP1, Zero)

    08D1: 08 48 50 31 5F 00                                // .HP1_.

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    08D7: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    08E7: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    08F5: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    0905: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    0915: 60                                               // `

            Return (Local0)
        }


    0916: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    0918: 14 42 0B 47 43 41 50 01                          // .B.GCAP.

            CreateDWordField (Arg0, Zero, ST01)

    0920: 8A 68 00 53 54 30 31                             // .h.ST01

            CreateDWordField (Arg0, 0x04, CP01)

    0927: 8A 68 0A 04 43 50 30 31                          // .h..CP01

            If (LOr (LEqual (ST01, 0x06), 
    092F: A0 12 91 93 53 54 30 31 0A 06                    // ....ST01..

LEqual (ST01, 0x0A)))
            {

    0939: 93 53 54 30 31 0A 0A                             // .ST01..

                Return (Zero)
            }


    0940: A4 00                                            // ..

            If (And (ST01, One))
            {
                And (CP01, 0x0BFF, CP01) /* \_SB_.PR01.GCAP.CP01 */

    0942: A0 16 7B 53 54 30 31 01 00 7B 43 50 30 31 0B FF  // ..{ST01..{CP01..
    0952: 0B 43 50 30 31                                   // .CP01

                Return (Zero)
            }

            Or (And (PC01, 0x7FFFFFFF), CP01, PC01) /* \PC01 */

    0957: A4 00 7D 7B 50 43 30 31 0C FF FF FF 7F 00 43 50  // ..}{PC01......CP
    0967: 30 31 50 43 30 31                                // 01PC01

            If (LEqual (And (PC01, 0x09), 0x09))
            {
                APPT ()
            }


    096D: A0 10 93 7B 50 43 30 31 0A 09 00 0A 09 41 50 50  // ...{PC01.....APP
    097D: 54                                               // T

            If (And (\_SB.OSCP, 0x20))
            {
                HWPT ()
            }


    097E: A0 13 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    098E: 48 57 50 54                                      // HWPT

            If (LOr (LEqual (And (PC01, 0x09), 0x09), 
    0992: A0 1F 91 93 7B 50 43 30 31 0A 09 00 0A 09        // ....{PC01.....

And (\_SB.OSCP, 0x20)))
            {
                APPS ()
            }


    09A0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 41 50  // {\._SB_OSCP. .AP
    09B0: 50 53                                            // PS

            If (And (PC01, 0x18))
            {
                APCT ()
            }

            Store (PC01, PC00) /* \PC00 */

    09B2: A0 0D 7B 50 43 30 31 0A 18 00 41 50 43 54 70 50  // ..{PC01...APCTpP
    09C2: 43 30 31 50 43 30 30                             // C01PC00

            Return (Zero)
        }


    09C9: A4 00                                            // ..

        Method (APCT, 0, Serialized)
        {

    09CB: 14 4A 04 41 50 43 54 08                          // .J.APCT.

            If (LAnd (And (CFGD, 0x7A), 
    09D3: A0 42 04 90 7B 43 46 47 44 0A 7A 00              // .B..{CFGD.z.

LNot (
    09DF: 92                                               // .

And (SDTL, 0x20))))
            {
                Or (SDTL, 0x20, SDTL) /* \SDTL */

    09E0: 7B 53 44 54 4C 0A 20 00 7D 53 44 54 4C 0A 20 53  // {SDTL. .}SDTL. S
    09F0: 44 54 4C                                         // DTL

                OperationRegion (CST1, SystemMemory, DerefOf (
    09F3: 5B 80 43 53 54 31 00 83                          // [.CST1..

Index (SSDT, 0x0A)), 
    09FB: 88 53 53 44 54 0A 0A 00                          // .SSDT...

DerefOf (
    0A03: 83                                               // .

Index (SSDT, 0x0B)))

    0A04: 88 53 53 44 54 0A 0B 00                          // .SSDT...

                Load (CST1, HC1) /* \_SB_.PR01.HC1_ */
            }
        }


    0A0C: 5B 20 43 53 54 31 48 43 31 5F                    // [ CST1HC1_

        Method (APPT, 0, Serialized)
        {

    0A16: 14 49 04 41 50 50 54 08                          // .I.APPT.

            If (LAnd (And (CFGD, One), 
    0A1E: A0 41 04 90 7B 43 46 47 44 01 00                 // .A..{CFGD..

LNot (
    0A29: 92                                               // .

And (SDTL, 0x10))))
            {
                Or (SDTL, 0x10, SDTL) /* \SDTL */

    0A2A: 7B 53 44 54 4C 0A 10 00 7D 53 44 54 4C 0A 10 53  // {SDTL...}SDTL..S
    0A3A: 44 54 4C                                         // DTL

                OperationRegion (IST1, SystemMemory, DerefOf (
    0A3D: 5B 80 49 53 54 31 00 83                          // [.IST1..

Index (SSDT, 0x04)), 
    0A45: 88 53 53 44 54 0A 04 00                          // .SSDT...

DerefOf (
    0A4D: 83                                               // .

Index (SSDT, 0x05)))

    0A4E: 88 53 53 44 54 0A 05 00                          // .SSDT...

                Load (IST1, HI1) /* \_SB_.PR01.HI1_ */
            }
        }


    0A56: 5B 20 49 53 54 31 48 49 31 5F                    // [ IST1HI1_

        Method (APPS, 0, Serialized)
        {

    0A60: 14 47 05 41 50 50 53 08                          // .G.APPS.

            If (LAnd (LOr (And (CFGD, One), 
    0A68: A0 4F 04 90 91 7B 43 46 47 44 01 00              // .O...{CFGD..

And (CFGD, 0x00400000)), 
    0A74: 7B 43 46 47 44 0C 00 00 40 00 00                 // {CFGD...@..

LNot (
    0A7F: 92                                               // .


                And (SDTL, 0x0200))))
            {
                Or (SDTL, 0x0200, SDTL) /* \SDTL */

    0A80: 7B 53 44 54 4C 0B 00 02 00 7D 53 44 54 4C 0B 00  // {SDTL....}SDTL..
    0A90: 02 53 44 54 4C                                   // .SDTL

                OperationRegion (PSD1, SystemMemory, DerefOf (
    0A95: 5B 80 50 53 44 31 00 83                          // [.PSD1..

Index (SSDT, 0x19)), 
    0A9D: 88 53 53 44 54 0A 19 00                          // .SSDT...

DerefOf (
    0AA5: 83                                               // .

Index (SSDT, 0x1A)))

    0AA6: 88 53 53 44 54 0A 1A 00                          // .SSDT...

                Load (PSD1, HP1) /* \_SB_.PR01.HP1_ */
            }
        }


    0AAE: 5B 20 50 53 44 31 48 50 31 5F                    // [ PSD1HP1_

        Method (HWPT, 0, Serialized)
        {

    0AB8: 14 49 05 48 57 50 54 08                          // .I.HWPT.

            If (
    0AC0: A0 41 05 92                                      // .A..

LGreaterEqual (OSYS, 0x07DF))
            {

    0AC4: 95 4F 53 59 53 0B DF 07                          // .OSYS...

                If (LAnd (And (CFGD, 0x00400000), 
    0ACC: A0 45 04 90 7B 43 46 47 44 0C 00 00 40 00 00     // .E..{CFGD...@..

LNot (
    0ADB: 92                                               // .

And (SDTL, 0x80))))
                {
                    Or (SDTL, 0x80, SDTL) /* \SDTL */

    0ADC: 7B 53 44 54 4C 0A 80 00 7D 53 44 54 4C 0A 80 53  // {SDTL...}SDTL..S
    0AEC: 44 54 4C                                         // DTL

                    OperationRegion (HWP1, SystemMemory, DerefOf (
    0AEF: 5B 80 48 57 50 31 00 83                          // [.HWP1..

Index (SSDT, 0x10)), 
    0AF7: 88 53 53 44 54 0A 10 00                          // .SSDT...

DerefOf (
    0AFF: 83                                               // .

Index (SSDT, 0x11)))

    0B00: 88 53 53 44 54 0A 11 00                          // .SSDT...

                    Load (HWP1, HW1) /* \_SB_.PR01.HW1_ */
                }
            }
        }
    }


    0B08: 5B 20 48 57 50 31 48 57 31 5F                    // [ HWP1HW1_

    Scope (\_SB.PR02)
    {

    0B12: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 32           // .L.\._SB_PR02

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    0B1F: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    0B2F: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    0B3D: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    0B4D: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    0B5D: 60                                               // `

            Return (Local0)
        }


    0B5E: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    0B60: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST02)

    0B68: 8A 68 00 53 54 30 32                             // .h.ST02

            CreateDWordField (Arg0, 0x04, CP02)

    0B6F: 8A 68 0A 04 43 50 30 32                          // .h..CP02

            If (LOr (LEqual (ST02, 0x06), 
    0B77: A0 12 91 93 53 54 30 32 0A 06                    // ....ST02..

LEqual (ST02, 0x0A)))
            {

    0B81: 93 53 54 30 32 0A 0A                             // .ST02..

                Return (Zero)
            }


    0B88: A4 00                                            // ..

            If (And (ST02, One))
            {
                And (CP02, 0x0BFF, CP02) /* \_SB_.PR02.GCAP.CP02 */

    0B8A: A0 16 7B 53 54 30 32 01 00 7B 43 50 30 32 0B FF  // ..{ST02..{CP02..
    0B9A: 0B 43 50 30 32                                   // .CP02

                Return (Zero)
            }

            Or (And (PC02, 0x7FFFFFFF), CP02, PC02) /* \PC02 */

    0B9F: A4 00 7D 7B 50 43 30 32 0C FF FF FF 7F 00 43 50  // ..}{PC02......CP
    0BAF: 30 32 50 43 30 32                                // 02PC02

            If (LEqual (And (PC02, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    0BB5: A0 1B 93 7B 50 43 30 32 0A 09 00 0A 09 5C 2F 03  // ...{PC02.....\/.
    0BC5: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    0BD1: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    0BE1: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC02, 0x09), 0x09), 
    0BF0: A0 2A 91 93 7B 50 43 30 32 0A 09 00 0A 09        // .*..{PC02.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    0BFE: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    0C0E: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC02, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC02, PC00) /* \PC00 */

    0C1B: A0 18 7B 50 43 30 32 0A 18 00 5C 2F 03 5F 53 42  // ..{PC02...\/._SB
    0C2B: 5F 50 52 30 31 41 50 43 54 70 50 43 30 32 50 43  // _PR01APCTpPC02PC
    0C3B: 30 30                                            // 00

            Return (Zero)
        }
    }


    0C3D: A4 00                                            // ..

    Scope (\_SB.PR03)
    {

    0C3F: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 33           // .L.\._SB_PR03

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    0C4C: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    0C5C: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    0C6A: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    0C7A: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    0C8A: 60                                               // `

            Return (Local0)
        }


    0C8B: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    0C8D: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST03)

    0C95: 8A 68 00 53 54 30 33                             // .h.ST03

            CreateDWordField (Arg0, 0x04, CP03)

    0C9C: 8A 68 0A 04 43 50 30 33                          // .h..CP03

            If (LOr (LEqual (ST03, 0x06), 
    0CA4: A0 12 91 93 53 54 30 33 0A 06                    // ....ST03..

LEqual (ST03, 0x0A)))
            {

    0CAE: 93 53 54 30 33 0A 0A                             // .ST03..

                Return (Zero)
            }


    0CB5: A4 00                                            // ..

            If (And (ST03, One))
            {
                And (CP03, 0x0BFF, CP03) /* \_SB_.PR03.GCAP.CP03 */

    0CB7: A0 16 7B 53 54 30 33 01 00 7B 43 50 30 33 0B FF  // ..{ST03..{CP03..
    0CC7: 0B 43 50 30 33                                   // .CP03

                Return (Zero)
            }

            Or (And (PC03, 0x7FFFFFFF), CP03, PC03) /* \PC03 */

    0CCC: A4 00 7D 7B 50 43 30 33 0C FF FF FF 7F 00 43 50  // ..}{PC03......CP
    0CDC: 30 33 50 43 30 33                                // 03PC03

            If (LEqual (And (PC03, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    0CE2: A0 1B 93 7B 50 43 30 33 0A 09 00 0A 09 5C 2F 03  // ...{PC03.....\/.
    0CF2: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    0CFE: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    0D0E: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC03, 0x09), 0x09), 
    0D1D: A0 2A 91 93 7B 50 43 30 33 0A 09 00 0A 09        // .*..{PC03.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    0D2B: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    0D3B: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC03, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC03, PC00) /* \PC00 */

    0D48: A0 18 7B 50 43 30 33 0A 18 00 5C 2F 03 5F 53 42  // ..{PC03...\/._SB
    0D58: 5F 50 52 30 31 41 50 43 54 70 50 43 30 33 50 43  // _PR01APCTpPC03PC
    0D68: 30 30                                            // 00

            Return (Zero)
        }
    }


    0D6A: A4 00                                            // ..

    Scope (\_SB.PR04)
    {

    0D6C: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 34           // .L.\._SB_PR04

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    0D79: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    0D89: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    0D97: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    0DA7: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    0DB7: 60                                               // `

            Return (Local0)
        }


    0DB8: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    0DBA: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST04)

    0DC2: 8A 68 00 53 54 30 34                             // .h.ST04

            CreateDWordField (Arg0, 0x04, CP04)

    0DC9: 8A 68 0A 04 43 50 30 34                          // .h..CP04

            If (LOr (LEqual (ST04, 0x06), 
    0DD1: A0 12 91 93 53 54 30 34 0A 06                    // ....ST04..

LEqual (ST04, 0x0A)))
            {

    0DDB: 93 53 54 30 34 0A 0A                             // .ST04..

                Return (Zero)
            }


    0DE2: A4 00                                            // ..

            If (And (ST04, One))
            {
                And (CP04, 0x0BFF, CP04) /* \_SB_.PR04.GCAP.CP04 */

    0DE4: A0 16 7B 53 54 30 34 01 00 7B 43 50 30 34 0B FF  // ..{ST04..{CP04..
    0DF4: 0B 43 50 30 34                                   // .CP04

                Return (Zero)
            }

            Or (And (PC04, 0x7FFFFFFF), CP04, PC04) /* \PC04 */

    0DF9: A4 00 7D 7B 50 43 30 34 0C FF FF FF 7F 00 43 50  // ..}{PC04......CP
    0E09: 30 34 50 43 30 34                                // 04PC04

            If (LEqual (And (PC04, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    0E0F: A0 1B 93 7B 50 43 30 34 0A 09 00 0A 09 5C 2F 03  // ...{PC04.....\/.
    0E1F: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    0E2B: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    0E3B: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC04, 0x09), 0x09), 
    0E4A: A0 2A 91 93 7B 50 43 30 34 0A 09 00 0A 09        // .*..{PC04.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    0E58: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    0E68: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC04, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC04, PC00) /* \PC00 */

    0E75: A0 18 7B 50 43 30 34 0A 18 00 5C 2F 03 5F 53 42  // ..{PC04...\/._SB
    0E85: 5F 50 52 30 31 41 50 43 54 70 50 43 30 34 50 43  // _PR01APCTpPC04PC
    0E95: 30 30                                            // 00

            Return (Zero)
        }
    }


    0E97: A4 00                                            // ..

    Scope (\_SB.PR05)
    {

    0E99: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 35           // .L.\._SB_PR05

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    0EA6: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    0EB6: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    0EC4: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    0ED4: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    0EE4: 60                                               // `

            Return (Local0)
        }


    0EE5: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    0EE7: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST05)

    0EEF: 8A 68 00 53 54 30 35                             // .h.ST05

            CreateDWordField (Arg0, 0x04, CP05)

    0EF6: 8A 68 0A 04 43 50 30 35                          // .h..CP05

            If (LOr (LEqual (ST05, 0x06), 
    0EFE: A0 12 91 93 53 54 30 35 0A 06                    // ....ST05..

LEqual (ST05, 0x0A)))
            {

    0F08: 93 53 54 30 35 0A 0A                             // .ST05..

                Return (Zero)
            }


    0F0F: A4 00                                            // ..

            If (And (ST05, One))
            {
                And (CP05, 0x0BFF, CP05) /* \_SB_.PR05.GCAP.CP05 */

    0F11: A0 16 7B 53 54 30 35 01 00 7B 43 50 30 35 0B FF  // ..{ST05..{CP05..
    0F21: 0B 43 50 30 35                                   // .CP05

                Return (Zero)
            }

            Or (And (PC05, 0x7FFFFFFF), CP05, PC05) /* \PC05 */

    0F26: A4 00 7D 7B 50 43 30 35 0C FF FF FF 7F 00 43 50  // ..}{PC05......CP
    0F36: 30 35 50 43 30 35                                // 05PC05

            If (LEqual (And (PC05, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    0F3C: A0 1B 93 7B 50 43 30 35 0A 09 00 0A 09 5C 2F 03  // ...{PC05.....\/.
    0F4C: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    0F58: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    0F68: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC05, 0x09), 0x09), 
    0F77: A0 2A 91 93 7B 50 43 30 35 0A 09 00 0A 09        // .*..{PC05.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    0F85: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    0F95: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC05, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC05, PC00) /* \PC00 */

    0FA2: A0 18 7B 50 43 30 35 0A 18 00 5C 2F 03 5F 53 42  // ..{PC05...\/._SB
    0FB2: 5F 50 52 30 31 41 50 43 54 70 50 43 30 35 50 43  // _PR01APCTpPC05PC
    0FC2: 30 30                                            // 00

            Return (Zero)
        }
    }


    0FC4: A4 00                                            // ..

    Scope (\_SB.PR06)
    {

    0FC6: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 36           // .L.\._SB_PR06

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    0FD3: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    0FE3: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    0FF1: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1001: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1011: 60                                               // `

            Return (Local0)
        }


    1012: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1014: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST06)

    101C: 8A 68 00 53 54 30 36                             // .h.ST06

            CreateDWordField (Arg0, 0x04, CP06)

    1023: 8A 68 0A 04 43 50 30 36                          // .h..CP06

            If (LOr (LEqual (ST06, 0x06), 
    102B: A0 12 91 93 53 54 30 36 0A 06                    // ....ST06..

LEqual (ST06, 0x0A)))
            {

    1035: 93 53 54 30 36 0A 0A                             // .ST06..

                Return (Zero)
            }


    103C: A4 00                                            // ..

            If (And (ST06, One))
            {
                And (CP06, 0x0BFF, CP06) /* \_SB_.PR06.GCAP.CP06 */

    103E: A0 16 7B 53 54 30 36 01 00 7B 43 50 30 36 0B FF  // ..{ST06..{CP06..
    104E: 0B 43 50 30 36                                   // .CP06

                Return (Zero)
            }

            Or (And (PC06, 0x7FFFFFFF), CP06, PC06) /* \PC06 */

    1053: A4 00 7D 7B 50 43 30 36 0C FF FF FF 7F 00 43 50  // ..}{PC06......CP
    1063: 30 36 50 43 30 36                                // 06PC06

            If (LEqual (And (PC06, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1069: A0 1B 93 7B 50 43 30 36 0A 09 00 0A 09 5C 2F 03  // ...{PC06.....\/.
    1079: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1085: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1095: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC06, 0x09), 0x09), 
    10A4: A0 2A 91 93 7B 50 43 30 36 0A 09 00 0A 09        // .*..{PC06.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    10B2: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    10C2: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC06, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC06, PC00) /* \PC00 */

    10CF: A0 18 7B 50 43 30 36 0A 18 00 5C 2F 03 5F 53 42  // ..{PC06...\/._SB
    10DF: 5F 50 52 30 31 41 50 43 54 70 50 43 30 36 50 43  // _PR01APCTpPC06PC
    10EF: 30 30                                            // 00

            Return (Zero)
        }
    }


    10F1: A4 00                                            // ..

    Scope (\_SB.PR07)
    {

    10F3: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 37           // .L.\._SB_PR07

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1100: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1110: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    111E: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    112E: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    113E: 60                                               // `

            Return (Local0)
        }


    113F: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1141: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST07)

    1149: 8A 68 00 53 54 30 37                             // .h.ST07

            CreateDWordField (Arg0, 0x04, CP07)

    1150: 8A 68 0A 04 43 50 30 37                          // .h..CP07

            If (LOr (LEqual (ST07, 0x06), 
    1158: A0 12 91 93 53 54 30 37 0A 06                    // ....ST07..

LEqual (ST07, 0x0A)))
            {

    1162: 93 53 54 30 37 0A 0A                             // .ST07..

                Return (Zero)
            }


    1169: A4 00                                            // ..

            If (And (ST07, One))
            {
                And (CP07, 0x0BFF, CP07) /* \_SB_.PR07.GCAP.CP07 */

    116B: A0 16 7B 53 54 30 37 01 00 7B 43 50 30 37 0B FF  // ..{ST07..{CP07..
    117B: 0B 43 50 30 37                                   // .CP07

                Return (Zero)
            }

            Or (And (PC07, 0x7FFFFFFF), CP07, PC07) /* \PC07 */

    1180: A4 00 7D 7B 50 43 30 37 0C FF FF FF 7F 00 43 50  // ..}{PC07......CP
    1190: 30 37 50 43 30 37                                // 07PC07

            If (LEqual (And (PC07, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1196: A0 1B 93 7B 50 43 30 37 0A 09 00 0A 09 5C 2F 03  // ...{PC07.....\/.
    11A6: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    11B2: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    11C2: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC07, 0x09), 0x09), 
    11D1: A0 2A 91 93 7B 50 43 30 37 0A 09 00 0A 09        // .*..{PC07.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    11DF: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    11EF: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC07, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC07, PC00) /* \PC00 */

    11FC: A0 18 7B 50 43 30 37 0A 18 00 5C 2F 03 5F 53 42  // ..{PC07...\/._SB
    120C: 5F 50 52 30 31 41 50 43 54 70 50 43 30 37 50 43  // _PR01APCTpPC07PC
    121C: 30 30                                            // 00

            Return (Zero)
        }
    }


    121E: A4 00                                            // ..

    Scope (\_SB.PR08)
    {

    1220: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 38           // .L.\._SB_PR08

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    122D: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    123D: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    124B: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    125B: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    126B: 60                                               // `

            Return (Local0)
        }


    126C: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    126E: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST08)

    1276: 8A 68 00 53 54 30 38                             // .h.ST08

            CreateDWordField (Arg0, 0x04, CP08)

    127D: 8A 68 0A 04 43 50 30 38                          // .h..CP08

            If (LOr (LEqual (ST08, 0x06), 
    1285: A0 12 91 93 53 54 30 38 0A 06                    // ....ST08..

LEqual (ST08, 0x0A)))
            {

    128F: 93 53 54 30 38 0A 0A                             // .ST08..

                Return (Zero)
            }


    1296: A4 00                                            // ..

            If (And (ST08, One))
            {
                And (CP08, 0x0BFF, CP08) /* \_SB_.PR08.GCAP.CP08 */

    1298: A0 16 7B 53 54 30 38 01 00 7B 43 50 30 38 0B FF  // ..{ST08..{CP08..
    12A8: 0B 43 50 30 38                                   // .CP08

                Return (Zero)
            }

            Or (And (PC08, 0x7FFFFFFF), CP08, PC08) /* \PC08 */

    12AD: A4 00 7D 7B 50 43 30 38 0C FF FF FF 7F 00 43 50  // ..}{PC08......CP
    12BD: 30 38 50 43 30 38                                // 08PC08

            If (LEqual (And (PC08, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    12C3: A0 1B 93 7B 50 43 30 38 0A 09 00 0A 09 5C 2F 03  // ...{PC08.....\/.
    12D3: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    12DF: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    12EF: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC08, 0x09), 0x09), 
    12FE: A0 2A 91 93 7B 50 43 30 38 0A 09 00 0A 09        // .*..{PC08.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    130C: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    131C: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC08, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC08, PC00) /* \PC00 */

    1329: A0 18 7B 50 43 30 38 0A 18 00 5C 2F 03 5F 53 42  // ..{PC08...\/._SB
    1339: 5F 50 52 30 31 41 50 43 54 70 50 43 30 38 50 43  // _PR01APCTpPC08PC
    1349: 30 30                                            // 00

            Return (Zero)
        }
    }


    134B: A4 00                                            // ..

    Scope (\_SB.PR09)
    {

    134D: 10 4C 12 5C 2E 5F 53 42 5F 50 52 30 39           // .L.\._SB_PR09

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    135A: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    136A: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1378: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1388: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1398: 60                                               // `

            Return (Local0)
        }


    1399: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    139B: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST09)

    13A3: 8A 68 00 53 54 30 39                             // .h.ST09

            CreateDWordField (Arg0, 0x04, CP09)

    13AA: 8A 68 0A 04 43 50 30 39                          // .h..CP09

            If (LOr (LEqual (ST09, 0x06), 
    13B2: A0 12 91 93 53 54 30 39 0A 06                    // ....ST09..

LEqual (ST09, 0x0A)))
            {

    13BC: 93 53 54 30 39 0A 0A                             // .ST09..

                Return (Zero)
            }


    13C3: A4 00                                            // ..

            If (And (ST09, One))
            {
                And (CP09, 0x0BFF, CP09) /* \_SB_.PR09.GCAP.CP09 */

    13C5: A0 16 7B 53 54 30 39 01 00 7B 43 50 30 39 0B FF  // ..{ST09..{CP09..
    13D5: 0B 43 50 30 39                                   // .CP09

                Return (Zero)
            }

            Or (And (PC09, 0x7FFFFFFF), CP09, PC09) /* \PC09 */

    13DA: A4 00 7D 7B 50 43 30 39 0C FF FF FF 7F 00 43 50  // ..}{PC09......CP
    13EA: 30 39 50 43 30 39                                // 09PC09

            If (LEqual (And (PC09, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    13F0: A0 1B 93 7B 50 43 30 39 0A 09 00 0A 09 5C 2F 03  // ...{PC09.....\/.
    1400: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    140C: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    141C: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC09, 0x09), 0x09), 
    142B: A0 2A 91 93 7B 50 43 30 39 0A 09 00 0A 09        // .*..{PC09.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1439: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1449: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC09, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC09, PC00) /* \PC00 */

    1456: A0 18 7B 50 43 30 39 0A 18 00 5C 2F 03 5F 53 42  // ..{PC09...\/._SB
    1466: 5F 50 52 30 31 41 50 43 54 70 50 43 30 39 50 43  // _PR01APCTpPC09PC
    1476: 30 30                                            // 00

            Return (Zero)
        }
    }


    1478: A4 00                                            // ..

    Scope (\_SB.PR10)
    {

    147A: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 30           // .L.\._SB_PR10

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1487: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1497: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    14A5: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    14B5: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    14C5: 60                                               // `

            Return (Local0)
        }


    14C6: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    14C8: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST10)

    14D0: 8A 68 00 53 54 31 30                             // .h.ST10

            CreateDWordField (Arg0, 0x04, CP10)

    14D7: 8A 68 0A 04 43 50 31 30                          // .h..CP10

            If (LOr (LEqual (ST10, 0x06), 
    14DF: A0 12 91 93 53 54 31 30 0A 06                    // ....ST10..

LEqual (ST10, 0x0A)))
            {

    14E9: 93 53 54 31 30 0A 0A                             // .ST10..

                Return (Zero)
            }


    14F0: A4 00                                            // ..

            If (And (ST10, One))
            {
                And (ST10, 0x0BFF, CP10) /* \_SB_.PR10.GCAP.CP10 */

    14F2: A0 16 7B 53 54 31 30 01 00 7B 53 54 31 30 0B FF  // ..{ST10..{ST10..
    1502: 0B 43 50 31 30                                   // .CP10

                Return (Zero)
            }

            Or (And (PC10, 0x7FFFFFFF), CP10, PC10) /* \PC10 */

    1507: A4 00 7D 7B 50 43 31 30 0C FF FF FF 7F 00 43 50  // ..}{PC10......CP
    1517: 31 30 50 43 31 30                                // 10PC10

            If (LEqual (And (PC10, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    151D: A0 1B 93 7B 50 43 31 30 0A 09 00 0A 09 5C 2F 03  // ...{PC10.....\/.
    152D: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1539: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1549: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC10, 0x09), 0x09), 
    1558: A0 2A 91 93 7B 50 43 31 30 0A 09 00 0A 09        // .*..{PC10.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1566: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1576: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC10, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC10, PC00) /* \PC00 */

    1583: A0 18 7B 50 43 31 30 0A 18 00 5C 2F 03 5F 53 42  // ..{PC10...\/._SB
    1593: 5F 50 52 30 31 41 50 43 54 70 50 43 31 30 50 43  // _PR01APCTpPC10PC
    15A3: 30 30                                            // 00

            Return (Zero)
        }
    }


    15A5: A4 00                                            // ..

    Scope (\_SB.PR11)
    {

    15A7: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 31           // .L.\._SB_PR11

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    15B4: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    15C4: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    15D2: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    15E2: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    15F2: 60                                               // `

            Return (Local0)
        }


    15F3: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    15F5: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST11)

    15FD: 8A 68 00 53 54 31 31                             // .h.ST11

            CreateDWordField (Arg0, 0x04, CP11)

    1604: 8A 68 0A 04 43 50 31 31                          // .h..CP11

            If (LOr (LEqual (ST11, 0x06), 
    160C: A0 12 91 93 53 54 31 31 0A 06                    // ....ST11..

LEqual (ST11, 0x0A)))
            {

    1616: 93 53 54 31 31 0A 0A                             // .ST11..

                Return (Zero)
            }


    161D: A4 00                                            // ..

            If (And (ST11, One))
            {
                And (ST11, 0x0BFF, CP11) /* \_SB_.PR11.GCAP.CP11 */

    161F: A0 16 7B 53 54 31 31 01 00 7B 53 54 31 31 0B FF  // ..{ST11..{ST11..
    162F: 0B 43 50 31 31                                   // .CP11

                Return (Zero)
            }

            Or (And (PC11, 0x7FFFFFFF), CP11, PC11) /* \PC11 */

    1634: A4 00 7D 7B 50 43 31 31 0C FF FF FF 7F 00 43 50  // ..}{PC11......CP
    1644: 31 31 50 43 31 31                                // 11PC11

            If (LEqual (And (PC11, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    164A: A0 1B 93 7B 50 43 31 31 0A 09 00 0A 09 5C 2F 03  // ...{PC11.....\/.
    165A: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1666: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1676: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC11, 0x09), 0x09), 
    1685: A0 2A 91 93 7B 50 43 31 31 0A 09 00 0A 09        // .*..{PC11.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1693: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    16A3: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC11, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC11, PC00) /* \PC00 */

    16B0: A0 18 7B 50 43 31 31 0A 18 00 5C 2F 03 5F 53 42  // ..{PC11...\/._SB
    16C0: 5F 50 52 30 31 41 50 43 54 70 50 43 31 31 50 43  // _PR01APCTpPC11PC
    16D0: 30 30                                            // 00

            Return (Zero)
        }
    }


    16D2: A4 00                                            // ..

    Scope (\_SB.PR12)
    {

    16D4: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 32           // .L.\._SB_PR12

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    16E1: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    16F1: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    16FF: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    170F: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    171F: 60                                               // `

            Return (Local0)
        }


    1720: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1722: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST12)

    172A: 8A 68 00 53 54 31 32                             // .h.ST12

            CreateDWordField (Arg0, 0x04, CP12)

    1731: 8A 68 0A 04 43 50 31 32                          // .h..CP12

            If (LOr (LEqual (ST12, 0x06), 
    1739: A0 12 91 93 53 54 31 32 0A 06                    // ....ST12..

LEqual (ST12, 0x0A)))
            {

    1743: 93 53 54 31 32 0A 0A                             // .ST12..

                Return (Zero)
            }


    174A: A4 00                                            // ..

            If (And (ST12, One))
            {
                And (ST12, 0x0BFF, CP12) /* \_SB_.PR12.GCAP.CP12 */

    174C: A0 16 7B 53 54 31 32 01 00 7B 53 54 31 32 0B FF  // ..{ST12..{ST12..
    175C: 0B 43 50 31 32                                   // .CP12

                Return (Zero)
            }

            Or (And (PC12, 0x7FFFFFFF), CP12, PC12) /* \PC12 */

    1761: A4 00 7D 7B 50 43 31 32 0C FF FF FF 7F 00 43 50  // ..}{PC12......CP
    1771: 31 32 50 43 31 32                                // 12PC12

            If (LEqual (And (PC12, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1777: A0 1B 93 7B 50 43 31 32 0A 09 00 0A 09 5C 2F 03  // ...{PC12.....\/.
    1787: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1793: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    17A3: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC12, 0x09), 0x09), 
    17B2: A0 2A 91 93 7B 50 43 31 32 0A 09 00 0A 09        // .*..{PC12.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    17C0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    17D0: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC12, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC12, PC00) /* \PC00 */

    17DD: A0 18 7B 50 43 31 32 0A 18 00 5C 2F 03 5F 53 42  // ..{PC12...\/._SB
    17ED: 5F 50 52 30 31 41 50 43 54 70 50 43 31 32 50 43  // _PR01APCTpPC12PC
    17FD: 30 30                                            // 00

            Return (Zero)
        }
    }


    17FF: A4 00                                            // ..

    Scope (\_SB.PR13)
    {

    1801: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 33           // .L.\._SB_PR13

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    180E: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    181E: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    182C: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    183C: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    184C: 60                                               // `

            Return (Local0)
        }


    184D: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    184F: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST13)

    1857: 8A 68 00 53 54 31 33                             // .h.ST13

            CreateDWordField (Arg0, 0x04, CP13)

    185E: 8A 68 0A 04 43 50 31 33                          // .h..CP13

            If (LOr (LEqual (ST13, 0x06), 
    1866: A0 12 91 93 53 54 31 33 0A 06                    // ....ST13..

LEqual (ST13, 0x0A)))
            {

    1870: 93 53 54 31 33 0A 0A                             // .ST13..

                Return (Zero)
            }


    1877: A4 00                                            // ..

            If (And (ST13, One))
            {
                And (ST13, 0x0BFF, CP13) /* \_SB_.PR13.GCAP.CP13 */

    1879: A0 16 7B 53 54 31 33 01 00 7B 53 54 31 33 0B FF  // ..{ST13..{ST13..
    1889: 0B 43 50 31 33                                   // .CP13

                Return (Zero)
            }

            Or (And (PC13, 0x7FFFFFFF), CP13, PC13) /* \PC13 */

    188E: A4 00 7D 7B 50 43 31 33 0C FF FF FF 7F 00 43 50  // ..}{PC13......CP
    189E: 31 33 50 43 31 33                                // 13PC13

            If (LEqual (And (PC13, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    18A4: A0 1B 93 7B 50 43 31 33 0A 09 00 0A 09 5C 2F 03  // ...{PC13.....\/.
    18B4: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    18C0: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    18D0: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC13, 0x09), 0x09), 
    18DF: A0 2A 91 93 7B 50 43 31 33 0A 09 00 0A 09        // .*..{PC13.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    18ED: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    18FD: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC13, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC13, PC00) /* \PC00 */

    190A: A0 18 7B 50 43 31 33 0A 18 00 5C 2F 03 5F 53 42  // ..{PC13...\/._SB
    191A: 5F 50 52 30 31 41 50 43 54 70 50 43 31 33 50 43  // _PR01APCTpPC13PC
    192A: 30 30                                            // 00

            Return (Zero)
        }
    }


    192C: A4 00                                            // ..

    Scope (\_SB.PR14)
    {

    192E: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 34           // .L.\._SB_PR14

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    193B: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    194B: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1959: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1969: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1979: 60                                               // `

            Return (Local0)
        }


    197A: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    197C: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST14)

    1984: 8A 68 00 53 54 31 34                             // .h.ST14

            CreateDWordField (Arg0, 0x04, CP14)

    198B: 8A 68 0A 04 43 50 31 34                          // .h..CP14

            If (LOr (LEqual (ST14, 0x06), 
    1993: A0 12 91 93 53 54 31 34 0A 06                    // ....ST14..

LEqual (ST14, 0x0A)))
            {

    199D: 93 53 54 31 34 0A 0A                             // .ST14..

                Return (Zero)
            }


    19A4: A4 00                                            // ..

            If (And (ST14, One))
            {
                And (ST14, 0x0BFF, CP14) /* \_SB_.PR14.GCAP.CP14 */

    19A6: A0 16 7B 53 54 31 34 01 00 7B 53 54 31 34 0B FF  // ..{ST14..{ST14..
    19B6: 0B 43 50 31 34                                   // .CP14

                Return (Zero)
            }

            Or (And (PC14, 0x7FFFFFFF), CP14, PC14) /* \PC14 */

    19BB: A4 00 7D 7B 50 43 31 34 0C FF FF FF 7F 00 43 50  // ..}{PC14......CP
    19CB: 31 34 50 43 31 34                                // 14PC14

            If (LEqual (And (PC14, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    19D1: A0 1B 93 7B 50 43 31 34 0A 09 00 0A 09 5C 2F 03  // ...{PC14.....\/.
    19E1: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    19ED: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    19FD: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC14, 0x09), 0x09), 
    1A0C: A0 2A 91 93 7B 50 43 31 34 0A 09 00 0A 09        // .*..{PC14.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1A1A: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1A2A: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC14, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC14, PC00) /* \PC00 */

    1A37: A0 18 7B 50 43 31 34 0A 18 00 5C 2F 03 5F 53 42  // ..{PC14...\/._SB
    1A47: 5F 50 52 30 31 41 50 43 54 70 50 43 31 34 50 43  // _PR01APCTpPC14PC
    1A57: 30 30                                            // 00

            Return (Zero)
        }
    }


    1A59: A4 00                                            // ..

    Scope (\_SB.PR15)
    {

    1A5B: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 35           // .L.\._SB_PR15

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1A68: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1A78: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1A86: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1A96: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1AA6: 60                                               // `

            Return (Local0)
        }


    1AA7: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1AA9: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST15)

    1AB1: 8A 68 00 53 54 31 35                             // .h.ST15

            CreateDWordField (Arg0, 0x04, CP15)

    1AB8: 8A 68 0A 04 43 50 31 35                          // .h..CP15

            If (LOr (LEqual (ST15, 0x06), 
    1AC0: A0 12 91 93 53 54 31 35 0A 06                    // ....ST15..

LEqual (ST15, 0x0A)))
            {

    1ACA: 93 53 54 31 35 0A 0A                             // .ST15..

                Return (Zero)
            }


    1AD1: A4 00                                            // ..

            If (And (ST15, One))
            {
                And (ST15, 0x0BFF, CP15) /* \_SB_.PR15.GCAP.CP15 */

    1AD3: A0 16 7B 53 54 31 35 01 00 7B 53 54 31 35 0B FF  // ..{ST15..{ST15..
    1AE3: 0B 43 50 31 35                                   // .CP15

                Return (Zero)
            }

            Or (And (PC15, 0x7FFFFFFF), CP15, PC15) /* \PC15 */

    1AE8: A4 00 7D 7B 50 43 31 35 0C FF FF FF 7F 00 43 50  // ..}{PC15......CP
    1AF8: 31 35 50 43 31 35                                // 15PC15

            If (LEqual (And (PC15, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1AFE: A0 1B 93 7B 50 43 31 35 0A 09 00 0A 09 5C 2F 03  // ...{PC15.....\/.
    1B0E: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1B1A: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1B2A: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC15, 0x09), 0x09), 
    1B39: A0 2A 91 93 7B 50 43 31 35 0A 09 00 0A 09        // .*..{PC15.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1B47: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1B57: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC15, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC15, PC00) /* \PC00 */

    1B64: A0 18 7B 50 43 31 35 0A 18 00 5C 2F 03 5F 53 42  // ..{PC15...\/._SB
    1B74: 5F 50 52 30 31 41 50 43 54 70 50 43 31 35 50 43  // _PR01APCTpPC15PC
    1B84: 30 30                                            // 00

            Return (Zero)
        }
    }


    1B86: A4 00                                            // ..

    Scope (\_SB.PR16)
    {

    1B88: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 36           // .L.\._SB_PR16

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1B95: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1BA5: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1BB3: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1BC3: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1BD3: 60                                               // `

            Return (Local0)
        }


    1BD4: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1BD6: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST16)

    1BDE: 8A 68 00 53 54 31 36                             // .h.ST16

            CreateDWordField (Arg0, 0x04, CP16)

    1BE5: 8A 68 0A 04 43 50 31 36                          // .h..CP16

            If (LOr (LEqual (ST16, 0x06), 
    1BED: A0 12 91 93 53 54 31 36 0A 06                    // ....ST16..

LEqual (ST16, 0x0A)))
            {

    1BF7: 93 53 54 31 36 0A 0A                             // .ST16..

                Return (Zero)
            }


    1BFE: A4 00                                            // ..

            If (And (ST16, One))
            {
                And (ST16, 0x0BFF, CP16) /* \_SB_.PR16.GCAP.CP16 */

    1C00: A0 16 7B 53 54 31 36 01 00 7B 53 54 31 36 0B FF  // ..{ST16..{ST16..
    1C10: 0B 43 50 31 36                                   // .CP16

                Return (Zero)
            }

            Or (And (PC16, 0x7FFFFFFF), CP16, PC16) /* \PC16 */

    1C15: A4 00 7D 7B 50 43 31 36 0C FF FF FF 7F 00 43 50  // ..}{PC16......CP
    1C25: 31 36 50 43 31 36                                // 16PC16

            If (LEqual (And (PC16, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1C2B: A0 1B 93 7B 50 43 31 36 0A 09 00 0A 09 5C 2F 03  // ...{PC16.....\/.
    1C3B: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1C47: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1C57: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC16, 0x09), 0x09), 
    1C66: A0 2A 91 93 7B 50 43 31 36 0A 09 00 0A 09        // .*..{PC16.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1C74: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1C84: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC16, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC16, PC00) /* \PC00 */

    1C91: A0 18 7B 50 43 31 36 0A 18 00 5C 2F 03 5F 53 42  // ..{PC16...\/._SB
    1CA1: 5F 50 52 30 31 41 50 43 54 70 50 43 31 36 50 43  // _PR01APCTpPC16PC
    1CB1: 30 30                                            // 00

            Return (Zero)
        }
    }


    1CB3: A4 00                                            // ..

    Scope (\_SB.PR17)
    {

    1CB5: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 37           // .L.\._SB_PR17

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1CC2: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1CD2: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1CE0: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1CF0: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1D00: 60                                               // `

            Return (Local0)
        }


    1D01: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1D03: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST17)

    1D0B: 8A 68 00 53 54 31 37                             // .h.ST17

            CreateDWordField (Arg0, 0x04, CP17)

    1D12: 8A 68 0A 04 43 50 31 37                          // .h..CP17

            If (LOr (LEqual (ST17, 0x06), 
    1D1A: A0 12 91 93 53 54 31 37 0A 06                    // ....ST17..

LEqual (ST17, 0x0A)))
            {

    1D24: 93 53 54 31 37 0A 0A                             // .ST17..

                Return (Zero)
            }


    1D2B: A4 00                                            // ..

            If (And (ST17, One))
            {
                And (ST17, 0x0BFF, CP17) /* \_SB_.PR17.GCAP.CP17 */

    1D2D: A0 16 7B 53 54 31 37 01 00 7B 53 54 31 37 0B FF  // ..{ST17..{ST17..
    1D3D: 0B 43 50 31 37                                   // .CP17

                Return (Zero)
            }

            Or (And (PC17, 0x7FFFFFFF), CP17, PC17) /* \PC17 */

    1D42: A4 00 7D 7B 50 43 31 37 0C FF FF FF 7F 00 43 50  // ..}{PC17......CP
    1D52: 31 37 50 43 31 37                                // 17PC17

            If (LEqual (And (PC17, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1D58: A0 1B 93 7B 50 43 31 37 0A 09 00 0A 09 5C 2F 03  // ...{PC17.....\/.
    1D68: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1D74: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1D84: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC17, 0x09), 0x09), 
    1D93: A0 2A 91 93 7B 50 43 31 37 0A 09 00 0A 09        // .*..{PC17.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1DA1: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1DB1: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC17, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC17, PC00) /* \PC00 */

    1DBE: A0 18 7B 50 43 31 37 0A 18 00 5C 2F 03 5F 53 42  // ..{PC17...\/._SB
    1DCE: 5F 50 52 30 31 41 50 43 54 70 50 43 31 37 50 43  // _PR01APCTpPC17PC
    1DDE: 30 30                                            // 00

            Return (Zero)
        }
    }


    1DE0: A4 00                                            // ..

    Scope (\_SB.PR18)
    {

    1DE2: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 38           // .L.\._SB_PR18

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1DEF: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1DFF: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1E0D: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1E1D: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1E2D: 60                                               // `

            Return (Local0)
        }


    1E2E: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1E30: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST18)

    1E38: 8A 68 00 53 54 31 38                             // .h.ST18

            CreateDWordField (Arg0, 0x04, CP18)

    1E3F: 8A 68 0A 04 43 50 31 38                          // .h..CP18

            If (LOr (LEqual (ST18, 0x06), 
    1E47: A0 12 91 93 53 54 31 38 0A 06                    // ....ST18..

LEqual (ST18, 0x0A)))
            {

    1E51: 93 53 54 31 38 0A 0A                             // .ST18..

                Return (Zero)
            }


    1E58: A4 00                                            // ..

            If (And (ST18, One))
            {
                And (ST18, 0x0BFF, CP18) /* \_SB_.PR18.GCAP.CP18 */

    1E5A: A0 16 7B 53 54 31 38 01 00 7B 53 54 31 38 0B FF  // ..{ST18..{ST18..
    1E6A: 0B 43 50 31 38                                   // .CP18

                Return (Zero)
            }

            Or (And (PC18, 0x7FFFFFFF), CP18, PC18) /* \PC18 */

    1E6F: A4 00 7D 7B 50 43 31 38 0C FF FF FF 7F 00 43 50  // ..}{PC18......CP
    1E7F: 31 38 50 43 31 38                                // 18PC18

            If (LEqual (And (PC18, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1E85: A0 1B 93 7B 50 43 31 38 0A 09 00 0A 09 5C 2F 03  // ...{PC18.....\/.
    1E95: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1EA1: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1EB1: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC18, 0x09), 0x09), 
    1EC0: A0 2A 91 93 7B 50 43 31 38 0A 09 00 0A 09        // .*..{PC18.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1ECE: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    1EDE: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC18, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC18, PC00) /* \PC00 */

    1EEB: A0 18 7B 50 43 31 38 0A 18 00 5C 2F 03 5F 53 42  // ..{PC18...\/._SB
    1EFB: 5F 50 52 30 31 41 50 43 54 70 50 43 31 38 50 43  // _PR01APCTpPC18PC
    1F0B: 30 30                                            // 00

            Return (Zero)
        }
    }


    1F0D: A4 00                                            // ..

    Scope (\_SB.PR19)
    {

    1F0F: 10 4C 12 5C 2E 5F 53 42 5F 50 52 31 39           // .L.\._SB_PR19

        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_SB.PR00.CPDC (Arg0), Local0)
            GCAP (Local0)
        }


    1F1C: 14 1D 5F 50 44 43 01 70 5C 2F 03 5F 53 42 5F 50  // .._PDC.p\/._SB_P
    1F2C: 52 30 30 43 50 44 43 68 60 47 43 41 50 60        // R00CPDCh`GCAP`

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_SB.PR00.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)

    1F3A: 14 22 5F 4F 53 43 04 70 5C 2F 03 5F 53 42 5F 50  // ."_OSC.p\/._SB_P
    1F4A: 52 30 30 43 4F 53 43 68 69 6A 6B 60 47 43 41 50  // R00COSChijk`GCAP
    1F5A: 60                                               // `

            Return (Local0)
        }


    1F5B: A4 60                                            // .`

        Method (GCAP, 1, NotSerialized)
        {

    1F5D: 14 4E 0D 47 43 41 50 01                          // .N.GCAP.

            CreateDWordField (Arg0, Zero, ST19)

    1F65: 8A 68 00 53 54 31 39                             // .h.ST19

            CreateDWordField (Arg0, 0x04, CP19)

    1F6C: 8A 68 0A 04 43 50 31 39                          // .h..CP19

            If (LOr (LEqual (ST19, 0x06), 
    1F74: A0 12 91 93 53 54 31 39 0A 06                    // ....ST19..

LEqual (ST19, 0x0A)))
            {

    1F7E: 93 53 54 31 39 0A 0A                             // .ST19..

                Return (Zero)
            }


    1F85: A4 00                                            // ..

            If (And (ST19, One))
            {
                And (ST19, 0x0BFF, CP19) /* \_SB_.PR19.GCAP.CP19 */

    1F87: A0 16 7B 53 54 31 39 01 00 7B 53 54 31 39 0B FF  // ..{ST19..{ST19..
    1F97: 0B 43 50 31 39                                   // .CP19

                Return (Zero)
            }

            Or (And (PC19, 0x7FFFFFFF), CP19, PC19) /* \PC19 */

    1F9C: A4 00 7D 7B 50 43 31 39 0C FF FF FF 7F 00 43 50  // ..}{PC19......CP
    1FAC: 31 39 50 43 31 39                                // 19PC19

            If (LEqual (And (PC19, 0x09), 0x09))
            {
                \_SB.PR01.APPT ()
            }


    1FB2: A0 1B 93 7B 50 43 31 39 0A 09 00 0A 09 5C 2F 03  // ...{PC19.....\/.
    1FC2: 5F 53 42 5F 50 52 30 31 41 50 50 54              // _SB_PR01APPT

            If (And (\_SB.OSCP, 0x20))
            {
                \_SB.PR01.HWPT ()
            }


    1FCE: A0 1E 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00  // ..{\._SB_OSCP. .
    1FDE: 5C 2F 03 5F 53 42 5F 50 52 30 31 48 57 50 54     // \/._SB_PR01HWPT

            If (LOr (LEqual (And (PC19, 0x09), 0x09), 
    1FED: A0 2A 91 93 7B 50 43 31 39 0A 09 00 0A 09        // .*..{PC19.....

And (\_SB.OSCP, 0x20)))
            {
                \_SB.PR01.APPS ()
            }


    1FFB: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0A 20 00 5C 2F  // {\._SB_OSCP. .\/
    200B: 03 5F 53 42 5F 50 52 30 31 41 50 50 53           // ._SB_PR01APPS

            If (And (PC19, 0x18))
            {
                \_SB.PR01.APCT ()
            }

            Store (PC19, PC00) /* \PC00 */

    2018: A0 18 7B 50 43 31 39 0A 18 00 5C 2F 03 5F 53 42  // ..{PC19...\/._SB
    2028: 5F 50 52 30 31 41 50 43 54 70 50 43 31 39 50 43  // _PR01APCTpPC19PC
    2038: 30 30                                            // 00

            Return (Zero)
        }
    }


    203A: A4 00                                            // ..

    Scope (\_SB)
    {

    203C: 10 40 07 5C 5F 53 42 5F                          // .@.\_SB_

        If (LEqual (TXTE, One))
        {

    2044: A0 48 06 93 54 58 54 45 01                       // .H..TXTE.

            Device (ACM)
            {

    204D: 5B 82 4E 05 41 43 4D 5F                          // [.N.ACM_

                Name (_HID, "INTC1025")  // _HID: Hardware ID

    2055: 08 5F 48 49 44 0D 49 4E 54 43 31 30 32 35 00     // ._HID.INTC1025.

                Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
                {
                    And (CPID, 0xFFFFFFF0, Local0)

    2064: 14 48 04 5F 43 49 44 00 7B 43 50 49 44 0C F0 FF  // .H._CID.{CPID...
    2074: FF FF 60                                         // ..`

                    If (LAnd (LEqual (Local0, 0x000A0650), 
    2077: A0 25 90 93 60 0C 50 06 0A 00                    // .%..`.P...


    2081: 92                                               // .

LNotEqual (CPID, 0x000A0652)))
                    {

    2082: 93 43 50 49 44 0C 52 06 0A 00                    // .CPID.R...

                        Return ("INT_CMLS_SINIT")
                    }


    208C: A4 0D 49 4E 54 5F 43 4D 4C 53 5F 53 49 4E 49 54  // ..INT_CMLS_SINIT
    209C: 00                                               // .

                    Return ("INT_CML_SINIT")
                }
            }
        }
    }
}



Table Header:
Table Body (Length 0x20AD)
