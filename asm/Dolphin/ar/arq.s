.include "macros.inc"
.section .data, "wa"  # 0x8049E220 - 0x804EFC20
.balign 8
.obj lbl_804A76C8, local
	.asciz "<< Dolphin SDK - ARQ\trelease build: Nov 26 2003 05:19:43 (0x2301) >>"
.endobj lbl_804A76C8

.section .sdata, "wa"  # 0x80514680 - 0x80514D80
.balign 8
.obj __ARQVersion, global
	.4byte lbl_804A76C8
.endobj __ARQVersion

.section .sbss # 0x80514D80 - 0x80516360
.balign 8
.obj __ARQRequestQueueHi, local
	.skip 0x4
.endobj __ARQRequestQueueHi
.obj __ARQRequestTailHi, local
	.skip 0x4
.endobj __ARQRequestTailHi
.obj __ARQRequestQueueLo, local
	.skip 0x4
.endobj __ARQRequestQueueLo
.obj __ARQRequestTailLo, local
	.skip 0x4
.endobj __ARQRequestTailLo
.obj __ARQRequestPendingHi, local
	.skip 0x4
.endobj __ARQRequestPendingHi
.obj __ARQRequestPendingLo, local
	.skip 0x4
.endobj __ARQRequestPendingLo
.obj __ARQCallbackHi, local
	.skip 0x4
.endobj __ARQCallbackHi
.obj __ARQCallbackLo, local
	.skip 0x4
.endobj __ARQCallbackLo
.obj __ARQChunkSize, local
	.skip 0x4
.endobj __ARQChunkSize
.obj __ARQ_init_flag, local
	.skip 0x4
.endobj __ARQ_init_flag

.section .text, "ax"  # 0x800056C0 - 0x80472F00
.fn __ARQServiceQueueLo, global
/* 800D41BC 000D10FC  7C 08 02 A6 */	mflr r0
/* 800D41C0 000D1100  90 01 00 04 */	stw r0, 4(r1)
/* 800D41C4 000D1104  94 21 FF F8 */	stwu r1, -8(r1)
/* 800D41C8 000D1108  80 0D 8D 8C */	lwz r0, __ARQRequestPendingLo@sda21(r13)
/* 800D41CC 000D110C  28 00 00 00 */	cmplwi r0, 0
/* 800D41D0 000D1110  40 82 00 1C */	bne .L_800D41EC
/* 800D41D4 000D1114  80 6D 8D 80 */	lwz r3, __ARQRequestQueueLo@sda21(r13)
/* 800D41D8 000D1118  28 03 00 00 */	cmplwi r3, 0
/* 800D41DC 000D111C  41 82 00 10 */	beq .L_800D41EC
/* 800D41E0 000D1120  90 6D 8D 8C */	stw r3, __ARQRequestPendingLo@sda21(r13)
/* 800D41E4 000D1124  80 03 00 00 */	lwz r0, 0(r3)
/* 800D41E8 000D1128  90 0D 8D 80 */	stw r0, __ARQRequestQueueLo@sda21(r13)
.L_800D41EC:
/* 800D41EC 000D112C  80 AD 8D 8C */	lwz r5, __ARQRequestPendingLo@sda21(r13)
/* 800D41F0 000D1130  28 05 00 00 */	cmplwi r5, 0
/* 800D41F4 000D1134  41 82 00 B8 */	beq .L_800D42AC
/* 800D41F8 000D1138  80 C5 00 18 */	lwz r6, 0x18(r5)
/* 800D41FC 000D113C  80 0D 8D 98 */	lwz r0, __ARQChunkSize@sda21(r13)
/* 800D4200 000D1140  7C 06 00 40 */	cmplw r6, r0
/* 800D4204 000D1144  41 81 00 3C */	bgt .L_800D4240
/* 800D4208 000D1148  80 65 00 08 */	lwz r3, 8(r5)
/* 800D420C 000D114C  28 03 00 00 */	cmplwi r3, 0
/* 800D4210 000D1150  40 82 00 14 */	bne .L_800D4224
/* 800D4214 000D1154  80 85 00 10 */	lwz r4, 0x10(r5)
/* 800D4218 000D1158  80 A5 00 14 */	lwz r5, 0x14(r5)
/* 800D421C 000D115C  4B FF E4 D9 */	bl ARStartDMA
/* 800D4220 000D1160  48 00 00 10 */	b .L_800D4230
.L_800D4224:
/* 800D4224 000D1164  80 85 00 14 */	lwz r4, 0x14(r5)
/* 800D4228 000D1168  80 A5 00 10 */	lwz r5, 0x10(r5)
/* 800D422C 000D116C  4B FF E4 C9 */	bl ARStartDMA
.L_800D4230:
/* 800D4230 000D1170  80 6D 8D 8C */	lwz r3, __ARQRequestPendingLo@sda21(r13)
/* 800D4234 000D1174  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 800D4238 000D1178  90 0D 8D 94 */	stw r0, __ARQCallbackLo@sda21(r13)
/* 800D423C 000D117C  48 00 00 34 */	b .L_800D4270
.L_800D4240:
/* 800D4240 000D1180  80 65 00 08 */	lwz r3, 8(r5)
/* 800D4244 000D1184  28 03 00 00 */	cmplwi r3, 0
/* 800D4248 000D1188  40 82 00 18 */	bne .L_800D4260
/* 800D424C 000D118C  80 85 00 10 */	lwz r4, 0x10(r5)
/* 800D4250 000D1190  7C 06 03 78 */	mr r6, r0
/* 800D4254 000D1194  80 A5 00 14 */	lwz r5, 0x14(r5)
/* 800D4258 000D1198  4B FF E4 9D */	bl ARStartDMA
/* 800D425C 000D119C  48 00 00 14 */	b .L_800D4270
.L_800D4260:
/* 800D4260 000D11A0  80 85 00 14 */	lwz r4, 0x14(r5)
/* 800D4264 000D11A4  7C 06 03 78 */	mr r6, r0
/* 800D4268 000D11A8  80 A5 00 10 */	lwz r5, 0x10(r5)
/* 800D426C 000D11AC  4B FF E4 89 */	bl ARStartDMA
.L_800D4270:
/* 800D4270 000D11B0  80 6D 8D 8C */	lwz r3, __ARQRequestPendingLo@sda21(r13)
/* 800D4274 000D11B4  80 8D 8D 98 */	lwz r4, __ARQChunkSize@sda21(r13)
/* 800D4278 000D11B8  80 03 00 18 */	lwz r0, 0x18(r3)
/* 800D427C 000D11BC  7C 04 00 50 */	subf r0, r4, r0
/* 800D4280 000D11C0  90 03 00 18 */	stw r0, 0x18(r3)
/* 800D4284 000D11C4  80 8D 8D 8C */	lwz r4, __ARQRequestPendingLo@sda21(r13)
/* 800D4288 000D11C8  80 0D 8D 98 */	lwz r0, __ARQChunkSize@sda21(r13)
/* 800D428C 000D11CC  80 64 00 10 */	lwz r3, 0x10(r4)
/* 800D4290 000D11D0  7C 03 02 14 */	add r0, r3, r0
/* 800D4294 000D11D4  90 04 00 10 */	stw r0, 0x10(r4)
/* 800D4298 000D11D8  80 8D 8D 8C */	lwz r4, __ARQRequestPendingLo@sda21(r13)
/* 800D429C 000D11DC  80 0D 8D 98 */	lwz r0, __ARQChunkSize@sda21(r13)
/* 800D42A0 000D11E0  80 64 00 14 */	lwz r3, 0x14(r4)
/* 800D42A4 000D11E4  7C 03 02 14 */	add r0, r3, r0
/* 800D42A8 000D11E8  90 04 00 14 */	stw r0, 0x14(r4)
.L_800D42AC:
/* 800D42AC 000D11EC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800D42B0 000D11F0  38 21 00 08 */	addi r1, r1, 8
/* 800D42B4 000D11F4  7C 08 03 A6 */	mtlr r0
/* 800D42B8 000D11F8  4E 80 00 20 */	blr 
.endfn __ARQServiceQueueLo

.fn __ARQCallbackHack, global
/* 800D42BC 000D11FC  4E 80 00 20 */	blr 
.endfn __ARQCallbackHack

.fn __ARQInterruptServiceRoutine, global
/* 800D42C0 000D1200  7C 08 02 A6 */	mflr r0
/* 800D42C4 000D1204  90 01 00 04 */	stw r0, 4(r1)
/* 800D42C8 000D1208  94 21 FF F8 */	stwu r1, -8(r1)
/* 800D42CC 000D120C  81 8D 8D 90 */	lwz r12, __ARQCallbackHi@sda21(r13)
/* 800D42D0 000D1210  28 0C 00 00 */	cmplwi r12, 0
/* 800D42D4 000D1214  41 82 00 20 */	beq .L_800D42F4
/* 800D42D8 000D1218  80 6D 8D 88 */	lwz r3, __ARQRequestPendingHi@sda21(r13)
/* 800D42DC 000D121C  7D 88 03 A6 */	mtlr r12
/* 800D42E0 000D1220  4E 80 00 21 */	blrl 
/* 800D42E4 000D1224  38 00 00 00 */	li r0, 0
/* 800D42E8 000D1228  90 0D 8D 88 */	stw r0, __ARQRequestPendingHi@sda21(r13)
/* 800D42EC 000D122C  90 0D 8D 90 */	stw r0, __ARQCallbackHi@sda21(r13)
/* 800D42F0 000D1230  48 00 00 28 */	b .L_800D4318
.L_800D42F4:
/* 800D42F4 000D1234  81 8D 8D 94 */	lwz r12, __ARQCallbackLo@sda21(r13)
/* 800D42F8 000D1238  28 0C 00 00 */	cmplwi r12, 0
/* 800D42FC 000D123C  41 82 00 1C */	beq .L_800D4318
/* 800D4300 000D1240  80 6D 8D 8C */	lwz r3, __ARQRequestPendingLo@sda21(r13)
/* 800D4304 000D1244  7D 88 03 A6 */	mtlr r12
/* 800D4308 000D1248  4E 80 00 21 */	blrl 
/* 800D430C 000D124C  38 00 00 00 */	li r0, 0
/* 800D4310 000D1250  90 0D 8D 8C */	stw r0, __ARQRequestPendingLo@sda21(r13)
/* 800D4314 000D1254  90 0D 8D 94 */	stw r0, __ARQCallbackLo@sda21(r13)
.L_800D4318:
/* 800D4318 000D1258  80 CD 8D 78 */	lwz r6, __ARQRequestQueueHi@sda21(r13)
/* 800D431C 000D125C  28 06 00 00 */	cmplwi r6, 0
/* 800D4320 000D1260  41 82 00 4C */	beq .L_800D436C
/* 800D4324 000D1264  80 66 00 08 */	lwz r3, 8(r6)
/* 800D4328 000D1268  28 03 00 00 */	cmplwi r3, 0
/* 800D432C 000D126C  40 82 00 18 */	bne .L_800D4344
/* 800D4330 000D1270  80 86 00 10 */	lwz r4, 0x10(r6)
/* 800D4334 000D1274  80 A6 00 14 */	lwz r5, 0x14(r6)
/* 800D4338 000D1278  80 C6 00 18 */	lwz r6, 0x18(r6)
/* 800D433C 000D127C  4B FF E3 B9 */	bl ARStartDMA
/* 800D4340 000D1280  48 00 00 14 */	b .L_800D4354
.L_800D4344:
/* 800D4344 000D1284  80 86 00 14 */	lwz r4, 0x14(r6)
/* 800D4348 000D1288  80 A6 00 10 */	lwz r5, 0x10(r6)
/* 800D434C 000D128C  80 C6 00 18 */	lwz r6, 0x18(r6)
/* 800D4350 000D1290  4B FF E3 A5 */	bl ARStartDMA
.L_800D4354:
/* 800D4354 000D1294  80 6D 8D 78 */	lwz r3, __ARQRequestQueueHi@sda21(r13)
/* 800D4358 000D1298  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 800D435C 000D129C  90 0D 8D 90 */	stw r0, __ARQCallbackHi@sda21(r13)
/* 800D4360 000D12A0  90 6D 8D 88 */	stw r3, __ARQRequestPendingHi@sda21(r13)
/* 800D4364 000D12A4  80 03 00 00 */	lwz r0, 0(r3)
/* 800D4368 000D12A8  90 0D 8D 78 */	stw r0, __ARQRequestQueueHi@sda21(r13)
.L_800D436C:
/* 800D436C 000D12AC  80 0D 8D 88 */	lwz r0, __ARQRequestPendingHi@sda21(r13)
/* 800D4370 000D12B0  28 00 00 00 */	cmplwi r0, 0
/* 800D4374 000D12B4  40 82 00 08 */	bne .L_800D437C
/* 800D4378 000D12B8  4B FF FE 45 */	bl __ARQServiceQueueLo
.L_800D437C:
/* 800D437C 000D12BC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800D4380 000D12C0  38 21 00 08 */	addi r1, r1, 8
/* 800D4384 000D12C4  7C 08 03 A6 */	mtlr r0
/* 800D4388 000D12C8  4E 80 00 20 */	blr 
.endfn __ARQInterruptServiceRoutine

.fn ARQInit, global
/* 800D438C 000D12CC  7C 08 02 A6 */	mflr r0
/* 800D4390 000D12D0  90 01 00 04 */	stw r0, 4(r1)
/* 800D4394 000D12D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800D4398 000D12D8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800D439C 000D12DC  80 0D 8D 9C */	lwz r0, __ARQ_init_flag@sda21(r13)
/* 800D43A0 000D12E0  2C 00 00 01 */	cmpwi r0, 1
/* 800D43A4 000D12E4  41 82 00 44 */	beq .L_800D43E8
/* 800D43A8 000D12E8  80 6D 82 80 */	lwz r3, __ARQVersion@sda21(r13)
/* 800D43AC 000D12EC  48 01 76 DD */	bl OSRegisterVersion
/* 800D43B0 000D12F0  3B E0 00 00 */	li r31, 0
/* 800D43B4 000D12F4  38 00 10 00 */	li r0, 0x1000
/* 800D43B8 000D12F8  93 ED 8D 80 */	stw r31, __ARQRequestQueueLo@sda21(r13)
/* 800D43BC 000D12FC  3C 60 80 0D */	lis r3, __ARQInterruptServiceRoutine@ha
/* 800D43C0 000D1300  93 ED 8D 78 */	stw r31, __ARQRequestQueueHi@sda21(r13)
/* 800D43C4 000D1304  38 63 42 C0 */	addi r3, r3, __ARQInterruptServiceRoutine@l
/* 800D43C8 000D1308  90 0D 8D 98 */	stw r0, __ARQChunkSize@sda21(r13)
/* 800D43CC 000D130C  4B FF E2 A9 */	bl ARRegisterDMACallback
/* 800D43D0 000D1310  38 00 00 01 */	li r0, 1
/* 800D43D4 000D1314  93 ED 8D 88 */	stw r31, __ARQRequestPendingHi@sda21(r13)
/* 800D43D8 000D1318  93 ED 8D 8C */	stw r31, __ARQRequestPendingLo@sda21(r13)
/* 800D43DC 000D131C  93 ED 8D 90 */	stw r31, __ARQCallbackHi@sda21(r13)
/* 800D43E0 000D1320  93 ED 8D 94 */	stw r31, __ARQCallbackLo@sda21(r13)
/* 800D43E4 000D1324  90 0D 8D 9C */	stw r0, __ARQ_init_flag@sda21(r13)
.L_800D43E8:
/* 800D43E8 000D1328  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800D43EC 000D132C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800D43F0 000D1330  38 21 00 10 */	addi r1, r1, 0x10
/* 800D43F4 000D1334  7C 08 03 A6 */	mtlr r0
/* 800D43F8 000D1338  4E 80 00 20 */	blr 
.endfn ARQInit

.fn ARQPostRequest, global
/* 800D43FC 000D133C  7C 08 02 A6 */	mflr r0
/* 800D4400 000D1340  28 0A 00 00 */	cmplwi r10, 0
/* 800D4404 000D1344  90 01 00 04 */	stw r0, 4(r1)
/* 800D4408 000D1348  38 00 00 00 */	li r0, 0
/* 800D440C 000D134C  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800D4410 000D1350  93 E1 00 34 */	stw r31, 0x34(r1)
/* 800D4414 000D1354  93 C1 00 30 */	stw r30, 0x30(r1)
/* 800D4418 000D1358  3B C6 00 00 */	addi r30, r6, 0
/* 800D441C 000D135C  93 A1 00 2C */	stw r29, 0x2c(r1)
/* 800D4420 000D1360  3B A3 00 00 */	addi r29, r3, 0
/* 800D4424 000D1364  90 03 00 00 */	stw r0, 0(r3)
/* 800D4428 000D1368  90 83 00 04 */	stw r4, 4(r3)
/* 800D442C 000D136C  90 A3 00 08 */	stw r5, 8(r3)
/* 800D4430 000D1370  90 E3 00 10 */	stw r7, 0x10(r3)
/* 800D4434 000D1374  91 03 00 14 */	stw r8, 0x14(r3)
/* 800D4438 000D1378  91 23 00 18 */	stw r9, 0x18(r3)
/* 800D443C 000D137C  41 82 00 0C */	beq .L_800D4448
/* 800D4440 000D1380  91 5D 00 1C */	stw r10, 0x1c(r29)
/* 800D4444 000D1384  48 00 00 10 */	b .L_800D4454
.L_800D4448:
/* 800D4448 000D1388  3C 60 80 0D */	lis r3, __ARQCallbackHack@ha
/* 800D444C 000D138C  38 03 42 BC */	addi r0, r3, __ARQCallbackHack@l
/* 800D4450 000D1390  90 1D 00 1C */	stw r0, 0x1c(r29)
.L_800D4454:
/* 800D4454 000D1394  48 01 A7 E5 */	bl OSDisableInterrupts
/* 800D4458 000D1398  2C 1E 00 01 */	cmpwi r30, 1
/* 800D445C 000D139C  3B E3 00 00 */	addi r31, r3, 0
/* 800D4460 000D13A0  41 82 00 38 */	beq .L_800D4498
/* 800D4464 000D13A4  40 80 00 54 */	bge .L_800D44B8
/* 800D4468 000D13A8  2C 1E 00 00 */	cmpwi r30, 0
/* 800D446C 000D13AC  40 80 00 08 */	bge .L_800D4474
/* 800D4470 000D13B0  48 00 00 48 */	b .L_800D44B8
.L_800D4474:
/* 800D4474 000D13B4  80 0D 8D 80 */	lwz r0, __ARQRequestQueueLo@sda21(r13)
/* 800D4478 000D13B8  28 00 00 00 */	cmplwi r0, 0
/* 800D447C 000D13BC  41 82 00 10 */	beq .L_800D448C
/* 800D4480 000D13C0  80 6D 8D 84 */	lwz r3, __ARQRequestTailLo@sda21(r13)
/* 800D4484 000D13C4  93 A3 00 00 */	stw r29, 0(r3)
/* 800D4488 000D13C8  48 00 00 08 */	b .L_800D4490
.L_800D448C:
/* 800D448C 000D13CC  93 AD 8D 80 */	stw r29, __ARQRequestQueueLo@sda21(r13)
.L_800D4490:
/* 800D4490 000D13D0  93 AD 8D 84 */	stw r29, __ARQRequestTailLo@sda21(r13)
/* 800D4494 000D13D4  48 00 00 24 */	b .L_800D44B8
.L_800D4498:
/* 800D4498 000D13D8  80 0D 8D 78 */	lwz r0, __ARQRequestQueueHi@sda21(r13)
/* 800D449C 000D13DC  28 00 00 00 */	cmplwi r0, 0
/* 800D44A0 000D13E0  41 82 00 10 */	beq .L_800D44B0
/* 800D44A4 000D13E4  80 6D 8D 7C */	lwz r3, __ARQRequestTailHi@sda21(r13)
/* 800D44A8 000D13E8  93 A3 00 00 */	stw r29, 0(r3)
/* 800D44AC 000D13EC  48 00 00 08 */	b .L_800D44B4
.L_800D44B0:
/* 800D44B0 000D13F0  93 AD 8D 78 */	stw r29, __ARQRequestQueueHi@sda21(r13)
.L_800D44B4:
/* 800D44B4 000D13F4  93 AD 8D 7C */	stw r29, __ARQRequestTailHi@sda21(r13)
.L_800D44B8:
/* 800D44B8 000D13F8  80 0D 8D 88 */	lwz r0, __ARQRequestPendingHi@sda21(r13)
/* 800D44BC 000D13FC  28 00 00 00 */	cmplwi r0, 0
/* 800D44C0 000D1400  40 82 00 74 */	bne .L_800D4534
/* 800D44C4 000D1404  80 0D 8D 8C */	lwz r0, __ARQRequestPendingLo@sda21(r13)
/* 800D44C8 000D1408  28 00 00 00 */	cmplwi r0, 0
/* 800D44CC 000D140C  40 82 00 68 */	bne .L_800D4534
/* 800D44D0 000D1410  80 CD 8D 78 */	lwz r6, __ARQRequestQueueHi@sda21(r13)
/* 800D44D4 000D1414  28 06 00 00 */	cmplwi r6, 0
/* 800D44D8 000D1418  41 82 00 4C */	beq .L_800D4524
/* 800D44DC 000D141C  80 66 00 08 */	lwz r3, 8(r6)
/* 800D44E0 000D1420  28 03 00 00 */	cmplwi r3, 0
/* 800D44E4 000D1424  40 82 00 18 */	bne .L_800D44FC
/* 800D44E8 000D1428  80 86 00 10 */	lwz r4, 0x10(r6)
/* 800D44EC 000D142C  80 A6 00 14 */	lwz r5, 0x14(r6)
/* 800D44F0 000D1430  80 C6 00 18 */	lwz r6, 0x18(r6)
/* 800D44F4 000D1434  4B FF E2 01 */	bl ARStartDMA
/* 800D44F8 000D1438  48 00 00 14 */	b .L_800D450C
.L_800D44FC:
/* 800D44FC 000D143C  80 86 00 14 */	lwz r4, 0x14(r6)
/* 800D4500 000D1440  80 A6 00 10 */	lwz r5, 0x10(r6)
/* 800D4504 000D1444  80 C6 00 18 */	lwz r6, 0x18(r6)
/* 800D4508 000D1448  4B FF E1 ED */	bl ARStartDMA
.L_800D450C:
/* 800D450C 000D144C  80 6D 8D 78 */	lwz r3, __ARQRequestQueueHi@sda21(r13)
/* 800D4510 000D1450  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 800D4514 000D1454  90 0D 8D 90 */	stw r0, __ARQCallbackHi@sda21(r13)
/* 800D4518 000D1458  90 6D 8D 88 */	stw r3, __ARQRequestPendingHi@sda21(r13)
/* 800D451C 000D145C  80 03 00 00 */	lwz r0, 0(r3)
/* 800D4520 000D1460  90 0D 8D 78 */	stw r0, __ARQRequestQueueHi@sda21(r13)
.L_800D4524:
/* 800D4524 000D1464  80 0D 8D 88 */	lwz r0, __ARQRequestPendingHi@sda21(r13)
/* 800D4528 000D1468  28 00 00 00 */	cmplwi r0, 0
/* 800D452C 000D146C  40 82 00 08 */	bne .L_800D4534
/* 800D4530 000D1470  4B FF FC 8D */	bl __ARQServiceQueueLo
.L_800D4534:
/* 800D4534 000D1474  7F E3 FB 78 */	mr r3, r31
/* 800D4538 000D1478  48 01 A7 29 */	bl OSRestoreInterrupts
/* 800D453C 000D147C  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800D4540 000D1480  83 E1 00 34 */	lwz r31, 0x34(r1)
/* 800D4544 000D1484  83 C1 00 30 */	lwz r30, 0x30(r1)
/* 800D4548 000D1488  83 A1 00 2C */	lwz r29, 0x2c(r1)
/* 800D454C 000D148C  38 21 00 38 */	addi r1, r1, 0x38
/* 800D4550 000D1490  7C 08 03 A6 */	mtlr r0
/* 800D4554 000D1494  4E 80 00 20 */	blr 
.endfn ARQPostRequest