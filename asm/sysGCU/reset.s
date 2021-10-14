.include "macros.inc"
.section .rodata  # 0x804732E0 - 0x8049E220
.balign 0x4
.global lbl_80499D20
lbl_80499D20:
	.4byte 0x09838183
	.4byte 0x82838A81
	.4byte 0x5B834A81
	.4byte 0x5B83688F
	.4byte 0x9182AB8D
	.4byte 0x9E82DD8F
	.4byte 0x4997B991
	.4byte 0xD282BF0A
	.4byte 0x00000000
	.4byte 0x09834981
	.4byte 0x5B836683
	.4byte 0x4283498F
	.4byte 0x4997B991
	.4byte 0xD282BF0A
	.4byte 0x00000000
	.4byte 0x0947508F
	.4byte 0x88979D8F
	.4byte 0x4997B991
	.4byte 0xD282BF0A
	.4byte 0x00000000
	.4byte 0x09838A83
	.4byte 0x5A836283
	.4byte 0x67837B83
	.4byte 0x5E839382
	.4byte 0xAA899F82
	.4byte 0xB382EA82
	.4byte 0xC482A282
	.4byte 0xE90A0000
	.4byte 0x8B9689C2
	.4byte 0x82AA8F6F
	.4byte 0x82C482A2
	.4byte 0x82C882A2
	.4byte 0x0A000000
	.4byte 0x00000000

.section .data, "wa"  # 0x8049E220 - 0x804EFC20
.balign 0x8
.global __vt__12ResetManager
__vt__12ResetManager:
	.4byte 0
	.4byte 0
	.4byte draw__12ResetManagerFv
	.4byte updateStatusEffects__12ResetManagerFv

.section .sdata2, "a"     # 0x80516360 - 0x80520E40
.balign 0x8
.global lbl_80520548
lbl_80520548:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_80520550
lbl_80520550:
	.4byte 0x43300000
	.4byte 0x00000000
.global lbl_80520558
lbl_80520558:
	.float 0.25
.global lbl_8052055C
lbl_8052055C:
	.4byte 0xBF800000
.global lbl_80520560
lbl_80520560:
	.float 1.0
.global lbl_80520564
lbl_80520564:
	.4byte 0x437F0000
.global lbl_80520568
lbl_80520568:
	.float 0.5
	.4byte 0x00000000

.section .text, "ax"  # 0x800056C0 - 0x80472F00
.global __ct__12ResetManagerFf
__ct__12ResetManagerFf:
/* 80429DB0 00426CF0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80429DB4 00426CF4  7C 08 02 A6 */	mflr r0
/* 80429DB8 00426CF8  3C A0 80 4F */	lis r5, __vt__12ResetManager@ha
/* 80429DBC 00426CFC  38 80 00 00 */	li r4, 0
/* 80429DC0 00426D00  90 01 00 24 */	stw r0, 0x24(r1)
/* 80429DC4 00426D04  3C 00 43 30 */	lis r0, 0x4330
/* 80429DC8 00426D08  38 A5 BE 10 */	addi r5, r5, __vt__12ResetManager@l
/* 80429DCC 00426D0C  C8 42 21 F0 */	lfd f2, lbl_80520550@sda21(r2)
/* 80429DD0 00426D10  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80429DD4 00426D14  7C 7F 1B 78 */	mr r31, r3
/* 80429DD8 00426D18  3C 60 80 00 */	lis r3, 0x800000F8@ha
/* 80429DDC 00426D1C  90 BF 00 00 */	stw r5, 0(r31)
/* 80429DE0 00426D20  98 9F 00 0C */	stb r4, 0xc(r31)
/* 80429DE4 00426D24  98 9F 00 0D */	stb r4, 0xd(r31)
/* 80429DE8 00426D28  98 9F 00 0E */	stb r4, 0xe(r31)
/* 80429DEC 00426D2C  98 9F 00 0F */	stb r4, 0xf(r31)
/* 80429DF0 00426D30  80 63 00 F8 */	lwz r3, 0x800000F8@l(r3)
/* 80429DF4 00426D34  90 01 00 08 */	stw r0, 8(r1)
/* 80429DF8 00426D38  54 60 F0 BE */	srwi r0, r3, 2
/* 80429DFC 00426D3C  90 01 00 0C */	stw r0, 0xc(r1)
/* 80429E00 00426D40  C8 01 00 08 */	lfd f0, 8(r1)
/* 80429E04 00426D44  EC 00 10 28 */	fsubs f0, f0, f2
/* 80429E08 00426D48  EC 20 00 72 */	fmuls f1, f0, f1
/* 80429E0C 00426D4C  4B C9 83 ED */	bl __cvt_dbl_usll
/* 80429E10 00426D50  90 6D 88 D8 */	stw r3, sThreshold__Q210JUTGamePad13C3ButtonReset@sda21(r13)
/* 80429E14 00426D54  38 A0 00 00 */	li r5, 0
/* 80429E18 00426D58  C0 02 21 E8 */	lfs f0, lbl_80520548@sda21(r2)
/* 80429E1C 00426D5C  7F E3 FB 78 */	mr r3, r31
/* 80429E20 00426D60  90 8D 88 DC */	stw r4, lbl_80514F5C@sda21(r13)
/* 80429E24 00426D64  98 BF 00 0C */	stb r5, 0xc(r31)
/* 80429E28 00426D68  98 BF 00 0D */	stb r5, 0xd(r31)
/* 80429E2C 00426D6C  98 BF 00 0E */	stb r5, 0xe(r31)
/* 80429E30 00426D70  98 BF 00 0F */	stb r5, 0xf(r31)
/* 80429E34 00426D74  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 80429E38 00426D78  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 80429E3C 00426D7C  90 1F 00 0C */	stw r0, 0xc(r31)
/* 80429E40 00426D80  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 80429E44 00426D84  54 00 07 76 */	rlwinm r0, r0, 0, 0x1d, 0x1b
/* 80429E48 00426D88  90 1F 00 0C */	stw r0, 0xc(r31)
/* 80429E4C 00426D8C  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 80429E50 00426D90  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 80429E54 00426D94  90 1F 00 0C */	stw r0, 0xc(r31)
/* 80429E58 00426D98  90 BF 00 04 */	stw r5, 4(r31)
/* 80429E5C 00426D9C  D0 1F 00 08 */	stfs f0, 8(r31)
/* 80429E60 00426DA0  90 BF 00 10 */	stw r5, 0x10(r31)
/* 80429E64 00426DA4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80429E68 00426DA8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80429E6C 00426DAC  7C 08 03 A6 */	mtlr r0
/* 80429E70 00426DB0  38 21 00 20 */	addi r1, r1, 0x20
/* 80429E74 00426DB4  4E 80 00 20 */	blr 

.global update__12ResetManagerFv
update__12ResetManagerFv:
/* 80429E78 00426DB8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80429E7C 00426DBC  7C 08 02 A6 */	mflr r0
/* 80429E80 00426DC0  3C 80 80 4A */	lis r4, lbl_80499D20@ha
/* 80429E84 00426DC4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80429E88 00426DC8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80429E8C 00426DCC  3B E4 9D 20 */	addi r31, r4, lbl_80499D20@l
/* 80429E90 00426DD0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80429E94 00426DD4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80429E98 00426DD8  7C 7D 1B 78 */	mr r29, r3
/* 80429E9C 00426DDC  4B CB 4F 15 */	bl DVDGetDriveStatus
/* 80429EA0 00426DE0  2C 03 FF FF */	cmpwi r3, -1
/* 80429EA4 00426DE4  41 82 02 6C */	beq lbl_8042A110
/* 80429EA8 00426DE8  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 80429EAC 00426DEC  3B C0 00 01 */	li r30, 1
/* 80429EB0 00426DF0  54 00 00 C7 */	rlwinm. r0, r0, 0, 3, 3
/* 80429EB4 00426DF4  40 82 00 18 */	bne lbl_80429ECC
/* 80429EB8 00426DF8  80 6D 9A EC */	lwz r3, sys@sda21(r13)
/* 80429EBC 00426DFC  4B FF 95 35 */	bl isDvdErrorOccured__6SystemFv
/* 80429EC0 00426E00  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80429EC4 00426E04  40 82 00 08 */	bne lbl_80429ECC
/* 80429EC8 00426E08  3B C0 00 00 */	li r30, 0
lbl_80429ECC:
/* 80429ECC 00426E0C  80 1D 00 04 */	lwz r0, 4(r29)
/* 80429ED0 00426E10  2C 00 00 00 */	cmpwi r0, 0
/* 80429ED4 00426E14  41 82 01 7C */	beq lbl_8042A050
/* 80429ED8 00426E18  7F A3 EB 78 */	mr r3, r29
/* 80429EDC 00426E1C  48 00 03 E1 */	bl isWritingMemoryCard__12ResetManagerFv
/* 80429EE0 00426E20  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80429EE4 00426E24  40 82 00 D4 */	bne lbl_80429FB8
/* 80429EE8 00426E28  7F A3 EB 78 */	mr r3, r29
/* 80429EEC 00426E2C  48 00 03 E5 */	bl isSoundSystemStopped__12ResetManagerFv
/* 80429EF0 00426E30  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80429EF4 00426E34  41 82 00 C4 */	beq lbl_80429FB8
/* 80429EF8 00426E38  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 80429EFC 00426E3C  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 80429F00 00426E40  40 82 00 B8 */	bne lbl_80429FB8
/* 80429F04 00426E44  57 C0 06 3F */	clrlwi. r0, r30, 0x18
/* 80429F08 00426E48  41 82 00 B0 */	beq lbl_80429FB8
/* 80429F0C 00426E4C  80 1D 00 04 */	lwz r0, 4(r29)
/* 80429F10 00426E50  2C 00 00 02 */	cmpwi r0, 2
/* 80429F14 00426E54  41 82 00 3C */	beq lbl_80429F50
/* 80429F18 00426E58  40 80 01 F8 */	bge lbl_8042A110
/* 80429F1C 00426E5C  2C 00 00 01 */	cmpwi r0, 1
/* 80429F20 00426E60  40 80 00 08 */	bge lbl_80429F28
/* 80429F24 00426E64  48 00 01 EC */	b lbl_8042A110
lbl_80429F28:
/* 80429F28 00426E68  7F A3 EB 78 */	mr r3, r29
/* 80429F2C 00426E6C  81 9D 00 00 */	lwz r12, 0(r29)
/* 80429F30 00426E70  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 80429F34 00426E74  7D 89 03 A6 */	mtctr r12
/* 80429F38 00426E78  4E 80 04 21 */	bctrl 
/* 80429F3C 00426E7C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80429F40 00426E80  41 82 01 D0 */	beq lbl_8042A110
/* 80429F44 00426E84  38 00 00 02 */	li r0, 2
/* 80429F48 00426E88  90 1D 00 04 */	stw r0, 4(r29)
/* 80429F4C 00426E8C  48 00 01 C4 */	b lbl_8042A110
lbl_80429F50:
/* 80429F50 00426E90  4B C0 3E 99 */	bl clearForReset__10JUTGamePadFv
/* 80429F54 00426E94  80 6D 9A EC */	lwz r3, sys@sda21(r13)
/* 80429F58 00426E98  4B FF 90 39 */	bl deleteThreads__6SystemFv
/* 80429F5C 00426E9C  4B C6 10 89 */	bl setForOSResetSystem__10JFWDisplayFv
/* 80429F60 00426EA0  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 80429F64 00426EA4  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 80429F68 00426EA8  41 82 00 18 */	beq lbl_80429F80
/* 80429F6C 00426EAC  38 60 00 01 */	li r3, 1
/* 80429F70 00426EB0  38 80 00 00 */	li r4, 0
/* 80429F74 00426EB4  38 A0 00 01 */	li r5, 1
/* 80429F78 00426EB8  4B CC 64 69 */	bl OSResetSystem
/* 80429F7C 00426EBC  48 00 01 94 */	b lbl_8042A110
lbl_80429F80:
/* 80429F80 00426EC0  3C 60 76 61 */	lis r3, 0x76616C64@ha
/* 80429F84 00426EC4  3C A0 80 70 */	lis r5, 0x80700000@ha
/* 80429F88 00426EC8  38 03 6C 64 */	addi r0, r3, 0x76616C64@l
/* 80429F8C 00426ECC  90 05 00 00 */	stw r0, 0x80700000@l(r5)
/* 80429F90 00426ED0  3C 60 80 70 */	lis r3, 0x8070
/* 80429F94 00426ED4  38 85 00 08 */	addi r4, r5, 8
/* 80429F98 00426ED8  80 0D 9A E8 */	lwz r0, mRenderMode__6System@sda21(r13)
/* 80429F9C 00426EDC  98 05 00 04 */	stb r0, 4(r5)
/* 80429FA0 00426EE0  4B CC 62 F9 */	bl OSSetSaveRegion
/* 80429FA4 00426EE4  38 60 00 00 */	li r3, 0
/* 80429FA8 00426EE8  38 80 00 00 */	li r4, 0
/* 80429FAC 00426EEC  38 A0 00 00 */	li r5, 0
/* 80429FB0 00426EF0  4B CC 64 31 */	bl OSResetSystem
/* 80429FB4 00426EF4  48 00 01 5C */	b lbl_8042A110
lbl_80429FB8:
/* 80429FB8 00426EF8  7F A3 EB 78 */	mr r3, r29
/* 80429FBC 00426EFC  48 00 03 01 */	bl isWritingMemoryCard__12ResetManagerFv
/* 80429FC0 00426F00  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80429FC4 00426F04  41 82 00 10 */	beq lbl_80429FD4
/* 80429FC8 00426F08  38 7F 00 00 */	addi r3, r31, 0
/* 80429FCC 00426F0C  4C C6 31 82 */	crclr 6
/* 80429FD0 00426F10  4B CC 37 1D */	bl OSReport
lbl_80429FD4:
/* 80429FD4 00426F14  7F A3 EB 78 */	mr r3, r29
/* 80429FD8 00426F18  48 00 02 F9 */	bl isSoundSystemStopped__12ResetManagerFv
/* 80429FDC 00426F1C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80429FE0 00426F20  40 82 00 28 */	bne lbl_8042A008
/* 80429FE4 00426F24  80 7D 00 10 */	lwz r3, 0x10(r29)
/* 80429FE8 00426F28  38 03 00 01 */	addi r0, r3, 1
/* 80429FEC 00426F2C  2C 00 00 03 */	cmpwi r0, 3
/* 80429FF0 00426F30  90 1D 00 10 */	stw r0, 0x10(r29)
/* 80429FF4 00426F34  40 82 00 08 */	bne lbl_80429FFC
/* 80429FF8 00426F38  48 02 4A 61 */	bl THPPlayerStop
lbl_80429FFC:
/* 80429FFC 00426F3C  38 7F 00 24 */	addi r3, r31, 0x24
/* 8042A000 00426F40  4C C6 31 82 */	crclr 6
/* 8042A004 00426F44  4B CC 36 E9 */	bl OSReport
lbl_8042A008:
/* 8042A008 00426F48  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8042A00C 00426F4C  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 8042A010 00426F50  41 82 00 10 */	beq lbl_8042A020
/* 8042A014 00426F54  38 7F 00 3C */	addi r3, r31, 0x3c
/* 8042A018 00426F58  4C C6 31 82 */	crclr 6
/* 8042A01C 00426F5C  4B CC 36 D1 */	bl OSReport
lbl_8042A020:
/* 8042A020 00426F60  4B CC 6A 3D */	bl OSGetResetSwitchState
/* 8042A024 00426F64  2C 03 00 00 */	cmpwi r3, 0
/* 8042A028 00426F68  41 82 00 10 */	beq lbl_8042A038
/* 8042A02C 00426F6C  38 7F 00 50 */	addi r3, r31, 0x50
/* 8042A030 00426F70  4C C6 31 82 */	crclr 6
/* 8042A034 00426F74  4B CC 36 B9 */	bl OSReport
lbl_8042A038:
/* 8042A038 00426F78  57 C0 06 3F */	clrlwi. r0, r30, 0x18
/* 8042A03C 00426F7C  40 82 00 D4 */	bne lbl_8042A110
/* 8042A040 00426F80  38 7F 00 70 */	addi r3, r31, 0x70
/* 8042A044 00426F84  4C C6 31 82 */	crclr 6
/* 8042A048 00426F88  4B CC 36 A5 */	bl OSReport
/* 8042A04C 00426F8C  48 00 00 C4 */	b lbl_8042A110
lbl_8042A050:
/* 8042A050 00426F90  34 01 00 08 */	addic. r0, r1, 8
/* 8042A054 00426F94  41 82 00 0C */	beq lbl_8042A060
/* 8042A058 00426F98  80 0D 88 E4 */	lwz r0, sResetOccurredPort__Q210JUTGamePad13C3ButtonReset@sda21(r13)
/* 8042A05C 00426F9C  90 01 00 08 */	stw r0, 8(r1)
lbl_8042A060:
/* 8042A060 00426FA0  88 0D 88 E1 */	lbz r0, sResetOccurred__Q210JUTGamePad13C3ButtonReset@sda21(r13)
/* 8042A064 00426FA4  28 00 00 00 */	cmplwi r0, 0
/* 8042A068 00426FA8  40 82 00 10 */	bne lbl_8042A078
/* 8042A06C 00426FAC  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8042A070 00426FB0  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8042A074 00426FB4  41 82 00 9C */	beq lbl_8042A110
lbl_8042A078:
/* 8042A078 00426FB8  4B CC 69 E5 */	bl OSGetResetSwitchState
/* 8042A07C 00426FBC  2C 03 00 00 */	cmpwi r3, 0
/* 8042A080 00426FC0  40 82 00 90 */	bne lbl_8042A110
/* 8042A084 00426FC4  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8042A088 00426FC8  38 60 00 01 */	li r3, 1
/* 8042A08C 00426FCC  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8042A090 00426FD0  40 82 00 1C */	bne lbl_8042A0AC
/* 8042A094 00426FD4  80 01 00 08 */	lwz r0, 8(r1)
/* 8042A098 00426FD8  2C 00 FF FF */	cmpwi r0, -1
/* 8042A09C 00426FDC  41 82 00 10 */	beq lbl_8042A0AC
/* 8042A0A0 00426FE0  28 00 00 01 */	cmplwi r0, 1
/* 8042A0A4 00426FE4  40 81 00 08 */	ble lbl_8042A0AC
/* 8042A0A8 00426FE8  38 60 00 00 */	li r3, 0
lbl_8042A0AC:
/* 8042A0AC 00426FEC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8042A0B0 00426FF0  41 82 00 40 */	beq lbl_8042A0F0
/* 8042A0B4 00426FF4  57 C0 06 3F */	clrlwi. r0, r30, 0x18
/* 8042A0B8 00426FF8  41 82 00 38 */	beq lbl_8042A0F0
/* 8042A0BC 00426FFC  80 6D 98 58 */	lwz r3, spSysIF__8PSSystem@sda21(r13)
/* 8042A0C0 00427000  28 03 00 00 */	cmplwi r3, 0
/* 8042A0C4 00427004  41 82 00 08 */	beq lbl_8042A0CC
/* 8042A0C8 00427008  4B F0 E4 89 */	bl stopSoundSystem__Q28PSSystem5SysIFFv
lbl_8042A0CC:
/* 8042A0CC 0042700C  38 60 00 00 */	li r3, 0
/* 8042A0D0 00427010  38 80 00 78 */	li r4, 0x78
/* 8042A0D4 00427014  48 02 53 91 */	bl THPPlayerSetVolume
/* 8042A0D8 00427018  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 8042A0DC 0042701C  38 00 00 01 */	li r0, 1
/* 8042A0E0 00427020  60 63 00 01 */	ori r3, r3, 1
/* 8042A0E4 00427024  90 7D 00 0C */	stw r3, 0xc(r29)
/* 8042A0E8 00427028  90 1D 00 04 */	stw r0, 4(r29)
/* 8042A0EC 0042702C  48 00 00 24 */	b lbl_8042A110
lbl_8042A0F0:
/* 8042A0F0 00427030  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 8042A0F4 00427034  38 00 00 00 */	li r0, 0
/* 8042A0F8 00427038  54 63 00 3C */	rlwinm r3, r3, 0, 0, 0x1e
/* 8042A0FC 0042703C  90 7D 00 0C */	stw r3, 0xc(r29)
/* 8042A100 00427040  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 8042A104 00427044  54 63 07 76 */	rlwinm r3, r3, 0, 0x1d, 0x1b
/* 8042A108 00427048  90 7D 00 0C */	stw r3, 0xc(r29)
/* 8042A10C 0042704C  98 0D 88 E1 */	stb r0, sResetOccurred__Q210JUTGamePad13C3ButtonReset@sda21(r13)
lbl_8042A110:
/* 8042A110 00427050  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8042A114 00427054  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8042A118 00427058  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8042A11C 0042705C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8042A120 00427060  7C 08 03 A6 */	mtlr r0
/* 8042A124 00427064  38 21 00 20 */	addi r1, r1, 0x20
/* 8042A128 00427068  4E 80 00 20 */	blr 

.global updateStatusEffects__12ResetManagerFv
updateStatusEffects__12ResetManagerFv:
/* 8042A12C 0042706C  80 8D 9A EC */	lwz r4, sys@sda21(r13)
/* 8042A130 00427070  38 00 00 00 */	li r0, 0
/* 8042A134 00427074  C0 43 00 08 */	lfs f2, 8(r3)
/* 8042A138 00427078  C0 24 00 54 */	lfs f1, 0x54(r4)
/* 8042A13C 0042707C  C0 02 21 F8 */	lfs f0, lbl_80520558@sda21(r2)
/* 8042A140 00427080  EC 22 08 2A */	fadds f1, f2, f1
/* 8042A144 00427084  D0 23 00 08 */	stfs f1, 8(r3)
/* 8042A148 00427088  C0 23 00 08 */	lfs f1, 8(r3)
/* 8042A14C 0042708C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8042A150 00427090  40 81 00 0C */	ble lbl_8042A15C
/* 8042A154 00427094  D0 03 00 08 */	stfs f0, 8(r3)
/* 8042A158 00427098  38 00 00 01 */	li r0, 1
lbl_8042A15C:
/* 8042A15C 0042709C  7C 03 03 78 */	mr r3, r0
/* 8042A160 004270A0  4E 80 00 20 */	blr 

.global draw__12ResetManagerFv
draw__12ResetManagerFv:
/* 8042A164 004270A4  94 21 FE E0 */	stwu r1, -0x120(r1)
/* 8042A168 004270A8  7C 08 02 A6 */	mflr r0
/* 8042A16C 004270AC  90 01 01 24 */	stw r0, 0x124(r1)
/* 8042A170 004270B0  93 E1 01 1C */	stw r31, 0x11c(r1)
/* 8042A174 004270B4  7C 7F 1B 78 */	mr r31, r3
/* 8042A178 004270B8  80 03 00 04 */	lwz r0, 4(r3)
/* 8042A17C 004270BC  2C 00 00 00 */	cmpwi r0, 0
/* 8042A180 004270C0  41 82 01 28 */	beq lbl_8042A2A8
/* 8042A184 004270C4  4B CB 4C 2D */	bl DVDGetDriveStatus
/* 8042A188 004270C8  2C 03 FF FF */	cmpwi r3, -1
/* 8042A18C 004270CC  41 82 01 1C */	beq lbl_8042A2A8
/* 8042A190 004270D0  80 AD 89 20 */	lwz r5, sManager__8JUTVideo@sda21(r13)
/* 8042A194 004270D4  3C 80 43 30 */	lis r4, 0x4330
/* 8042A198 004270D8  C0 22 21 E8 */	lfs f1, lbl_80520548@sda21(r2)
/* 8042A19C 004270DC  38 61 00 10 */	addi r3, r1, 0x10
/* 8042A1A0 004270E0  80 C5 00 04 */	lwz r6, 4(r5)
/* 8042A1A4 004270E4  90 81 00 E8 */	stw r4, 0xe8(r1)
/* 8042A1A8 004270E8  FC 40 08 90 */	fmr f2, f1
/* 8042A1AC 004270EC  A0 A6 00 04 */	lhz r5, 4(r6)
/* 8042A1B0 004270F0  A0 06 00 06 */	lhz r0, 6(r6)
/* 8042A1B4 004270F4  90 A1 00 EC */	stw r5, 0xec(r1)
/* 8042A1B8 004270F8  C8 82 21 F0 */	lfd f4, lbl_80520550@sda21(r2)
/* 8042A1BC 004270FC  C8 01 00 E8 */	lfd f0, 0xe8(r1)
/* 8042A1C0 00427100  90 01 00 F4 */	stw r0, 0xf4(r1)
/* 8042A1C4 00427104  EC 60 20 28 */	fsubs f3, f0, f4
/* 8042A1C8 00427108  C0 A2 21 FC */	lfs f5, lbl_8052055C@sda21(r2)
/* 8042A1CC 0042710C  90 81 00 F0 */	stw r4, 0xf0(r1)
/* 8042A1D0 00427110  C0 C2 22 00 */	lfs f6, lbl_80520560@sda21(r2)
/* 8042A1D4 00427114  C8 01 00 F0 */	lfd f0, 0xf0(r1)
/* 8042A1D8 00427118  EC 80 20 28 */	fsubs f4, f0, f4
/* 8042A1DC 0042711C  4B C0 B3 FD */	bl __ct__13J2DOrthoGraphFffffff
/* 8042A1E0 00427120  38 61 00 10 */	addi r3, r1, 0x10
/* 8042A1E4 00427124  4B C0 B4 D9 */	bl setPort__13J2DOrthoGraphFv
/* 8042A1E8 00427128  C0 42 22 04 */	lfs f2, lbl_80520564@sda21(r2)
/* 8042A1EC 0042712C  C0 1F 00 08 */	lfs f0, 8(r31)
/* 8042A1F0 00427130  C0 22 21 F8 */	lfs f1, lbl_80520558@sda21(r2)
/* 8042A1F4 00427134  EC 42 00 32 */	fmuls f2, f2, f0
/* 8042A1F8 00427138  C0 02 21 E8 */	lfs f0, lbl_80520548@sda21(r2)
/* 8042A1FC 0042713C  EC 22 08 24 */	fdivs f1, f2, f1
/* 8042A200 00427140  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8042A204 00427144  4C 41 13 82 */	cror 2, 1, 2
/* 8042A208 00427148  40 82 00 10 */	bne lbl_8042A218
/* 8042A20C 0042714C  C0 02 22 08 */	lfs f0, lbl_80520568@sda21(r2)
/* 8042A210 00427150  EC 00 08 2A */	fadds f0, f0, f1
/* 8042A214 00427154  48 00 00 0C */	b lbl_8042A220
lbl_8042A218:
/* 8042A218 00427158  C0 02 22 08 */	lfs f0, lbl_80520568@sda21(r2)
/* 8042A21C 0042715C  EC 01 00 28 */	fsubs f0, f1, f0
lbl_8042A220:
/* 8042A220 00427160  FC 00 00 1E */	fctiwz f0, f0
/* 8042A224 00427164  38 C0 00 00 */	li r6, 0
/* 8042A228 00427168  3C 00 43 30 */	lis r0, 0x4330
/* 8042A22C 0042716C  C0 22 21 E8 */	lfs f1, lbl_80520548@sda21(r2)
/* 8042A230 00427170  98 C1 00 08 */	stb r6, 8(r1)
/* 8042A234 00427174  38 61 00 0C */	addi r3, r1, 0xc
/* 8042A238 00427178  D8 01 00 F8 */	stfd f0, 0xf8(r1)
/* 8042A23C 0042717C  FC 40 08 90 */	fmr f2, f1
/* 8042A240 00427180  80 8D 89 20 */	lwz r4, sManager__8JUTVideo@sda21(r13)
/* 8042A244 00427184  80 A1 00 FC */	lwz r5, 0xfc(r1)
/* 8042A248 00427188  98 C1 00 09 */	stb r6, 9(r1)
/* 8042A24C 0042718C  C8 82 21 F0 */	lfd f4, lbl_80520550@sda21(r2)
/* 8042A250 00427190  98 C1 00 0A */	stb r6, 0xa(r1)
/* 8042A254 00427194  98 A1 00 0B */	stb r5, 0xb(r1)
/* 8042A258 00427198  80 A1 00 08 */	lwz r5, 8(r1)
/* 8042A25C 0042719C  90 01 01 00 */	stw r0, 0x100(r1)
/* 8042A260 004271A0  90 A1 00 0C */	stw r5, 0xc(r1)
/* 8042A264 004271A4  80 A4 00 04 */	lwz r5, 4(r4)
/* 8042A268 004271A8  90 01 01 08 */	stw r0, 0x108(r1)
/* 8042A26C 004271AC  A0 85 00 04 */	lhz r4, 4(r5)
/* 8042A270 004271B0  A0 05 00 06 */	lhz r0, 6(r5)
/* 8042A274 004271B4  90 81 01 04 */	stw r4, 0x104(r1)
/* 8042A278 004271B8  90 01 01 0C */	stw r0, 0x10c(r1)
/* 8042A27C 004271BC  C8 61 01 00 */	lfd f3, 0x100(r1)
/* 8042A280 004271C0  C8 01 01 08 */	lfd f0, 0x108(r1)
/* 8042A284 004271C4  EC 63 20 28 */	fsubs f3, f3, f4
/* 8042A288 004271C8  EC 80 20 28 */	fsubs f4, f0, f4
/* 8042A28C 004271CC  4B C0 B7 6D */	bl J2DFillBox__FffffQ28JUtility6TColor
/* 8042A290 004271D0  3C 80 80 4A */	lis r4, __vt__13J2DOrthoGraph@ha
/* 8042A294 004271D4  3C 60 80 4A */	lis r3, __vt__14J2DGrafContext@ha
/* 8042A298 004271D8  38 04 06 00 */	addi r0, r4, __vt__13J2DOrthoGraph@l
/* 8042A29C 004271DC  90 01 00 10 */	stw r0, 0x10(r1)
/* 8042A2A0 004271E0  38 03 06 50 */	addi r0, r3, __vt__14J2DGrafContext@l
/* 8042A2A4 004271E4  90 01 00 10 */	stw r0, 0x10(r1)
lbl_8042A2A8:
/* 8042A2A8 004271E8  80 01 01 24 */	lwz r0, 0x124(r1)
/* 8042A2AC 004271EC  83 E1 01 1C */	lwz r31, 0x11c(r1)
/* 8042A2B0 004271F0  7C 08 03 A6 */	mtlr r0
/* 8042A2B4 004271F4  38 21 01 20 */	addi r1, r1, 0x120
/* 8042A2B8 004271F8  4E 80 00 20 */	blr 

.global isWritingMemoryCard__12ResetManagerFv
isWritingMemoryCard__12ResetManagerFv:
/* 8042A2BC 004271FC  80 6D 9A EC */	lwz r3, sys@sda21(r13)
/* 8042A2C0 00427200  80 63 00 5C */	lwz r3, 0x5c(r3)
/* 8042A2C4 00427204  80 03 00 E4 */	lwz r0, 0xe4(r3)
/* 8042A2C8 00427208  54 03 07 FE */	clrlwi r3, r0, 0x1f
/* 8042A2CC 0042720C  4E 80 00 20 */	blr 

.global isSoundSystemStopped__12ResetManagerFv
isSoundSystemStopped__12ResetManagerFv:
/* 8042A2D0 00427210  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8042A2D4 00427214  7C 08 02 A6 */	mflr r0
/* 8042A2D8 00427218  90 01 00 14 */	stw r0, 0x14(r1)
/* 8042A2DC 0042721C  80 0D 98 58 */	lwz r0, spSysIF__8PSSystem@sda21(r13)
/* 8042A2E0 00427220  28 00 00 00 */	cmplwi r0, 0
/* 8042A2E4 00427224  41 82 00 1C */	beq lbl_8042A300
/* 8042A2E8 00427228  4B C8 2D 41 */	bl checkAudioStopStatus__8JAIBasicFv
/* 8042A2EC 0042722C  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8042A2F0 00427230  20 00 00 02 */	subfic r0, r0, 2
/* 8042A2F4 00427234  7C 00 00 34 */	cntlzw r0, r0
/* 8042A2F8 00427238  54 03 D9 7E */	srwi r3, r0, 5
/* 8042A2FC 0042723C  48 00 00 08 */	b lbl_8042A304
lbl_8042A300:
/* 8042A300 00427240  38 60 00 01 */	li r3, 1
lbl_8042A304:
/* 8042A304 00427244  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8042A308 00427248  7C 08 03 A6 */	mtlr r0
/* 8042A30C 0042724C  38 21 00 10 */	addi r1, r1, 0x10
/* 8042A310 00427250  4E 80 00 20 */	blr 
