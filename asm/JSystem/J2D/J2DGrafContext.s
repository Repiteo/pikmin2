.include "macros.inc"
.section .data, "wa"  # 0x8049E220 - 0x804EFC20
.balign 0x8
.global __vt__14J2DGrafContext
__vt__14J2DGrafContext:
	.4byte 0
	.4byte 0
	.4byte __dt__14J2DGrafContextFv
	.4byte "place__14J2DGrafContextFRCQ29JGeometry8TBox2<f>"
	.4byte place__14J2DGrafContextFffff
	.4byte setPort__14J2DGrafContextFv
	.4byte setup2D__14J2DGrafContextFv
	.4byte setScissor__14J2DGrafContextFv
	.4byte getGrafType__14J2DGrafContextCFv
	.4byte setLookat__14J2DGrafContextFv

.section .text, "ax"  # 0x800056C0 - 0x80472F00
.global __ct__14J2DGrafContextFffff
__ct__14J2DGrafContextFffff:
/* 80036074 00032FB4  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80036078 00032FB8  7C 08 02 A6 */	mflr r0
/* 8003607C 00032FBC  3C 80 80 4A */	lis r4, __vt__14J2DGrafContext@ha
/* 80036080 00032FC0  EC 01 18 2A */	fadds f0, f1, f3
/* 80036084 00032FC4  90 01 00 34 */	stw r0, 0x34(r1)
/* 80036088 00032FC8  38 00 FF FF */	li r0, -1
/* 8003608C 00032FCC  38 84 06 50 */	addi r4, r4, __vt__14J2DGrafContext@l
/* 80036090 00032FD0  EC 62 20 2A */	fadds f3, f2, f4
/* 80036094 00032FD4  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80036098 00032FD8  7C 7F 1B 78 */	mr r31, r3
/* 8003609C 00032FDC  38 A1 00 10 */	addi r5, r1, 0x10
/* 800360A0 00032FE0  90 83 00 00 */	stw r4, 0(r3)
/* 800360A4 00032FE4  38 81 00 0C */	addi r4, r1, 0xc
/* 800360A8 00032FE8  38 C1 00 14 */	addi r6, r1, 0x14
/* 800360AC 00032FEC  38 E1 00 18 */	addi r7, r1, 0x18
/* 800360B0 00032FF0  D0 23 00 04 */	stfs f1, 4(r3)
/* 800360B4 00032FF4  D0 43 00 08 */	stfs f2, 8(r3)
/* 800360B8 00032FF8  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800360BC 00032FFC  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 800360C0 00033000  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 800360C4 00033004  D0 43 00 18 */	stfs f2, 0x18(r3)
/* 800360C8 00033008  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 800360CC 0003300C  D0 63 00 20 */	stfs f3, 0x20(r3)
/* 800360D0 00033010  90 03 00 24 */	stw r0, 0x24(r3)
/* 800360D4 00033014  90 03 00 28 */	stw r0, 0x28(r3)
/* 800360D8 00033018  90 03 00 2C */	stw r0, 0x2c(r3)
/* 800360DC 0003301C  90 03 00 30 */	stw r0, 0x30(r3)
/* 800360E0 00033020  90 01 00 1C */	stw r0, 0x1c(r1)
/* 800360E4 00033024  90 01 00 08 */	stw r0, 8(r1)
/* 800360E8 00033028  90 01 00 18 */	stw r0, 0x18(r1)
/* 800360EC 0003302C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800360F0 00033030  90 01 00 10 */	stw r0, 0x10(r1)
/* 800360F4 00033034  90 01 00 0C */	stw r0, 0xc(r1)
/* 800360F8 00033038  48 00 05 95 */	bl setColor__14J2DGrafContextFQ28JUtility6TColorQ28JUtility6TColorQ28JUtility6TColorQ28JUtility6TColor
/* 800360FC 0003303C  7F E3 FB 78 */	mr r3, r31
/* 80036100 00033040  38 80 00 06 */	li r4, 6
/* 80036104 00033044  48 00 06 A5 */	bl setLineWidth__14J2DGrafContextFUc
/* 80036108 00033048  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8003610C 0003304C  7F E3 FB 78 */	mr r3, r31
/* 80036110 00033050  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80036114 00033054  7C 08 03 A6 */	mtlr r0
/* 80036118 00033058  38 21 00 30 */	addi r1, r1, 0x30
/* 8003611C 0003305C  4E 80 00 20 */	blr 

.global setPort__14J2DGrafContextFv
setPort__14J2DGrafContextFv:
/* 80036120 00033060  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80036124 00033064  7C 08 02 A6 */	mflr r0
/* 80036128 00033068  90 01 00 14 */	stw r0, 0x14(r1)
/* 8003612C 0003306C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80036130 00033070  7C 7F 1B 78 */	mr r31, r3
/* 80036134 00033074  81 83 00 00 */	lwz r12, 0(r3)
/* 80036138 00033078  81 8C 00 1C */	lwz r12, 0x1c(r12)
/* 8003613C 0003307C  7D 89 03 A6 */	mtctr r12
/* 80036140 00033080  4E 80 04 21 */	bctrl 
/* 80036144 00033084  7F E3 FB 78 */	mr r3, r31
/* 80036148 00033088  81 9F 00 00 */	lwz r12, 0(r31)
/* 8003614C 0003308C  81 8C 00 18 */	lwz r12, 0x18(r12)
/* 80036150 00033090  7D 89 03 A6 */	mtctr r12
/* 80036154 00033094  4E 80 04 21 */	bctrl 
/* 80036158 00033098  C0 3F 00 04 */	lfs f1, 4(r31)
/* 8003615C 0003309C  C0 02 84 48 */	lfs f0, lbl_805167A8@sda21(r2)
/* 80036160 000330A0  C0 5F 00 08 */	lfs f2, 8(r31)
/* 80036164 000330A4  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80036168 000330A8  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 8003616C 000330AC  C0 9F 00 10 */	lfs f4, 0x10(r31)
/* 80036170 000330B0  40 80 00 08 */	bge lbl_80036178
/* 80036174 000330B4  FC 20 00 90 */	fmr f1, f0
lbl_80036178:
/* 80036178 000330B8  C0 02 84 48 */	lfs f0, lbl_805167A8@sda21(r2)
/* 8003617C 000330BC  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 80036180 000330C0  40 80 00 08 */	bge lbl_80036188
/* 80036184 000330C4  FC 40 00 90 */	fmr f2, f0
lbl_80036188:
/* 80036188 000330C8  EC 63 08 28 */	fsubs f3, f3, f1
/* 8003618C 000330CC  C0 A2 84 48 */	lfs f5, lbl_805167A8@sda21(r2)
/* 80036190 000330D0  EC 84 10 28 */	fsubs f4, f4, f2
/* 80036194 000330D4  C0 C2 84 4C */	lfs f6, lbl_805167AC@sda21(r2)
/* 80036198 000330D8  48 0B 35 F9 */	bl GXSetViewport
/* 8003619C 000330DC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800361A0 000330E0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800361A4 000330E4  7C 08 03 A6 */	mtlr r0
/* 800361A8 000330E8  38 21 00 10 */	addi r1, r1, 0x10
/* 800361AC 000330EC  4E 80 00 20 */	blr 

.global setup2D__14J2DGrafContextFv
setup2D__14J2DGrafContextFv:
/* 800361B0 000330F0  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800361B4 000330F4  7C 08 02 A6 */	mflr r0
/* 800361B8 000330F8  90 01 00 44 */	stw r0, 0x44(r1)
/* 800361BC 000330FC  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 800361C0 00033100  93 C1 00 38 */	stw r30, 0x38(r1)
/* 800361C4 00033104  7C 7E 1B 78 */	mr r30, r3
/* 800361C8 00033108  38 60 00 00 */	li r3, 0
/* 800361CC 0003310C  48 0B 21 89 */	bl GXSetNumIndStages
/* 800361D0 00033110  3B E0 00 00 */	li r31, 0
lbl_800361D4:
/* 800361D4 00033114  7F E3 FB 78 */	mr r3, r31
/* 800361D8 00033118  48 0B 21 A1 */	bl GXSetTevDirect
/* 800361DC 0003311C  3B FF 00 01 */	addi r31, r31, 1
/* 800361E0 00033120  2C 1F 00 10 */	cmpwi r31, 0x10
/* 800361E4 00033124  41 80 FF F0 */	blt lbl_800361D4
/* 800361E8 00033128  38 60 00 00 */	li r3, 0
/* 800361EC 0003312C  48 0B 2F CD */	bl GXSetZCompLoc
/* 800361F0 00033130  38 60 00 04 */	li r3, 4
/* 800361F4 00033134  38 80 00 00 */	li r4, 0
/* 800361F8 00033138  38 A0 00 01 */	li r5, 1
/* 800361FC 0003313C  38 C0 00 04 */	li r6, 4
/* 80036200 00033140  38 E0 00 00 */	li r7, 0
/* 80036204 00033144  48 0B 27 49 */	bl GXSetAlphaCompare
/* 80036208 00033148  38 60 00 00 */	li r3, 0
/* 8003620C 0003314C  38 80 00 03 */	li r4, 3
/* 80036210 00033150  38 A0 00 00 */	li r5, 0
/* 80036214 00033154  48 0B 2F 71 */	bl GXSetZMode
/* 80036218 00033158  38 60 00 00 */	li r3, 0
/* 8003621C 0003315C  38 80 00 04 */	li r4, 4
/* 80036220 00033160  48 0B 22 5D */	bl GXSetTevOp
/* 80036224 00033164  38 60 00 01 */	li r3, 1
/* 80036228 00033168  48 0B 0C 3D */	bl GXSetNumChans
/* 8003622C 0003316C  38 60 00 01 */	li r3, 1
/* 80036230 00033170  48 0B 29 89 */	bl GXSetNumTevStages
/* 80036234 00033174  38 60 00 00 */	li r3, 0
/* 80036238 00033178  48 0A ED 65 */	bl GXSetNumTexGens
/* 8003623C 0003317C  38 60 00 00 */	li r3, 0
/* 80036240 00033180  38 80 00 FF */	li r4, 0xff
/* 80036244 00033184  38 A0 00 FF */	li r5, 0xff
/* 80036248 00033188  38 C0 00 04 */	li r6, 4
/* 8003624C 0003318C  48 0B 27 D1 */	bl GXSetTevOrder
/* 80036250 00033190  38 60 00 00 */	li r3, 0
/* 80036254 00033194  48 0A F9 55 */	bl GXSetCullMode
/* 80036258 00033198  38 7E 00 80 */	addi r3, r30, 0x80
/* 8003625C 0003319C  38 80 00 00 */	li r4, 0
/* 80036260 000331A0  48 0B 33 19 */	bl GXLoadPosMtxImm
/* 80036264 000331A4  38 61 00 08 */	addi r3, r1, 8
/* 80036268 000331A8  48 0B 40 39 */	bl PSMTXIdentity
/* 8003626C 000331AC  38 61 00 08 */	addi r3, r1, 8
/* 80036270 000331B0  38 80 00 3C */	li r4, 0x3c
/* 80036274 000331B4  38 A0 00 00 */	li r5, 0
/* 80036278 000331B8  48 0B 33 D5 */	bl GXLoadTexMtxImm
/* 8003627C 000331BC  38 60 00 04 */	li r3, 4
/* 80036280 000331C0  38 80 00 00 */	li r4, 0
/* 80036284 000331C4  38 A0 00 00 */	li r5, 0
/* 80036288 000331C8  38 C0 00 01 */	li r6, 1
/* 8003628C 000331CC  38 E0 00 00 */	li r7, 0
/* 80036290 000331D0  39 00 00 00 */	li r8, 0
/* 80036294 000331D4  39 20 00 02 */	li r9, 2
/* 80036298 000331D8  48 0B 0C 09 */	bl GXSetChanCtrl
/* 8003629C 000331DC  38 60 00 05 */	li r3, 5
/* 800362A0 000331E0  38 80 00 00 */	li r4, 0
/* 800362A4 000331E4  38 A0 00 00 */	li r5, 0
/* 800362A8 000331E8  38 C0 00 00 */	li r6, 0
/* 800362AC 000331EC  38 E0 00 00 */	li r7, 0
/* 800362B0 000331F0  39 00 00 00 */	li r8, 0
/* 800362B4 000331F4  39 20 00 02 */	li r9, 2
/* 800362B8 000331F8  48 0B 0B E9 */	bl GXSetChanCtrl
/* 800362BC 000331FC  38 60 00 00 */	li r3, 0
/* 800362C0 00033200  48 0B 33 59 */	bl GXSetCurrentMtx
/* 800362C4 00033204  38 60 00 00 */	li r3, 0
/* 800362C8 00033208  38 80 00 01 */	li r4, 1
/* 800362CC 0003320C  38 A0 00 04 */	li r5, 4
/* 800362D0 00033210  38 C0 00 3C */	li r6, 0x3c
/* 800362D4 00033214  38 E0 00 00 */	li r7, 0
/* 800362D8 00033218  39 00 00 7D */	li r8, 0x7d
/* 800362DC 0003321C  48 0A EA 41 */	bl GXSetTexCoordGen2
/* 800362E0 00033220  38 60 00 00 */	li r3, 0
/* 800362E4 00033224  38 80 00 09 */	li r4, 9
/* 800362E8 00033228  38 A0 00 01 */	li r5, 1
/* 800362EC 0003322C  38 C0 00 03 */	li r6, 3
/* 800362F0 00033230  38 E0 00 00 */	li r7, 0
/* 800362F4 00033234  48 0A E4 15 */	bl GXSetVtxAttrFmt
/* 800362F8 00033238  38 60 00 00 */	li r3, 0
/* 800362FC 0003323C  38 80 00 0B */	li r4, 0xb
/* 80036300 00033240  38 A0 00 01 */	li r5, 1
/* 80036304 00033244  38 C0 00 05 */	li r6, 5
/* 80036308 00033248  38 E0 00 00 */	li r7, 0
/* 8003630C 0003324C  48 0A E3 FD */	bl GXSetVtxAttrFmt
/* 80036310 00033250  38 60 00 00 */	li r3, 0
/* 80036314 00033254  38 80 00 0D */	li r4, 0xd
/* 80036318 00033258  38 A0 00 01 */	li r5, 1
/* 8003631C 0003325C  38 C0 00 02 */	li r6, 2
/* 80036320 00033260  38 E0 00 0F */	li r7, 0xf
/* 80036324 00033264  48 0A E3 E5 */	bl GXSetVtxAttrFmt
/* 80036328 00033268  38 60 00 00 */	li r3, 0
/* 8003632C 0003326C  38 80 00 0E */	li r4, 0xe
/* 80036330 00033270  38 A0 00 01 */	li r5, 1
/* 80036334 00033274  38 C0 00 02 */	li r6, 2
/* 80036338 00033278  38 E0 00 0F */	li r7, 0xf
/* 8003633C 0003327C  48 0A E3 CD */	bl GXSetVtxAttrFmt
/* 80036340 00033280  88 7E 00 34 */	lbz r3, 0x34(r30)
/* 80036344 00033284  38 80 00 00 */	li r4, 0
/* 80036348 00033288  48 0A F7 99 */	bl GXSetLineWidth
/* 8003634C 0003328C  48 0A E3 85 */	bl GXClearVtxDesc
/* 80036350 00033290  38 60 00 09 */	li r3, 9
/* 80036354 00033294  38 80 00 01 */	li r4, 1
/* 80036358 00033298  48 0A DF 2D */	bl GXSetVtxDesc
/* 8003635C 0003329C  38 60 00 0B */	li r3, 0xb
/* 80036360 000332A0  38 80 00 01 */	li r4, 1
/* 80036364 000332A4  48 0A DF 21 */	bl GXSetVtxDesc
/* 80036368 000332A8  38 60 00 0D */	li r3, 0xd
/* 8003636C 000332AC  38 80 00 00 */	li r4, 0
/* 80036370 000332B0  48 0A DF 15 */	bl GXSetVtxDesc
/* 80036374 000332B4  80 01 00 44 */	lwz r0, 0x44(r1)
/* 80036378 000332B8  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 8003637C 000332BC  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 80036380 000332C0  7C 08 03 A6 */	mtlr r0
/* 80036384 000332C4  38 21 00 40 */	addi r1, r1, 0x40
/* 80036388 000332C8  4E 80 00 20 */	blr 

.global setScissor__14J2DGrafContextFv
setScissor__14J2DGrafContextFv:
/* 8003638C 000332CC  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 80036390 000332D0  7C 08 02 A6 */	mflr r0
/* 80036394 000332D4  90 01 00 74 */	stw r0, 0x74(r1)
/* 80036398 000332D8  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 8003639C 000332DC  F3 E1 00 68 */	psq_st f31, 104(r1), 0, qr0
/* 800363A0 000332E0  DB C1 00 50 */	stfd f30, 0x50(r1)
/* 800363A4 000332E4  F3 C1 00 58 */	psq_st f30, 88(r1), 0, qr0
/* 800363A8 000332E8  DB A1 00 40 */	stfd f29, 0x40(r1)
/* 800363AC 000332EC  F3 A1 00 48 */	psq_st f29, 72(r1), 0, qr0
/* 800363B0 000332F0  DB 81 00 30 */	stfd f28, 0x30(r1)
/* 800363B4 000332F4  F3 81 00 38 */	psq_st f28, 56(r1), 0, qr0
/* 800363B8 000332F8  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800363BC 000332FC  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800363C0 00033300  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800363C4 00033304  C0 23 00 14 */	lfs f1, 0x14(r3)
/* 800363C8 00033308  C0 02 84 48 */	lfs f0, lbl_805167A8@sda21(r2)
/* 800363CC 0003330C  C3 A3 00 18 */	lfs f29, 0x18(r3)
/* 800363D0 00033310  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800363D4 00033314  C3 E3 00 1C */	lfs f31, 0x1c(r3)
/* 800363D8 00033318  C3 C3 00 20 */	lfs f30, 0x20(r3)
/* 800363DC 0003331C  4C 40 13 82 */	cror 2, 0, 2
/* 800363E0 00033320  40 82 00 08 */	bne lbl_800363E8
/* 800363E4 00033324  D0 03 00 14 */	stfs f0, 0x14(r3)
lbl_800363E8:
/* 800363E8 00033328  C0 43 00 18 */	lfs f2, 0x18(r3)
/* 800363EC 0003332C  C0 02 84 48 */	lfs f0, lbl_805167A8@sda21(r2)
/* 800363F0 00033330  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 800363F4 00033334  4C 40 13 82 */	cror 2, 0, 2
/* 800363F8 00033338  40 82 00 08 */	bne lbl_80036400
/* 800363FC 0003333C  D0 03 00 18 */	stfs f0, 0x18(r3)
lbl_80036400:
/* 80036400 00033340  C0 43 00 1C */	lfs f2, 0x1c(r3)
/* 80036404 00033344  C0 02 84 50 */	lfs f0, lbl_805167B0@sda21(r2)
/* 80036408 00033348  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 8003640C 0003334C  4C 41 13 82 */	cror 2, 1, 2
/* 80036410 00033350  40 82 00 08 */	bne lbl_80036418
/* 80036414 00033354  D0 03 00 1C */	stfs f0, 0x1c(r3)
lbl_80036418:
/* 80036418 00033358  C0 43 00 20 */	lfs f2, 0x20(r3)
/* 8003641C 0003335C  C0 02 84 50 */	lfs f0, lbl_805167B0@sda21(r2)
/* 80036420 00033360  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 80036424 00033364  4C 41 13 82 */	cror 2, 1, 2
/* 80036428 00033368  40 82 00 08 */	bne lbl_80036430
/* 8003642C 0003336C  D0 03 00 20 */	stfs f0, 0x20(r3)
lbl_80036430:
/* 80036430 00033370  FC 1F 08 40 */	fcmpo cr0, f31, f1
/* 80036434 00033374  38 00 00 00 */	li r0, 0
/* 80036438 00033378  4C 41 13 82 */	cror 2, 1, 2
/* 8003643C 0003337C  40 82 00 14 */	bne lbl_80036450
/* 80036440 00033380  FC 1E E8 40 */	fcmpo cr0, f30, f29
/* 80036444 00033384  4C 41 13 82 */	cror 2, 1, 2
/* 80036448 00033388  40 82 00 08 */	bne lbl_80036450
/* 8003644C 0003338C  38 00 00 01 */	li r0, 1
lbl_80036450:
/* 80036450 00033390  54 00 06 3F */	clrlwi. r0, r0, 0x18
/* 80036454 00033394  40 82 00 84 */	bne lbl_800364D8
/* 80036458 00033398  FC 01 08 40 */	fcmpo cr0, f1, f1
/* 8003645C 0003339C  FC 00 08 90 */	fmr f0, f1
/* 80036460 000333A0  FC 40 E8 90 */	fmr f2, f29
/* 80036464 000333A4  FC 60 F8 90 */	fmr f3, f31
/* 80036468 000333A8  FC 80 F0 90 */	fmr f4, f30
/* 8003646C 000333AC  4C 41 13 82 */	cror 2, 1, 2
/* 80036470 000333B0  FC 1D E8 40 */	fcmpo cr0, f29, f29
/* 80036474 000333B4  4C 41 13 82 */	cror 2, 1, 2
/* 80036478 000333B8  FC 01 F8 40 */	fcmpo cr0, f1, f31
/* 8003647C 000333BC  4C 41 13 82 */	cror 2, 1, 2
/* 80036480 000333C0  40 82 00 08 */	bne lbl_80036488
/* 80036484 000333C4  FC 20 F8 90 */	fmr f1, f31
lbl_80036488:
/* 80036488 000333C8  FC 1D F0 40 */	fcmpo cr0, f29, f30
/* 8003648C 000333CC  4C 41 13 82 */	cror 2, 1, 2
/* 80036490 000333D0  40 82 00 08 */	bne lbl_80036498
/* 80036494 000333D4  FF A0 F0 90 */	fmr f29, f30
lbl_80036498:
/* 80036498 000333D8  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8003649C 000333DC  4C 40 13 82 */	cror 2, 0, 2
/* 800364A0 000333E0  40 82 00 08 */	bne lbl_800364A8
/* 800364A4 000333E4  FF E0 00 90 */	fmr f31, f0
lbl_800364A8:
/* 800364A8 000333E8  FC 1E 10 40 */	fcmpo cr0, f30, f2
/* 800364AC 000333EC  4C 40 13 82 */	cror 2, 0, 2
/* 800364B0 000333F0  40 82 00 08 */	bne lbl_800364B8
/* 800364B4 000333F4  FF C0 10 90 */	fmr f30, f2
lbl_800364B8:
/* 800364B8 000333F8  FC 1F 18 40 */	fcmpo cr0, f31, f3
/* 800364BC 000333FC  4C 40 13 82 */	cror 2, 0, 2
/* 800364C0 00033400  40 82 00 08 */	bne lbl_800364C8
/* 800364C4 00033404  FF E0 18 90 */	fmr f31, f3
lbl_800364C8:
/* 800364C8 00033408  FC 1E 20 40 */	fcmpo cr0, f30, f4
/* 800364CC 0003340C  4C 40 13 82 */	cror 2, 0, 2
/* 800364D0 00033410  40 82 00 08 */	bne lbl_800364D8
/* 800364D4 00033414  FF C0 20 90 */	fmr f30, f4
lbl_800364D8:
/* 800364D8 00033418  C0 02 84 48 */	lfs f0, lbl_805167A8@sda21(r2)
/* 800364DC 0003341C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800364E0 00033420  4C 40 13 82 */	cror 2, 0, 2
/* 800364E4 00033424  40 82 00 08 */	bne lbl_800364EC
/* 800364E8 00033428  FC 20 00 90 */	fmr f1, f0
lbl_800364EC:
/* 800364EC 0003342C  C0 02 84 48 */	lfs f0, lbl_805167A8@sda21(r2)
/* 800364F0 00033430  FC 1D 00 40 */	fcmpo cr0, f29, f0
/* 800364F4 00033434  4C 40 13 82 */	cror 2, 0, 2
/* 800364F8 00033438  40 82 00 08 */	bne lbl_80036500
/* 800364FC 0003343C  FF A0 00 90 */	fmr f29, f0
lbl_80036500:
/* 80036500 00033440  C0 02 84 50 */	lfs f0, lbl_805167B0@sda21(r2)
/* 80036504 00033444  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80036508 00033448  4C 41 13 82 */	cror 2, 1, 2
/* 8003650C 0003344C  40 82 00 08 */	bne lbl_80036514
/* 80036510 00033450  FF E0 00 90 */	fmr f31, f0
lbl_80036514:
/* 80036514 00033454  C0 02 84 50 */	lfs f0, lbl_805167B0@sda21(r2)
/* 80036518 00033458  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 8003651C 0003345C  4C 41 13 82 */	cror 2, 1, 2
/* 80036520 00033460  40 82 00 08 */	bne lbl_80036528
/* 80036524 00033464  FF C0 00 90 */	fmr f30, f0
lbl_80036528:
/* 80036528 00033468  FC 1F 08 40 */	fcmpo cr0, f31, f1
/* 8003652C 0003346C  38 00 00 00 */	li r0, 0
/* 80036530 00033470  4C 41 13 82 */	cror 2, 1, 2
/* 80036534 00033474  40 82 00 14 */	bne lbl_80036548
/* 80036538 00033478  FC 1E E8 40 */	fcmpo cr0, f30, f29
/* 8003653C 0003347C  4C 41 13 82 */	cror 2, 1, 2
/* 80036540 00033480  40 82 00 08 */	bne lbl_80036548
/* 80036544 00033484  38 00 00 01 */	li r0, 1
lbl_80036548:
/* 80036548 00033488  54 00 06 3F */	clrlwi. r0, r0, 0x18
/* 8003654C 0003348C  41 82 00 98 */	beq lbl_800365E4
/* 80036550 00033490  48 08 B5 FD */	bl __cvt_fp2unsigned
/* 80036554 00033494  3C 00 43 30 */	lis r0, 0x4330
/* 80036558 00033498  90 61 00 0C */	stw r3, 0xc(r1)
/* 8003655C 0003349C  C8 42 84 58 */	lfd f2, lbl_805167B8@sda21(r2)
/* 80036560 000334A0  FC 20 E8 90 */	fmr f1, f29
/* 80036564 000334A4  90 01 00 08 */	stw r0, 8(r1)
/* 80036568 000334A8  C8 01 00 08 */	lfd f0, 8(r1)
/* 8003656C 000334AC  EF A0 10 28 */	fsubs f29, f0, f2
/* 80036570 000334B0  48 08 B5 DD */	bl __cvt_fp2unsigned
/* 80036574 000334B4  3C 00 43 30 */	lis r0, 0x4330
/* 80036578 000334B8  90 61 00 14 */	stw r3, 0x14(r1)
/* 8003657C 000334BC  C8 42 84 58 */	lfd f2, lbl_805167B8@sda21(r2)
/* 80036580 000334C0  FC 20 F8 90 */	fmr f1, f31
/* 80036584 000334C4  90 01 00 10 */	stw r0, 0x10(r1)
/* 80036588 000334C8  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8003658C 000334CC  EF E0 10 28 */	fsubs f31, f0, f2
/* 80036590 000334D0  48 09 8B B9 */	bl ceil
/* 80036594 000334D4  FF 80 08 18 */	frsp f28, f1
/* 80036598 000334D8  FC 20 F0 90 */	fmr f1, f30
/* 8003659C 000334DC  48 09 8B AD */	bl ceil
/* 800365A0 000334E0  FC 00 08 18 */	frsp f0, f1
/* 800365A4 000334E4  EC 20 F8 28 */	fsubs f1, f0, f31
/* 800365A8 000334E8  48 08 B5 A5 */	bl __cvt_fp2unsigned
/* 800365AC 000334EC  EC 3C E8 28 */	fsubs f1, f28, f29
/* 800365B0 000334F0  7C 7D 1B 78 */	mr r29, r3
/* 800365B4 000334F4  48 08 B5 99 */	bl __cvt_fp2unsigned
/* 800365B8 000334F8  FC 20 F8 90 */	fmr f1, f31
/* 800365BC 000334FC  7C 7E 1B 78 */	mr r30, r3
/* 800365C0 00033500  48 08 B5 8D */	bl __cvt_fp2unsigned
/* 800365C4 00033504  FC 20 E8 90 */	fmr f1, f29
/* 800365C8 00033508  7C 7F 1B 78 */	mr r31, r3
/* 800365CC 0003350C  48 08 B5 81 */	bl __cvt_fp2unsigned
/* 800365D0 00033510  7F E4 FB 78 */	mr r4, r31
/* 800365D4 00033514  7F C5 F3 78 */	mr r5, r30
/* 800365D8 00033518  7F A6 EB 78 */	mr r6, r29
/* 800365DC 0003351C  48 0B 31 FD */	bl GXSetScissor
/* 800365E0 00033520  48 00 00 18 */	b lbl_800365F8
lbl_800365E4:
/* 800365E4 00033524  38 60 00 00 */	li r3, 0
/* 800365E8 00033528  38 80 00 00 */	li r4, 0
/* 800365EC 0003352C  38 A0 00 00 */	li r5, 0
/* 800365F0 00033530  38 C0 00 00 */	li r6, 0
/* 800365F4 00033534  48 0B 31 E5 */	bl GXSetScissor
lbl_800365F8:
/* 800365F8 00033538  E3 E1 00 68 */	psq_l f31, 104(r1), 0, qr0
/* 800365FC 0003353C  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 80036600 00033540  E3 C1 00 58 */	psq_l f30, 88(r1), 0, qr0
/* 80036604 00033544  CB C1 00 50 */	lfd f30, 0x50(r1)
/* 80036608 00033548  E3 A1 00 48 */	psq_l f29, 72(r1), 0, qr0
/* 8003660C 0003354C  CB A1 00 40 */	lfd f29, 0x40(r1)
/* 80036610 00033550  E3 81 00 38 */	psq_l f28, 56(r1), 0, qr0
/* 80036614 00033554  CB 81 00 30 */	lfd f28, 0x30(r1)
/* 80036618 00033558  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8003661C 0003355C  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80036620 00033560  80 01 00 74 */	lwz r0, 0x74(r1)
/* 80036624 00033564  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80036628 00033568  7C 08 03 A6 */	mtlr r0
/* 8003662C 0003356C  38 21 00 70 */	addi r1, r1, 0x70
/* 80036630 00033570  4E 80 00 20 */	blr 

.global "scissor__14J2DGrafContextFRCQ29JGeometry8TBox2<f>"
"scissor__14J2DGrafContextFRCQ29JGeometry8TBox2<f>":
/* 80036634 00033574  80 A4 00 00 */	lwz r5, 0(r4)
/* 80036638 00033578  80 04 00 04 */	lwz r0, 4(r4)
/* 8003663C 0003357C  90 A3 00 14 */	stw r5, 0x14(r3)
/* 80036640 00033580  80 A4 00 08 */	lwz r5, 8(r4)
/* 80036644 00033584  90 03 00 18 */	stw r0, 0x18(r3)
/* 80036648 00033588  80 04 00 0C */	lwz r0, 0xc(r4)
/* 8003664C 0003358C  90 A3 00 1C */	stw r5, 0x1c(r3)
/* 80036650 00033590  90 03 00 20 */	stw r0, 0x20(r3)
/* 80036654 00033594  4E 80 00 20 */	blr 

.global "place__14J2DGrafContextFRCQ29JGeometry8TBox2<f>"
"place__14J2DGrafContextFRCQ29JGeometry8TBox2<f>":
/* 80036658 00033598  80 E4 00 00 */	lwz r7, 0(r4)
/* 8003665C 0003359C  80 C4 00 04 */	lwz r6, 4(r4)
/* 80036660 000335A0  90 E3 00 04 */	stw r7, 4(r3)
/* 80036664 000335A4  80 A4 00 08 */	lwz r5, 8(r4)
/* 80036668 000335A8  90 C3 00 08 */	stw r6, 8(r3)
/* 8003666C 000335AC  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80036670 000335B0  90 A3 00 0C */	stw r5, 0xc(r3)
/* 80036674 000335B4  90 03 00 10 */	stw r0, 0x10(r3)
/* 80036678 000335B8  90 E3 00 14 */	stw r7, 0x14(r3)
/* 8003667C 000335BC  90 C3 00 18 */	stw r6, 0x18(r3)
/* 80036680 000335C0  90 A3 00 1C */	stw r5, 0x1c(r3)
/* 80036684 000335C4  90 03 00 20 */	stw r0, 0x20(r3)
/* 80036688 000335C8  4E 80 00 20 */	blr 

.global setColor__14J2DGrafContextFQ28JUtility6TColorQ28JUtility6TColorQ28JUtility6TColorQ28JUtility6TColor
setColor__14J2DGrafContextFQ28JUtility6TColorQ28JUtility6TColorQ28JUtility6TColorQ28JUtility6TColor:
/* 8003668C 000335CC  88 04 00 00 */	lbz r0, 0(r4)
/* 80036690 000335D0  39 20 00 01 */	li r9, 1
/* 80036694 000335D4  89 64 00 01 */	lbz r11, 1(r4)
/* 80036698 000335D8  39 00 00 04 */	li r8, 4
/* 8003669C 000335DC  98 03 00 24 */	stb r0, 0x24(r3)
/* 800366A0 000335E0  38 00 00 05 */	li r0, 5
/* 800366A4 000335E4  89 44 00 02 */	lbz r10, 2(r4)
/* 800366A8 000335E8  99 63 00 25 */	stb r11, 0x25(r3)
/* 800366AC 000335EC  88 84 00 03 */	lbz r4, 3(r4)
/* 800366B0 000335F0  99 43 00 26 */	stb r10, 0x26(r3)
/* 800366B4 000335F4  89 45 00 00 */	lbz r10, 0(r5)
/* 800366B8 000335F8  98 83 00 27 */	stb r4, 0x27(r3)
/* 800366BC 000335FC  88 85 00 01 */	lbz r4, 1(r5)
/* 800366C0 00033600  99 43 00 28 */	stb r10, 0x28(r3)
/* 800366C4 00033604  89 45 00 02 */	lbz r10, 2(r5)
/* 800366C8 00033608  98 83 00 29 */	stb r4, 0x29(r3)
/* 800366CC 0003360C  88 85 00 03 */	lbz r4, 3(r5)
/* 800366D0 00033610  99 43 00 2A */	stb r10, 0x2a(r3)
/* 800366D4 00033614  88 A6 00 00 */	lbz r5, 0(r6)
/* 800366D8 00033618  98 83 00 2B */	stb r4, 0x2b(r3)
/* 800366DC 0003361C  88 86 00 01 */	lbz r4, 1(r6)
/* 800366E0 00033620  98 A3 00 2C */	stb r5, 0x2c(r3)
/* 800366E4 00033624  88 A6 00 02 */	lbz r5, 2(r6)
/* 800366E8 00033628  98 83 00 2D */	stb r4, 0x2d(r3)
/* 800366EC 0003362C  88 86 00 03 */	lbz r4, 3(r6)
/* 800366F0 00033630  98 A3 00 2E */	stb r5, 0x2e(r3)
/* 800366F4 00033634  88 A7 00 00 */	lbz r5, 0(r7)
/* 800366F8 00033638  98 83 00 2F */	stb r4, 0x2f(r3)
/* 800366FC 0003363C  88 87 00 01 */	lbz r4, 1(r7)
/* 80036700 00033640  98 A3 00 30 */	stb r5, 0x30(r3)
/* 80036704 00033644  88 A7 00 02 */	lbz r5, 2(r7)
/* 80036708 00033648  98 83 00 31 */	stb r4, 0x31(r3)
/* 8003670C 0003364C  88 87 00 03 */	lbz r4, 3(r7)
/* 80036710 00033650  98 A3 00 32 */	stb r5, 0x32(r3)
/* 80036714 00033654  98 83 00 33 */	stb r4, 0x33(r3)
/* 80036718 00033658  99 23 00 B0 */	stb r9, 0xb0(r3)
/* 8003671C 0003365C  99 03 00 B1 */	stb r8, 0xb1(r3)
/* 80036720 00033660  98 03 00 B2 */	stb r0, 0xb2(r3)
/* 80036724 00033664  99 23 00 B3 */	stb r9, 0xb3(r3)
/* 80036728 00033668  99 03 00 B4 */	stb r8, 0xb4(r3)
/* 8003672C 0003366C  98 03 00 B5 */	stb r0, 0xb5(r3)
/* 80036730 00033670  99 23 00 B6 */	stb r9, 0xb6(r3)
/* 80036734 00033674  99 03 00 B7 */	stb r8, 0xb7(r3)
/* 80036738 00033678  98 03 00 B8 */	stb r0, 0xb8(r3)
/* 8003673C 0003367C  80 03 00 24 */	lwz r0, 0x24(r3)
/* 80036740 00033680  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 80036744 00033684  28 00 00 FF */	cmplwi r0, 0xff
/* 80036748 00033688  4C 82 00 20 */	bnelr 
/* 8003674C 0003368C  38 80 00 00 */	li r4, 0
/* 80036750 00033690  98 83 00 B0 */	stb r4, 0xb0(r3)
/* 80036754 00033694  99 23 00 B1 */	stb r9, 0xb1(r3)
/* 80036758 00033698  98 83 00 B2 */	stb r4, 0xb2(r3)
/* 8003675C 0003369C  80 03 00 2C */	lwz r0, 0x2c(r3)
/* 80036760 000336A0  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 80036764 000336A4  28 00 00 FF */	cmplwi r0, 0xff
/* 80036768 000336A8  4C 82 00 20 */	bnelr 
/* 8003676C 000336AC  98 83 00 B3 */	stb r4, 0xb3(r3)
/* 80036770 000336B0  99 23 00 B4 */	stb r9, 0xb4(r3)
/* 80036774 000336B4  98 83 00 B5 */	stb r4, 0xb5(r3)
/* 80036778 000336B8  80 03 00 28 */	lwz r0, 0x28(r3)
/* 8003677C 000336BC  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 80036780 000336C0  28 00 00 FF */	cmplwi r0, 0xff
/* 80036784 000336C4  4C 82 00 20 */	bnelr 
/* 80036788 000336C8  80 03 00 30 */	lwz r0, 0x30(r3)
/* 8003678C 000336CC  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 80036790 000336D0  28 00 00 FF */	cmplwi r0, 0xff
/* 80036794 000336D4  4C 82 00 20 */	bnelr 
/* 80036798 000336D8  98 83 00 B6 */	stb r4, 0xb6(r3)
/* 8003679C 000336DC  99 23 00 B7 */	stb r9, 0xb7(r3)
/* 800367A0 000336E0  98 83 00 B8 */	stb r4, 0xb8(r3)
/* 800367A4 000336E4  4E 80 00 20 */	blr 

.global setLineWidth__14J2DGrafContextFUc
setLineWidth__14J2DGrafContextFUc:
/* 800367A8 000336E8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800367AC 000336EC  7C 08 02 A6 */	mflr r0
/* 800367B0 000336F0  90 01 00 14 */	stw r0, 0x14(r1)
/* 800367B4 000336F4  98 83 00 34 */	stb r4, 0x34(r3)
/* 800367B8 000336F8  38 80 00 00 */	li r4, 0
/* 800367BC 000336FC  88 63 00 34 */	lbz r3, 0x34(r3)
/* 800367C0 00033700  48 0A F3 21 */	bl GXSetLineWidth
/* 800367C4 00033704  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800367C8 00033708  7C 08 03 A6 */	mtlr r0
/* 800367CC 0003370C  38 21 00 10 */	addi r1, r1, 0x10
/* 800367D0 00033710  4E 80 00 20 */	blr 

.global "fillBox__14J2DGrafContextFRCQ29JGeometry8TBox2<f>"
"fillBox__14J2DGrafContextFRCQ29JGeometry8TBox2<f>":
/* 800367D4 00033714  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800367D8 00033718  7C 08 02 A6 */	mflr r0
/* 800367DC 0003371C  38 C0 00 0F */	li r6, 0xf
/* 800367E0 00033720  90 01 00 14 */	stw r0, 0x14(r1)
/* 800367E4 00033724  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800367E8 00033728  7C 9F 23 78 */	mr r31, r4
/* 800367EC 0003372C  93 C1 00 08 */	stw r30, 8(r1)
/* 800367F0 00033730  7C 7E 1B 78 */	mr r30, r3
/* 800367F4 00033734  88 63 00 B6 */	lbz r3, 0xb6(r3)
/* 800367F8 00033738  88 9E 00 B7 */	lbz r4, 0xb7(r30)
/* 800367FC 0003373C  88 BE 00 B8 */	lbz r5, 0xb8(r30)
/* 80036800 00033740  48 0B 28 D9 */	bl GXSetBlendMode
/* 80036804 00033744  38 7E 00 80 */	addi r3, r30, 0x80
/* 80036808 00033748  38 80 00 00 */	li r4, 0
/* 8003680C 0003374C  48 0B 2D 6D */	bl GXLoadPosMtxImm
/* 80036810 00033750  38 60 00 00 */	li r3, 0
/* 80036814 00033754  38 80 00 09 */	li r4, 9
/* 80036818 00033758  38 A0 00 01 */	li r5, 1
/* 8003681C 0003375C  38 C0 00 04 */	li r6, 4
/* 80036820 00033760  38 E0 00 00 */	li r7, 0
/* 80036824 00033764  48 0A DE E5 */	bl GXSetVtxAttrFmt
/* 80036828 00033768  38 60 00 80 */	li r3, 0x80
/* 8003682C 0003376C  38 80 00 00 */	li r4, 0
/* 80036830 00033770  38 A0 00 04 */	li r5, 4
/* 80036834 00033774  48 0A F1 55 */	bl GXBegin
/* 80036838 00033778  C0 5F 00 00 */	lfs f2, 0(r31)
/* 8003683C 0003377C  3D 00 CC 01 */	lis r8, 0xCC008000@ha
/* 80036840 00033780  C0 7F 00 04 */	lfs f3, 4(r31)
/* 80036844 00033784  38 60 00 00 */	li r3, 0
/* 80036848 00033788  D0 48 80 00 */	stfs f2, 0xCC008000@l(r8)
/* 8003684C 0003378C  38 80 00 09 */	li r4, 9
/* 80036850 00033790  C0 22 84 48 */	lfs f1, lbl_805167A8@sda21(r2)
/* 80036854 00033794  38 A0 00 01 */	li r5, 1
/* 80036858 00033798  D0 68 80 00 */	stfs f3, -0x8000(r8)
/* 8003685C 0003379C  38 C0 00 03 */	li r6, 3
/* 80036860 000337A0  C0 1F 00 08 */	lfs f0, 8(r31)
/* 80036864 000337A4  38 E0 00 00 */	li r7, 0
/* 80036868 000337A8  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 8003686C 000337AC  C0 9F 00 0C */	lfs f4, 0xc(r31)
/* 80036870 000337B0  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80036874 000337B4  90 08 80 00 */	stw r0, -0x8000(r8)
/* 80036878 000337B8  D0 08 80 00 */	stfs f0, -0x8000(r8)
/* 8003687C 000337BC  D0 68 80 00 */	stfs f3, -0x8000(r8)
/* 80036880 000337C0  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 80036884 000337C4  80 1E 00 28 */	lwz r0, 0x28(r30)
/* 80036888 000337C8  90 08 80 00 */	stw r0, -0x8000(r8)
/* 8003688C 000337CC  D0 08 80 00 */	stfs f0, -0x8000(r8)
/* 80036890 000337D0  D0 88 80 00 */	stfs f4, -0x8000(r8)
/* 80036894 000337D4  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 80036898 000337D8  80 1E 00 30 */	lwz r0, 0x30(r30)
/* 8003689C 000337DC  90 08 80 00 */	stw r0, -0x8000(r8)
/* 800368A0 000337E0  D0 48 80 00 */	stfs f2, -0x8000(r8)
/* 800368A4 000337E4  D0 88 80 00 */	stfs f4, -0x8000(r8)
/* 800368A8 000337E8  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 800368AC 000337EC  80 1E 00 2C */	lwz r0, 0x2c(r30)
/* 800368B0 000337F0  90 08 80 00 */	stw r0, -0x8000(r8)
/* 800368B4 000337F4  48 0A DE 55 */	bl GXSetVtxAttrFmt
/* 800368B8 000337F8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800368BC 000337FC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800368C0 00033800  83 C1 00 08 */	lwz r30, 8(r1)
/* 800368C4 00033804  7C 08 03 A6 */	mtlr r0
/* 800368C8 00033808  38 21 00 10 */	addi r1, r1, 0x10
/* 800368CC 0003380C  4E 80 00 20 */	blr 

.global "drawFrame__14J2DGrafContextFRCQ29JGeometry8TBox2<f>"
"drawFrame__14J2DGrafContextFRCQ29JGeometry8TBox2<f>":
/* 800368D0 00033810  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800368D4 00033814  7C 08 02 A6 */	mflr r0
/* 800368D8 00033818  38 C0 00 0F */	li r6, 0xf
/* 800368DC 0003381C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800368E0 00033820  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800368E4 00033824  7C 9F 23 78 */	mr r31, r4
/* 800368E8 00033828  93 C1 00 08 */	stw r30, 8(r1)
/* 800368EC 0003382C  7C 7E 1B 78 */	mr r30, r3
/* 800368F0 00033830  88 63 00 B6 */	lbz r3, 0xb6(r3)
/* 800368F4 00033834  88 9E 00 B7 */	lbz r4, 0xb7(r30)
/* 800368F8 00033838  88 BE 00 B8 */	lbz r5, 0xb8(r30)
/* 800368FC 0003383C  48 0B 27 DD */	bl GXSetBlendMode
/* 80036900 00033840  38 7E 00 80 */	addi r3, r30, 0x80
/* 80036904 00033844  38 80 00 00 */	li r4, 0
/* 80036908 00033848  48 0B 2C 71 */	bl GXLoadPosMtxImm
/* 8003690C 0003384C  38 60 00 00 */	li r3, 0
/* 80036910 00033850  38 80 00 09 */	li r4, 9
/* 80036914 00033854  38 A0 00 01 */	li r5, 1
/* 80036918 00033858  38 C0 00 04 */	li r6, 4
/* 8003691C 0003385C  38 E0 00 00 */	li r7, 0
/* 80036920 00033860  48 0A DD E9 */	bl GXSetVtxAttrFmt
/* 80036924 00033864  38 60 00 B0 */	li r3, 0xb0
/* 80036928 00033868  38 80 00 00 */	li r4, 0
/* 8003692C 0003386C  38 A0 00 05 */	li r5, 5
/* 80036930 00033870  48 0A F0 59 */	bl GXBegin
/* 80036934 00033874  C0 5F 00 00 */	lfs f2, 0(r31)
/* 80036938 00033878  3D 00 CC 01 */	lis r8, 0xCC008000@ha
/* 8003693C 0003387C  C0 7F 00 04 */	lfs f3, 4(r31)
/* 80036940 00033880  38 60 00 00 */	li r3, 0
/* 80036944 00033884  D0 48 80 00 */	stfs f2, 0xCC008000@l(r8)
/* 80036948 00033888  38 80 00 09 */	li r4, 9
/* 8003694C 0003388C  C0 22 84 48 */	lfs f1, lbl_805167A8@sda21(r2)
/* 80036950 00033890  38 A0 00 01 */	li r5, 1
/* 80036954 00033894  D0 68 80 00 */	stfs f3, -0x8000(r8)
/* 80036958 00033898  38 C0 00 03 */	li r6, 3
/* 8003695C 0003389C  C0 1F 00 08 */	lfs f0, 8(r31)
/* 80036960 000338A0  38 E0 00 00 */	li r7, 0
/* 80036964 000338A4  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 80036968 000338A8  C0 9F 00 0C */	lfs f4, 0xc(r31)
/* 8003696C 000338AC  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80036970 000338B0  90 08 80 00 */	stw r0, -0x8000(r8)
/* 80036974 000338B4  D0 08 80 00 */	stfs f0, -0x8000(r8)
/* 80036978 000338B8  D0 68 80 00 */	stfs f3, -0x8000(r8)
/* 8003697C 000338BC  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 80036980 000338C0  80 1E 00 28 */	lwz r0, 0x28(r30)
/* 80036984 000338C4  90 08 80 00 */	stw r0, -0x8000(r8)
/* 80036988 000338C8  D0 08 80 00 */	stfs f0, -0x8000(r8)
/* 8003698C 000338CC  D0 88 80 00 */	stfs f4, -0x8000(r8)
/* 80036990 000338D0  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 80036994 000338D4  80 1E 00 30 */	lwz r0, 0x30(r30)
/* 80036998 000338D8  90 08 80 00 */	stw r0, -0x8000(r8)
/* 8003699C 000338DC  D0 48 80 00 */	stfs f2, -0x8000(r8)
/* 800369A0 000338E0  D0 88 80 00 */	stfs f4, -0x8000(r8)
/* 800369A4 000338E4  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 800369A8 000338E8  80 1E 00 2C */	lwz r0, 0x2c(r30)
/* 800369AC 000338EC  90 08 80 00 */	stw r0, -0x8000(r8)
/* 800369B0 000338F0  D0 48 80 00 */	stfs f2, -0x8000(r8)
/* 800369B4 000338F4  D0 68 80 00 */	stfs f3, -0x8000(r8)
/* 800369B8 000338F8  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 800369BC 000338FC  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 800369C0 00033900  90 08 80 00 */	stw r0, -0x8000(r8)
/* 800369C4 00033904  48 0A DD 45 */	bl GXSetVtxAttrFmt
/* 800369C8 00033908  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800369CC 0003390C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800369D0 00033910  83 C1 00 08 */	lwz r30, 8(r1)
/* 800369D4 00033914  7C 08 03 A6 */	mtlr r0
/* 800369D8 00033918  38 21 00 10 */	addi r1, r1, 0x10
/* 800369DC 0003391C  4E 80 00 20 */	blr 

.global "lineTo__14J2DGrafContextFQ29JGeometry8TVec2<f>"
"lineTo__14J2DGrafContextFQ29JGeometry8TVec2<f>":
/* 800369E0 00033920  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800369E4 00033924  7C 08 02 A6 */	mflr r0
/* 800369E8 00033928  38 C0 00 0F */	li r6, 0xf
/* 800369EC 0003392C  90 01 00 24 */	stw r0, 0x24(r1)
/* 800369F0 00033930  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800369F4 00033934  7C 9F 23 78 */	mr r31, r4
/* 800369F8 00033938  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800369FC 0003393C  7C 7E 1B 78 */	mr r30, r3
/* 80036A00 00033940  80 64 00 00 */	lwz r3, 0(r4)
/* 80036A04 00033944  80 84 00 04 */	lwz r4, 4(r4)
/* 80036A08 00033948  80 BE 00 38 */	lwz r5, 0x38(r30)
/* 80036A0C 0003394C  80 1E 00 3C */	lwz r0, 0x3c(r30)
/* 80036A10 00033950  90 61 00 08 */	stw r3, 8(r1)
/* 80036A14 00033954  88 7E 00 B3 */	lbz r3, 0xb3(r30)
/* 80036A18 00033958  90 81 00 0C */	stw r4, 0xc(r1)
/* 80036A1C 0003395C  88 9E 00 B4 */	lbz r4, 0xb4(r30)
/* 80036A20 00033960  90 A1 00 10 */	stw r5, 0x10(r1)
/* 80036A24 00033964  88 BE 00 B5 */	lbz r5, 0xb5(r30)
/* 80036A28 00033968  90 01 00 14 */	stw r0, 0x14(r1)
/* 80036A2C 0003396C  48 0B 26 AD */	bl GXSetBlendMode
/* 80036A30 00033970  38 7E 00 80 */	addi r3, r30, 0x80
/* 80036A34 00033974  38 80 00 00 */	li r4, 0
/* 80036A38 00033978  48 0B 2B 41 */	bl GXLoadPosMtxImm
/* 80036A3C 0003397C  38 60 00 00 */	li r3, 0
/* 80036A40 00033980  38 80 00 09 */	li r4, 9
/* 80036A44 00033984  38 A0 00 01 */	li r5, 1
/* 80036A48 00033988  38 C0 00 04 */	li r6, 4
/* 80036A4C 0003398C  38 E0 00 00 */	li r7, 0
/* 80036A50 00033990  48 0A DC B9 */	bl GXSetVtxAttrFmt
/* 80036A54 00033994  38 60 00 A8 */	li r3, 0xa8
/* 80036A58 00033998  38 80 00 00 */	li r4, 0
/* 80036A5C 0003399C  38 A0 00 02 */	li r5, 2
/* 80036A60 000339A0  48 0A EF 29 */	bl GXBegin
/* 80036A64 000339A4  C0 21 00 10 */	lfs f1, 0x10(r1)
/* 80036A68 000339A8  3D 00 CC 01 */	lis r8, 0xCC008000@ha
/* 80036A6C 000339AC  C0 01 00 14 */	lfs f0, 0x14(r1)
/* 80036A70 000339B0  38 60 00 00 */	li r3, 0
/* 80036A74 000339B4  D0 28 80 00 */	stfs f1, 0xCC008000@l(r8)
/* 80036A78 000339B8  38 80 00 09 */	li r4, 9
/* 80036A7C 000339BC  C0 42 84 48 */	lfs f2, lbl_805167A8@sda21(r2)
/* 80036A80 000339C0  38 A0 00 01 */	li r5, 1
/* 80036A84 000339C4  D0 08 80 00 */	stfs f0, -0x8000(r8)
/* 80036A88 000339C8  38 C0 00 03 */	li r6, 3
/* 80036A8C 000339CC  C0 21 00 08 */	lfs f1, 8(r1)
/* 80036A90 000339D0  38 E0 00 00 */	li r7, 0
/* 80036A94 000339D4  D0 48 80 00 */	stfs f2, -0x8000(r8)
/* 80036A98 000339D8  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 80036A9C 000339DC  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80036AA0 000339E0  90 08 80 00 */	stw r0, -0x8000(r8)
/* 80036AA4 000339E4  D0 28 80 00 */	stfs f1, -0x8000(r8)
/* 80036AA8 000339E8  D0 08 80 00 */	stfs f0, -0x8000(r8)
/* 80036AAC 000339EC  D0 48 80 00 */	stfs f2, -0x8000(r8)
/* 80036AB0 000339F0  80 1E 00 2C */	lwz r0, 0x2c(r30)
/* 80036AB4 000339F4  90 08 80 00 */	stw r0, -0x8000(r8)
/* 80036AB8 000339F8  48 0A DC 51 */	bl GXSetVtxAttrFmt
/* 80036ABC 000339FC  C0 3F 00 00 */	lfs f1, 0(r31)
/* 80036AC0 00033A00  C0 1F 00 04 */	lfs f0, 4(r31)
/* 80036AC4 00033A04  D0 3E 00 38 */	stfs f1, 0x38(r30)
/* 80036AC8 00033A08  D0 1E 00 3C */	stfs f0, 0x3c(r30)
/* 80036ACC 00033A0C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80036AD0 00033A10  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80036AD4 00033A14  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80036AD8 00033A18  7C 08 03 A6 */	mtlr r0
/* 80036ADC 00033A1C  38 21 00 20 */	addi r1, r1, 0x20
/* 80036AE0 00033A20  4E 80 00 20 */	blr 

.global getGrafType__14J2DGrafContextCFv
getGrafType__14J2DGrafContextCFv:
/* 80036AE4 00033A24  38 60 00 00 */	li r3, 0
/* 80036AE8 00033A28  4E 80 00 20 */	blr 

.global setLookat__14J2DGrafContextFv
setLookat__14J2DGrafContextFv:
/* 80036AEC 00033A2C  4E 80 00 20 */	blr 
