.include "macros.inc"
.section .data, "wa"  # 0x8049E220 - 0x804EFC20
.balign 0x8
.global __vt__12JKRAramBlock
__vt__12JKRAramBlock:
	.4byte 0
	.4byte 0
	.4byte __dt__12JKRAramBlockFv
	.4byte 0

.section .text, "ax"  # 0x800056C0 - 0x80472F00
.global __ct__12JKRAramBlockFUlUlUlUcb
__ct__12JKRAramBlockFUlUlUlUcb:
/* 80019444 00016384  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80019448 00016388  7C 08 02 A6 */	mflr r0
/* 8001944C 0001638C  3D 20 80 4A */	lis r9, __vt__12JKRAramBlock@ha
/* 80019450 00016390  90 01 00 24 */	stw r0, 0x24(r1)
/* 80019454 00016394  38 09 FC 18 */	addi r0, r9, __vt__12JKRAramBlock@l
/* 80019458 00016398  BF 41 00 08 */	stmw r26, 8(r1)
/* 8001945C 0001639C  7C 7A 1B 78 */	mr r26, r3
/* 80019460 000163A0  7C 9B 23 78 */	mr r27, r4
/* 80019464 000163A4  7C BC 2B 78 */	mr r28, r5
/* 80019468 000163A8  7C DD 33 78 */	mr r29, r6
/* 8001946C 000163AC  7C FE 3B 78 */	mr r30, r7
/* 80019470 000163B0  7D 1F 43 78 */	mr r31, r8
/* 80019474 000163B4  7F 44 D3 78 */	mr r4, r26
/* 80019478 000163B8  90 03 00 00 */	stw r0, 0(r3)
/* 8001947C 000163BC  38 7A 00 04 */	addi r3, r26, 4
/* 80019480 000163C0  48 00 D3 39 */	bl __ct__10JSUPtrLinkFPv
/* 80019484 000163C4  93 7A 00 14 */	stw r27, 0x14(r26)
/* 80019488 000163C8  7F 43 D3 78 */	mr r3, r26
/* 8001948C 000163CC  93 9A 00 18 */	stw r28, 0x18(r26)
/* 80019490 000163D0  93 BA 00 1C */	stw r29, 0x1c(r26)
/* 80019494 000163D4  9B DA 00 20 */	stb r30, 0x20(r26)
/* 80019498 000163D8  9B FA 00 21 */	stb r31, 0x21(r26)
/* 8001949C 000163DC  BB 41 00 08 */	lmw r26, 8(r1)
/* 800194A0 000163E0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800194A4 000163E4  7C 08 03 A6 */	mtlr r0
/* 800194A8 000163E8  38 21 00 20 */	addi r1, r1, 0x20
/* 800194AC 000163EC  4E 80 00 20 */	blr 

.global __dt__12JKRAramBlockFv
__dt__12JKRAramBlockFv:
/* 800194B0 000163F0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800194B4 000163F4  7C 08 02 A6 */	mflr r0
/* 800194B8 000163F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800194BC 000163FC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800194C0 00016400  7C 9F 23 78 */	mr r31, r4
/* 800194C4 00016404  93 C1 00 08 */	stw r30, 8(r1)
/* 800194C8 00016408  7C 7E 1B 79 */	or. r30, r3, r3
/* 800194CC 0001640C  41 82 00 84 */	beq lbl_80019550
/* 800194D0 00016410  3C 60 80 4A */	lis r3, __vt__12JKRAramBlock@ha
/* 800194D4 00016414  38 03 FC 18 */	addi r0, r3, __vt__12JKRAramBlock@l
/* 800194D8 00016418  90 1E 00 00 */	stw r0, 0(r30)
/* 800194DC 0001641C  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 800194E0 00016420  80 7E 00 08 */	lwz r3, 8(r30)
/* 800194E4 00016424  28 04 00 00 */	cmplwi r4, 0
/* 800194E8 00016428  41 82 00 2C */	beq lbl_80019514
/* 800194EC 0001642C  80 E4 00 00 */	lwz r7, 0(r4)
/* 800194F0 00016430  38 9E 00 04 */	addi r4, r30, 4
/* 800194F4 00016434  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 800194F8 00016438  80 C7 00 1C */	lwz r6, 0x1c(r7)
/* 800194FC 0001643C  80 BE 00 18 */	lwz r5, 0x18(r30)
/* 80019500 00016440  7C 00 32 14 */	add r0, r0, r6
/* 80019504 00016444  7C 05 02 14 */	add r0, r5, r0
/* 80019508 00016448  90 07 00 1C */	stw r0, 0x1c(r7)
/* 8001950C 0001644C  48 00 D7 19 */	bl remove__10JSUPtrListFP10JSUPtrLink
/* 80019510 00016450  48 00 00 1C */	b lbl_8001952C
lbl_80019514:
/* 80019514 00016454  80 9E 00 1C */	lwz r4, 0x1c(r30)
/* 80019518 00016458  38 00 00 00 */	li r0, 0
/* 8001951C 0001645C  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 80019520 00016460  7C 64 1A 14 */	add r3, r4, r3
/* 80019524 00016464  90 7E 00 1C */	stw r3, 0x1c(r30)
/* 80019528 00016468  90 1E 00 18 */	stw r0, 0x18(r30)
lbl_8001952C:
/* 8001952C 0001646C  34 1E 00 04 */	addic. r0, r30, 4
/* 80019530 00016470  41 82 00 10 */	beq lbl_80019540
/* 80019534 00016474  38 7E 00 04 */	addi r3, r30, 4
/* 80019538 00016478  38 80 00 00 */	li r4, 0
/* 8001953C 0001647C  48 00 D2 95 */	bl __dt__10JSUPtrLinkFv
lbl_80019540:
/* 80019540 00016480  7F E0 07 35 */	extsh. r0, r31
/* 80019544 00016484  40 81 00 0C */	ble lbl_80019550
/* 80019548 00016488  7F C3 F3 78 */	mr r3, r30
/* 8001954C 0001648C  48 00 AB 69 */	bl __dl__FPv
lbl_80019550:
/* 80019550 00016490  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80019554 00016494  7F C3 F3 78 */	mr r3, r30
/* 80019558 00016498  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8001955C 0001649C  83 C1 00 08 */	lwz r30, 8(r1)
/* 80019560 000164A0  7C 08 03 A6 */	mtlr r0
/* 80019564 000164A4  38 21 00 10 */	addi r1, r1, 0x10
/* 80019568 000164A8  4E 80 00 20 */	blr 

.global allocHead__12JKRAramBlockFUlUcP11JKRAramHeap
allocHead__12JKRAramBlockFUlUcP11JKRAramHeap:
/* 8001956C 000164AC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80019570 000164B0  7C 08 02 A6 */	mflr r0
/* 80019574 000164B4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80019578 000164B8  BF 41 00 08 */	stmw r26, 8(r1)
/* 8001957C 000164BC  7C 7A 1B 78 */	mr r26, r3
/* 80019580 000164C0  7C 9B 23 78 */	mr r27, r4
/* 80019584 000164C4  7C BC 2B 78 */	mr r28, r5
/* 80019588 000164C8  38 A0 00 00 */	li r5, 0
/* 8001958C 000164CC  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80019590 000164D0  81 03 00 14 */	lwz r8, 0x14(r3)
/* 80019594 000164D4  38 60 00 24 */	li r3, 0x24
/* 80019598 000164D8  80 FA 00 18 */	lwz r7, 0x18(r26)
/* 8001959C 000164DC  7F BB 00 50 */	subf r29, r27, r0
/* 800195A0 000164E0  80 86 00 30 */	lwz r4, 0x30(r6)
/* 800195A4 000164E4  7F C8 3A 14 */	add r30, r8, r7
/* 800195A8 000164E8  48 00 A9 99 */	bl __nw__FUlP7JKRHeapi
/* 800195AC 000164EC  7C 7F 1B 79 */	or. r31, r3, r3
/* 800195B0 000164F0  41 82 00 34 */	beq lbl_800195E4
/* 800195B4 000164F4  3C 60 80 4A */	lis r3, __vt__12JKRAramBlock@ha
/* 800195B8 000164F8  7F E4 FB 78 */	mr r4, r31
/* 800195BC 000164FC  38 03 FC 18 */	addi r0, r3, __vt__12JKRAramBlock@l
/* 800195C0 00016500  38 7F 00 04 */	addi r3, r31, 4
/* 800195C4 00016504  90 1F 00 00 */	stw r0, 0(r31)
/* 800195C8 00016508  48 00 D1 F1 */	bl __ct__10JSUPtrLinkFPv
/* 800195CC 0001650C  93 DF 00 14 */	stw r30, 0x14(r31)
/* 800195D0 00016510  38 00 00 00 */	li r0, 0
/* 800195D4 00016514  93 7F 00 18 */	stw r27, 0x18(r31)
/* 800195D8 00016518  93 BF 00 1C */	stw r29, 0x1c(r31)
/* 800195DC 0001651C  9B 9F 00 20 */	stb r28, 0x20(r31)
/* 800195E0 00016520  98 1F 00 21 */	stb r0, 0x21(r31)
lbl_800195E4:
/* 800195E4 00016524  38 00 00 00 */	li r0, 0
/* 800195E8 00016528  38 BF 00 04 */	addi r5, r31, 4
/* 800195EC 0001652C  90 1A 00 1C */	stw r0, 0x1c(r26)
/* 800195F0 00016530  80 7A 00 08 */	lwz r3, 8(r26)
/* 800195F4 00016534  80 9A 00 10 */	lwz r4, 0x10(r26)
/* 800195F8 00016538  48 00 D4 5D */	bl insert__10JSUPtrListFP10JSUPtrLinkP10JSUPtrLink
/* 800195FC 0001653C  7F E3 FB 78 */	mr r3, r31
/* 80019600 00016540  BB 41 00 08 */	lmw r26, 8(r1)
/* 80019604 00016544  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80019608 00016548  7C 08 03 A6 */	mtlr r0
/* 8001960C 0001654C  38 21 00 20 */	addi r1, r1, 0x20
/* 80019610 00016550  4E 80 00 20 */	blr 

.global allocTail__12JKRAramBlockFUlUcP11JKRAramHeap
allocTail__12JKRAramBlockFUlUcP11JKRAramHeap:
/* 80019614 00016554  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80019618 00016558  7C 08 02 A6 */	mflr r0
/* 8001961C 0001655C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80019620 00016560  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 80019624 00016564  7C 7B 1B 78 */	mr r27, r3
/* 80019628 00016568  7C 9C 23 78 */	mr r28, r4
/* 8001962C 0001656C  7C BD 2B 78 */	mr r29, r5
/* 80019630 00016570  38 A0 00 00 */	li r5, 0
/* 80019634 00016574  80 83 00 1C */	lwz r4, 0x1c(r3)
/* 80019638 00016578  80 03 00 18 */	lwz r0, 0x18(r3)
/* 8001963C 0001657C  38 60 00 24 */	li r3, 0x24
/* 80019640 00016580  80 FB 00 14 */	lwz r7, 0x14(r27)
/* 80019644 00016584  7C 00 22 14 */	add r0, r0, r4
/* 80019648 00016588  80 86 00 30 */	lwz r4, 0x30(r6)
/* 8001964C 0001658C  7C 07 02 14 */	add r0, r7, r0
/* 80019650 00016590  7F DC 00 50 */	subf r30, r28, r0
/* 80019654 00016594  48 00 A8 ED */	bl __nw__FUlP7JKRHeapi
/* 80019658 00016598  7C 7F 1B 79 */	or. r31, r3, r3
/* 8001965C 0001659C  41 82 00 38 */	beq lbl_80019694
/* 80019660 000165A0  3C 60 80 4A */	lis r3, __vt__12JKRAramBlock@ha
/* 80019664 000165A4  7F E4 FB 78 */	mr r4, r31
/* 80019668 000165A8  38 03 FC 18 */	addi r0, r3, __vt__12JKRAramBlock@l
/* 8001966C 000165AC  38 7F 00 04 */	addi r3, r31, 4
/* 80019670 000165B0  90 1F 00 00 */	stw r0, 0(r31)
/* 80019674 000165B4  48 00 D1 45 */	bl __ct__10JSUPtrLinkFPv
/* 80019678 000165B8  93 DF 00 14 */	stw r30, 0x14(r31)
/* 8001967C 000165BC  38 60 00 00 */	li r3, 0
/* 80019680 000165C0  38 00 00 01 */	li r0, 1
/* 80019684 000165C4  93 9F 00 18 */	stw r28, 0x18(r31)
/* 80019688 000165C8  90 7F 00 1C */	stw r3, 0x1c(r31)
/* 8001968C 000165CC  9B BF 00 20 */	stb r29, 0x20(r31)
/* 80019690 000165D0  98 1F 00 21 */	stb r0, 0x21(r31)
lbl_80019694:
/* 80019694 000165D4  80 1B 00 1C */	lwz r0, 0x1c(r27)
/* 80019698 000165D8  38 BF 00 04 */	addi r5, r31, 4
/* 8001969C 000165DC  7C 1C 00 50 */	subf r0, r28, r0
/* 800196A0 000165E0  90 1B 00 1C */	stw r0, 0x1c(r27)
/* 800196A4 000165E4  80 7B 00 08 */	lwz r3, 8(r27)
/* 800196A8 000165E8  80 9B 00 10 */	lwz r4, 0x10(r27)
/* 800196AC 000165EC  48 00 D3 A9 */	bl insert__10JSUPtrListFP10JSUPtrLinkP10JSUPtrLink
/* 800196B0 000165F0  7F E3 FB 78 */	mr r3, r31
/* 800196B4 000165F4  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 800196B8 000165F8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800196BC 000165FC  7C 08 03 A6 */	mtlr r0
/* 800196C0 00016600  38 21 00 20 */	addi r1, r1, 0x20
/* 800196C4 00016604  4E 80 00 20 */	blr 
