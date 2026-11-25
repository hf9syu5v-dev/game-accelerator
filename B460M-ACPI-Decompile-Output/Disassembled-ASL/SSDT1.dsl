{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.B0D3, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.HDOS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.HNOT, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.IPU0, DeviceObj)
    External (CPSC, UnknownObj)
    External (DSEN, UnknownObj)
    External (ECON, IntObj)
    External (GUAM, MethodObj)    // 1 Arguments
    External (OSYS, IntObj)
    External (PNHM, IntObj)
    External (S0ID, UnknownObj)


    0024: A0 46 0A 00 15 5C 2E 5F 53 42 5F 50 43 49 30 06  // .F...\._SB_PCI0.
    0034: 00 15 5C 2F 03 5F 53 42 5F 50 43 49 30 47 46 58  // ..\/._SB_PCI0GFX
    0044: 30 06 00 15 5C 2F 03 5F 53 42 5F 50 43 49 30 49  // 0...\/._SB_PCI0I
    0054: 50 55 30 06 00 15 5C 2F 03 5F 53 42 5F 50 43 49  // PU0...\/._SB_PCI
    0064: 30 42 30 44 33 06 00 15 5C 2F 04 5F 53 42 5F 50  // 0B0D3...\/._SB_P
    0074: 43 49 30 47 46 58 30 48 44 4F 53 08 00 15 5C 45  // CI0GFX0HDOS...\E
    0084: 43 4F 4E 01 00 15 5C 50 4E 48 4D 01 00 15 4F 53  // CON...\PNHM...OS
    0094: 59 53 01 00 15 43 50 53 43 00 00 15 5C 47 55 41  // YS...CPSC...\GUA
    00A4: 4D 08 01 15 44 53 45 4E 00 00 15 53 30 49 44 00  // M...DSEN...S0ID.
    00B4: 00 15 5C 2F 04 5F 53 42 5F 50 43 49 30 47 46 58  // ..\/._SB_PCI0GFX
    00C4: 30 48 4E 4F 54 08 01                             // 0HNOT..

    OperationRegion (SANV, SystemMemory, 0x5D36C098, 0x01F4)

    00CB: 5B 80 53 41 4E 56 00 0C 98 C0 36 5D 0B F4 01     // [.SANV....6]...

    Field (SANV, AnyAcc, Lock, Preserve)
    {
        ASLB,   32, 
        IMON,   8, 
        IGDS,   8, 
        IBTT,   8, 
        IPAT,   8, 
        IPSC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        GSMI,   8, 
        PAVP,   8, 
        CADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        DID9,   32, 
        DIDA,   32, 
        DIDB,   32, 
        DIDC,   32, 
        DIDD,   32, 
        DIDE,   32, 
        DIDF,   32, 
        DIDX,   32, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        NXDX,   32, 
        LIDS,   8, 
        KSV0,   32, 
        KSV1,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        ALFP,   8, 
        IPTP,   8, 
        EDPV,   8, 
        SGMD,   8, 
        SGFL,   8, 
        SGGP,   8, 
        HRE0,   8, 
        HRG0,   32, 
        HRA0,   8, 
        PWE0,   8, 
        PWG0,   32, 
        PWA0,   8, 
        P1GP,   8, 
        HRE1,   8, 
        HRG1,   32, 
        HRA1,   8, 
        PWE1,   8, 
        PWG1,   32, 
        PWA1,   8, 
        P2GP,   8, 
        HRE2,   8, 
        HRG2,   32, 
        HRA2,   8, 
        PWE2,   8, 
        PWG2,   32, 
        PWA2,   8, 
        DLPW,   16, 
        DLHR,   16, 
        EECP,   8, 
        XBAS,   32, 
        GBAS,   16, 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        LTRX,   8, 
        OBFX,   8, 
        LTRY,   8, 
        OBFY,   8, 
        LTRZ,   8, 
        OBFZ,   8, 
        LTRW,   8, 
        OBFA,   8, 
        SMSL,   16, 
        SNSL,   16, 
        P0UB,   8, 
        P1UB,   8, 
        P2UB,   8, 
        P3UB,   8, 
        PCSL,   8, 
        PBGE,   8, 
        M64B,   64, 
        M64L,   64, 
        CPEX,   32, 
        EEC1,   8, 
        EEC2,   8, 
        SBN0,   8, 
        SBN1,   8, 
        SBN2,   8, 
        M32B,   32, 
        M32L,   32, 
        P0WK,   32, 
        P1WK,   32, 
        P2WK,   32, 
        VTDS,   8, 
        VTB1,   32, 
        VTB2,   32, 
        VTB3,   32, 
        VE1V,   16, 
        VE2V,   16, 
        SBN3,   8, 
        P3GP,   8, 
        HRE3,   8, 
        HRG3,   32, 
        HRA3,   8, 
        PWE3,   8, 
        PWG3,   32, 
        PWA3,   8, 
        P3WK,   32, 
        EEC3,   8, 
        RPIN,   8, 
        RPBA,   32, 
        DGOP,   32, 
        P0SC,   8, 
        P1SC,   8, 
        P2SC,   8, 
        Offset (0x1F4)
    }


    00DA: 5B 81 4F 2A 53 41 4E 56 10 41 53 4C 42 20 49 4D  // [.O*SANV.ASLB IM
    00EA: 4F 4E 08 49 47 44 53 08 49 42 54 54 08 49 50 41  // ON.IGDS.IBTT.IPA
    00FA: 54 08 49 50 53 43 08 49 42 49 41 08 49 53 53 43  // T.IPSC.IBIA.ISSC
    010A: 08 49 44 4D 53 08 49 46 31 45 08 48 56 43 4F 08  // .IDMS.IF1E.HVCO.
    011A: 47 53 4D 49 08 50 41 56 50 08 43 41 44 4C 08 43  // GSMI.PAVP.CADL.C
    012A: 53 54 45 10 4E 53 54 45 10 4E 44 49 44 08 44 49  // STE.NSTE.NDID.DI
    013A: 44 31 20 44 49 44 32 20 44 49 44 33 20 44 49 44  // D1 DID2 DID3 DID
    014A: 34 20 44 49 44 35 20 44 49 44 36 20 44 49 44 37  // 4 DID5 DID6 DID7
    015A: 20 44 49 44 38 20 44 49 44 39 20 44 49 44 41 20  //  DID8 DID9 DIDA 
    016A: 44 49 44 42 20 44 49 44 43 20 44 49 44 44 20 44  // DIDB DIDC DIDD D
    017A: 49 44 45 20 44 49 44 46 20 44 49 44 58 20 4E 58  // IDE DIDF DIDX NX
    018A: 44 31 20 4E 58 44 32 20 4E 58 44 33 20 4E 58 44  // D1 NXD2 NXD3 NXD
    019A: 34 20 4E 58 44 35 20 4E 58 44 36 20 4E 58 44 37  // 4 NXD5 NXD6 NXD7
    01AA: 20 4E 58 44 38 20 4E 58 44 58 20 4C 49 44 53 08  //  NXD8 NXDX LIDS.
    01BA: 4B 53 56 30 20 4B 53 56 31 08 42 52 54 4C 08 41  // KSV0 KSV1.BRTL.A
    01CA: 4C 53 45 08 41 4C 41 46 08 4C 4C 4F 57 08 4C 48  // LSE.ALAF.LLOW.LH
    01DA: 49 48 08 41 4C 46 50 08 49 50 54 50 08 45 44 50  // IH.ALFP.IPTP.EDP
    01EA: 56 08 53 47 4D 44 08 53 47 46 4C 08 53 47 47 50  // V.SGMD.SGFL.SGGP
    01FA: 08 48 52 45 30 08 48 52 47 30 20 48 52 41 30 08  // .HRE0.HRG0 HRA0.
    020A: 50 57 45 30 08 50 57 47 30 20 50 57 41 30 08 50  // PWE0.PWG0 PWA0.P
    021A: 31 47 50 08 48 52 45 31 08 48 52 47 31 20 48 52  // 1GP.HRE1.HRG1 HR
    022A: 41 31 08 50 57 45 31 08 50 57 47 31 20 50 57 41  // A1.PWE1.PWG1 PWA
    023A: 31 08 50 32 47 50 08 48 52 45 32 08 48 52 47 32  // 1.P2GP.HRE2.HRG2
    024A: 20 48 52 41 32 08 50 57 45 32 08 50 57 47 32 20  //  HRA2.PWE2.PWG2 
    025A: 50 57 41 32 08 44 4C 50 57 10 44 4C 48 52 10 45  // PWA2.DLPW.DLHR.E
    026A: 45 43 50 08 58 42 41 53 20 47 42 41 53 10 4E 56  // ECP.XBAS GBAS.NV
    027A: 47 41 20 4E 56 48 41 20 41 4D 44 41 20 4C 54 52  // GA NVHA AMDA LTR
    028A: 58 08 4F 42 46 58 08 4C 54 52 59 08 4F 42 46 59  // X.OBFX.LTRY.OBFY
    029A: 08 4C 54 52 5A 08 4F 42 46 5A 08 4C 54 52 57 08  // .LTRZ.OBFZ.LTRW.
    02AA: 4F 42 46 41 08 53 4D 53 4C 10 53 4E 53 4C 10 50  // OBFA.SMSL.SNSL.P
    02BA: 30 55 42 08 50 31 55 42 08 50 32 55 42 08 50 33  // 0UB.P1UB.P2UB.P3
    02CA: 55 42 08 50 43 53 4C 08 50 42 47 45 08 4D 36 34  // UB.PCSL.PBGE.M64
    02DA: 42 40 04 4D 36 34 4C 40 04 43 50 45 58 20 45 45  // B@.M64L@.CPEX EE
    02EA: 43 31 08 45 45 43 32 08 53 42 4E 30 08 53 42 4E  // C1.EEC2.SBN0.SBN
    02FA: 31 08 53 42 4E 32 08 4D 33 32 42 20 4D 33 32 4C  // 1.SBN2.M32B M32L
    030A: 20 50 30 57 4B 20 50 31 57 4B 20 50 32 57 4B 20  //  P0WK P1WK P2WK 
    031A: 56 54 44 53 08 56 54 42 31 20 56 54 42 32 20 56  // VTDS.VTB1 VTB2 V
    032A: 54 42 33 20 56 45 31 56 10 56 45 32 56 10 53 42  // TB3 VE1V.VE2V.SB
    033A: 4E 33 08 50 33 47 50 08 48 52 45 33 08 48 52 47  // N3.P3GP.HRE3.HRG
    034A: 33 20 48 52 41 33 08 50 57 45 33 08 50 57 47 33  // 3 HRA3.PWE3.PWG3
    035A: 20 50 57 41 33 08 50 33 57 4B 20 45 45 43 33 08  //  PWA3.P3WK EEC3.
    036A: 52 50 49 4E 08 52 50 42 41 20 44 47 4F 50 20 50  // RPIN.RPBA DGOP P
    037A: 30 53 43 08 50 31 53 43 08 50 32 53 43 08 00 48  // 0SC.P1SC.P2SC..H
    038A: 5E                                               // ^

    Scope (\_SB.PCI0.GFX0)
    {

    038B: 10 8C C8 02 5C 2F 03 5F 53 42 5F 50 43 49 30 47  // ....\/._SB_PCI0G
    039B: 46 58 30                                         // FX0

        Name (TMP1, 
    039E: 08 54 4D 50 31                                   // .TMP1

Package (0x01)
        {
            0xFFFFFFFF
        })

    03A3: 12 07 01 0C FF FF FF FF                          // ........

        Name (TMP2, 
    03AB: 08 54 4D 50 32                                   // .TMP2

Package (0x02)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    03B0: 12 0C 02 0C FF FF FF FF 0C FF FF FF FF           // .............

        Name (TMP3, 
    03BD: 08 54 4D 50 33                                   // .TMP3

Package (0x03)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    03C2: 12 11 03 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    03D2: FF FF                                            // ..

        Name (TMP4, 
    03D4: 08 54 4D 50 34                                   // .TMP4

Package (0x04)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    03D9: 12 16 04 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    03E9: FF FF 0C FF FF FF FF                             // .......

        Name (TMP5, 
    03F0: 08 54 4D 50 35                                   // .TMP5

Package (0x05)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    03F5: 12 1B 05 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    0405: FF FF 0C FF FF FF FF 0C FF FF FF FF              // ............

        Name (TMP6, 
    0411: 08 54 4D 50 36                                   // .TMP6

Package (0x06)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0416: 12 20 06 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // . ..............
    0426: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    0436: FF                                               // .

        Name (TMP7, 
    0437: 08 54 4D 50 37                                   // .TMP7

Package (0x07)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    043C: 12 25 07 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // .%..............
    044C: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    045C: FF 0C FF FF FF FF                                // ......

        Name (TMP8, 
    0462: 08 54 4D 50 38                                   // .TMP8

Package (0x08)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0467: 12 2A 08 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // .*..............
    0477: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    0487: FF 0C FF FF FF FF 0C FF FF FF FF                 // ...........

        Name (TMP9, 
    0492: 08 54 4D 50 39                                   // .TMP9

Package (0x09)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0497: 12 2F 09 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ./..............
    04A7: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    04B7: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................

        Name (TMPA, 
    04C7: 08 54 4D 50 41                                   // .TMPA

Package (0x0A)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    04CC: 12 34 0A 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // .4..............
    04DC: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    04EC: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    04FC: 0C FF FF FF FF                                   // .....

        Name (TMPB, 
    0501: 08 54 4D 50 42                                   // .TMPB

Package (0x0B)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0506: 12 39 0B 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // .9..............
    0516: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    0526: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    0536: 0C FF FF FF FF 0C FF FF FF FF                    // ..........

        Name (TMPC, 
    0540: 08 54 4D 50 43                                   // .TMPC

Package (0x0C)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0545: 12 3E 0C 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // .>..............
    0555: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    0565: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    0575: 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF     // ...............

        Name (TMPD, 
    0584: 08 54 4D 50 44                                   // .TMPD

Package (0x0D)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0589: 12 44 04 0D 0C FF FF FF FF 0C FF FF FF FF 0C FF  // .D..............
    0599: FF FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    05A9: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    05B9: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    05C9: 0C FF FF FF FF                                   // .....

        Name (TMPE, 
    05CE: 08 54 4D 50 45                                   // .TMPE

Package (0x0E)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    05D3: 12 49 04 0E 0C FF FF FF FF 0C FF FF FF FF 0C FF  // .I..............
    05E3: FF FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    05F3: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    0603: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    0613: 0C FF FF FF FF 0C FF FF FF FF                    // ..........

        Name (TMPF, 
    061D: 08 54 4D 50 46                                   // .TMPF

Package (0x0F)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0622: 12 4E 04 0F 0C FF FF FF FF 0C FF FF FF FF 0C FF  // .N..............
    0632: FF FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    0642: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    0652: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    0662: 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF     // ...............

        Name (TMPG, 
    0671: 08 54 4D 50 47                                   // .TMPG

Package (0x10)
        {
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF, 
            0xFFFFFFFF
        })

    0676: 12 43 05 10 0C FF FF FF FF 0C FF FF FF FF 0C FF  // .C..............
    0686: FF FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF  // ................
    0696: FF FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF  // ................
    06A6: FF 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF  // ................
    06B6: 0C FF FF FF FF 0C FF FF FF FF 0C FF FF FF FF 0C  // ................
    06C6: FF FF FF FF                                      // ....

        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            Store (And (Arg0, 0x07), DSEN) /* External reference */

    06CA: 14 26 5F 44 4F 53 01 70 7B 68 0A 07 00 44 53 45  // .&_DOS.p{h...DSE
    06DA: 4E                                               // N

            If (LEqual (And (Arg0, 0x03), Zero))
            {

    06DB: A0 15 93 7B 68 0A 03 00 00                       // ...{h....

                If (CondRefOf (HDOS))
                {
                    HDOS ()
                }
            }
        }


    06E4: A0 0C 5B 12 48 44 4F 53 00 48 44 4F 53           // ..[.HDOS.HDOS

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {

    06F1: 14 4D E3 5F 44 4F 44 00                          // .M._DOD.

            If (LEqual (IPTP, One))
            {

    06F9: A0 0D 93 49 50 54 50 01                          // ...IPTP.

                Store (One, NDID) /* \NDID */
            }

    0701: 70 01 4E 44 49 44                                // p.NDID

            Else
            {

    0707: A1 07                                            // ..

                Store (Zero, NDID) /* \NDID */
            }


    0709: 70 00 4E 44 49 44                                // p.NDID

            If (
    070F: A0 15 92                                         // ...

LNotEqual (DIDL, Zero))
            {

    0712: 93 44 49 44 4C 00                                // .DIDL.

                Store (SDDL (DIDL), DID1) /* \DID1 */
            }


    0718: 70 53 44 44 4C 44 49 44 4C 44 49 44 31           // pSDDLDIDLDID1

            If (
    0725: A0 15 92                                         // ...

LNotEqual (DDL2, Zero))
            {

    0728: 93 44 44 4C 32 00                                // .DDL2.

                Store (SDDL (DDL2), DID2) /* \DID2 */
            }


    072E: 70 53 44 44 4C 44 44 4C 32 44 49 44 32           // pSDDLDDL2DID2

            If (
    073B: A0 15 92                                         // ...

LNotEqual (DDL3, Zero))
            {

    073E: 93 44 44 4C 33 00                                // .DDL3.

                Store (SDDL (DDL3), DID3) /* \DID3 */
            }


    0744: 70 53 44 44 4C 44 44 4C 33 44 49 44 33           // pSDDLDDL3DID3

            If (
    0751: A0 15 92                                         // ...

LNotEqual (DDL4, Zero))
            {

    0754: 93 44 44 4C 34 00                                // .DDL4.

                Store (SDDL (DDL4), DID4) /* \DID4 */
            }


    075A: 70 53 44 44 4C 44 44 4C 34 44 49 44 34           // pSDDLDDL4DID4

            If (
    0767: A0 15 92                                         // ...

LNotEqual (DDL5, Zero))
            {

    076A: 93 44 44 4C 35 00                                // .DDL5.

                Store (SDDL (DDL5), DID5) /* \DID5 */
            }


    0770: 70 53 44 44 4C 44 44 4C 35 44 49 44 35           // pSDDLDDL5DID5

            If (
    077D: A0 15 92                                         // ...

LNotEqual (DDL6, Zero))
            {

    0780: 93 44 44 4C 36 00                                // .DDL6.

                Store (SDDL (DDL6), DID6) /* \DID6 */
            }


    0786: 70 53 44 44 4C 44 44 4C 36 44 49 44 36           // pSDDLDDL6DID6

            If (
    0793: A0 15 92                                         // ...

LNotEqual (DDL7, Zero))
            {

    0796: 93 44 44 4C 37 00                                // .DDL7.

                Store (SDDL (DDL7), DID7) /* \DID7 */
            }


    079C: 70 53 44 44 4C 44 44 4C 37 44 49 44 37           // pSDDLDDL7DID7

            If (
    07A9: A0 15 92                                         // ...

LNotEqual (DDL8, Zero))
            {

    07AC: 93 44 44 4C 38 00                                // .DDL8.

                Store (SDDL (DDL8), DID8) /* \DID8 */
            }


    07B2: 70 53 44 44 4C 44 44 4C 38 44 49 44 38           // pSDDLDDL8DID8

            If (
    07BF: A0 15 92                                         // ...

LNotEqual (DDL9, Zero))
            {

    07C2: 93 44 44 4C 39 00                                // .DDL9.

                Store (SDDL (DDL9), DID9) /* \DID9 */
            }


    07C8: 70 53 44 44 4C 44 44 4C 39 44 49 44 39           // pSDDLDDL9DID9

            If (
    07D5: A0 15 92                                         // ...

LNotEqual (DD10, Zero))
            {

    07D8: 93 44 44 31 30 00                                // .DD10.

                Store (SDDL (DD10), DIDA) /* \DIDA */
            }


    07DE: 70 53 44 44 4C 44 44 31 30 44 49 44 41           // pSDDLDD10DIDA

            If (
    07EB: A0 15 92                                         // ...

LNotEqual (DD11, Zero))
            {

    07EE: 93 44 44 31 31 00                                // .DD11.

                Store (SDDL (DD11), DIDB) /* \DIDB */
            }


    07F4: 70 53 44 44 4C 44 44 31 31 44 49 44 42           // pSDDLDD11DIDB

            If (
    0801: A0 15 92                                         // ...

LNotEqual (DD12, Zero))
            {

    0804: 93 44 44 31 32 00                                // .DD12.

                Store (SDDL (DD12), DIDC) /* \DIDC */
            }


    080A: 70 53 44 44 4C 44 44 31 32 44 49 44 43           // pSDDLDD12DIDC

            If (
    0817: A0 15 92                                         // ...

LNotEqual (DD13, Zero))
            {

    081A: 93 44 44 31 33 00                                // .DD13.

                Store (SDDL (DD13), DIDD) /* \DIDD */
            }


    0820: 70 53 44 44 4C 44 44 31 33 44 49 44 44           // pSDDLDD13DIDD

            If (
    082D: A0 15 92                                         // ...

LNotEqual (DD14, Zero))
            {

    0830: 93 44 44 31 34 00                                // .DD14.

                Store (SDDL (DD14), DIDE) /* \DIDE */
            }


    0836: 70 53 44 44 4C 44 44 31 34 44 49 44 45           // pSDDLDD14DIDE

            If (
    0843: A0 15 92                                         // ...

LNotEqual (DD15, Zero))
            {

    0846: 93 44 44 31 35 00                                // .DD15.

                Store (SDDL (DD15), DIDF) /* \DIDF */
            }


    084C: 70 53 44 44 4C 44 44 31 35 44 49 44 46           // pSDDLDD15DIDF

            If (LEqual (NDID, One))
            {

    0859: A0 36 93 4E 44 49 44 01                          // .6.NDID.

                If (LEqual (IPTP, One))
                {

    0861: A0 14 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0869: 70 0C 80 34 02 00                                // p..4..

Index (TMP1, Zero))
                }

    086F: 88 54 4D 50 31 00 00                             // .TMP1..

                Else
                {

    0876: A1 14                                            // ..

                    Store (Or (0x00010000, DID1), 
    0878: 70 7D 0C 00 00 01 00 44 49 44 31 00              // p}.....DID1.

Index (TMP1, Zero))
                }


    0884: 88 54 4D 50 31 00 00                             // .TMP1..

                Return (TMP1) /* \_SB_.PCI0.GFX0.TMP1 */
            }


    088B: A4 54 4D 50 31                                   // .TMP1

            If (LEqual (NDID, 0x02))
            {
                Store (Or (0x00010000, DID1), 
    0890: A0 4B 04 93 4E 44 49 44 0A 02 70 7D 0C 00 00 01  // .K..NDID..p}....
    08A0: 00 44 49 44 31 00                                // .DID1.

Index (TMP2, Zero))

    08A6: 88 54 4D 50 32 00 00                             // .TMP2..

                If (LEqual (IPTP, One))
                {

    08AD: A0 14 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    08B5: 70 0C 80 34 02 00                                // p..4..

Index (TMP2, One))
                }

    08BB: 88 54 4D 50 32 01 00                             // .TMP2..

                Else
                {

    08C2: A1 14                                            // ..

                    Store (Or (0x00010000, DID2), 
    08C4: 70 7D 0C 00 00 01 00 44 49 44 32 00              // p}.....DID2.

Index (TMP2, One))
                }


    08D0: 88 54 4D 50 32 01 00                             // .TMP2..

                Return (TMP2) /* \_SB_.PCI0.GFX0.TMP2 */
            }


    08D7: A4 54 4D 50 32                                   // .TMP2

            If (LEqual (NDID, 0x03))
            {
                Store (Or (0x00010000, DID1), 
    08DC: A0 40 06 93 4E 44 49 44 0A 03 70 7D 0C 00 00 01  // .@..NDID..p}....
    08EC: 00 44 49 44 31 00                                // .DID1.

Index (TMP3, Zero))
                Store (Or (0x00010000, DID2), 
    08F2: 88 54 4D 50 33 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP3..p}.....DI
    0902: 44 32 00                                         // D2.

Index (TMP3, One))

    0905: 88 54 4D 50 33 01 00                             // .TMP3..

                If (LEqual (IPTP, One))
                {

    090C: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0914: 70 0C 80 34 02 00                                // p..4..

Index (TMP3, 0x02))
                }

    091A: 88 54 4D 50 33 0A 02 00                          // .TMP3...

                Else
                {

    0922: A1 15                                            // ..

                    Store (Or (0x00010000, DID3), 
    0924: 70 7D 0C 00 00 01 00 44 49 44 33 00              // p}.....DID3.

Index (TMP3, 0x02))
                }


    0930: 88 54 4D 50 33 0A 02 00                          // .TMP3...

                Return (TMP3) /* \_SB_.PCI0.GFX0.TMP3 */
            }


    0938: A4 54 4D 50 33                                   // .TMP3

            If (LEqual (NDID, 0x04))
            {
                Store (Or (0x00010000, DID1), 
    093D: A0 44 07 93 4E 44 49 44 0A 04 70 7D 0C 00 00 01  // .D..NDID..p}....
    094D: 00 44 49 44 31 00                                // .DID1.

Index (TMP4, Zero))
                Store (Or (0x00010000, DID2), 
    0953: 88 54 4D 50 34 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP4..p}.....DI
    0963: 44 32 00                                         // D2.

Index (TMP4, One))
                Store (Or (0x00010000, DID3), 
    0966: 88 54 4D 50 34 01 00 70 7D 0C 00 00 01 00 44 49  // .TMP4..p}.....DI
    0976: 44 33 00                                         // D3.

Index (TMP4, 0x02))

    0979: 88 54 4D 50 34 0A 02 00                          // .TMP4...

                If (LEqual (IPTP, One))
                {

    0981: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0989: 70 0C 80 34 02 00                                // p..4..

Index (TMP4, 0x03))
                }

    098F: 88 54 4D 50 34 0A 03 00                          // .TMP4...

                Else
                {

    0997: A1 15                                            // ..

                    Store (Or (0x00010000, DID4), 
    0999: 70 7D 0C 00 00 01 00 44 49 44 34 00              // p}.....DID4.

Index (TMP4, 0x03))
                }


    09A5: 88 54 4D 50 34 0A 03 00                          // .TMP4...

                Return (TMP4) /* \_SB_.PCI0.GFX0.TMP4 */
            }


    09AD: A4 54 4D 50 34                                   // .TMP4

            If (LEqual (NDID, 0x05))
            {
                Store (Or (0x00010000, DID1), 
    09B2: A0 48 08 93 4E 44 49 44 0A 05 70 7D 0C 00 00 01  // .H..NDID..p}....
    09C2: 00 44 49 44 31 00                                // .DID1.

Index (TMP5, Zero))
                Store (Or (0x00010000, DID2), 
    09C8: 88 54 4D 50 35 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP5..p}.....DI
    09D8: 44 32 00                                         // D2.

Index (TMP5, One))
                Store (Or (0x00010000, DID3), 
    09DB: 88 54 4D 50 35 01 00 70 7D 0C 00 00 01 00 44 49  // .TMP5..p}.....DI
    09EB: 44 33 00                                         // D3.

Index (TMP5, 0x02))
                Store (Or (0x00010000, DID4), 
    09EE: 88 54 4D 50 35 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMP5...p}.....D
    09FE: 49 44 34 00                                      // ID4.

Index (TMP5, 0x03))

    0A02: 88 54 4D 50 35 0A 03 00                          // .TMP5...

                If (LEqual (IPTP, One))
                {

    0A0A: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0A12: 70 0C 80 34 02 00                                // p..4..

Index (TMP5, 0x04))
                }

    0A18: 88 54 4D 50 35 0A 04 00                          // .TMP5...

                Else
                {

    0A20: A1 15                                            // ..

                    Store (Or (0x00010000, DID5), 
    0A22: 70 7D 0C 00 00 01 00 44 49 44 35 00              // p}.....DID5.

Index (TMP5, 0x04))
                }


    0A2E: 88 54 4D 50 35 0A 04 00                          // .TMP5...

                Return (TMP5) /* \_SB_.PCI0.GFX0.TMP5 */
            }


    0A36: A4 54 4D 50 35                                   // .TMP5

            If (LEqual (NDID, 0x06))
            {
                Store (Or (0x00010000, DID1), 
    0A3B: A0 4C 09 93 4E 44 49 44 0A 06 70 7D 0C 00 00 01  // .L..NDID..p}....
    0A4B: 00 44 49 44 31 00                                // .DID1.

Index (TMP6, Zero))
                Store (Or (0x00010000, DID2), 
    0A51: 88 54 4D 50 36 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP6..p}.....DI
    0A61: 44 32 00                                         // D2.

Index (TMP6, One))
                Store (Or (0x00010000, DID3), 
    0A64: 88 54 4D 50 36 01 00 70 7D 0C 00 00 01 00 44 49  // .TMP6..p}.....DI
    0A74: 44 33 00                                         // D3.

Index (TMP6, 0x02))
                Store (Or (0x00010000, DID4), 
    0A77: 88 54 4D 50 36 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMP6...p}.....D
    0A87: 49 44 34 00                                      // ID4.

Index (TMP6, 0x03))
                Store (Or (0x00010000, DID5), 
    0A8B: 88 54 4D 50 36 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMP6...p}.....D
    0A9B: 49 44 35 00                                      // ID5.

Index (TMP6, 0x04))

    0A9F: 88 54 4D 50 36 0A 04 00                          // .TMP6...

                If (LEqual (IPTP, One))
                {

    0AA7: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0AAF: 70 0C 80 34 02 00                                // p..4..

Index (TMP6, 0x05))
                }

    0AB5: 88 54 4D 50 36 0A 05 00                          // .TMP6...

                Else
                {

    0ABD: A1 15                                            // ..

                    Store (Or (0x00010000, DID6), 
    0ABF: 70 7D 0C 00 00 01 00 44 49 44 36 00              // p}.....DID6.

Index (TMP6, 0x05))
                }


    0ACB: 88 54 4D 50 36 0A 05 00                          // .TMP6...

                Return (TMP6) /* \_SB_.PCI0.GFX0.TMP6 */
            }


    0AD3: A4 54 4D 50 36                                   // .TMP6

            If (LEqual (NDID, 0x07))
            {
                Store (Or (0x00010000, DID1), 
    0AD8: A0 40 0B 93 4E 44 49 44 0A 07 70 7D 0C 00 00 01  // .@..NDID..p}....
    0AE8: 00 44 49 44 31 00                                // .DID1.

Index (TMP7, Zero))
                Store (Or (0x00010000, DID2), 
    0AEE: 88 54 4D 50 37 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP7..p}.....DI
    0AFE: 44 32 00                                         // D2.

Index (TMP7, One))
                Store (Or (0x00010000, DID3), 
    0B01: 88 54 4D 50 37 01 00 70 7D 0C 00 00 01 00 44 49  // .TMP7..p}.....DI
    0B11: 44 33 00                                         // D3.

Index (TMP7, 0x02))
                Store (Or (0x00010000, DID4), 
    0B14: 88 54 4D 50 37 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMP7...p}.....D
    0B24: 49 44 34 00                                      // ID4.

Index (TMP7, 0x03))
                Store (Or (0x00010000, DID5), 
    0B28: 88 54 4D 50 37 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMP7...p}.....D
    0B38: 49 44 35 00                                      // ID5.

Index (TMP7, 0x04))
                Store (Or (0x00010000, DID6), 
    0B3C: 88 54 4D 50 37 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMP7...p}.....D
    0B4C: 49 44 36 00                                      // ID6.

Index (TMP7, 0x05))

    0B50: 88 54 4D 50 37 0A 05 00                          // .TMP7...

                If (LEqual (IPTP, One))
                {

    0B58: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0B60: 70 0C 80 34 02 00                                // p..4..

Index (TMP7, 0x06))
                }

    0B66: 88 54 4D 50 37 0A 06 00                          // .TMP7...

                Else
                {

    0B6E: A1 15                                            // ..

                    Store (Or (0x00010000, DID7), 
    0B70: 70 7D 0C 00 00 01 00 44 49 44 37 00              // p}.....DID7.

Index (TMP7, 0x06))
                }


    0B7C: 88 54 4D 50 37 0A 06 00                          // .TMP7...

                Return (TMP7) /* \_SB_.PCI0.GFX0.TMP7 */
            }


    0B84: A4 54 4D 50 37                                   // .TMP7

            If (LEqual (NDID, 0x08))
            {
                Store (Or (0x00010000, DID1), 
    0B89: A0 44 0C 93 4E 44 49 44 0A 08 70 7D 0C 00 00 01  // .D..NDID..p}....
    0B99: 00 44 49 44 31 00                                // .DID1.

Index (TMP8, Zero))
                Store (Or (0x00010000, DID2), 
    0B9F: 88 54 4D 50 38 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP8..p}.....DI
    0BAF: 44 32 00                                         // D2.

Index (TMP8, One))
                Store (Or (0x00010000, DID3), 
    0BB2: 88 54 4D 50 38 01 00 70 7D 0C 00 00 01 00 44 49  // .TMP8..p}.....DI
    0BC2: 44 33 00                                         // D3.

Index (TMP8, 0x02))
                Store (Or (0x00010000, DID4), 
    0BC5: 88 54 4D 50 38 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMP8...p}.....D
    0BD5: 49 44 34 00                                      // ID4.

Index (TMP8, 0x03))
                Store (Or (0x00010000, DID5), 
    0BD9: 88 54 4D 50 38 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMP8...p}.....D
    0BE9: 49 44 35 00                                      // ID5.

Index (TMP8, 0x04))
                Store (Or (0x00010000, DID6), 
    0BED: 88 54 4D 50 38 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMP8...p}.....D
    0BFD: 49 44 36 00                                      // ID6.

Index (TMP8, 0x05))
                Store (Or (0x00010000, DID7), 
    0C01: 88 54 4D 50 38 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMP8...p}.....D
    0C11: 49 44 37 00                                      // ID7.

Index (TMP8, 0x06))

    0C15: 88 54 4D 50 38 0A 06 00                          // .TMP8...

                If (LEqual (IPTP, One))
                {

    0C1D: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0C25: 70 0C 80 34 02 00                                // p..4..

Index (TMP8, 0x07))
                }

    0C2B: 88 54 4D 50 38 0A 07 00                          // .TMP8...

                Else
                {

    0C33: A1 15                                            // ..

                    Store (Or (0x00010000, DID8), 
    0C35: 70 7D 0C 00 00 01 00 44 49 44 38 00              // p}.....DID8.

Index (TMP8, 0x07))
                }


    0C41: 88 54 4D 50 38 0A 07 00                          // .TMP8...

                Return (TMP8) /* \_SB_.PCI0.GFX0.TMP8 */
            }


    0C49: A4 54 4D 50 38                                   // .TMP8

            If (LEqual (NDID, 0x09))
            {
                Store (Or (0x00010000, DID1), 
    0C4E: A0 48 0D 93 4E 44 49 44 0A 09 70 7D 0C 00 00 01  // .H..NDID..p}....
    0C5E: 00 44 49 44 31 00                                // .DID1.

Index (TMP9, Zero))
                Store (Or (0x00010000, DID2), 
    0C64: 88 54 4D 50 39 00 00 70 7D 0C 00 00 01 00 44 49  // .TMP9..p}.....DI
    0C74: 44 32 00                                         // D2.

Index (TMP9, One))
                Store (Or (0x00010000, DID3), 
    0C77: 88 54 4D 50 39 01 00 70 7D 0C 00 00 01 00 44 49  // .TMP9..p}.....DI
    0C87: 44 33 00                                         // D3.

Index (TMP9, 0x02))
                Store (Or (0x00010000, DID4), 
    0C8A: 88 54 4D 50 39 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMP9...p}.....D
    0C9A: 49 44 34 00                                      // ID4.

Index (TMP9, 0x03))
                Store (Or (0x00010000, DID5), 
    0C9E: 88 54 4D 50 39 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMP9...p}.....D
    0CAE: 49 44 35 00                                      // ID5.

Index (TMP9, 0x04))
                Store (Or (0x00010000, DID6), 
    0CB2: 88 54 4D 50 39 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMP9...p}.....D
    0CC2: 49 44 36 00                                      // ID6.

Index (TMP9, 0x05))
                Store (Or (0x00010000, DID7), 
    0CC6: 88 54 4D 50 39 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMP9...p}.....D
    0CD6: 49 44 37 00                                      // ID7.

Index (TMP9, 0x06))
                Store (Or (0x00010000, DID8), 
    0CDA: 88 54 4D 50 39 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMP9...p}.....D
    0CEA: 49 44 38 00                                      // ID8.

Index (TMP9, 0x07))

    0CEE: 88 54 4D 50 39 0A 07 00                          // .TMP9...

                If (LEqual (IPTP, One))
                {

    0CF6: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0CFE: 70 0C 80 34 02 00                                // p..4..

Index (TMP9, 0x08))
                }

    0D04: 88 54 4D 50 39 0A 08 00                          // .TMP9...

                Else
                {

    0D0C: A1 15                                            // ..

                    Store (Or (0x00010000, DID9), 
    0D0E: 70 7D 0C 00 00 01 00 44 49 44 39 00              // p}.....DID9.

Index (TMP9, 0x08))
                }


    0D1A: 88 54 4D 50 39 0A 08 00                          // .TMP9...

                Return (TMP9) /* \_SB_.PCI0.GFX0.TMP9 */
            }


    0D22: A4 54 4D 50 39                                   // .TMP9

            If (LEqual (NDID, 0x0A))
            {
                Store (Or (0x00010000, DID1), 
    0D27: A0 4C 0E 93 4E 44 49 44 0A 0A 70 7D 0C 00 00 01  // .L..NDID..p}....
    0D37: 00 44 49 44 31 00                                // .DID1.

Index (TMPA, Zero))
                Store (Or (0x00010000, DID2), 
    0D3D: 88 54 4D 50 41 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPA..p}.....DI
    0D4D: 44 32 00                                         // D2.

Index (TMPA, One))
                Store (Or (0x00010000, DID3), 
    0D50: 88 54 4D 50 41 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPA..p}.....DI
    0D60: 44 33 00                                         // D3.

Index (TMPA, 0x02))
                Store (Or (0x00010000, DID4), 
    0D63: 88 54 4D 50 41 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPA...p}.....D
    0D73: 49 44 34 00                                      // ID4.

Index (TMPA, 0x03))
                Store (Or (0x00010000, DID5), 
    0D77: 88 54 4D 50 41 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPA...p}.....D
    0D87: 49 44 35 00                                      // ID5.

Index (TMPA, 0x04))
                Store (Or (0x00010000, DID6), 
    0D8B: 88 54 4D 50 41 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPA...p}.....D
    0D9B: 49 44 36 00                                      // ID6.

Index (TMPA, 0x05))
                Store (Or (0x00010000, DID7), 
    0D9F: 88 54 4D 50 41 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPA...p}.....D
    0DAF: 49 44 37 00                                      // ID7.

Index (TMPA, 0x06))
                Store (Or (0x00010000, DID8), 
    0DB3: 88 54 4D 50 41 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPA...p}.....D
    0DC3: 49 44 38 00                                      // ID8.

Index (TMPA, 0x07))
                Store (Or (0x00010000, DID9), 
    0DC7: 88 54 4D 50 41 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPA...p}.....D
    0DD7: 49 44 39 00                                      // ID9.

Index (TMPA, 0x08))

    0DDB: 88 54 4D 50 41 0A 08 00                          // .TMPA...

                If (LEqual (IPTP, One))
                {

    0DE3: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0DEB: 70 0C 80 34 02 00                                // p..4..

Index (TMPA, 0x09))
                }

    0DF1: 88 54 4D 50 41 0A 09 00                          // .TMPA...

                Else
                {

    0DF9: A1 15                                            // ..

                    Store (Or (0x00010000, DIDA), 
    0DFB: 70 7D 0C 00 00 01 00 44 49 44 41 00              // p}.....DIDA.

Index (TMPA, 0x09))
                }


    0E07: 88 54 4D 50 41 0A 09 00                          // .TMPA...

                Return (TMPA) /* \_SB_.PCI0.GFX0.TMPA */
            }


    0E0F: A4 54 4D 50 41                                   // .TMPA

            If (LEqual (NDID, 0x0B))
            {
                Store (Or (0x00010000, DID1), 
    0E14: A0 40 10 93 4E 44 49 44 0A 0B 70 7D 0C 00 00 01  // .@..NDID..p}....
    0E24: 00 44 49 44 31 00                                // .DID1.

Index (TMPB, Zero))
                Store (Or (0x00010000, DID2), 
    0E2A: 88 54 4D 50 42 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPB..p}.....DI
    0E3A: 44 32 00                                         // D2.

Index (TMPB, One))
                Store (Or (0x00010000, DID3), 
    0E3D: 88 54 4D 50 42 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPB..p}.....DI
    0E4D: 44 33 00                                         // D3.

Index (TMPB, 0x02))
                Store (Or (0x00010000, DID4), 
    0E50: 88 54 4D 50 42 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0E60: 49 44 34 00                                      // ID4.

Index (TMPB, 0x03))
                Store (Or (0x00010000, DID5), 
    0E64: 88 54 4D 50 42 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0E74: 49 44 35 00                                      // ID5.

Index (TMPB, 0x04))
                Store (Or (0x00010000, DID6), 
    0E78: 88 54 4D 50 42 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0E88: 49 44 36 00                                      // ID6.

Index (TMPB, 0x05))
                Store (Or (0x00010000, DID7), 
    0E8C: 88 54 4D 50 42 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0E9C: 49 44 37 00                                      // ID7.

Index (TMPB, 0x06))
                Store (Or (0x00010000, DID8), 
    0EA0: 88 54 4D 50 42 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0EB0: 49 44 38 00                                      // ID8.

Index (TMPB, 0x07))
                Store (Or (0x00010000, DID9), 
    0EB4: 88 54 4D 50 42 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0EC4: 49 44 39 00                                      // ID9.

Index (TMPB, 0x08))
                Store (Or (0x00010000, DIDA), 
    0EC8: 88 54 4D 50 42 0A 08 00 70 7D 0C 00 00 01 00 44  // .TMPB...p}.....D
    0ED8: 49 44 41 00                                      // IDA.

Index (TMPB, 0x09))

    0EDC: 88 54 4D 50 42 0A 09 00                          // .TMPB...

                If (LEqual (IPTP, One))
                {

    0EE4: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    0EEC: 70 0C 80 34 02 00                                // p..4..

Index (TMPB, 0x0A))
                }

    0EF2: 88 54 4D 50 42 0A 0A 00                          // .TMPB...

                Else
                {

    0EFA: A1 15                                            // ..

                    Store (Or (0x00010000, DIDB), 
    0EFC: 70 7D 0C 00 00 01 00 44 49 44 42 00              // p}.....DIDB.

Index (TMPB, 0x0A))
                }


    0F08: 88 54 4D 50 42 0A 0A 00                          // .TMPB...

                Return (TMPB) /* \_SB_.PCI0.GFX0.TMPB */
            }


    0F10: A4 54 4D 50 42                                   // .TMPB

            If (LEqual (NDID, 0x0C))
            {
                Store (Or (0x00010000, DID1), 
    0F15: A0 44 11 93 4E 44 49 44 0A 0C 70 7D 0C 00 00 01  // .D..NDID..p}....
    0F25: 00 44 49 44 31 00                                // .DID1.

Index (TMPC, Zero))
                Store (Or (0x00010000, DID2), 
    0F2B: 88 54 4D 50 43 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPC..p}.....DI
    0F3B: 44 32 00                                         // D2.

Index (TMPC, One))
                Store (Or (0x00010000, DID3), 
    0F3E: 88 54 4D 50 43 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPC..p}.....DI
    0F4E: 44 33 00                                         // D3.

Index (TMPC, 0x02))
                Store (Or (0x00010000, DID4), 
    0F51: 88 54 4D 50 43 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0F61: 49 44 34 00                                      // ID4.

Index (TMPC, 0x03))
                Store (Or (0x00010000, DID5), 
    0F65: 88 54 4D 50 43 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0F75: 49 44 35 00                                      // ID5.

Index (TMPC, 0x04))
                Store (Or (0x00010000, DID6), 
    0F79: 88 54 4D 50 43 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0F89: 49 44 36 00                                      // ID6.

Index (TMPC, 0x05))
                Store (Or (0x00010000, DID7), 
    0F8D: 88 54 4D 50 43 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0F9D: 49 44 37 00                                      // ID7.

Index (TMPC, 0x06))
                Store (Or (0x00010000, DID8), 
    0FA1: 88 54 4D 50 43 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0FB1: 49 44 38 00                                      // ID8.

Index (TMPC, 0x07))
                Store (Or (0x00010000, DID9), 
    0FB5: 88 54 4D 50 43 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0FC5: 49 44 39 00                                      // ID9.

Index (TMPC, 0x08))
                Store (Or (0x00010000, DIDA), 
    0FC9: 88 54 4D 50 43 0A 08 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0FD9: 49 44 41 00                                      // IDA.

Index (TMPC, 0x09))
                Store (Or (0x00010000, DIDB), 
    0FDD: 88 54 4D 50 43 0A 09 00 70 7D 0C 00 00 01 00 44  // .TMPC...p}.....D
    0FED: 49 44 42 00                                      // IDB.

Index (TMPC, 0x0A))

    0FF1: 88 54 4D 50 43 0A 0A 00                          // .TMPC...

                If (LEqual (IPTP, One))
                {

    0FF9: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    1001: 70 0C 80 34 02 00                                // p..4..

Index (TMPC, 0x0B))
                }

    1007: 88 54 4D 50 43 0A 0B 00                          // .TMPC...

                Else
                {

    100F: A1 15                                            // ..

                    Store (Or (0x00010000, DIDC), 
    1011: 70 7D 0C 00 00 01 00 44 49 44 43 00              // p}.....DIDC.

Index (TMPC, 0x0B))
                }


    101D: 88 54 4D 50 43 0A 0B 00                          // .TMPC...

                Return (TMPC) /* \_SB_.PCI0.GFX0.TMPC */
            }


    1025: A4 54 4D 50 43                                   // .TMPC

            If (LEqual (NDID, 0x0D))
            {
                Store (Or (0x00010000, DID1), 
    102A: A0 48 12 93 4E 44 49 44 0A 0D 70 7D 0C 00 00 01  // .H..NDID..p}....
    103A: 00 44 49 44 31 00                                // .DID1.

Index (TMPD, Zero))
                Store (Or (0x00010000, DID2), 
    1040: 88 54 4D 50 44 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPD..p}.....DI
    1050: 44 32 00                                         // D2.

Index (TMPD, One))
                Store (Or (0x00010000, DID3), 
    1053: 88 54 4D 50 44 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPD..p}.....DI
    1063: 44 33 00                                         // D3.

Index (TMPD, 0x02))
                Store (Or (0x00010000, DID4), 
    1066: 88 54 4D 50 44 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    1076: 49 44 34 00                                      // ID4.

Index (TMPD, 0x03))
                Store (Or (0x00010000, DID5), 
    107A: 88 54 4D 50 44 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    108A: 49 44 35 00                                      // ID5.

Index (TMPD, 0x04))
                Store (Or (0x00010000, DID6), 
    108E: 88 54 4D 50 44 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    109E: 49 44 36 00                                      // ID6.

Index (TMPD, 0x05))
                Store (Or (0x00010000, DID7), 
    10A2: 88 54 4D 50 44 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    10B2: 49 44 37 00                                      // ID7.

Index (TMPD, 0x06))
                Store (Or (0x00010000, DID8), 
    10B6: 88 54 4D 50 44 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    10C6: 49 44 38 00                                      // ID8.

Index (TMPD, 0x07))
                Store (Or (0x00010000, DID9), 
    10CA: 88 54 4D 50 44 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    10DA: 49 44 39 00                                      // ID9.

Index (TMPD, 0x08))
                Store (Or (0x00010000, DIDA), 
    10DE: 88 54 4D 50 44 0A 08 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    10EE: 49 44 41 00                                      // IDA.

Index (TMPD, 0x09))
                Store (Or (0x00010000, DIDB), 
    10F2: 88 54 4D 50 44 0A 09 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    1102: 49 44 42 00                                      // IDB.

Index (TMPD, 0x0A))
                Store (Or (0x00010000, DIDC), 
    1106: 88 54 4D 50 44 0A 0A 00 70 7D 0C 00 00 01 00 44  // .TMPD...p}.....D
    1116: 49 44 43 00                                      // IDC.

Index (TMPD, 0x0B))

    111A: 88 54 4D 50 44 0A 0B 00                          // .TMPD...

                If (LEqual (IPTP, One))
                {

    1122: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    112A: 70 0C 80 34 02 00                                // p..4..

Index (TMPD, 0x0C))
                }

    1130: 88 54 4D 50 44 0A 0C 00                          // .TMPD...

                Else
                {

    1138: A1 15                                            // ..

                    Store (Or (0x00010000, DIDD), 
    113A: 70 7D 0C 00 00 01 00 44 49 44 44 00              // p}.....DIDD.

Index (TMPD, 0x0C))
                }


    1146: 88 54 4D 50 44 0A 0C 00                          // .TMPD...

                Return (TMPD) /* \_SB_.PCI0.GFX0.TMPD */
            }


    114E: A4 54 4D 50 44                                   // .TMPD

            If (LEqual (NDID, 0x0E))
            {
                Store (Or (0x00010000, DID1), 
    1153: A0 4C 13 93 4E 44 49 44 0A 0E 70 7D 0C 00 00 01  // .L..NDID..p}....
    1163: 00 44 49 44 31 00                                // .DID1.

Index (TMPE, Zero))
                Store (Or (0x00010000, DID2), 
    1169: 88 54 4D 50 45 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPE..p}.....DI
    1179: 44 32 00                                         // D2.

Index (TMPE, One))
                Store (Or (0x00010000, DID3), 
    117C: 88 54 4D 50 45 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPE..p}.....DI
    118C: 44 33 00                                         // D3.

Index (TMPE, 0x02))
                Store (Or (0x00010000, DID4), 
    118F: 88 54 4D 50 45 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    119F: 49 44 34 00                                      // ID4.

Index (TMPE, 0x03))
                Store (Or (0x00010000, DID5), 
    11A3: 88 54 4D 50 45 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    11B3: 49 44 35 00                                      // ID5.

Index (TMPE, 0x04))
                Store (Or (0x00010000, DID6), 
    11B7: 88 54 4D 50 45 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    11C7: 49 44 36 00                                      // ID6.

Index (TMPE, 0x05))
                Store (Or (0x00010000, DID7), 
    11CB: 88 54 4D 50 45 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    11DB: 49 44 37 00                                      // ID7.

Index (TMPE, 0x06))
                Store (Or (0x00010000, DID8), 
    11DF: 88 54 4D 50 45 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    11EF: 49 44 38 00                                      // ID8.

Index (TMPE, 0x07))
                Store (Or (0x00010000, DID9), 
    11F3: 88 54 4D 50 45 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    1203: 49 44 39 00                                      // ID9.

Index (TMPE, 0x08))
                Store (Or (0x00010000, DIDA), 
    1207: 88 54 4D 50 45 0A 08 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    1217: 49 44 41 00                                      // IDA.

Index (TMPE, 0x09))
                Store (Or (0x00010000, DIDB), 
    121B: 88 54 4D 50 45 0A 09 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    122B: 49 44 42 00                                      // IDB.

Index (TMPE, 0x0A))
                Store (Or (0x00010000, DIDC), 
    122F: 88 54 4D 50 45 0A 0A 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    123F: 49 44 43 00                                      // IDC.

Index (TMPE, 0x0B))
                Store (Or (0x00010000, DIDD), 
    1243: 88 54 4D 50 45 0A 0B 00 70 7D 0C 00 00 01 00 44  // .TMPE...p}.....D
    1253: 49 44 44 00                                      // IDD.

Index (TMPE, 0x0C))

    1257: 88 54 4D 50 45 0A 0C 00                          // .TMPE...

                If (LEqual (IPTP, One))
                {

    125F: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    1267: 70 0C 80 34 02 00                                // p..4..

Index (TMPE, 0x0D))
                }

    126D: 88 54 4D 50 45 0A 0D 00                          // .TMPE...

                Else
                {

    1275: A1 15                                            // ..

                    Store (Or (0x00010000, DIDE), 
    1277: 70 7D 0C 00 00 01 00 44 49 44 45 00              // p}.....DIDE.

Index (TMPE, 0x0D))
                }


    1283: 88 54 4D 50 45 0A 0D 00                          // .TMPE...

                Return (TMPE) /* \_SB_.PCI0.GFX0.TMPE */
            }


    128B: A4 54 4D 50 45                                   // .TMPE

            If (LEqual (NDID, 0x0F))
            {
                Store (Or (0x00010000, DID1), 
    1290: A0 40 15 93 4E 44 49 44 0A 0F 70 7D 0C 00 00 01  // .@..NDID..p}....
    12A0: 00 44 49 44 31 00                                // .DID1.

Index (TMPF, Zero))
                Store (Or (0x00010000, DID2), 
    12A6: 88 54 4D 50 46 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPF..p}.....DI
    12B6: 44 32 00                                         // D2.

Index (TMPF, One))
                Store (Or (0x00010000, DID3), 
    12B9: 88 54 4D 50 46 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPF..p}.....DI
    12C9: 44 33 00                                         // D3.

Index (TMPF, 0x02))
                Store (Or (0x00010000, DID4), 
    12CC: 88 54 4D 50 46 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    12DC: 49 44 34 00                                      // ID4.

Index (TMPF, 0x03))
                Store (Or (0x00010000, DID5), 
    12E0: 88 54 4D 50 46 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    12F0: 49 44 35 00                                      // ID5.

Index (TMPF, 0x04))
                Store (Or (0x00010000, DID6), 
    12F4: 88 54 4D 50 46 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    1304: 49 44 36 00                                      // ID6.

Index (TMPF, 0x05))
                Store (Or (0x00010000, DID7), 
    1308: 88 54 4D 50 46 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    1318: 49 44 37 00                                      // ID7.

Index (TMPF, 0x06))
                Store (Or (0x00010000, DID8), 
    131C: 88 54 4D 50 46 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    132C: 49 44 38 00                                      // ID8.

Index (TMPF, 0x07))
                Store (Or (0x00010000, DID9), 
    1330: 88 54 4D 50 46 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    1340: 49 44 39 00                                      // ID9.

Index (TMPF, 0x08))
                Store (Or (0x00010000, DIDA), 
    1344: 88 54 4D 50 46 0A 08 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    1354: 49 44 41 00                                      // IDA.

Index (TMPF, 0x09))
                Store (Or (0x00010000, DIDB), 
    1358: 88 54 4D 50 46 0A 09 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    1368: 49 44 42 00                                      // IDB.

Index (TMPF, 0x0A))
                Store (Or (0x00010000, DIDC), 
    136C: 88 54 4D 50 46 0A 0A 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    137C: 49 44 43 00                                      // IDC.

Index (TMPF, 0x0B))
                Store (Or (0x00010000, DIDD), 
    1380: 88 54 4D 50 46 0A 0B 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    1390: 49 44 44 00                                      // IDD.

Index (TMPF, 0x0C))
                Store (Or (0x00010000, DIDE), 
    1394: 88 54 4D 50 46 0A 0C 00 70 7D 0C 00 00 01 00 44  // .TMPF...p}.....D
    13A4: 49 44 45 00                                      // IDE.

Index (TMPF, 0x0D))

    13A8: 88 54 4D 50 46 0A 0D 00                          // .TMPF...

                If (LEqual (IPTP, One))
                {

    13B0: A0 15 93 49 50 54 50 01                          // ...IPTP.

                    Store (0x00023480, 
    13B8: 70 0C 80 34 02 00                                // p..4..

Index (TMPF, 0x0E))
                }

    13BE: 88 54 4D 50 46 0A 0E 00                          // .TMPF...

                Else
                {

    13C6: A1 15                                            // ..

                    Store (Or (0x00010000, DIDF), 
    13C8: 70 7D 0C 00 00 01 00 44 49 44 46 00              // p}.....DIDF.

Index (TMPF, 0x0E))
                }


    13D4: 88 54 4D 50 46 0A 0E 00                          // .TMPF...

                Return (TMPF) /* \_SB_.PCI0.GFX0.TMPF */
            }


    13DC: A4 54 4D 50 46                                   // .TMPF

            If (LEqual (NDID, 0x10))
            {
                Store (Or (0x00010000, DID1), 
    13E1: A0 46 14 93 4E 44 49 44 0A 10 70 7D 0C 00 00 01  // .F..NDID..p}....
    13F1: 00 44 49 44 31 00                                // .DID1.

Index (TMPG, Zero))
                Store (Or (0x00010000, DID2), 
    13F7: 88 54 4D 50 47 00 00 70 7D 0C 00 00 01 00 44 49  // .TMPG..p}.....DI
    1407: 44 32 00                                         // D2.

Index (TMPG, One))
                Store (Or (0x00010000, DID3), 
    140A: 88 54 4D 50 47 01 00 70 7D 0C 00 00 01 00 44 49  // .TMPG..p}.....DI
    141A: 44 33 00                                         // D3.

Index (TMPG, 0x02))
                Store (Or (0x00010000, DID4), 
    141D: 88 54 4D 50 47 0A 02 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    142D: 49 44 34 00                                      // ID4.

Index (TMPG, 0x03))
                Store (Or (0x00010000, DID5), 
    1431: 88 54 4D 50 47 0A 03 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    1441: 49 44 35 00                                      // ID5.

Index (TMPG, 0x04))
                Store (Or (0x00010000, DID6), 
    1445: 88 54 4D 50 47 0A 04 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    1455: 49 44 36 00                                      // ID6.

Index (TMPG, 0x05))
                Store (Or (0x00010000, DID7), 
    1459: 88 54 4D 50 47 0A 05 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    1469: 49 44 37 00                                      // ID7.

Index (TMPG, 0x06))
                Store (Or (0x00010000, DID8), 
    146D: 88 54 4D 50 47 0A 06 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    147D: 49 44 38 00                                      // ID8.

Index (TMPG, 0x07))
                Store (Or (0x00010000, DID9), 
    1481: 88 54 4D 50 47 0A 07 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    1491: 49 44 39 00                                      // ID9.

Index (TMPG, 0x08))
                Store (Or (0x00010000, DIDA), 
    1495: 88 54 4D 50 47 0A 08 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    14A5: 49 44 41 00                                      // IDA.

Index (TMPG, 0x09))
                Store (Or (0x00010000, DIDB), 
    14A9: 88 54 4D 50 47 0A 09 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    14B9: 49 44 42 00                                      // IDB.

Index (TMPG, 0x0A))
                Store (Or (0x00010000, DIDC), 
    14BD: 88 54 4D 50 47 0A 0A 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    14CD: 49 44 43 00                                      // IDC.

Index (TMPG, 0x0B))
                Store (Or (0x00010000, DIDD), 
    14D1: 88 54 4D 50 47 0A 0B 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    14E1: 49 44 44 00                                      // IDD.

Index (TMPG, 0x0C))
                Store (Or (0x00010000, DIDE), 
    14E5: 88 54 4D 50 47 0A 0C 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    14F5: 49 44 45 00                                      // IDE.

Index (TMPG, 0x0D))
                Store (Or (0x00010000, DIDF), 
    14F9: 88 54 4D 50 47 0A 0D 00 70 7D 0C 00 00 01 00 44  // .TMPG...p}.....D
    1509: 49 44 46 00                                      // IDF.

Index (TMPG, 0x0E))
                Store (0x00023480, 
    150D: 88 54 4D 50 47 0A 0E 00 70 0C 80 34 02 00        // .TMPG...p..4..

Index (TMPG, 0x0F))

    151B: 88 54 4D 50 47 0A 0F 00                          // .TMPG...

                Return (TMPG) /* \_SB_.PCI0.GFX0.TMPG */
            }


    1523: A4 54 4D 50 47                                   // .TMPG

            Return (
    1528: A4                                               // .

Package (0x01)
            {
                0x0400
            })
        }


    1529: 12 05 01 0B 00 04                                // ......

        Device (DD01)
        {

    152F: 5B 82 42 09 44 44 30 31                          // [.B.DD01

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1537: 14 46 04 5F 41 44 52 08                          // .F._ADR.

                If (LEqual (And (0x0F00, DID1), 0x0400))
                {
                    Store (One, EDPV) /* \EDPV */
                    Store (NXD1, NXDX) /* \NXDX */
                    Store (DID1, DIDX) /* \DIDX */

    153F: A0 28 93 7B 0B 00 0F 44 49 44 31 00 0B 00 04 70  // .(.{...DID1....p
    154F: 01 45 44 50 56 70 4E 58 44 31 4E 58 44 58 70 44  // .EDPVpNXD1NXDXpD
    155F: 49 44 31 44 49 44 58                             // ID1DIDX

                    Return (One)
                }


    1566: A4 01                                            // ..

                If (LEqual (DID1, Zero))
                {

    1568: A0 09 93 44 49 44 31 00                          // ...DID1.

                    Return (One)
                }

    1570: A4 01                                            // ..

                Else
                {

    1572: A1 0B                                            // ..

                    Return (
    1574: A4                                               // .

And (0xFFFF, DID1))
                }
            }


    1575: 7B 0B FF FF 44 49 44 31 00                       // {...DID1.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    157E: 14 0F 5F 44 43 53 00                             // .._DCS.

                Return (CDDS (DID1))
            }


    1585: A4 43 44 44 53 44 49 44 31                       // .CDDSDID1

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    158E: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1595: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    15A2: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD1) /* \NXD1 */
                }


    15A9: A4 4E 58 44 31                                   // .NXD1

                Return (NDDS (DID1))
            }


    15AE: A4 4E 44 44 53 44 49 44 31                       // .NDDSDID1

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    15B7: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD02)
        {

    15C3: 5B 82 4F 09 44 44 30 32                          // [.O.DD02

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    15CB: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID2), 0x0400))
                {
                    Store (0x02, EDPV) /* \EDPV */
                    Store (NXD2, NXDX) /* \NXDX */
                    Store (DID2, DIDX) /* \DIDX */

    15D3: A0 2A 93 7B 0B 00 0F 44 49 44 32 00 0B 00 04 70  // .*.{...DID2....p
    15E3: 0A 02 45 44 50 56 70 4E 58 44 32 4E 58 44 58 70  // ..EDPVpNXD2NXDXp
    15F3: 44 49 44 32 44 49 44 58                          // DID2DIDX

                    Return (0x02)
                }


    15FB: A4 0A 02                                         // ...

                If (LEqual (DID2, Zero))
                {

    15FE: A0 0A 93 44 49 44 32 00                          // ...DID2.

                    Return (0x02)
                }

    1606: A4 0A 02                                         // ...

                Else
                {

    1609: A1 0B                                            // ..

                    Return (
    160B: A4                                               // .

And (0xFFFF, DID2))
                }
            }


    160C: 7B 0B FF FF 44 49 44 32 00                       // {...DID2.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1615: 14 19 5F 44 43 53 00                             // .._DCS.

                If (LEqual (LIDS, Zero))
                {

    161C: A0 09 93 4C 49 44 53 00                          // ...LIDS.

                    Return (Zero)
                }


    1624: A4 00                                            // ..

                Return (CDDS (DID2))
            }


    1626: A4 43 44 44 53 44 49 44 32                       // .CDDSDID2

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    162F: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1636: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1643: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD2) /* \NXD2 */
                }


    164A: A4 4E 58 44 32                                   // .NXD2

                Return (NDDS (DID2))
            }


    164F: A4 4E 44 44 53 44 49 44 32                       // .NDDSDID2

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1658: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD03)
        {

    1664: 5B 82 42 0A 44 44 30 33                          // [.B.DD03

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    166C: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID3), 0x0400))
                {
                    Store (0x03, EDPV) /* \EDPV */
                    Store (NXD3, NXDX) /* \NXDX */
                    Store (DID3, DIDX) /* \DIDX */

    1674: A0 2A 93 7B 0B 00 0F 44 49 44 33 00 0B 00 04 70  // .*.{...DID3....p
    1684: 0A 03 45 44 50 56 70 4E 58 44 33 4E 58 44 58 70  // ..EDPVpNXD3NXDXp
    1694: 44 49 44 33 44 49 44 58                          // DID3DIDX

                    Return (0x03)
                }


    169C: A4 0A 03                                         // ...

                If (LEqual (DID3, Zero))
                {

    169F: A0 0A 93 44 49 44 33 00                          // ...DID3.

                    Return (0x03)
                }

    16A7: A4 0A 03                                         // ...

                Else
                {

    16AA: A1 0B                                            // ..

                    Return (
    16AC: A4                                               // .

And (0xFFFF, DID3))
                }
            }


    16AD: 7B 0B FF FF 44 49 44 33 00                       // {...DID3.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    16B6: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID3, Zero))
                {

    16BD: A0 0A 93 44 49 44 33 00                          // ...DID3.

                    Return (0x0B)
                }

    16C5: A4 0A 0B                                         // ...

                Else
                {

    16C8: A1 0A                                            // ..

                    Return (CDDS (DID3))
                }
            }


    16CA: A4 43 44 44 53 44 49 44 33                       // .CDDSDID3

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    16D3: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    16DA: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    16E7: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD3) /* \NXD3 */
                }


    16EE: A4 4E 58 44 33                                   // .NXD3

                Return (NDDS (DID3))
            }


    16F3: A4 4E 44 44 53 44 49 44 33                       // .NDDSDID3

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    16FC: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD04)
        {

    1708: 5B 82 42 0A 44 44 30 34                          // [.B.DD04

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1710: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID4), 0x0400))
                {
                    Store (0x04, EDPV) /* \EDPV */
                    Store (NXD4, NXDX) /* \NXDX */
                    Store (DID4, DIDX) /* \DIDX */

    1718: A0 2A 93 7B 0B 00 0F 44 49 44 34 00 0B 00 04 70  // .*.{...DID4....p
    1728: 0A 04 45 44 50 56 70 4E 58 44 34 4E 58 44 58 70  // ..EDPVpNXD4NXDXp
    1738: 44 49 44 34 44 49 44 58                          // DID4DIDX

                    Return (0x04)
                }


    1740: A4 0A 04                                         // ...

                If (LEqual (DID4, Zero))
                {

    1743: A0 0A 93 44 49 44 34 00                          // ...DID4.

                    Return (0x04)
                }

    174B: A4 0A 04                                         // ...

                Else
                {

    174E: A1 0B                                            // ..

                    Return (
    1750: A4                                               // .

And (0xFFFF, DID4))
                }
            }


    1751: 7B 0B FF FF 44 49 44 34 00                       // {...DID4.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    175A: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID4, Zero))
                {

    1761: A0 0A 93 44 49 44 34 00                          // ...DID4.

                    Return (0x0B)
                }

    1769: A4 0A 0B                                         // ...

                Else
                {

    176C: A1 0A                                            // ..

                    Return (CDDS (DID4))
                }
            }


    176E: A4 43 44 44 53 44 49 44 34                       // .CDDSDID4

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1777: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    177E: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    178B: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD4) /* \NXD4 */
                }


    1792: A4 4E 58 44 34                                   // .NXD4

                Return (NDDS (DID4))
            }


    1797: A4 4E 44 44 53 44 49 44 34                       // .NDDSDID4

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    17A0: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD05)
        {

    17AC: 5B 82 42 0A 44 44 30 35                          // [.B.DD05

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    17B4: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID5), 0x0400))
                {
                    Store (0x05, EDPV) /* \EDPV */
                    Store (NXD5, NXDX) /* \NXDX */
                    Store (DID5, DIDX) /* \DIDX */

    17BC: A0 2A 93 7B 0B 00 0F 44 49 44 35 00 0B 00 04 70  // .*.{...DID5....p
    17CC: 0A 05 45 44 50 56 70 4E 58 44 35 4E 58 44 58 70  // ..EDPVpNXD5NXDXp
    17DC: 44 49 44 35 44 49 44 58                          // DID5DIDX

                    Return (0x05)
                }


    17E4: A4 0A 05                                         // ...

                If (LEqual (DID5, Zero))
                {

    17E7: A0 0A 93 44 49 44 35 00                          // ...DID5.

                    Return (0x05)
                }

    17EF: A4 0A 05                                         // ...

                Else
                {

    17F2: A1 0B                                            // ..

                    Return (
    17F4: A4                                               // .

And (0xFFFF, DID5))
                }
            }


    17F5: 7B 0B FF FF 44 49 44 35 00                       // {...DID5.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    17FE: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID5, Zero))
                {

    1805: A0 0A 93 44 49 44 35 00                          // ...DID5.

                    Return (0x0B)
                }

    180D: A4 0A 0B                                         // ...

                Else
                {

    1810: A1 0A                                            // ..

                    Return (CDDS (DID5))
                }
            }


    1812: A4 43 44 44 53 44 49 44 35                       // .CDDSDID5

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    181B: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1822: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    182F: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD5) /* \NXD5 */
                }


    1836: A4 4E 58 44 35                                   // .NXD5

                Return (NDDS (DID5))
            }


    183B: A4 4E 44 44 53 44 49 44 35                       // .NDDSDID5

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1844: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD06)
        {

    1850: 5B 82 42 0A 44 44 30 36                          // [.B.DD06

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1858: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID6), 0x0400))
                {
                    Store (0x06, EDPV) /* \EDPV */
                    Store (NXD6, NXDX) /* \NXDX */
                    Store (DID6, DIDX) /* \DIDX */

    1860: A0 2A 93 7B 0B 00 0F 44 49 44 36 00 0B 00 04 70  // .*.{...DID6....p
    1870: 0A 06 45 44 50 56 70 4E 58 44 36 4E 58 44 58 70  // ..EDPVpNXD6NXDXp
    1880: 44 49 44 36 44 49 44 58                          // DID6DIDX

                    Return (0x06)
                }


    1888: A4 0A 06                                         // ...

                If (LEqual (DID6, Zero))
                {

    188B: A0 0A 93 44 49 44 36 00                          // ...DID6.

                    Return (0x06)
                }

    1893: A4 0A 06                                         // ...

                Else
                {

    1896: A1 0B                                            // ..

                    Return (
    1898: A4                                               // .

And (0xFFFF, DID6))
                }
            }


    1899: 7B 0B FF FF 44 49 44 36 00                       // {...DID6.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    18A2: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID6, Zero))
                {

    18A9: A0 0A 93 44 49 44 36 00                          // ...DID6.

                    Return (0x0B)
                }

    18B1: A4 0A 0B                                         // ...

                Else
                {

    18B4: A1 0A                                            // ..

                    Return (CDDS (DID6))
                }
            }


    18B6: A4 43 44 44 53 44 49 44 36                       // .CDDSDID6

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    18BF: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    18C6: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    18D3: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD6) /* \NXD6 */
                }


    18DA: A4 4E 58 44 36                                   // .NXD6

                Return (NDDS (DID6))
            }


    18DF: A4 4E 44 44 53 44 49 44 36                       // .NDDSDID6

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    18E8: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD07)
        {

    18F4: 5B 82 42 0A 44 44 30 37                          // [.B.DD07

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    18FC: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID7), 0x0400))
                {
                    Store (0x07, EDPV) /* \EDPV */
                    Store (NXD7, NXDX) /* \NXDX */
                    Store (DID7, DIDX) /* \DIDX */

    1904: A0 2A 93 7B 0B 00 0F 44 49 44 37 00 0B 00 04 70  // .*.{...DID7....p
    1914: 0A 07 45 44 50 56 70 4E 58 44 37 4E 58 44 58 70  // ..EDPVpNXD7NXDXp
    1924: 44 49 44 37 44 49 44 58                          // DID7DIDX

                    Return (0x07)
                }


    192C: A4 0A 07                                         // ...

                If (LEqual (DID7, Zero))
                {

    192F: A0 0A 93 44 49 44 37 00                          // ...DID7.

                    Return (0x07)
                }

    1937: A4 0A 07                                         // ...

                Else
                {

    193A: A1 0B                                            // ..

                    Return (
    193C: A4                                               // .

And (0xFFFF, DID7))
                }
            }


    193D: 7B 0B FF FF 44 49 44 37 00                       // {...DID7.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1946: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID7, Zero))
                {

    194D: A0 0A 93 44 49 44 37 00                          // ...DID7.

                    Return (0x0B)
                }

    1955: A4 0A 0B                                         // ...

                Else
                {

    1958: A1 0A                                            // ..

                    Return (CDDS (DID7))
                }
            }


    195A: A4 43 44 44 53 44 49 44 37                       // .CDDSDID7

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1963: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    196A: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1977: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD7) /* \NXD7 */
                }


    197E: A4 4E 58 44 37                                   // .NXD7

                Return (NDDS (DID7))
            }


    1983: A4 4E 44 44 53 44 49 44 37                       // .NDDSDID7

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    198C: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD08)
        {

    1998: 5B 82 42 0A 44 44 30 38                          // [.B.DD08

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    19A0: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID8), 0x0400))
                {
                    Store (0x08, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DID8, DIDX) /* \DIDX */

    19A8: A0 2A 93 7B 0B 00 0F 44 49 44 38 00 0B 00 04 70  // .*.{...DID8....p
    19B8: 0A 08 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    19C8: 44 49 44 38 44 49 44 58                          // DID8DIDX

                    Return (0x08)
                }


    19D0: A4 0A 08                                         // ...

                If (LEqual (DID8, Zero))
                {

    19D3: A0 0A 93 44 49 44 38 00                          // ...DID8.

                    Return (0x08)
                }

    19DB: A4 0A 08                                         // ...

                Else
                {

    19DE: A1 0B                                            // ..

                    Return (
    19E0: A4                                               // .

And (0xFFFF, DID8))
                }
            }


    19E1: 7B 0B FF FF 44 49 44 38 00                       // {...DID8.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    19EA: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID8, Zero))
                {

    19F1: A0 0A 93 44 49 44 38 00                          // ...DID8.

                    Return (0x0B)
                }

    19F9: A4 0A 0B                                         // ...

                Else
                {

    19FC: A1 0A                                            // ..

                    Return (CDDS (DID8))
                }
            }


    19FE: A4 43 44 44 53 44 49 44 38                       // .CDDSDID8

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1A07: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1A0E: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1A1B: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1A22: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DID8))
            }


    1A27: A4 4E 44 44 53 44 49 44 38                       // .NDDSDID8

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1A30: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD09)
        {

    1A3C: 5B 82 42 0A 44 44 30 39                          // [.B.DD09

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1A44: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DID9), 0x0400))
                {
                    Store (0x09, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DID9, DIDX) /* \DIDX */

    1A4C: A0 2A 93 7B 0B 00 0F 44 49 44 39 00 0B 00 04 70  // .*.{...DID9....p
    1A5C: 0A 09 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1A6C: 44 49 44 39 44 49 44 58                          // DID9DIDX

                    Return (0x09)
                }


    1A74: A4 0A 09                                         // ...

                If (LEqual (DID9, Zero))
                {

    1A77: A0 0A 93 44 49 44 39 00                          // ...DID9.

                    Return (0x09)
                }

    1A7F: A4 0A 09                                         // ...

                Else
                {

    1A82: A1 0B                                            // ..

                    Return (
    1A84: A4                                               // .

And (0xFFFF, DID9))
                }
            }


    1A85: 7B 0B FF FF 44 49 44 39 00                       // {...DID9.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1A8E: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DID9, Zero))
                {

    1A95: A0 0A 93 44 49 44 39 00                          // ...DID9.

                    Return (0x0B)
                }

    1A9D: A4 0A 0B                                         // ...

                Else
                {

    1AA0: A1 0A                                            // ..

                    Return (CDDS (DID9))
                }
            }


    1AA2: A4 43 44 44 53 44 49 44 39                       // .CDDSDID9

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1AAB: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1AB2: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1ABF: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1AC6: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DID9))
            }


    1ACB: A4 4E 44 44 53 44 49 44 39                       // .NDDSDID9

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1AD4: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD0A)
        {

    1AE0: 5B 82 42 0A 44 44 30 41                          // [.B.DD0A

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1AE8: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DIDA), 0x0400))
                {
                    Store (0x0A, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DIDA, DIDX) /* \DIDX */

    1AF0: A0 2A 93 7B 0B 00 0F 44 49 44 41 00 0B 00 04 70  // .*.{...DIDA....p
    1B00: 0A 0A 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1B10: 44 49 44 41 44 49 44 58                          // DIDADIDX

                    Return (0x0A)
                }


    1B18: A4 0A 0A                                         // ...

                If (LEqual (DIDA, Zero))
                {

    1B1B: A0 0A 93 44 49 44 41 00                          // ...DIDA.

                    Return (0x0A)
                }

    1B23: A4 0A 0A                                         // ...

                Else
                {

    1B26: A1 0B                                            // ..

                    Return (
    1B28: A4                                               // .

And (0xFFFF, DIDA))
                }
            }


    1B29: 7B 0B FF FF 44 49 44 41 00                       // {...DIDA.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1B32: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DIDA, Zero))
                {

    1B39: A0 0A 93 44 49 44 41 00                          // ...DIDA.

                    Return (0x0B)
                }

    1B41: A4 0A 0B                                         // ...

                Else
                {

    1B44: A1 0A                                            // ..

                    Return (CDDS (DIDA))
                }
            }


    1B46: A4 43 44 44 53 44 49 44 41                       // .CDDSDIDA

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1B4F: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1B56: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1B63: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1B6A: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DIDA))
            }


    1B6F: A4 4E 44 44 53 44 49 44 41                       // .NDDSDIDA

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1B78: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD0B)
        {

    1B84: 5B 82 42 0A 44 44 30 42                          // [.B.DD0B

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1B8C: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DIDB), 0x0400))
                {
                    Store (0x0B, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DIDB, DIDX) /* \DIDX */

    1B94: A0 2A 93 7B 0B 00 0F 44 49 44 42 00 0B 00 04 70  // .*.{...DIDB....p
    1BA4: 0A 0B 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1BB4: 44 49 44 42 44 49 44 58                          // DIDBDIDX

                    Return (0x0B)
                }


    1BBC: A4 0A 0B                                         // ...

                If (LEqual (DIDB, Zero))
                {

    1BBF: A0 0A 93 44 49 44 42 00                          // ...DIDB.

                    Return (0x0B)
                }

    1BC7: A4 0A 0B                                         // ...

                Else
                {

    1BCA: A1 0B                                            // ..

                    Return (
    1BCC: A4                                               // .

And (0xFFFF, DIDB))
                }
            }


    1BCD: 7B 0B FF FF 44 49 44 42 00                       // {...DIDB.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1BD6: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DIDB, Zero))
                {

    1BDD: A0 0A 93 44 49 44 42 00                          // ...DIDB.

                    Return (0x0B)
                }

    1BE5: A4 0A 0B                                         // ...

                Else
                {

    1BE8: A1 0A                                            // ..

                    Return (CDDS (DIDB))
                }
            }


    1BEA: A4 43 44 44 53 44 49 44 42                       // .CDDSDIDB

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1BF3: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1BFA: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1C07: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1C0E: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DIDB))
            }


    1C13: A4 4E 44 44 53 44 49 44 42                       // .NDDSDIDB

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1C1C: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD0C)
        {

    1C28: 5B 82 42 0A 44 44 30 43                          // [.B.DD0C

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1C30: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DIDC), 0x0400))
                {
                    Store (0x0C, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DIDC, DIDX) /* \DIDX */

    1C38: A0 2A 93 7B 0B 00 0F 44 49 44 43 00 0B 00 04 70  // .*.{...DIDC....p
    1C48: 0A 0C 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1C58: 44 49 44 43 44 49 44 58                          // DIDCDIDX

                    Return (0x0C)
                }


    1C60: A4 0A 0C                                         // ...

                If (LEqual (DIDC, Zero))
                {

    1C63: A0 0A 93 44 49 44 43 00                          // ...DIDC.

                    Return (0x0C)
                }

    1C6B: A4 0A 0C                                         // ...

                Else
                {

    1C6E: A1 0B                                            // ..

                    Return (
    1C70: A4                                               // .

And (0xFFFF, DIDC))
                }
            }


    1C71: 7B 0B FF FF 44 49 44 43 00                       // {...DIDC.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1C7A: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DIDC, Zero))
                {

    1C81: A0 0A 93 44 49 44 43 00                          // ...DIDC.

                    Return (0x0C)
                }

    1C89: A4 0A 0C                                         // ...

                Else
                {

    1C8C: A1 0A                                            // ..

                    Return (CDDS (DIDC))
                }
            }


    1C8E: A4 43 44 44 53 44 49 44 43                       // .CDDSDIDC

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1C97: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1C9E: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1CAB: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1CB2: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DIDC))
            }


    1CB7: A4 4E 44 44 53 44 49 44 43                       // .NDDSDIDC

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1CC0: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD0D)
        {

    1CCC: 5B 82 42 0A 44 44 30 44                          // [.B.DD0D

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1CD4: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DIDD), 0x0400))
                {
                    Store (0x0D, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DIDD, DIDX) /* \DIDX */

    1CDC: A0 2A 93 7B 0B 00 0F 44 49 44 44 00 0B 00 04 70  // .*.{...DIDD....p
    1CEC: 0A 0D 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1CFC: 44 49 44 44 44 49 44 58                          // DIDDDIDX

                    Return (0x0D)
                }


    1D04: A4 0A 0D                                         // ...

                If (LEqual (DIDD, Zero))
                {

    1D07: A0 0A 93 44 49 44 44 00                          // ...DIDD.

                    Return (0x0D)
                }

    1D0F: A4 0A 0D                                         // ...

                Else
                {

    1D12: A1 0B                                            // ..

                    Return (
    1D14: A4                                               // .

And (0xFFFF, DIDD))
                }
            }


    1D15: 7B 0B FF FF 44 49 44 44 00                       // {...DIDD.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1D1E: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DIDD, Zero))
                {

    1D25: A0 0A 93 44 49 44 44 00                          // ...DIDD.

                    Return (0x0D)
                }

    1D2D: A4 0A 0D                                         // ...

                Else
                {

    1D30: A1 0A                                            // ..

                    Return (CDDS (DIDD))
                }
            }


    1D32: A4 43 44 44 53 44 49 44 44                       // .CDDSDIDD

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1D3B: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1D42: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1D4F: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1D56: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DIDD))
            }


    1D5B: A4 4E 44 44 53 44 49 44 44                       // .NDDSDIDD

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1D64: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD0E)
        {

    1D70: 5B 82 42 0A 44 44 30 45                          // [.B.DD0E

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1D78: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DIDE), 0x0400))
                {
                    Store (0x0E, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DIDE, DIDX) /* \DIDX */

    1D80: A0 2A 93 7B 0B 00 0F 44 49 44 45 00 0B 00 04 70  // .*.{...DIDE....p
    1D90: 0A 0E 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1DA0: 44 49 44 45 44 49 44 58                          // DIDEDIDX

                    Return (0x0E)
                }


    1DA8: A4 0A 0E                                         // ...

                If (LEqual (DIDE, Zero))
                {

    1DAB: A0 0A 93 44 49 44 45 00                          // ...DIDE.

                    Return (0x0E)
                }

    1DB3: A4 0A 0E                                         // ...

                Else
                {

    1DB6: A1 0B                                            // ..

                    Return (
    1DB8: A4                                               // .

And (0xFFFF, DIDE))
                }
            }


    1DB9: 7B 0B FF FF 44 49 44 45 00                       // {...DIDE.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1DC2: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DIDE, Zero))
                {

    1DC9: A0 0A 93 44 49 44 45 00                          // ...DIDE.

                    Return (0x0E)
                }

    1DD1: A4 0A 0E                                         // ...

                Else
                {

    1DD4: A1 0A                                            // ..

                    Return (CDDS (DIDE))
                }
            }


    1DD6: A4 43 44 44 53 44 49 44 45                       // .CDDSDIDE

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1DDF: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1DE6: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1DF3: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1DFA: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DIDE))
            }


    1DFF: A4 4E 44 44 53 44 49 44 45                       // .NDDSDIDE

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1E08: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD0F)
        {

    1E14: 5B 82 42 0A 44 44 30 46                          // [.B.DD0F

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1E1C: 14 49 04 5F 41 44 52 08                          // .I._ADR.

                If (LEqual (And (0x0F00, DIDF), 0x0400))
                {
                    Store (0x0F, EDPV) /* \EDPV */
                    Store (NXD8, NXDX) /* \NXDX */
                    Store (DIDF, DIDX) /* \DIDX */

    1E24: A0 2A 93 7B 0B 00 0F 44 49 44 46 00 0B 00 04 70  // .*.{...DIDF....p
    1E34: 0A 0F 45 44 50 56 70 4E 58 44 38 4E 58 44 58 70  // ..EDPVpNXD8NXDXp
    1E44: 44 49 44 46 44 49 44 58                          // DIDFDIDX

                    Return (0x0F)
                }


    1E4C: A4 0A 0F                                         // ...

                If (LEqual (DIDF, Zero))
                {

    1E4F: A0 0A 93 44 49 44 46 00                          // ...DIDF.

                    Return (0x0F)
                }

    1E57: A4 0A 0F                                         // ...

                Else
                {

    1E5A: A1 0B                                            // ..

                    Return (
    1E5C: A4                                               // .

And (0xFFFF, DIDF))
                }
            }


    1E5D: 7B 0B FF FF 44 49 44 46 00                       // {...DIDF.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1E66: 14 1C 5F 44 43 53 00                             // .._DCS.

                If (LEqual (DIDC, Zero))
                {

    1E6D: A0 0A 93 44 49 44 43 00                          // ...DIDC.

                    Return (0x0F)
                }

    1E75: A4 0A 0F                                         // ...

                Else
                {

    1E78: A1 0A                                            // ..

                    Return (CDDS (DIDF))
                }
            }


    1E7A: A4 43 44 44 53 44 49 44 46                       // .CDDSDIDF

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1E83: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1E8A: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1E97: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXD8) /* \NXD8 */
                }


    1E9E: A4 4E 58 44 38                                   // .NXD8

                Return (NDDS (DIDF))
            }


    1EA3: A4 4E 44 44 53 44 49 44 46                       // .NDDSDIDF

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1EAC: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Device (DD1F)
        {

    1EB8: 5B 82 45 07 44 44 31 46                          // [.E.DD1F

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {

    1EC0: 14 1D 5F 41 44 52 08                             // .._ADR.

                If (LEqual (EDPV, Zero))
                {

    1EC7: A0 0A 93 45 44 50 56 00                          // ...EDPV.

                    Return (0x1F)
                }

    1ECF: A4 0A 1F                                         // ...

                Else
                {

    1ED2: A1 0B                                            // ..

                    Return (
    1ED4: A4                                               // .

And (0xFFFF, DIDX))
                }
            }


    1ED5: 7B 0B FF FF 44 49 44 58 00                       // {...DIDX.

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {

    1EDE: 14 1B 5F 44 43 53 00                             // .._DCS.

                If (LEqual (EDPV, Zero))
                {

    1EE5: A0 09 93 45 44 50 56 00                          // ...EDPV.

                    Return (Zero)
                }

    1EED: A4 00                                            // ..

                Else
                {

    1EEF: A1 0A                                            // ..

                    Return (CDDS (DIDX))
                }
            }


    1EF1: A4 43 44 44 53 44 49 44 58                       // .CDDSDIDX

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {

    1EFA: 14 28 5F 44 47 53 00                             // .(_DGS.

                If (LAnd (LEqual (And (SGMD, 0x7F), One), 
    1F01: A0 18 90 93 7B 53 47 4D 44 0A 7F 00 01           // ....{SGMD....

CondRefOf (SNXD)))
                {

    1F0E: 5B 12 53 4E 58 44 00                             // [.SNXD.

                    Return (NXDX) /* \NXDX */
                }


    1F15: A4 4E 58 44 58                                   // .NXDX

                Return (NDDS (DIDX))
            }


    1F1A: A4 4E 44 44 53 44 49 44 58                       // .NDDSDIDX

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }


    1F23: 14 0B 5F 44 53 53 01 44 53 53 54 68              // .._DSS.DSSTh

        Method (SDDL, 1, NotSerialized)
        {
            Increment (NDID)
            Store (And (Arg0, 0x0F0F), Local0)
            Or (0x80000000, Local0, Local1)

    1F2F: 14 44 0B 53 44 44 4C 01 75 4E 44 49 44 70 7B 68  // .D.SDDL.uNDIDp{h
    1F3F: 0B 0F 0F 00 60 7D 0C 00 00 00 80 60 61           // ....`}.....`a

            If (LEqual (DIDL, Local0))
            {

    1F4C: A0 09 93 44 49 44 4C 60                          // ...DIDL`

                Return (Local1)
            }


    1F54: A4 61                                            // .a

            If (LEqual (DDL2, Local0))
            {

    1F56: A0 09 93 44 44 4C 32 60                          // ...DDL2`

                Return (Local1)
            }


    1F5E: A4 61                                            // .a

            If (LEqual (DDL3, Local0))
            {

    1F60: A0 09 93 44 44 4C 33 60                          // ...DDL3`

                Return (Local1)
            }


    1F68: A4 61                                            // .a

            If (LEqual (DDL4, Local0))
            {

    1F6A: A0 09 93 44 44 4C 34 60                          // ...DDL4`

                Return (Local1)
            }


    1F72: A4 61                                            // .a

            If (LEqual (DDL5, Local0))
            {

    1F74: A0 09 93 44 44 4C 35 60                          // ...DDL5`

                Return (Local1)
            }


    1F7C: A4 61                                            // .a

            If (LEqual (DDL6, Local0))
            {

    1F7E: A0 09 93 44 44 4C 36 60                          // ...DDL6`

                Return (Local1)
            }


    1F86: A4 61                                            // .a

            If (LEqual (DDL7, Local0))
            {

    1F88: A0 09 93 44 44 4C 37 60                          // ...DDL7`

                Return (Local1)
            }


    1F90: A4 61                                            // .a

            If (LEqual (DDL8, Local0))
            {

    1F92: A0 09 93 44 44 4C 38 60                          // ...DDL8`

                Return (Local1)
            }


    1F9A: A4 61                                            // .a

            If (LEqual (DDL9, Local0))
            {

    1F9C: A0 09 93 44 44 4C 39 60                          // ...DDL9`

                Return (Local1)
            }


    1FA4: A4 61                                            // .a

            If (LEqual (DD10, Local0))
            {

    1FA6: A0 09 93 44 44 31 30 60                          // ...DD10`

                Return (Local1)
            }


    1FAE: A4 61                                            // .a

            If (LEqual (DD11, Local0))
            {

    1FB0: A0 09 93 44 44 31 31 60                          // ...DD11`

                Return (Local1)
            }


    1FB8: A4 61                                            // .a

            If (LEqual (DD12, Local0))
            {

    1FBA: A0 09 93 44 44 31 32 60                          // ...DD12`

                Return (Local1)
            }


    1FC2: A4 61                                            // .a

            If (LEqual (DD13, Local0))
            {

    1FC4: A0 09 93 44 44 31 33 60                          // ...DD13`

                Return (Local1)
            }


    1FCC: A4 61                                            // .a

            If (LEqual (DD14, Local0))
            {

    1FCE: A0 09 93 44 44 31 34 60                          // ...DD14`

                Return (Local1)
            }


    1FD6: A4 61                                            // .a

            If (LEqual (DD15, Local0))
            {

    1FD8: A0 09 93 44 44 31 35 60                          // ...DD15`

                Return (Local1)
            }


    1FE0: A4 61                                            // .a

            Return (Zero)
        }


    1FE2: A4 00                                            // ..

        Method (CDDS, 1, NotSerialized)
        {
            Store (And (Arg0, 0x0F0F), Local0)

    1FE4: 14 42 07 43 44 44 53 01 70 7B 68 0B 0F 0F 00 60  // .B.CDDS.p{h....`

            If (LEqual (Zero, Local0))
            {

    1FF4: A0 07 93 00 60                                   // ....`

                Return (0x1D)
            }


    1FF9: A4 0A 1D                                         // ...

            If (LEqual (CADL, Local0))
            {

    1FFC: A0 0A 93 43 41 44 4C 60                          // ...CADL`

                Return (0x1F)
            }


    2004: A4 0A 1F                                         // ...

            If (LEqual (CAL2, Local0))
            {

    2007: A0 0A 93 43 41 4C 32 60                          // ...CAL2`

                Return (0x1F)
            }


    200F: A4 0A 1F                                         // ...

            If (LEqual (CAL3, Local0))
            {

    2012: A0 0A 93 43 41 4C 33 60                          // ...CAL3`

                Return (0x1F)
            }


    201A: A4 0A 1F                                         // ...

            If (LEqual (CAL4, Local0))
            {

    201D: A0 0A 93 43 41 4C 34 60                          // ...CAL4`

                Return (0x1F)
            }


    2025: A4 0A 1F                                         // ...

            If (LEqual (CAL5, Local0))
            {

    2028: A0 0A 93 43 41 4C 35 60                          // ...CAL5`

                Return (0x1F)
            }


    2030: A4 0A 1F                                         // ...

            If (LEqual (CAL6, Local0))
            {

    2033: A0 0A 93 43 41 4C 36 60                          // ...CAL6`

                Return (0x1F)
            }


    203B: A4 0A 1F                                         // ...

            If (LEqual (CAL7, Local0))
            {

    203E: A0 0A 93 43 41 4C 37 60                          // ...CAL7`

                Return (0x1F)
            }


    2046: A4 0A 1F                                         // ...

            If (LEqual (CAL8, Local0))
            {

    2049: A0 0A 93 43 41 4C 38 60                          // ...CAL8`

                Return (0x1F)
            }


    2051: A4 0A 1F                                         // ...

            Return (0x1D)
        }


    2054: A4 0A 1D                                         // ...

        Method (NDDS, 1, NotSerialized)
        {
            Store (And (Arg0, 0x0F0F), Local0)

    2057: 14 48 06 4E 44 44 53 01 70 7B 68 0B 0F 0F 00 60  // .H.NDDS.p{h....`

            If (LEqual (Zero, Local0))
            {

    2067: A0 06 93 00 60                                   // ....`

                Return (Zero)
            }


    206C: A4 00                                            // ..

            If (LEqual (NADL, Local0))
            {

    206E: A0 09 93 4E 41 44 4C 60                          // ...NADL`

                Return (One)
            }


    2076: A4 01                                            // ..

            If (LEqual (NDL2, Local0))
            {

    2078: A0 09 93 4E 44 4C 32 60                          // ...NDL2`

                Return (One)
            }


    2080: A4 01                                            // ..

            If (LEqual (NDL3, Local0))
            {

    2082: A0 09 93 4E 44 4C 33 60                          // ...NDL3`

                Return (One)
            }


    208A: A4 01                                            // ..

            If (LEqual (NDL4, Local0))
            {

    208C: A0 09 93 4E 44 4C 34 60                          // ...NDL4`

                Return (One)
            }


    2094: A4 01                                            // ..

            If (LEqual (NDL5, Local0))
            {

    2096: A0 09 93 4E 44 4C 35 60                          // ...NDL5`

                Return (One)
            }


    209E: A4 01                                            // ..

            If (LEqual (NDL6, Local0))
            {

    20A0: A0 09 93 4E 44 4C 36 60                          // ...NDL6`

                Return (One)
            }


    20A8: A4 01                                            // ..

            If (LEqual (NDL7, Local0))
            {

    20AA: A0 09 93 4E 44 4C 37 60                          // ...NDL7`

                Return (One)
            }


    20B2: A4 01                                            // ..

            If (LEqual (NDL8, Local0))
            {

    20B4: A0 09 93 4E 44 4C 38 60                          // ...NDL8`

                Return (One)
            }


    20BC: A4 01                                            // ..

            Return (Zero)
        }


    20BE: A4 00                                            // ..

        Method (DSST, 1, NotSerialized)
        {

    20C0: 14 1F 44 53 53 54 01                             // ..DSST.

            If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
            {

    20C7: A0 18 93 7B 68 0C 00 00 00 C0 00 0C 00 00 00 C0  // ...{h...........

                Store (NSTE, CSTE) /* \CSTE */
            }
        }


    20D7: 70 4E 53 54 45 43 53 54 45                       // pNSTECSTE

        Scope (\_SB.PCI0)
        {

    20E0: 10 30 5C 2E 5F 53 42 5F 50 43 49 30              // .0\._SB_PCI0

            OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)

    20EC: 5B 80 4D 43 48 50 02 0A 40 0A C0                 // [.MCHP..@..

            Field (MCHP, AnyAcc, NoLock, Preserve)
            {
                Offset (0x14), 
                AUDE,   8, 
                Offset (0x60), 
                TASM,   10, 
                Offset (0x62)
            }
        }


    20F7: 5B 81 18 4D 43 48 50 00 00 40 0A 41 55 44 45 08  // [..MCHP..@.AUDE.
    2107: 00 48 25 54 41 53 4D 0A 00 06                    // .H%TASM...

        OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)

    2111: 5B 80 49 47 44 50 02 0A 40 0A C0                 // [.IGDP..@..

        Field (IGDP, AnyAcc, NoLock, Preserve)
        {
            Offset (0x10), 
                ,   1, 
            GIVD,   1, 
                ,   2, 
            GUMA,   3, 
            Offset (0x12), 
            Offset (0x14), 
                ,   4, 
            GMFN,   1, 
            Offset (0x18), 
            Offset (0xA4), 
            ASLE,   8, 
            Offset (0xA8), 
            GSSE,   1, 
            GSSB,   14, 
            GSES,   1, 
            Offset (0xB0), 
                ,   12, 
            CDVL,   1, 
            Offset (0xB2), 
            Offset (0xB5), 
            LBPC,   8, 
            Offset (0xBC), 
            ASLS,   32
        }


    211C: 5B 81 47 05 49 47 44 50 00 00 40 08 00 01 47 49  // [.G.IGDP..@...GI
    212C: 56 44 01 00 02 47 55 4D 41 03 00 09 00 10 00 04  // VD...GUMA.......
    213C: 47 4D 46 4E 01 00 1B 00 40 46 41 53 4C 45 08 00  // GMFN....@FASLE..
    214C: 18 47 53 53 45 01 47 53 53 42 0E 47 53 45 53 01  // .GSSE.GSSB.GSES.
    215C: 00 30 00 0C 43 44 56 4C 01 00 03 00 18 4C 42 50  // .0..CDVL.....LBP
    216C: 43 08 00 30 41 53 4C 53 20                       // C..0ASLS 

        OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)

    2175: 5B 80 49 47 44 4D 00 41 53 4C 42 0B 00 20        // [.IGDM.ASLB.. 

        Field (IGDM, AnyAcc, NoLock, Preserve)
        {
            SIGN,   128, 
            SIZE,   32, 
            OVER,   32, 
            SVER,   256, 
            VVER,   128, 
            GVER,   128, 
            MBOX,   32, 
            DMOD,   32, 
            PCON,   32, 
            DVER,   64, 
            Offset (0x100), 
            DRDY,   32, 
            CSTS,   32, 
            CEVT,   32, 
            Offset (0x120), 
            DIDL,   32, 
            DDL2,   32, 
            DDL3,   32, 
            DDL4,   32, 
            DDL5,   32, 
            DDL6,   32, 
            DDL7,   32, 
            DDL8,   32, 
            CPDL,   32, 
            CPL2,   32, 
            CPL3,   32, 
            CPL4,   32, 
            CPL5,   32, 
            CPL6,   32, 
            CPL7,   32, 
            CPL8,   32, 
            CADL,   32, 
            CAL2,   32, 
            CAL3,   32, 
            CAL4,   32, 
            CAL5,   32, 
            CAL6,   32, 
            CAL7,   32, 
            CAL8,   32, 
            NADL,   32, 
            NDL2,   32, 
            NDL3,   32, 
            NDL4,   32, 
            NDL5,   32, 
            NDL6,   32, 
            NDL7,   32, 
            NDL8,   32, 
            ASLP,   32, 
            TIDX,   32, 
            CHPD,   32, 
            CLID,   32, 
            CDCK,   32, 
            SXSW,   32, 
            EVTS,   32, 
            CNOT,   32, 
            NRDY,   32, 
            DDL9,   32, 
            DD10,   32, 
            DD11,   32, 
            DD12,   32, 
            DD13,   32, 
            DD14,   32, 
            DD15,   32, 
            CPL9,   32, 
            CP10,   32, 
            CP11,   32, 
            CP12,   32, 
            CP13,   32, 
            CP14,   32, 
            CP15,   32, 
            Offset (0x200), 
            SCIE,   1, 
            GEFC,   4, 
            GXFC,   3, 
            GESF,   8, 
            Offset (0x204), 
            PARM,   32, 
            DSLP,   32, 
            Offset (0x300), 
            ARDY,   32, 
            ASLC,   32, 
            TCHE,   32, 
            ALSI,   32, 
            BCLP,   32, 
            PFIT,   32, 
            CBLV,   32, 
            BCLM,   320, 
            CPFM,   32, 
            EPFM,   32, 
            PLUT,   592, 
            PFMB,   32, 
            CCDV,   32, 
            PCFT,   32, 
            SROT,   32, 
            IUER,   32, 
            FDSS,   64, 
            FDSP,   32, 
            STAT,   32, 
            Offset (0x400), 
            RVBT,   49152, 
            PHED,   32, 
            BDDC,   2048
        }


    2183: 5B 81 42 20 49 47 44 4D 00 53 49 47 4E 40 08 53  // [.B IGDM.SIGN@.S
    2193: 49 5A 45 20 4F 56 45 52 20 53 56 45 52 40 10 56  // IZE OVER SVER@.V
    21A3: 56 45 52 40 08 47 56 45 52 40 08 4D 42 4F 58 20  // VER@.GVER@.MBOX 
    21B3: 44 4D 4F 44 20 50 43 4F 4E 20 44 56 45 52 40 04  // DMOD PCON DVER@.
    21C3: 00 40 4A 44 52 44 59 20 43 53 54 53 20 43 45 56  // .@JDRDY CSTS CEV
    21D3: 54 20 00 40 0A 44 49 44 4C 20 44 44 4C 32 20 44  // T .@.DIDL DDL2 D
    21E3: 44 4C 33 20 44 44 4C 34 20 44 44 4C 35 20 44 44  // DL3 DDL4 DDL5 DD
    21F3: 4C 36 20 44 44 4C 37 20 44 44 4C 38 20 43 50 44  // L6 DDL7 DDL8 CPD
    2203: 4C 20 43 50 4C 32 20 43 50 4C 33 20 43 50 4C 34  // L CPL2 CPL3 CPL4
    2213: 20 43 50 4C 35 20 43 50 4C 36 20 43 50 4C 37 20  //  CPL5 CPL6 CPL7 
    2223: 43 50 4C 38 20 43 41 44 4C 20 43 41 4C 32 20 43  // CPL8 CADL CAL2 C
    2233: 41 4C 33 20 43 41 4C 34 20 43 41 4C 35 20 43 41  // AL3 CAL4 CAL5 CA
    2243: 4C 36 20 43 41 4C 37 20 43 41 4C 38 20 4E 41 44  // L6 CAL7 CAL8 NAD
    2253: 4C 20 4E 44 4C 32 20 4E 44 4C 33 20 4E 44 4C 34  // L NDL2 NDL3 NDL4
    2263: 20 4E 44 4C 35 20 4E 44 4C 36 20 4E 44 4C 37 20  //  NDL5 NDL6 NDL7 
    2273: 4E 44 4C 38 20 41 53 4C 50 20 54 49 44 58 20 43  // NDL8 ASLP TIDX C
    2283: 48 50 44 20 43 4C 49 44 20 43 44 43 4B 20 53 58  // HPD CLID CDCK SX
    2293: 53 57 20 45 56 54 53 20 43 4E 4F 54 20 4E 52 44  // SW EVTS CNOT NRD
    22A3: 59 20 44 44 4C 39 20 44 44 31 30 20 44 44 31 31  // Y DDL9 DD10 DD11
    22B3: 20 44 44 31 32 20 44 44 31 33 20 44 44 31 34 20  //  DD12 DD13 DD14 
    22C3: 44 44 31 35 20 43 50 4C 39 20 43 50 31 30 20 43  // DD15 CPL9 CP10 C
    22D3: 50 31 31 20 43 50 31 32 20 43 50 31 33 20 43 50  // P11 CP12 CP13 CP
    22E3: 31 34 20 43 50 31 35 20 00 20 53 43 49 45 01 47  // 14 CP15 . SCIE.G
    22F3: 45 46 43 04 47 58 46 43 03 47 45 53 46 08 00 10  // EFC.GXFC.GESF...
    2303: 50 41 52 4D 20 44 53 4C 50 20 00 40 7A 41 52 44  // PARM DSLP .@zARD
    2313: 59 20 41 53 4C 43 20 54 43 48 45 20 41 4C 53 49  // Y ASLC TCHE ALSI
    2323: 20 42 43 4C 50 20 50 46 49 54 20 43 42 4C 56 20  //  BCLP PFIT CBLV 
    2333: 42 43 4C 4D 40 14 43 50 46 4D 20 45 50 46 4D 20  // BCLM@.CPFM EPFM 
    2343: 50 4C 55 54 40 25 50 46 4D 42 20 43 43 44 56 20  // PLUT@%PFMB CCDV 
    2353: 50 43 46 54 20 53 52 4F 54 20 49 55 45 52 20 46  // PCFT SROT IUER F
    2363: 44 53 53 40 04 46 44 53 50 20 53 54 41 54 20 00  // DSS@.FDSP STAT .
    2373: 40 23 52 56 42 54 80 00 0C 50 48 45 44 20 42 44  // @#RVBT...PHED BD
    2383: 44 43 40 80                                      // DC@.

        Name (DBTB, 
    2387: 08 44 42 54 42                                   // .DBTB

Package (0x15)
        {
            Zero, 
            0x07, 
            0x38, 
            0x01C0, 
            0x0E00, 
            0x3F, 
            0x01C7, 
            0x0E07, 
            0x01F8, 
            0x0E38, 
            0x0FC0, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            0x7000, 
            0x7007, 
            0x7038, 
            0x71C0, 
            0x7E00
        })

    238C: 12 32 15 00 0A 07 0A 38 0B C0 01 0B 00 0E 0A 3F  // .2.....8.......?
    239C: 0B C7 01 0B 07 0E 0B F8 01 0B 38 0E 0B C0 0F 00  // ..........8.....
    23AC: 00 00 00 00 0B 00 70 0B 07 70 0B 38 70 0B C0 71  // ......p..p.8p..q
    23BC: 0B 00 7E                                         // ..~

        Name (CDCT, 
    23BF: 08 43 44 43 54                                   // .CDCT

Package (0x05)
        {

    23C4: 12 27 05                                         // .'.

            Package (0x02)
            {
                0xE4, 
                0x0140
            }, 


    23C7: 12 07 02 0A E4 0B 40 01                          // ......@.

            Package (0x02)
            {
                0xDE, 
                0x014D
            }, 


    23CF: 12 07 02 0A DE 0B 4D 01                          // ......M.

            Package (0x02)
            {
                0xDE, 
                0x014D
            }, 


    23D7: 12 07 02 0A DE 0B 4D 01                          // ......M.

            Package (0x02)
            {
                Zero, 
                Zero
            }, 


    23DF: 12 04 02 00 00                                   // .....

            Package (0x02)
            {
                0xDE, 
                0x014D
            }
        })

    23E4: 12 07 02 0A DE 0B 4D 01                          // ......M.

        Name (SUCC, One)

    23EC: 08 53 55 43 43 01                                // .SUCC.

        Name (NVLD, 0x02)

    23F2: 08 4E 56 4C 44 0A 02                             // .NVLD..

        Name (CRIT, 0x04)

    23F9: 08 43 52 49 54 0A 04                             // .CRIT..

        Name (NCRT, 0x06)

    2400: 08 4E 43 52 54 0A 06                             // .NCRT..

        Method (GSCI, 0, Serialized)
        {

    2407: 14 49 4E 47 53 43 49 08                          // .INGSCI.

            Method (GBDA, 0, Serialized)
            {

    240F: 14 40 1D 47 42 44 41 08                          // .@.GBDA.

                If (LEqual (GESF, Zero))
                {
                    Store (0x0659, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    2417: A0 1A 93 47 45 53 46 00 70 0B 59 06 50 41 52 4D  // ...GESF.p.Y.PARM
    2427: 70 00 47 45 53 46                                // p.GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    242D: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, One))
                {
                    Store (0x00300482, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2432: A0 30 93 47 45 53 46 01 70 0C 82 04 30 00 50 41  // .0.GESF.p...0.PA
    2442: 52 4D                                            // RM

                    If (LEqual (S0ID, One))
                    {

    2444: A0 13 93 53 30 49 44 01                          // ...S0ID.

                        Or (PARM, 0x0100, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    244C: 7D 50 41 52 4D 0B 00 01 50 41 52 4D 70 00 47 45  // }PARM...PARMp.GE
    245C: 53 46                                            // SF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    245E: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x04))
                {
                    And (PARM, 0xEFFF0000, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    And (PARM, ShiftLeft (DerefOf (
    2463: A0 47 04 93 47 45 53 46 0A 04 7B 50 41 52 4D 0C  // .G..GESF..{PARM.
    2473: 00 00 FF EF 50 41 52 4D 7B 50 41 52 4D 79 83     // ....PARM{PARMy.

Index (DBTB, IBTT)), 0x10), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (IBTT, PARM, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    2482: 88 44 42 54 42 49 42 54 54 00 0A 10 00 50 41 52  // .DBTBIBTT....PAR
    2492: 4D 7D 49 42 54 54 50 41 52 4D 50 41 52 4D 70 00  // M}IBTTPARMPARMp.
    24A2: 47 45 53 46                                      // GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    24A6: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x05))
                {
                    Store (IPSC, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (PARM, ShiftLeft (IPAT, 0x08), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Add (PARM, 0x0100, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (PARM, ShiftLeft (LIDS, 0x10), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Add (PARM, 0x00010000, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (PARM, ShiftLeft (IBIA, 0x14), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    24AB: A0 4A 06 93 47 45 53 46 0A 05 70 49 50 53 43 50  // .J..GESF..pIPSCP
    24BB: 41 52 4D 7D 50 41 52 4D 79 49 50 41 54 0A 08 00  // ARM}PARMyIPAT...
    24CB: 50 41 52 4D 72 50 41 52 4D 0B 00 01 50 41 52 4D  // PARMrPARM...PARM
    24DB: 7D 50 41 52 4D 79 4C 49 44 53 0A 10 00 50 41 52  // }PARMyLIDS...PAR
    24EB: 4D 72 50 41 52 4D 0C 00 00 01 00 50 41 52 4D 7D  // MrPARM.....PARM}
    24FB: 50 41 52 4D 79 49 42 49 41 0A 14 00 50 41 52 4D  // PARMyIBIA...PARM
    250B: 70 00 47 45 53 46                                // p.GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2511: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x07))
                {
                    Store (GIVD, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    XOr (PARM, One, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (PARM, ShiftLeft (GMFN, One), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (PARM, 0x1800, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (PARM, ShiftLeft (IDMS, 0x11), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Or (ShiftLeft (DerefOf (
    2516: A0 43 07 93 47 45 53 46 0A 07 70 47 49 56 44 50  // .C..GESF..pGIVDP
    2526: 41 52 4D 7F 50 41 52 4D 01 50 41 52 4D 7D 50 41  // ARM.PARM.PARM}PA
    2536: 52 4D 79 47 4D 46 4E 01 00 50 41 52 4D 7D 50 41  // RMyGMFN..PARM}PA
    2546: 52 4D 0B 00 18 50 41 52 4D 7D 50 41 52 4D 79 49  // RM...PARM}PARMyI
    2556: 44 4D 53 0A 11 00 50 41 52 4D 7D 79 83           // DMS...PARM}y.

Index (DerefOf (
    2563: 88 83                                            // ..

Index (CDCT, HVCO)), CDVL)), 0x15
                        ), PARM, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (One, GESF) /* \_SB_.PCI0.GFX0.GESF */

    2565: 88 43 44 43 54 48 56 43 4F 00 43 44 56 4C 00 0A  // .CDCTHVCO.CDVL..
    2575: 15 00 50 41 52 4D 50 41 52 4D 70 01 47 45 53 46  // ..PARMPARMp.GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2585: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x0A))
                {
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    258A: A0 2A 93 47 45 53 46 0A 0A 70 00 50 41 52 4D     // .*.GESF..p.PARM

                    If (ISSC)
                    {

    2599: A0 10 49 53 53 43                                // ..ISSC

                        Or (PARM, 0x03, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    259F: 7D 50 41 52 4D 0A 03 50 41 52 4D 70 00 47 45 53  // }PARM..PARMp.GES
    25AF: 46                                               // F

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    25B0: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x0B))
                {
                    Store (KSV0, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (KSV1, GESF) /* \_SB_.PCI0.GFX0.GESF */

    25B5: A0 1F 93 47 45 53 46 0A 0B 70 4B 53 56 30 50 41  // ...GESF..pKSV0PA
    25C5: 52 4D 70 4B 53 56 31 47 45 53 46                 // RMpKSV1GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    25D0: A4 53 55 43 43 70 00 47 45 53 46                 // .SUCCp.GESF

                Return (CRIT) /* \_SB_.PCI0.GFX0.CRIT */
            }


    25DB: A4 43 52 49 54                                   // .CRIT

            Method (SBCB, 0, Serialized)
            {

    25E0: 14 42 2D 53 42 43 42 08                          // .B-SBCB.

                If (LEqual (GESF, Zero))
                {
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (0x000F87DD, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    25E8: A0 22 93 47 45 53 46 00 70 00 50 41 52 4D 70 0C  // .".GESF.p.PARMp.
    25F8: DD 87 0F 00 50 41 52 4D 70 00 47 45 53 46        // ....PARMp.GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2606: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, One))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    260B: A0 18 93 47 45 53 46 01 70 00 47 45 53 46 70 00  // ...GESF.p.GESFp.
    261B: 50 41 52 4D                                      // PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    261F: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x03))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2624: A0 19 93 47 45 53 46 0A 03 70 00 47 45 53 46 70  // ...GESF..p.GESFp
    2634: 00 50 41 52 4D                                   // .PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2639: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x04))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    263E: A0 19 93 47 45 53 46 0A 04 70 00 47 45 53 46 70  // ...GESF..p.GESFp
    264E: 00 50 41 52 4D                                   // .PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2653: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x05))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2658: A0 19 93 47 45 53 46 0A 05 70 00 47 45 53 46 70  // ...GESF..p.GESFp
    2668: 00 50 41 52 4D                                   // .PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    266D: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x07))
                {

    2672: A0 4A 07 93 47 45 53 46 0A 07                    // .J..GESF..

                    If (LAnd (LEqual (S0ID, One), 
    267C: A0 34 90 93 53 30 49 44 01                       // .4..S0ID.

LLess (OSYS, 0x07DF)))
                    {

    2685: 95 4F 53 59 53 0B DF 07                          // .OSYS...

                        If (LEqual (And (PARM, 0xFF), One))
                        {
                            \GUAM (One)
                        }


    268D: A0 11 93 7B 50 41 52 4D 0A FF 00 01 5C 47 55 41  // ...{PARM....\GUA
    269D: 4D 01                                            // M.

                        If (LEqual (And (PARM, 0xFF), Zero))
                        {
                            \GUAM (Zero)
                        }
                    }


    269F: A0 11 93 7B 50 41 52 4D 0A FF 00 00 5C 47 55 41  // ...{PARM....\GUA
    26AF: 4D 00                                            // M.

                    If (LEqual (PARM, Zero))
                    {
                        Store (CLID, Local0)

    26B1: A0 2A 93 50 41 52 4D 00 70 43 4C 49 44 60        // .*.PARM.pCLID`

                        If (And (0x80000000, Local0))
                        {
                            And (CLID, 0x0F, CLID) /* \_SB_.PCI0.GFX0.CLID */
                            GLID (CLID)
                        }
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    26BF: A0 1C 7B 0C 00 00 00 80 60 00 7B 43 4C 49 44 0A  // ..{.....`.{CLID.
    26CF: 0F 43 4C 49 44 47 4C 49 44 43 4C 49 44 70 00 47  // .CLIDGLIDCLIDp.G
    26DF: 45 53 46 70 00 50 41 52 4D                       // ESFp.PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    26E8: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x08))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    26ED: A0 19 93 47 45 53 46 0A 08 70 00 47 45 53 46 70  // ...GESF..p.GESFp
    26FD: 00 50 41 52 4D                                   // .PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2702: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x09))
                {
                    And (PARM, 0xFF, IBTT) /* \IBTT */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2707: A0 24 93 47 45 53 46 0A 09 7B 50 41 52 4D 0A FF  // .$.GESF..{PARM..
    2717: 49 42 54 54 70 00 47 45 53 46 70 00 50 41 52 4D  // IBTTp.GESFp.PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2727: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x0A))
                {
                    And (PARM, 0xFF, IPSC) /* \IPSC */

    272C: A0 46 05 93 47 45 53 46 0A 0A 7B 50 41 52 4D 0A  // .F..GESF..{PARM.
    273C: FF 49 50 53 43                                   // .IPSC

                    If (And (ShiftRight (PARM, 0x08), 0xFF))
                    {
                        And (ShiftRight (PARM, 0x08), 0xFF, IPAT) /* \IPAT */

    2741: A0 21 7B 7A 50 41 52 4D 0A 08 00 0A FF 00 7B 7A  // .!{zPARM......{z
    2751: 50 41 52 4D 0A 08 00 0A FF 49 50 41 54           // PARM.....IPAT

                        Decrement (IPAT)
                    }

                    And (ShiftRight (PARM, 0x14), 0x07, IBIA) /* \IBIA */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    275E: 76 49 50 41 54 7B 7A 50 41 52 4D 0A 14 00 0A 07  // vIPAT{zPARM.....
    276E: 49 42 49 41 70 00 47 45 53 46 70 00 50 41 52 4D  // IBIAp.GESFp.PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    277E: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x0B))
                {
                    And (ShiftRight (PARM, One), One, IF1E) /* \IF1E */

    2783: A0 44 05 93 47 45 53 46 0A 0B 7B 7A 50 41 52 4D  // .D..GESF..{zPARM
    2793: 01 00 01 49 46 31 45                             // ...IF1E

                    If (And (PARM, 0x0001E000))
                    {

    279A: A0 1B 7B 50 41 52 4D 0C 00 E0 01 00 00           // ..{PARM......

                        And (ShiftRight (PARM, 0x0D), 0x0F, IDMS) /* \IDMS */
                    }

    27A7: 7B 7A 50 41 52 4D 0A 0D 00 0A 0F 49 44 4D 53     // {zPARM.....IDMS

                    Else
                    {

    27B6: A1 10                                            // ..

                        And (ShiftRight (PARM, 0x11), 0x0F, IDMS) /* \IDMS */
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    27B8: 7B 7A 50 41 52 4D 0A 11 00 0A 0F 49 44 4D 53 70  // {zPARM.....IDMSp
    27C8: 00 47 45 53 46 70 00 50 41 52 4D                 // .GESFp.PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    27D3: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x10))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    27D8: A0 19 93 47 45 53 46 0A 10 70 00 47 45 53 46 70  // ...GESF..p.GESFp
    27E8: 00 50 41 52 4D                                   // .PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    27ED: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x11))
                {
                    Store (ShiftLeft (LIDS, 0x08), PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Add (PARM, 0x0100, PARM) /* \_SB_.PCI0.GFX0.PARM */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    27F2: A0 2C 93 47 45 53 46 0A 11 70 79 4C 49 44 53 0A  // .,.GESF..pyLIDS.
    2802: 08 00 50 41 52 4D 72 50 41 52 4D 0B 00 01 50 41  // ..PARMrPARM...PA
    2812: 52 4D 70 00 47 45 53 46                          // RMp.GESF

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    281A: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x12))
                {

    281F: A0 49 04 93 47 45 53 46 0A 12                    // .I..GESF..

                    If (And (PARM, One))
                    {

    2829: A0 26 7B 50 41 52 4D 01 00                       // .&{PARM..

                        If (LEqual (ShiftRight (PARM, One), One))
                        {

    2832: A0 10 93 7A 50 41 52 4D 01 00 01                 // ...zPARM...

                            Store (One, ISSC) /* \ISSC */
                        }

    283D: 70 01 49 53 53 43                                // p.ISSC

                        Else
                        {
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    2843: A1 0C 70 00 47 45 53 46                          // ..p.GESF

                            Return (CRIT) /* \_SB_.PCI0.GFX0.CRIT */
                        }
                    }

    284B: A4 43 52 49 54                                   // .CRIT

                    Else
                    {

    2850: A1 07                                            // ..

                        Store (Zero, ISSC) /* \ISSC */
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2852: 70 00 49 53 53 43 70 00 47 45 53 46 70 00 50 41  // p.ISSCp.GESFp.PA
    2862: 52 4D                                            // RM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    2864: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x13))
                {
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2869: A0 19 93 47 45 53 46 0A 13 70 00 47 45 53 46 70  // ...GESF..p.GESFp
    2879: 00 50 41 52 4D                                   // .PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }


    287E: A4 53 55 43 43                                   // .SUCC

                If (LEqual (GESF, 0x14))
                {
                    And (PARM, 0x0F, PAVP) /* \PAVP */
                    Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                    Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */

    2883: A0 24 93 47 45 53 46 0A 14 7B 50 41 52 4D 0A 0F  // .$.GESF..{PARM..
    2893: 50 41 56 50 70 00 47 45 53 46 70 00 50 41 52 4D  // PAVPp.GESFp.PARM

                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */

    28A3: A4 53 55 43 43 70 00 47 45 53 46                 // .SUCCp.GESF

                Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
            }


    28AE: A4 53 55 43 43                                   // .SUCC

            If (LEqual (GEFC, 0x04))
            {

    28B3: A0 11 93 47 45 46 43 0A 04                       // ...GEFC..

                Store (GBDA (), GXFC) /* \_SB_.PCI0.GFX0.GXFC */
            }


    28BC: 70 47 42 44 41 47 58 46 43                       // pGBDAGXFC

            If (LEqual (GEFC, 0x06))
            {

    28C5: A0 11 93 47 45 46 43 0A 06                       // ...GEFC..

                Store (SBCB (), GXFC) /* \_SB_.PCI0.GFX0.GXFC */
            }

            Store (Zero, GEFC) /* \_SB_.PCI0.GFX0.GEFC */
            Store (One, CPSC) /* External reference */
            Store (Zero, GSSE) /* \_SB_.PCI0.GFX0.GSSE */
            Store (Zero, SCIE) /* \_SB_.PCI0.GFX0.SCIE */

    28CE: 70 53 42 43 42 47 58 46 43 70 00 47 45 46 43 70  // pSBCBGXFCp.GEFCp
    28DE: 01 43 50 53 43 70 00 47 53 53 45 70 00 53 43 49  // .CPSCp.GSSEp.SCI
    28EE: 45                                               // E

            Return (Zero)
        }


    28EF: A4 00                                            // ..

        Method (PDRD, 0, NotSerialized)
        {

    28F1: 14 0C 50 44 52 44 00                             // ..PDRD.

            Return (
    28F8: A4                                               // .

LNot (DRDY))
        }


    28F9: 92 44 52 44 59                                   // .DRDY

        Method (PSTS, 0, NotSerialized)
        {

    28FE: 14 1D 50 53 54 53 00                             // ..PSTS.

            If (LGreater (CSTS, 0x02))
            {

    2905: A0 0E 94 43 53 54 53 0A 02                       // ...CSTS..

                Sleep (ASLP)
            }


    290E: 5B 22 41 53 4C 50                                // ["ASLP

            Return (
    2914: A4                                               // .

LEqual (CSTS, 0x03))
        }


    2915: 93 43 53 54 53 0A 03                             // .CSTS..

        Method (GNOT, 2, NotSerialized)
        {

    291C: 14 4D 05 47 4E 4F 54 02                          // .M.GNOT.

            If (PDRD ())
            {

    2924: A0 07 50 44 52 44                                // ..PDRD

                Return (One)
            }

            Store (Arg0, CEVT) /* \_SB_.PCI0.GFX0.CEVT */
            Store (0x03, CSTS) /* \_SB_.PCI0.GFX0.CSTS */

    292A: A4 01 70 68 43 45 56 54 70 0A 03 43 53 54 53     // ..phCEVTp..CSTS

            If (LAnd (LEqual (CHPD, Zero), 
    2939: A0 1C 90 93 43 48 50 44 00                       // ....CHPD.

LEqual (Arg1, Zero)))
            {

    2942: 93 69 00                                         // .i.

                Notify (\_SB.PCI0.GFX0, Arg1)
            }


    2945: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 47 46 58 30  // .\/._SB_PCI0GFX0
    2955: 69                                               // i

            If (CondRefOf (HNOT))
            {
                HNOT (Arg0)
            }

    2956: A0 0D 5B 12 48 4E 4F 54 00 48 4E 4F 54 68        // ..[.HNOT.HNOTh

            Else
            {

    2964: A1 13                                            // ..

                Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
            }


    2966: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 47 46 58 30  // .\/._SB_PCI0GFX0
    2976: 0A 80                                            // ..

            Return (Zero)
        }


    2978: A4 00                                            // ..

        Method (GHDS, 1, NotSerialized)
        {
            Store (Arg0, TIDX) /* \_SB_.PCI0.GFX0.TIDX */

    297A: 14 13 47 48 44 53 01 70 68 54 49 44 58           // ..GHDS.phTIDX

            Return (GNOT (One, Zero))
        }


    2987: A4 47 4E 4F 54 01 00                             // .GNOT..

        Method (GLID, 1, NotSerialized)
        {

    298E: 14 35 47 4C 49 44 01                             // .5GLID.

            If (LEqual (Arg0, One))
            {

    2995: A0 0B 93 68 01                                   // ...h.

                Store (0x03, CLID) /* \_SB_.PCI0.GFX0.CLID */
            }

    299A: 70 0A 03 43 4C 49 44                             // p..CLID

            Else
            {

    29A1: A1 07                                            // ..

                Store (Arg0, CLID) /* \_SB_.PCI0.GFX0.CLID */
            }


    29A3: 70 68 43 4C 49 44                                // phCLID

            If (GNOT (0x02, Zero))
            {
                Or (CLID, 0x80000000, CLID) /* \_SB_.PCI0.GFX0.CLID */

    29A9: A0 18 47 4E 4F 54 0A 02 00 7D 43 4C 49 44 0C 00  // ..GNOT...}CLID..
    29B9: 00 00 80 43 4C 49 44                             // ...CLID

                Return (One)
            }


    29C0: A4 01                                            // ..

            Return (Zero)
        }


    29C2: A4 00                                            // ..

        Method (GDCK, 1, NotSerialized)
        {
            Store (Arg0, CDCK) /* \_SB_.PCI0.GFX0.CDCK */

    29C4: 14 14 47 44 43 4B 01 70 68 43 44 43 4B           // ..GDCK.phCDCK

            Return (GNOT (0x04, Zero))
        }


    29D1: A4 47 4E 4F 54 0A 04 00                          // .GNOT...

        Method (PARD, 0, NotSerialized)
        {

    29D9: 14 19 50 41 52 44 00                             // ..PARD.

            If (LNot (ARDY))
            {

    29E0: A0 0C 92 41 52 44 59                             // ...ARDY

                Sleep (ASLP)
            }


    29E7: 5B 22 41 53 4C 50                                // ["ASLP

            Return (
    29ED: A4                                               // .

LNot (ARDY))
        }


    29EE: 92 41 52 44 59                                   // .ARDY

        Method (IUEH, 1, Serialized)
        {
            And (IUER, 0xC0, IUER) /* \_SB_.PCI0.GFX0.IUER */
            XOr (IUER, ShiftLeft (One, Arg0), IUER) /* \_SB_.PCI0.GFX0.IUER */

    29F3: 14 36 49 55 45 48 09 7B 49 55 45 52 0A C0 49 55  // .6IUEH.{IUER..IU
    2A03: 45 52 7F 49 55 45 52 79 01 68 00 49 55 45 52     // ER.IUERy.h.IUER

            If (
    2A12: A0 0E 92                                         // ...

LLessEqual (Arg0, 0x04))
            {

    2A15: 94 68 0A 04                                      // .h..

                Return (AINT (0x05, Zero))
            }

    2A19: A4 41 49 4E 54 0A 05 00                          // .AINT...

            Else
            {

    2A21: A1 08                                            // ..

                Return (AINT (Arg0, Zero))
            }
        }


    2A23: A4 41 49 4E 54 68 00                             // .AINTh.

        Method (AINT, 2, NotSerialized)
        {

    2A2A: 14 4F 15 41 49 4E 54 02                          // .O.AINT.

            If (LNot (
    2A32: A0 0E 92                                         // ...

And (TCHE, ShiftLeft (One, Arg0))))
            {

    2A35: 7B 54 43 48 45 79 01 68 00 00                    // {TCHEy.h..

                Return (One)
            }


    2A3F: A4 01                                            // ..

            If (PARD ())
            {

    2A41: A0 07 50 41 52 44                                // ..PARD

                Return (One)
            }


    2A47: A4 01                                            // ..

            If (LAnd (
    2A49: A0 34 90 92                                      // .4..

LGreaterEqual (Arg0, 0x05), 
    2A4D: 95 68 0A 05                                      // .h..


    2A51: 92                                               // .

LLessEqual (Arg0, 0x07)))
            {
                Store (ShiftLeft (One, Arg0), ASLC) /* \_SB_.PCI0.GFX0.ASLC */
                Store (One, ASLE) /* \_SB_.PCI0.GFX0.ASLE */
                Store (Zero, Local2)

    2A52: 94 68 0A 07 70 79 01 68 00 41 53 4C 43 70 01 41  // .h..py.h.ASLCp.A
    2A62: 53 4C 45 70 00 62                                // SLEp.b

                While (LAnd (LLess (Local2, 0xFA), 
    2A68: A2 13 90 95 62 0A FA                             // ....b..


    2A6F: 92                                               // .

LNotEqual (ASLC, Zero)))
                {
                    Sleep (0x04)

    2A70: 93 41 53 4C 43 00 5B 22 0A 04                    // .ASLC.["..

                    Increment (Local2)
                }


    2A7A: 75 62                                            // ub

                Return (Zero)
            }


    2A7C: A4 00                                            // ..

            If (LEqual (Arg0, 0x02))
            {

    2A7E: A0 40 0C 93 68 0A 02                             // .@..h..

                If (CPFM)
                {
                    And (CPFM, 0x0F, Local0)
                    And (EPFM, 0x0F, Local1)

    2A85: A0 47 09 43 50 46 4D 7B 43 50 46 4D 0A 0F 60 7B  // .G.CPFM{CPFM..`{
    2A95: 45 50 46 4D 0A 0F 61                             // EPFM..a

                    If (LEqual (Local0, One))
                    {

    2A9C: A0 2A 93 60 01                                   // .*.`.

                        If (And (Local1, 0x06))
                        {

    2AA1: A0 0D 7B 61 0A 06 00                             // ..{a...

                            Store (0x06, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

    2AA8: 70 0A 06 50 46 49 54                             // p..PFIT

                        ElseIf
    2AAF: A1 17                                            // ..

 (And (Local1, 0x08))
                        {

    2AB1: A0 0D 7B 61 0A 08 00                             // ..{a...

                            Store (0x08, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

    2AB8: 70 0A 08 50 46 49 54                             // p..PFIT

                        Else
                        {

    2ABF: A1 07                                            // ..

                            Store (One, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }
                    }


    2AC1: 70 01 50 46 49 54                                // p.PFIT

                    If (LEqual (Local0, 0x06))
                    {

    2AC7: A0 2A 93 60 0A 06                                // .*.`..

                        If (And (Local1, 0x08))
                        {

    2ACD: A0 0D 7B 61 0A 08 00                             // ..{a...

                            Store (0x08, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

    2AD4: 70 0A 08 50 46 49 54                             // p..PFIT

                        ElseIf
    2ADB: A1 16                                            // ..

 (And (Local1, One))
                        {

    2ADD: A0 0B 7B 61 01 00                                // ..{a..

                            Store (One, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

    2AE3: 70 01 50 46 49 54                                // p.PFIT

                        Else
                        {

    2AE9: A1 08                                            // ..

                            Store (0x06, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }
                    }


    2AEB: 70 0A 06 50 46 49 54                             // p..PFIT

                    If (LEqual (Local0, 0x08))
                    {

    2AF2: A0 2A 93 60 0A 08                                // .*.`..

                        If (And (Local1, One))
                        {

    2AF8: A0 0B 7B 61 01 00                                // ..{a..

                            Store (One, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

    2AFE: 70 01 50 46 49 54                                // p.PFIT

                        ElseIf
    2B04: A1 18                                            // ..

 (And (Local1, 0x06))
                        {

    2B06: A0 0D 7B 61 0A 06 00                             // ..{a...

                            Store (0x06, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

    2B0D: 70 0A 06 50 46 49 54                             // p..PFIT

                        Else
                        {

    2B14: A1 08                                            // ..

                            Store (0x08, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }
                    }
                }

    2B16: 70 0A 08 50 46 49 54                             // p..PFIT

                Else
                {

    2B1D: A1 0C                                            // ..

                    XOr (PFIT, 0x07, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                }

                Or (PFIT, 0x80000000, PFIT) /* \_SB_.PCI0.GFX0.PFIT */

    2B1F: 7F 50 46 49 54 0A 07 50 46 49 54 7D 50 46 49 54  // .PFIT..PFIT}PFIT
    2B2F: 0C 00 00 00 80 50 46 49 54                       // .....PFIT

                Store (0x04, ASLC) /* \_SB_.PCI0.GFX0.ASLC */
            }

    2B38: 70 0A 04 41 53 4C 43                             // p..ASLC

            ElseIf
    2B3F: A1 42 04                                         // .B.

 (LEqual (Arg0, One))
            {
                Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP) /* \_SB_.PCI0.GFX0.BCLP */
                Or (BCLP, 0x80000000, BCLP) /* \_SB_.PCI0.GFX0.BCLP */

    2B42: A0 28 93 68 01 70 78 77 69 0A FF 00 0A 64 00 00  // .(.h.pxwi....d..
    2B52: 42 43 4C 50 7D 42 43 4C 50 0C 00 00 00 80 42 43  // BCLP}BCLP.....BC
    2B62: 4C 50                                            // LP

                Store (0x02, ASLC) /* \_SB_.PCI0.GFX0.ASLC */
            }

    2B64: 70 0A 02 41 53 4C 43                             // p..ASLC

            ElseIf
    2B6B: A1 16                                            // ..

 (LEqual (Arg0, Zero))
            {
                Store (Arg1, ALSI) /* \_SB_.PCI0.GFX0.ALSI */

    2B6D: A0 10 93 68 00 70 69 41 4C 53 49                 // ...h.piALSI

                Store (One, ASLC) /* \_SB_.PCI0.GFX0.ASLC */
            }

    2B78: 70 01 41 53 4C 43                                // p.ASLC

            Else
            {

    2B7E: A1 03                                            // ..

                Return (One)
            }

            Store (One, ASLE) /* \_SB_.PCI0.GFX0.ASLE */

    2B80: A4 01 70 01 41 53 4C 45                          // ..p.ASLE

            Return (Zero)
        }


    2B88: A4 00                                            // ..

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {

    2B8A: 14 4D 48 5F 44 53 4D 0C                          // .MH_DSM.


    2B92: 08 5F 54 5F 30 00                                // ._T_0.

            If (LEqual (Arg0, 
    2B98: A0 4A 47 93 68                                   // .JG.h

ToUUID ("3e5b41c6-eb1d-4260-9d15-c71fbadae414") /* Unknown UUID */))
            {

    2B9D: 11 13 0A 10 C6 41 5B 3E 1D EB 60 42 9D 15 C7 1F  // .....A[>..`B....
    2BAD: BA DA E4 14                                      // ....

                Switch (ToInteger (Arg2))
                {

    2BB1: A2 41 46 01 70 99 6A 00 5F 54 5F 30              // .AF.p.j._T_0

                    Case (Zero)
                    {

    2BBD: A0 37 93 5F 54 5F 30 00                          // .7._T_0.

                        If (LEqual (Arg1, One))
                        {
                            Store ("iGfx Supported Functions Bitmap ", Debug)

    2BC5: A0 2F 93 69 01 70 0D 69 47 66 78 20 53 75 70 70  // ./.i.p.iGfx Supp
    2BD5: 6F 72 74 65 64 20 46 75 6E 63 74 69 6F 6E 73 20  // orted Functions 
    2BE5: 42 69 74 6D 61 70 20 00 5B 31                    // Bitmap .[1

                            Return (0x0001E7FF)
                        }
                    }

    2BEF: A4 0C FF E7 01 00                                // ......

                    Case
    2BF5: A1 4C 41                                         // .LA

 (One)
                    {

    2BF8: A0 4D 09 93 5F 54 5F 30 01                       // .M.._T_0.

                        If (LEqual (Arg1, One))
                        {
                            Store (" Adapter Power State Notification ", Debug)

    2C01: A0 44 09 93 69 01 70 0D 20 41 64 61 70 74 65 72  // .D..i.p. Adapter
    2C11: 20 50 6F 77 65 72 20 53 74 61 74 65 20 4E 6F 74  //  Power State Not
    2C21: 69 66 69 63 61 74 69 6F 6E 20 00 5B 31           // ification .[1

                            If (LAnd (LEqual (S0ID, One), 
    2C2E: A0 39 90 93 53 30 49 44 01                       // .9..S0ID.

LLess (OSYS, 0x07DF)))
                            {

    2C37: 95 4F 53 59 53 0B DF 07                          // .OSYS...

                                If (LEqual (And (DerefOf (
    2C3F: A0 12 93 7B 83                                   // ...{.

Index (Arg3, Zero)), 0xFF), One))
                                {
                                    \GUAM (One)
                                }

                                Store (And (DerefOf (
    2C44: 88 6B 00 00 0A FF 00 01 5C 47 55 41 4D 01 70 7B  // .k......\GUAM.p{
    2C54: 83                                               // .

Index (Arg3, One)), 0xFF), Local0)

    2C55: 88 6B 01 00 0A FF 00 60                          // .k.....`

                                If (LEqual (Local0, Zero))
                                {
                                    \GUAM (Zero)
                                }
                            }


    2C5D: A0 0A 93 60 00 5C 47 55 41 4D 00                 // ...`.\GUAM.

                            If (LEqual (DerefOf (
    2C68: A0 2B 93 83                                      // .+..

Index (Arg3, Zero)), Zero))
                            {
                                Store (CLID, Local0)

    2C6C: 88 6B 00 00 00 70 43 4C 49 44 60                 // .k...pCLID`

                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID) /* \_SB_.PCI0.GFX0.CLID */
                                    GLID (CLID)
                                }
                            }


    2C77: A0 1C 7B 0C 00 00 00 80 60 00 7B 43 4C 49 44 0A  // ..{.....`.{CLID.
    2C87: 0F 43 4C 49 44 47 4C 49 44 43 4C 49 44           // .CLIDGLIDCLID

                            Return (One)
                        }
                    }

    2C94: A4 01                                            // ..

                    Case
    2C96: A1 4B 37                                         // .K7

 (0x02)
                    {

    2C99: A0 35 93 5F 54 5F 30 0A 02                       // .5._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("Display Power State Notification ", Debug)

    2CA2: A0 2C 93 69 01 70 0D 44 69 73 70 6C 61 79 20 50  // .,.i.p.Display P
    2CB2: 6F 77 65 72 20 53 74 61 74 65 20 4E 6F 74 69 66  // ower State Notif
    2CC2: 69 63 61 74 69 6F 6E 20 00 5B 31                 // ication .[1

                            Return (One)
                        }
                    }

    2CCD: A4 01                                            // ..

                    Case
    2CCF: A1 42 34                                         // .B4

 (0x03)
                    {

    2CD2: A0 36 93 5F 54 5F 30 0A 03                       // .6._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("BIOS POST Completion Notification ", Debug)

    2CDB: A0 2D 93 69 01 70 0D 42 49 4F 53 20 50 4F 53 54  // .-.i.p.BIOS POST
    2CEB: 20 43 6F 6D 70 6C 65 74 69 6F 6E 20 4E 6F 74 69  //  Completion Noti
    2CFB: 66 69 63 61 74 69 6F 6E 20 00 5B 31              // fication .[1

                            Return (One)
                        }
                    }

    2D07: A4 01                                            // ..

                    Case
    2D09: A1 48 30                                         // .H0

 (0x04)
                    {

    2D0C: A0 27 93 5F 54 5F 30 0A 04                       // .'._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("Pre-Hires Set Mode ", Debug)

    2D15: A0 1E 93 69 01 70 0D 50 72 65 2D 48 69 72 65 73  // ...i.p.Pre-Hires
    2D25: 20 53 65 74 20 4D 6F 64 65 20 00 5B 31           //  Set Mode .[1

                            Return (One)
                        }
                    }

    2D32: A4 01                                            // ..

                    Case
    2D34: A1 4D 2D                                         // .M-

 (0x05)
                    {

    2D37: A0 28 93 5F 54 5F 30 0A 05                       // .(._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("Post-Hires Set Mode ", Debug)

    2D40: A0 1F 93 69 01 70 0D 50 6F 73 74 2D 48 69 72 65  // ...i.p.Post-Hire
    2D50: 73 20 53 65 74 20 4D 6F 64 65 20 00 5B 31        // s Set Mode .[1

                            Return (One)
                        }
                    }

    2D5E: A4 01                                            // ..

                    Case
    2D60: A1 41 2B                                         // .A+

 (0x06)
                    {

    2D63: A0 30 93 5F 54 5F 30 0A 06                       // .0._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("SetDisplayDeviceNotification", Debug)

    2D6C: A0 27 93 69 01 70 0D 53 65 74 44 69 73 70 6C 61  // .'.i.p.SetDispla
    2D7C: 79 44 65 76 69 63 65 4E 6F 74 69 66 69 63 61 74  // yDeviceNotificat
    2D8C: 69 6F 6E 00 5B 31                                // ion.[1

                            Return (One)
                        }
                    }

    2D92: A4 01                                            // ..

                    Case
    2D94: A1 4D 27                                         // .M'

 (0x07)
                    {

    2D97: A0 38 93 5F 54 5F 30 0A 07                       // .8._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("SetBootDevicePreference ", Debug)
                            And (DerefOf (
    2DA0: A0 2F 93 69 01 70 0D 53 65 74 42 6F 6F 74 44 65  // ./.i.p.SetBootDe
    2DB0: 76 69 63 65 50 72 65 66 65 72 65 6E 63 65 20 00  // vicePreference .
    2DC0: 5B 31 7B 83                                      // [1{.

Index (Arg3, Zero)), 0xFF, IBTT) /* \IBTT */

    2DC4: 88 6B 00 00 0A FF 49 42 54 54                    // .k....IBTT

                            Return (One)
                        }
                    }

    2DCE: A4 01                                            // ..

                    Case
    2DD0: A1 41 24                                         // .A$

 (0x08)
                    {

    2DD3: A0 42 06 93 5F 54 5F 30 0A 08                    // .B.._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("SetPanelPreference ", Debug)
                            And (DerefOf (
    2DDD: A0 48 05 93 69 01 70 0D 53 65 74 50 61 6E 65 6C  // .H..i.p.SetPanel
    2DED: 50 72 65 66 65 72 65 6E 63 65 20 00 5B 31 7B 83  // Preference .[1{.

Index (Arg3, Zero)), 0xFF, IPSC) /* \IPSC */

    2DFD: 88 6B 00 00 0A FF 49 50 53 43                    // .k....IPSC

                            If (And (DerefOf (
    2E07: A0 1B 7B 83                                      // ..{.

Index (Arg3, One)), 0xFF))
                            {
                                And (DerefOf (
    2E0B: 88 6B 01 00 0A FF 00 7B 83                       // .k.....{.

Index (Arg3, One)), 0xFF, IPAT) /* \IPAT */

    2E14: 88 6B 01 00 0A FF 49 50 41 54                    // .k....IPAT

                                Decrement (IPAT)
                            }

                            And (ShiftRight (DerefOf (
    2E1E: 76 49 50 41 54 7B 7A 83                          // vIPAT{z.

Index (Arg3, 0x02)), 0x04), 0x07, IBIA) /* \IBIA */

    2E26: 88 6B 0A 02 00 0A 04 00 0A 07 49 42 49 41        // .k........IBIA

                            Return (One)
                        }
                    }

    2E34: A4 01                                            // ..

                    Case
    2E36: A1 4B 1D                                         // .K.

 (0x09)
                    {

    2E39: A0 22 93 5F 54 5F 30 0A 09                       // ."._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("FullScreenDOS ", Debug)

    2E42: A0 19 93 69 01 70 0D 46 75 6C 6C 53 63 72 65 65  // ...i.p.FullScree
    2E52: 6E 44 4F 53 20 00 5B 31                          // nDOS .[1

                            Return (One)
                        }
                    }

    2E5A: A4 01                                            // ..

                    Case
    2E5C: A1 45 1B                                         // .E.

 (0x0A)
                    {

    2E5F: A0 31 93 5F 54 5F 30 0A 0A                       // .1._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("APM Complete ", Debug)
                            Store (ShiftLeft (LIDS, 0x08), Local0)
                            Add (Local0, 0x0100, Local0)

    2E68: A0 28 93 69 01 70 0D 41 50 4D 20 43 6F 6D 70 6C  // .(.i.p.APM Compl
    2E78: 65 74 65 20 00 5B 31 70 79 4C 49 44 53 0A 08 00  // ete .[1pyLIDS...
    2E88: 60 72 60 0B 00 01 60                             // `r`...`

                            Return (Local0)
                        }
                    }

    2E8F: A4 60                                            // .`

                    Case
    2E91: A1 40 18                                         // .@.

 (0x0D)
                    {

    2E94: A0 46 06 93 5F 54 5F 30 0A 0D                    // .F.._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("GetBootDisplayPreference ", Debug)
                            Or (ShiftLeft (DerefOf (
    2E9E: A0 4C 05 93 69 01 70 0D 47 65 74 42 6F 6F 74 44  // .L..i.p.GetBootD
    2EAE: 69 73 70 6C 61 79 50 72 65 66 65 72 65 6E 63 65  // isplayPreference
    2EBE: 20 00 5B 31 7D 79 83                             //  .[1}y.

Index (Arg3, 0x03)), 0x18), ShiftLeft (DerefOf (
    2EC5: 88 6B 0A 03 00 0A 18 00 79 83                    // .k......y.

Index (
                                Arg3, 0x02)), 0x10), Local0)
                            And (Local0, 0xEFFF0000, Local0)
                            And (Local0, ShiftLeft (DerefOf (
    2ECF: 88 6B 0A 02 00 0A 10 00 60 7B 60 0C 00 00 FF EF  // .k......`{`.....
    2EDF: 60 7B 60 79 83                                   // `{`y.

Index (DBTB, IBTT)), 0x10), Local0)
                            Or (IBTT, Local0, Local0)

    2EE4: 88 44 42 54 42 49 42 54 54 00 0A 10 00 60 7D 49  // .DBTBIBTT....`}I
    2EF4: 42 54 54 60 60                                   // BTT``

                            Return (Local0)
                        }
                    }

    2EF9: A4 60                                            // .`

                    Case
    2EFB: A1 46 11                                         // .F.

 (0x0E)
                    {

    2EFE: A0 4B 05 93 5F 54 5F 30 0A 0E                    // .K.._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("GetPanelDetails ", Debug)
                            Store (IPSC, Local0)
                            Or (Local0, ShiftLeft (IPAT, 0x08), Local0)
                            Add (Local0, 0x0100, Local0)
                            Or (Local0, ShiftLeft (LIDS, 0x10), Local0)
                            Add (Local0, 0x00010000, Local0)
                            Or (Local0, ShiftLeft (IBIA, 0x14), Local0)

    2F08: A0 41 05 93 69 01 70 0D 47 65 74 50 61 6E 65 6C  // .A..i.p.GetPanel
    2F18: 44 65 74 61 69 6C 73 20 00 5B 31 70 49 50 53 43  // Details .[1pIPSC
    2F28: 60 7D 60 79 49 50 41 54 0A 08 00 60 72 60 0B 00  // `}`yIPAT...`r`..
    2F38: 01 60 7D 60 79 4C 49 44 53 0A 10 00 60 72 60 0C  // .`}`yLIDS...`r`.
    2F48: 00 00 01 00 60 7D 60 79 49 42 49 41 0A 14 00 60  // ....`}`yIBIA...`

                            Return (Local0)
                        }
                    }

    2F58: A4 60                                            // .`

                    Case
    2F5A: A1 47 0B                                         // .G.

 (0x0F)
                    {

    2F5D: A0 48 06 93 5F 54 5F 30 0A 0F                    // .H.._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("GetInternalGraphics ", Debug)
                            Store (GIVD, Local0)
                            XOr (Local0, One, Local0)
                            Or (Local0, ShiftLeft (GMFN, One), Local0)
                            Or (Local0, 0x1800, Local0)
                            Or (Local0, ShiftLeft (IDMS, 0x11), Local0)
                            Or (ShiftLeft (DerefOf (
    2F67: A0 4E 05 93 69 01 70 0D 47 65 74 49 6E 74 65 72  // .N..i.p.GetInter
    2F77: 6E 61 6C 47 72 61 70 68 69 63 73 20 00 5B 31 70  // nalGraphics .[1p
    2F87: 47 49 56 44 60 7F 60 01 60 7D 60 79 47 4D 46 4E  // GIVD`.`.`}`yGMFN
    2F97: 01 00 60 7D 60 0B 00 18 60 7D 60 79 49 44 4D 53  // ..`}`...`}`yIDMS
    2FA7: 0A 11 00 60 7D 79 83                             // ...`}y.

Index (DerefOf (
    2FAE: 88 83                                            // ..

Index (CDCT, HVCO)), CDVL)), 0x15
                                ), Local0, Local0)

    2FB0: 88 43 44 43 54 48 56 43 4F 00 43 44 56 4C 00 0A  // .CDCTHVCO.CDVL..
    2FC0: 15 00 60 60                                      // ..``

                            Return (Local0)
                        }
                    }

    2FC4: A4 60                                            // .`

                    Case
    2FC6: A1 4B 04                                         // .K.

 (0x10)
                    {

    2FC9: A0 48 04 93 5F 54 5F 30 0A 10                    // .H.._T_0..

                        If (LEqual (Arg1, One))
                        {
                            Store ("GetAKSV ", Debug)

    2FD3: A0 3E 93 69 01 70 0D 47 65 74 41 4B 53 56 20 00  // .>.i.p.GetAKSV .
    2FE3: 5B 31                                            // [1

                            Name (KSVP, 
    2FE5: 08 4B 53 56 50                                   // .KSVP

Package (0x02)
                            {
                                0x80000000, 
                                0x8000
                            })
                            Store (KSV0, 
    2FEA: 12 0A 02 0C 00 00 00 80 0B 00 80 70 4B 53 56 30  // ...........pKSV0

Index (KSVP, Zero))
                            Store (KSV1, 
    2FFA: 88 4B 53 56 50 00 00 70 4B 53 56 31              // .KSVP..pKSV1

Index (KSVP, One))

    3006: 88 4B 53 56 50 01 00                             // .KSVP..

                            Return (KSVP) /* \_SB_.PCI0.GFX0._DSM.KSVP */
                        }
                    }


    300D: A4 4B 53 56 50                                   // .KSVP

                }
            }


    3012: A5                                               // .

            Return (
    3013: A4                                               // .

Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }


    3014: 11 03 01 00                                      // ....

    Scope (\_SB.PCI0.GFX0)
    {

    3018: 10 35 5C 2F 03 5F 53 42 5F 50 43 49 30 47 46 58  // .5\/._SB_PCI0GFX
    3028: 30                                               // 0

        Device (IPUA)
        {

    3029: 5B 82 23 49 50 55 41                             // [.#IPUA

            Name (_ADR, 0x3480)  // _ADR: Address

    3030: 08 5F 41 44 52 0B 80 34                          // ._ADR..4

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

    3038: 14 15 5F 53 54 41 00                             // .._STA.

                If (LEqual (IPTP, One))
                {

    303F: A0 0A 93 49 50 54 50 01                          // ...IPTP.

                    Return (0x0F)
                }

    3047: A4 0A 0F                                         // ...

                Else
                {

    304A: A1 03                                            // ..

                    Return (Zero)
                }
            }
        }
    }


    304C: A4 00                                            // ..

    Scope (\_SB.PCI0.IPU0)
    {

    304E: 10 4E 05 5C 2F 03 5F 53 42 5F 50 43 49 30 49 50  // .N.\/._SB_PCI0IP
    305E: 55 30                                            // U0

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {

    3060: 14 4C 04 5F 44 53 4D 04                          // .L._DSM.

            If (LEqual (Arg0, 
    3068: A0 42 04 93 68                                   // .B..h

ToUUID ("9a9e6ab4-e3fc-475d-ad1c-c4789e4cfe90") /* Unknown UUID */))
            {

    306D: 11 13 0A 10 B4 6A 9E 9A FC E3 5D 47 AD 1C C4 78  // .....j....]G...x
    307D: 9E 4C FE 90                                      // .L..

                If (LEqual (Arg2, Zero))
                {

    3081: A0 12 93 6A 00                                   // ...j.

                    If (LEqual (Arg1, Zero))
                    {

    3086: A0 09 93 69 00                                   // ...i.

                        Return (
    308B: A4                                               // .

Buffer (One)
                        {
                             0x07                                             // .
                        })
                    }

    308C: 11 03 01 07                                      // ....

                    Else
                    {

    3090: A1 03                                            // ..

                        Return (Zero)
                    }
                }


    3092: A4 00                                            // ..

                If (LEqual (Arg2, One))
                {

    3094: A0 0A 93 6A 01                                   // ...j.

                    Return (0x64503C19)
                }


    3099: A4 0C 19 3C 50 64                                // ...<Pd

                If (LEqual (Arg2, 0x02))
                {

    309F: A0 0B 93 6A 0A 02                                // ...j..

                    Return (0xFFF0783C)
                }
            }


    30A5: A4 0C 3C 78 F0 FF                                // ..<x..

            Return (Zero)
        }
    }
}



Table Header:
Table Body (Length 0x30AD)
