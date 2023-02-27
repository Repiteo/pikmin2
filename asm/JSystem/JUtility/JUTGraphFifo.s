.include "macros.inc"
.section .data, "wa"  # 0x8049E220 - 0x804EFC20
.balign 8
.obj __vt__12JUTGraphFifo, global
	.4byte 0
	.4byte 0
	.4byte __dt__12JUTGraphFifoFv
.endobj __vt__12JUTGraphFifo

.section .sbss # 0x80514D80 - 0x80516360
.balign 8
.obj sInitiated__12JUTGraphFifo, global
	.skip 0x1
.endobj sInitiated__12JUTGraphFifo
.balign 4
.obj sCurrentFifo__12JUTGraphFifo, global
	.skip 0x4
.endobj sCurrentFifo__12JUTGraphFifo
.balign 4
.obj mGpStatus__12JUTGraphFifo, global
	.skip 0x5
.endobj mGpStatus__12JUTGraphFifo

.section .text, "ax"  # 0x800056C0 - 0x80472F00
.fn __ct__12JUTGraphFifoFUl, global
/* 8002EB34 0002BA74  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002EB38 0002BA78  7C 08 02 A6 */	mflr r0
/* 8002EB3C 0002BA7C  3C A0 80 4A */	lis r5, __vt__12JUTGraphFifo@ha
/* 8002EB40 0002BA80  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002EB44 0002BA84  38 04 00 1F */	addi r0, r4, 0x1f
/* 8002EB48 0002BA88  54 00 00 34 */	rlwinm r0, r0, 0, 0, 0x1a
/* 8002EB4C 0002BA8C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8002EB50 0002BA90  7C 7F 1B 78 */	mr r31, r3
/* 8002EB54 0002BA94  38 65 04 D0 */	addi r3, r5, __vt__12JUTGraphFifo@l
/* 8002EB58 0002BA98  90 7F 00 00 */	stw r3, 0(r31)
/* 8002EB5C 0002BA9C  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8002EB60 0002BAA0  88 0D 88 E8 */	lbz r0, sInitiated__12JUTGraphFifo@sda21(r13)
/* 8002EB64 0002BAA4  28 00 00 00 */	cmplwi r0, 0
/* 8002EB68 0002BAA8  41 82 00 4C */	beq .L_8002EBB4
/* 8002EB6C 0002BAAC  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 8002EB70 0002BAB0  38 A0 00 20 */	li r5, 0x20
/* 8002EB74 0002BAB4  80 6D 88 28 */	lwz r3, sSystemHeap__7JKRHeap@sda21(r13)
/* 8002EB78 0002BAB8  38 84 00 80 */	addi r4, r4, 0x80
/* 8002EB7C 0002BABC  4B FF 4A C5 */	bl alloc__7JKRHeapFUli
/* 8002EB80 0002BAC0  90 7F 00 04 */	stw r3, 4(r31)
/* 8002EB84 0002BAC4  80 7F 00 04 */	lwz r3, 4(r31)
/* 8002EB88 0002BAC8  38 03 00 80 */	addi r0, r3, 0x80
/* 8002EB8C 0002BACC  90 1F 00 08 */	stw r0, 8(r31)
/* 8002EB90 0002BAD0  80 7F 00 04 */	lwz r3, 4(r31)
/* 8002EB94 0002BAD4  80 9F 00 08 */	lwz r4, 8(r31)
/* 8002EB98 0002BAD8  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 8002EB9C 0002BADC  48 0B 4F 99 */	bl GXInitFifoBase
/* 8002EBA0 0002BAE0  80 9F 00 08 */	lwz r4, 8(r31)
/* 8002EBA4 0002BAE4  80 7F 00 04 */	lwz r3, 4(r31)
/* 8002EBA8 0002BAE8  7C 85 23 78 */	mr r5, r4
/* 8002EBAC 0002BAEC  48 0B 4F F5 */	bl GXInitFifoPtrs
/* 8002EBB0 0002BAF0  48 00 00 48 */	b .L_8002EBF8
.L_8002EBB4:
/* 8002EBB4 0002BAF4  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 8002EBB8 0002BAF8  38 A0 00 20 */	li r5, 0x20
/* 8002EBBC 0002BAFC  80 6D 88 28 */	lwz r3, sSystemHeap__7JKRHeap@sda21(r13)
/* 8002EBC0 0002BB00  38 84 00 A0 */	addi r4, r4, 0xa0
/* 8002EBC4 0002BB04  4B FF 4A 7D */	bl alloc__7JKRHeapFUli
/* 8002EBC8 0002BB08  90 7F 00 08 */	stw r3, 8(r31)
/* 8002EBCC 0002BB0C  80 7F 00 08 */	lwz r3, 8(r31)
/* 8002EBD0 0002BB10  38 03 00 1F */	addi r0, r3, 0x1f
/* 8002EBD4 0002BB14  54 00 00 34 */	rlwinm r0, r0, 0, 0, 0x1a
/* 8002EBD8 0002BB18  90 1F 00 08 */	stw r0, 8(r31)
/* 8002EBDC 0002BB1C  80 7F 00 08 */	lwz r3, 8(r31)
/* 8002EBE0 0002BB20  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 8002EBE4 0002BB24  48 0B 3D 4D */	bl GXInit
/* 8002EBE8 0002BB28  90 7F 00 04 */	stw r3, 4(r31)
/* 8002EBEC 0002BB2C  38 00 00 01 */	li r0, 1
/* 8002EBF0 0002BB30  98 0D 88 E8 */	stb r0, sInitiated__12JUTGraphFifo@sda21(r13)
/* 8002EBF4 0002BB34  93 ED 88 EC */	stw r31, sCurrentFifo__12JUTGraphFifo@sda21(r13)
.L_8002EBF8:
/* 8002EBF8 0002BB38  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002EBFC 0002BB3C  7F E3 FB 78 */	mr r3, r31
/* 8002EC00 0002BB40  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002EC04 0002BB44  7C 08 03 A6 */	mtlr r0
/* 8002EC08 0002BB48  38 21 00 10 */	addi r1, r1, 0x10
/* 8002EC0C 0002BB4C  4E 80 00 20 */	blr 
.endfn __ct__12JUTGraphFifoFUl

.fn __dt__12JUTGraphFifoFv, global
/* 8002EC10 0002BB50  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8002EC14 0002BB54  7C 08 02 A6 */	mflr r0
/* 8002EC18 0002BB58  90 01 00 24 */	stw r0, 0x24(r1)
/* 8002EC1C 0002BB5C  BF 41 00 08 */	stmw r26, 8(r1)
/* 8002EC20 0002BB60  7C 7A 1B 79 */	or. r26, r3, r3
/* 8002EC24 0002BB64  7C 9B 23 78 */	mr r27, r4
/* 8002EC28 0002BB68  41 82 00 8C */	beq .L_8002ECB4
/* 8002EC2C 0002BB6C  3C 60 80 4A */	lis r3, __vt__12JUTGraphFifo@ha
/* 8002EC30 0002BB70  38 03 04 D0 */	addi r0, r3, __vt__12JUTGraphFifo@l
/* 8002EC34 0002BB74  90 1A 00 00 */	stw r0, 0(r26)
/* 8002EC38 0002BB78  80 6D 88 EC */	lwz r3, sCurrentFifo__12JUTGraphFifo@sda21(r13)
/* 8002EC3C 0002BB7C  80 63 00 04 */	lwz r3, 4(r3)
/* 8002EC40 0002BB80  48 0B 52 7D */	bl GXSaveCPUFifo
/* 8002EC44 0002BB84  3B ED 88 F0 */	addi r31, r13, mGpStatus__12JUTGraphFifo@sda21
/* 8002EC48 0002BB88  7F FE FB 78 */	mr r30, r31
/* 8002EC4C 0002BB8C  7F FD FB 78 */	mr r29, r31
/* 8002EC50 0002BB90  3B 9F 00 01 */	addi r28, r31, 1
/* 8002EC54 0002BB94  3B FF 00 04 */	addi r31, r31, 4
/* 8002EC58 0002BB98  3B DE 00 03 */	addi r30, r30, 3
/* 8002EC5C 0002BB9C  3B BD 00 02 */	addi r29, r29, 2
.L_8002EC60:
/* 8002EC60 0002BBA0  7F 84 E3 78 */	mr r4, r28
/* 8002EC64 0002BBA4  7F A5 EB 78 */	mr r5, r29
/* 8002EC68 0002BBA8  7F C6 F3 78 */	mr r6, r30
/* 8002EC6C 0002BBAC  7F E7 FB 78 */	mr r7, r31
/* 8002EC70 0002BBB0  38 6D 88 F0 */	addi r3, r13, mGpStatus__12JUTGraphFifo@sda21
/* 8002EC74 0002BBB4  48 0B 53 45 */	bl GXGetGPStatus
/* 8002EC78 0002BBB8  88 1D 00 00 */	lbz r0, 0(r29)
/* 8002EC7C 0002BBBC  28 00 00 00 */	cmplwi r0, 0
/* 8002EC80 0002BBC0  41 82 FF E0 */	beq .L_8002EC60
/* 8002EC84 0002BBC4  80 0D 88 EC */	lwz r0, sCurrentFifo__12JUTGraphFifo@sda21(r13)
/* 8002EC88 0002BBC8  7C 00 D0 40 */	cmplw r0, r26
/* 8002EC8C 0002BBCC  40 82 00 0C */	bne .L_8002EC98
/* 8002EC90 0002BBD0  38 00 00 00 */	li r0, 0
/* 8002EC94 0002BBD4  90 0D 88 EC */	stw r0, sCurrentFifo__12JUTGraphFifo@sda21(r13)
.L_8002EC98:
/* 8002EC98 0002BBD8  80 6D 88 28 */	lwz r3, sSystemHeap__7JKRHeap@sda21(r13)
/* 8002EC9C 0002BBDC  80 9A 00 08 */	lwz r4, 8(r26)
/* 8002ECA0 0002BBE0  4B FF 4A 15 */	bl free__7JKRHeapFPv
/* 8002ECA4 0002BBE4  7F 60 07 35 */	extsh. r0, r27
/* 8002ECA8 0002BBE8  40 81 00 0C */	ble .L_8002ECB4
/* 8002ECAC 0002BBEC  7F 43 D3 78 */	mr r3, r26
/* 8002ECB0 0002BBF0  4B FF 54 05 */	bl __dl__FPv
.L_8002ECB4:
/* 8002ECB4 0002BBF4  7F 43 D3 78 */	mr r3, r26
/* 8002ECB8 0002BBF8  BB 41 00 08 */	lmw r26, 8(r1)
/* 8002ECBC 0002BBFC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8002ECC0 0002BC00  7C 08 03 A6 */	mtlr r0
/* 8002ECC4 0002BC04  38 21 00 20 */	addi r1, r1, 0x20
/* 8002ECC8 0002BC08  4E 80 00 20 */	blr 
.endfn __dt__12JUTGraphFifoFv
