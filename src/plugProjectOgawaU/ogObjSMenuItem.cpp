#include "og/newScreen/SMenu.h"
#include "og/Screen/ogScreen.h"
#include "og/Screen/anime.h"
#include "og/Screen/callbackNodes.h"
#include "og/Sound.h"
#include "Game/gamePlayData.h"
#include "trig.h"

static void _Print(char* format, ...) { OSReport(format, __FILE__); }

namespace Game {
namespace Equip {
int EquipItemList[12] = {
	OlimarData::ODII_AmplifiedAmplifier, OlimarData::ODII_ProfessionalNoisemaker, OlimarData::ODII_StellarOrb,        // row 1
	OlimarData::ODII_JusticeAlloy,       OlimarData::ODII_ForgedCourage,          OlimarData::ODII_DreamMaterial,     // row 2
	OlimarData::ODII_RepugnantAppendage, OlimarData::ODII_BruteKnuckles,          OlimarData::ODII_PrototypeDetector, // row 3
	OlimarData::ODII_SphericalAtlas,     OlimarData::ODII_GeographicProjection,   OlimarData::ODII_FiveManNapsack,    // row 4
};
} // namespace Equip
} // namespace Game

namespace og {
namespace newScreen {
// NB: same order as EquipItemList above
u64 ItemMsgID_List[12] = {
	'6122_00', // "Mega Tweeter"
	'6119_00', // "Pluckaphone"
	'6126_00', // "Solar System"

	'6116_00', // "Metal Suit Z"
	'6117_00', // "Scorch Guard"
	'6129_00', // "Anti-Electrifier"

	'6120_00', // "Rush Boots"
	'6118_00', // "Rocket Fist"
	'6121_00', // "Treasure Gauge"

	'6127_00', // "Sphere Chart"
	'6128_00', // "Survey Chart"
	'6123_00', // "Napsack"
};

/**
 * @note Address: 0x80312EF8
 * @note Size: 0x7C
 */
ObjSMenuItem::ObjSMenuItem(char const* name)
{
	mDisp         = nullptr;
	mScreenItems  = nullptr;
	mItemAnims    = nullptr;
	mSprayAnims   = nullptr;
	mScreenSprays = nullptr;

	mBitterSprayPane    = nullptr;
	mSpicySprayPane     = nullptr;
	mBitterSpraySubPane = nullptr;
	mSpicySpraySubPane  = nullptr;
	mName               = name;
}

/**
 * @note Address: 0x80312F74
 * @note Size: 0xC4
 */
ObjSMenuItem::~ObjSMenuItem() { }

/**
 * @note Address: 0x80313038
 * @note Size: 0x924
 */
void ObjSMenuItem::doCreate(JKRArchive* arc)
{
	mDisp = static_cast<og::Screen::DispMemberSMenuItem*>(getDispMember()->getSubMember(OWNER_OGA, MEMBER_START_MENU_ITEM));
	if (!mDisp) {
		og::Screen::DispMemberSMenuAll* newdisp = new og::Screen::DispMemberSMenuAll;
		mDisp = static_cast<og::Screen::DispMemberSMenuItem*>(newdisp->getSubMember(OWNER_OGA, MEMBER_START_MENU_ITEM));
	}

	mScreenItems = new P2DScreen::Mgr_tuning;
	mScreenItems->set("s_menu_item_l.blo", 0x1040000, arc); // main item menu screen

	J2DScreen* itemIconScreen = new J2DScreen;
	itemIconScreen->set("s_menu_powerup_icon.blo", 0x1040000, arc);

	// set up all Exploration Kit icons
	for (int i = 0; i < 12; i++) {
		u64 itemPaneTag = 'Nitem00' + (i % 10) + (i / 10) % 10 * 256;  // each item's individual pane
		u64 itemIconTag = 'Picon00' + (i % 10) + (i / 10) % 10 * 256;  // each item's actual icon
		u64 itemBgTag   = 'Pitemb00' + (i % 10) + (i / 10) % 10 * 256; // each item's background picture

		J2DPane* itemPane = og::Screen::TagSearch(mScreenItems, itemPaneTag);
		J2DPane* iconPane = og::Screen::TagSearch(itemIconScreen, itemIconTag);
		J2DPane* bgPane   = og::Screen::TagSearch(mScreenItems, itemBgTag);

		// attach icon to pane + center on background pane
		iconPane->setBasePosition((J2DBasePosition)bgPane->mBasePosition);
		itemPane->appendChild(iconPane);
		JGeometry::TBox2f* box = bgPane->getBounds();
		iconPane->place(*box);
	}

	mScreenSprays = new P2DScreen::Mgr;
	mScreenSprays->set("s_menu_item_spray.blo", 0x1040000, arc);

	mBitterSprayPane    = og::Screen::TagSearch(mScreenItems, 'Nspray00');  // bitter spray
	mSpicySprayPane     = og::Screen::TagSearch(mScreenItems, 'Nspray01');  // spicy spray
	mBitterSpraySubPane = og::Screen::TagSearch(mScreenSprays, 'Nspray00'); // bitter spray
	mSpicySpraySubPane  = og::Screen::TagSearch(mScreenSprays, 'Nspray01'); // spicy spray

	mBitterSprayPane->move(msVal.mBitterSprayOffset.x, msVal.mBitterSprayOffset.y);
	mSpicySprayPane->move(msVal.mSpicySprayOffset.x, msVal.mSpicySprayOffset.y);

	if (!mDisp->mIsBitterUnlocked && !mDisp->mIsSpicyUnlocked) {
		// neither spicies nor bitters
		og::Screen::TagSearch(mScreenItems, 'Nwin0')->hide();               // hide bitter window
		og::Screen::TagSearch(mScreenItems, 'Nwin1')->hide();               // hide spicy window
		og::Screen::TagSearch(mScreenItems, 'NULL_002')->add(-96.0f, 0.0f); // move item pane to center
		mBitterSpraySubPane->hide();
		mSpicySpraySubPane->hide();

	} else if (!mDisp->mIsBitterUnlocked) {
		// no bitters
		og::Screen::TagSearch(mScreenItems, 'Nwin0')->hide();             // hide bitter window
		og::Screen::TagSearch(mScreenItems, 'Nwin1')->add(0.0f, -100.0f); // move spicy window to (vertical) center
		mBitterSpraySubPane->hide();

	} else if (!mDisp->mIsSpicyUnlocked) {
		// no spicies
		og::Screen::TagSearch(mScreenItems, 'Nwin0')->add(0.0f, 80.0f); // move bitter window to (vertical) center
		og::Screen::TagSearch(mScreenItems, 'Nwin1')->hide();           // hide spicy window
		mSpicySpraySubPane->hide();
	}

	// set up general pane animations
	mItemAnims = new og::Screen::AnimGroup(5);
	og::Screen::registAnimGroupScreen(mItemAnims, arc, mScreenItems, "s_menu_item_l.btk", msBaseVal.mAnimSpeed);
	og::Screen::registAnimGroupScreen(mItemAnims, arc, mScreenItems, "s_menu_item_l_02.btk", msBaseVal.mAnimSpeed);
	og::Screen::registAnimGroupScreen(mItemAnims, arc, mScreenItems, "s_menu_item_l_03.btk", msBaseVal.mAnimSpeed);
	og::Screen::registAnimGroupScreen(mItemAnims, arc, mScreenItems, "s_menu_item_l_04.btk", msBaseVal.mAnimSpeed);
	og::Screen::registAnimGroupScreen(mItemAnims, arc, mScreenItems, "s_menu_item_l_05.btk", msBaseVal.mAnimSpeed);

	// set up spray animations
	mSprayAnims = new og::Screen::AnimGroup(1);
	og::Screen::registAnimGroupScreen(mSprayAnims, arc, mScreenSprays, "s_menu_item_spray.btk", 1.0f);

	// set up bitter spray and berry counters
	og::Screen::setCallBack_CounterRV(mScreenItems, 'Pup_1', 'Pup_2', 'Pup_2', &mDisp->mBitterSprayCount, 3, 3, false, arc);
	og::Screen::setCallBack_CounterRV(mScreenItems, 'PupS_1', 'PupS_2', 'PupS_2', &mDisp->mBitterBerryCount, 2, 2, false, arc);

	// set up spicy spray and berry counters
	og::Screen::setCallBack_CounterRV(mScreenItems, 'Pdown_1', 'Pdown_2', 'Pdown_2', &mDisp->mSpicySprayCount, 3, 3, false, arc);
	og::Screen::setCallBack_CounterRV(mScreenItems, 'PdownS_1', 'PdownS_2', 'PdownS_2', &mDisp->mSpicyBerryCount, 2, 2, false, arc);

	J2DPane* iconList[12];
	JUtility::TColor greyedWhite(255, 255, 255, 160);
	JUtility::TColor greyedBlack(0, 0, 0, 0);

	// show each Exploration Kit item as "Incomplete" or named
	for (int i = 0; i < 12; i++) {
		u64 itemTag            = 'Pitemb00' + (i % 10) + (i / 10) % 10 * 256;
		J2DPictureEx* itemPane = static_cast<J2DPictureEx*>(og::Screen::TagSearch(mScreenItems, itemTag));

		u64 itemNameTag       = 'Titem000' + (i % 10) + (i / 10) % 10 * 256;
		J2DPane* itemNameTBox = og::Screen::TagSearch(mScreenItems, itemNameTag);
		itemNameTBox->setMsgID(ItemMsgID_List[i]);

		u64 iconTag = 'Picon00' + (i % 10) + (i / 10) % 10 * 256;
		iconList[i] = og::Screen::TagSearch(mScreenItems, iconTag);
		if (iconList[i]) {
			int id = Game::Equip::EquipItemList[i];

			itemPane->setWhite(msVal.mItemColorWhite);
			itemPane->setBlack(msVal.mItemColorBlack);

			if (mDisp->mExplorationKitInventory[id]) {
				// we have the item, display it and the name
				iconList[i]->show();
				if (itemNameTBox) {
					itemNameTBox->show();
				}
			} else {
				// we don't have the item, gray it out and label as "Incomplete"
				iconList[i]->show();
				itemPane->setWhite(greyedWhite);
				itemPane->setBlack(greyedBlack);
				if (itemNameTBox) {
					itemNameTBox->show();
					itemNameTBox->setMsgID('6130_00'); // "Incomplete"
					itemNameTBox->setAlpha(128);       // grey out label

				} else {
					char buf[12];
					og::Screen::TagToName(iconTag, buf); // debug
				}
			}

		} else {
			JUT_PANICLINE(386, "icon tag not found !!\n");
		}
	}

	doCreateAfter(arc, mScreenItems);
	/*
	stwu     r1, -0xd0(r1)
	mflr     r0
	lis      r5, lbl_8048E438@ha
	stw      r0, 0xd4(r1)
	stmw     r14, 0x88(r1)
	mr       r31, r3
	addi     r23, r5, lbl_8048E438@l
	stw      r4, 0x20(r1)
	bl       getDispMember__Q26Screen7ObjBaseFv
	lis      r4, 0x004F4741@ha
	lis      r6, 0x4954454D@ha
	lis      r5, 0x00534D5F@ha
	addi     r4, r4, 0x004F4741@l
	addi     r6, r6, 0x4954454D@l
	addi     r5, r5, 0x00534D5F@l
	bl       getSubMember__Q32og6Screen14DispMemberBaseFUlUx
	stw      r3, 0xa8(r31)
	lwz      r0, 0xa8(r31)
	cmplwi   r0, 0
	bne      lbl_803130BC
	li       r3, 0xc4
	bl       __nw__FUl
	cmplwi   r3, 0
	beq      lbl_8031309C
	bl       __ct__Q32og6Screen18DispMemberSMenuAllFv

lbl_8031309C:
	lis      r4, 0x004F4741@ha
	lis      r6, 0x4954454D@ha
	lis      r5, 0x00534D5F@ha
	addi     r4, r4, 0x004F4741@l
	addi     r6, r6, 0x4954454D@l
	addi     r5, r5, 0x00534D5F@l
	bl       getSubMember__Q32og6Screen14DispMemberBaseFUlUx
	stw      r3, 0xa8(r31)

lbl_803130BC:
	li       r3, 0x148
	bl       __nw__FUl
	cmplwi   r3, 0
	beq      lbl_803130D0
	bl       __ct__Q29P2DScreen10Mgr_tuningFv

lbl_803130D0:
	stw      r3, 0xac(r31)
	addi     r4, r23, 0x14
	lwz      r6, 0x20(r1)
	lis      r5, 0x104
	lwz      r3, 0xac(r31)
	bl       set__9J2DScreenFPCcUlP10JKRArchive
	li       r3, 0x118
	bl       __nw__FUl
	or.      r24, r3, r3
	beq      lbl_80313100
	bl       __ct__9J2DScreenFv
	mr       r24, r3

lbl_80313100:
	lwz      r6, 0x20(r1)
	mr       r3, r24
	addi     r4, r23, 0x28
	lis      r5, 0x104
	bl       set__9J2DScreenFPCcUlP10JKRArchive
	lis      r9, 0x66666667@ha
	lis      r8, 0x656D3030@ha
	lis      r7, 0x004E6974@ha
	lis      r6, 0x6F6E3030@ha
	lis      r5, 0x00506963@ha
	lis      r4, 0x6D623030@ha
	lis      r3, 0x50697465@ha
	addi     r22, r9, 0x66666667@l
	addi     r20, r8, 0x656D3030@l
	addi     r19, r7, 0x004E6974@l
	addi     r17, r6, 0x6F6E3030@l
	addi     r16, r5, 0x00506963@l
	addi     r15, r4, 0x6D623030@l
	addi     r14, r3, 0x50697465@l
	li       r27, 0

lbl_80313150:
	mulhw    r5, r22, r27
	lwz      r3, 0xac(r31)
	srawi    r0, r5, 2
	srwi     r4, r0, 0x1f
	add      r0, r0, r4
	mulli    r0, r0, 0xa
	subf     r21, r0, r27
	srawi    r26, r21, 0x1f
	addc     r6, r21, r20
	adde     r7, r26, r19
	srawi    r0, r5, 2
	srwi     r4, r0, 0x1f
	add      r5, r0, r4
	mulhw    r0, r22, r5
	srawi    r0, r0, 2
	srwi     r4, r0, 0x1f
	add      r0, r0, r4
	mulli    r0, r0, 0xa
	subf     r0, r0, r5
	slwi     r18, r0, 8
	srawi    r25, r18, 0x1f
	addc     r6, r6, r18
	adde     r5, r7, r25
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	addc     r4, r21, r17
	mr       r5, r3
	adde     r0, r26, r16
	mr       r3, r24
	addc     r6, r4, r18
	mr       r28, r5
	adde     r5, r0, r25
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	addc     r4, r21, r15
	mr       r5, r3
	adde     r0, r26, r14
	lwz      r3, 0xac(r31)
	addc     r6, r4, r18
	mr       r18, r5
	adde     r5, r0, r25
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	mr       r0, r3
	mr       r3, r18
	mr       r21, r0
	lbz      r4, 0xb7(r21)
	bl       setBasePosition__7J2DPaneF15J2DBasePosition
	mr       r3, r28
	mr       r4, r18
	bl       appendChild__7J2DPaneFP7J2DPane
	mr       r3, r21
	bl       getBounds__7J2DPaneFv
	mr       r4, r3
	mr       r3, r18
	bl       "place__7J2DPaneFRCQ29JGeometry8TBox2<f>"
	addi     r27, r27, 1
	cmpwi    r27, 0xc
	blt      lbl_80313150
	li       r3, 0x138
	bl       __nw__FUl
	cmplwi   r3, 0
	beq      lbl_80313244
	bl       __ct__Q29P2DScreen3MgrFv

lbl_80313244:
	stw      r3, 0xb0(r31)
	addi     r4, r23, 0x40
	lwz      r6, 0x20(r1)
	lis      r5, 0x104
	lwz      r3, 0xb0(r31)
	bl       set__9J2DScreenFPCcUlP10JKRArchive
	lis      r5, 0x61793030@ha
	lis      r4, 0x4E737072@ha
	lwz      r3, 0xac(r31)
	addi     r6, r5, 0x61793030@l
	addi     r5, r4, 0x4E737072@l
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	stw      r3, 0xbc(r31)
	lis      r5, 0x61793031@ha
	lis      r4, 0x4E737072@ha
	lwz      r3, 0xac(r31)
	addi     r6, r5, 0x61793031@l
	addi     r5, r4, 0x4E737072@l
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	stw      r3, 0xc0(r31)
	lis      r5, 0x61793030@ha
	lis      r4, 0x4E737072@ha
	lwz      r3, 0xb0(r31)
	addi     r6, r5, 0x61793030@l
	addi     r5, r4, 0x4E737072@l
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	stw      r3, 0xc4(r31)
	lis      r5, 0x61793031@ha
	lis      r4, 0x4E737072@ha
	lwz      r3, 0xb0(r31)
	addi     r6, r5, 0x61793031@l
	addi     r5, r4, 0x4E737072@l
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	stw      r3, 0xc8(r31)
	lis      r3, msVal__Q32og9newScreen12ObjSMenuItem@ha
	addi     r4, r3, msVal__Q32og9newScreen12ObjSMenuItem@l
	lwz      r3, 0xbc(r31)
	lfs      f1, 8(r4)
	lwz      r12, 0(r3)
	lfs      f2, 0xc(r4)
	lwz      r12, 0x10(r12)
	mtctr    r12
	bctrl
	lwz      r3, 0xc0(r31)
	lis      r4, msVal__Q32og9newScreen12ObjSMenuItem@ha
	addi     r4, r4, msVal__Q32og9newScreen12ObjSMenuItem@l
	lwz      r12, 0(r3)
	lfs      f1, 0x10(r4)
	lwz      r12, 0x10(r12)
	lfs      f2, 0x14(r4)
	mtctr    r12
	bctrl
	lwz      r3, 0xa8(r31)
	lbz      r4, 0x24(r3)
	cmplwi   r4, 0
	bne      lbl_803133B0
	lbz      r0, 0x25(r3)
	cmplwi   r0, 0
	bne      lbl_803133B0
	lis      r4, 0x77696E30@ha
	lwz      r3, 0xac(r31)
	addi     r6, r4, 0x77696E30@l
	li       r5, 0x4e
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	li       r0, 0
	lis      r4, 0x77696E31@ha
	stb      r0, 0xb0(r3)
	addi     r6, r4, 0x77696E31@l
	li       r5, 0x4e
	lwz      r3, 0xac(r31)
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	li       r0, 0
	lis      r5, 0x5F303032@ha
	stb      r0, 0xb0(r3)
	lis      r4, 0x4E554C4C@ha
	addi     r6, r5, 0x5F303032@l
	lwz      r3, 0xac(r31)
	addi     r5, r4, 0x4E554C4C@l
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	lwz      r12, 0(r3)
	lfs      f1, lbl_8051D830@sda21(r2)
	lwz      r12, 0x14(r12)
	lfs      f2, lbl_8051D834@sda21(r2)
	mtctr    r12
	bctrl
	lwz      r3, 0xc4(r31)
	li       r0, 0
	stb      r0, 0xb0(r3)
	lwz      r3, 0xc8(r31)
	stb      r0, 0xb0(r3)
	b        lbl_8031346C

lbl_803133B0:
	cmplwi   r4, 0
	bne      lbl_80313410
	lis      r4, 0x77696E30@ha
	lwz      r3, 0xac(r31)
	addi     r6, r4, 0x77696E30@l
	li       r5, 0x4e
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	li       r0, 0
	lis      r4, 0x77696E31@ha
	stb      r0, 0xb0(r3)
	addi     r6, r4, 0x77696E31@l
	li       r5, 0x4e
	lwz      r3, 0xac(r31)
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	lwz      r12, 0(r3)
	lfs      f1, lbl_8051D834@sda21(r2)
	lwz      r12, 0x14(r12)
	lfs      f2, lbl_8051D838@sda21(r2)
	mtctr    r12
	bctrl
	lwz      r3, 0xc4(r31)
	li       r0, 0
	stb      r0, 0xb0(r3)
	b        lbl_8031346C

lbl_80313410:
	lbz      r0, 0x25(r3)
	cmplwi   r0, 0
	bne      lbl_8031346C
	lis      r4, 0x77696E30@ha
	lwz      r3, 0xac(r31)
	addi     r6, r4, 0x77696E30@l
	li       r5, 0x4e
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	lwz      r12, 0(r3)
	lfs      f1, lbl_8051D834@sda21(r2)
	lwz      r12, 0x14(r12)
	lfs      f2, lbl_8051D83C@sda21(r2)
	mtctr    r12
	bctrl
	lis      r4, 0x77696E31@ha
	lwz      r3, 0xac(r31)
	addi     r6, r4, 0x77696E31@l
	li       r5, 0x4e
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	li       r0, 0
	stb      r0, 0xb0(r3)
	lwz      r3, 0xc8(r31)
	stb      r0, 0xb0(r3)

lbl_8031346C:
	li       r3, 0x1c
	bl       __nw__FUl
	cmplwi   r3, 0
	beq      lbl_80313484
	li       r4, 5
	bl       __ct__Q32og6Screen9AnimGroupFi

lbl_80313484:
	stw      r3, 0xb4(r31)
	lis      r3, msBaseVal__Q32og9newScreen12ObjSMenuBase@ha
	addi     r7, r3, msBaseVal__Q32og9newScreen12ObjSMenuBase@l
	lwz      r4, 0x20(r1)
	lwz      r3, 0xb4(r31)
	addi     r6, r23, 0x58
	lwz      r5, 0xac(r31)
	lfs      f1, 0(r7)
	bl
registAnimGroupScreen__Q22og6ScreenFPQ32og6Screen9AnimGroupP10JKRArchiveP9J2DScreenPcf
	lis      r4, msBaseVal__Q32og9newScreen12ObjSMenuBase@ha
	lwz      r3, 0xb4(r31)
	lfs      f1, msBaseVal__Q32og9newScreen12ObjSMenuBase@l(r4)
	addi     r6, r23, 0x6c
	lwz      r5, 0xac(r31)
	lwz      r4, 0x20(r1)
	bl
registAnimGroupScreen__Q22og6ScreenFPQ32og6Screen9AnimGroupP10JKRArchiveP9J2DScreenPcf
	lis      r4, msBaseVal__Q32og9newScreen12ObjSMenuBase@ha
	lwz      r3, 0xb4(r31)
	lfs      f1, msBaseVal__Q32og9newScreen12ObjSMenuBase@l(r4)
	addi     r6, r23, 0x84
	lwz      r5, 0xac(r31)
	lwz      r4, 0x20(r1)
	bl
registAnimGroupScreen__Q22og6ScreenFPQ32og6Screen9AnimGroupP10JKRArchiveP9J2DScreenPcf
	lis      r4, msBaseVal__Q32og9newScreen12ObjSMenuBase@ha
	lwz      r3, 0xb4(r31)
	lfs      f1, msBaseVal__Q32og9newScreen12ObjSMenuBase@l(r4)
	addi     r6, r23, 0x9c
	lwz      r5, 0xac(r31)
	lwz      r4, 0x20(r1)
	bl
registAnimGroupScreen__Q22og6ScreenFPQ32og6Screen9AnimGroupP10JKRArchiveP9J2DScreenPcf
	lis      r4, msBaseVal__Q32og9newScreen12ObjSMenuBase@ha
	lwz      r3, 0xb4(r31)
	lfs      f1, msBaseVal__Q32og9newScreen12ObjSMenuBase@l(r4)
	addi     r6, r23, 0xb4
	lwz      r5, 0xac(r31)
	lwz      r4, 0x20(r1)
	bl
registAnimGroupScreen__Q22og6ScreenFPQ32og6Screen9AnimGroupP10JKRArchiveP9J2DScreenPcf
	li       r3, 0x1c
	bl       __nw__FUl
	cmplwi   r3, 0
	beq      lbl_80313530
	li       r4, 1
	bl       __ct__Q32og6Screen9AnimGroupFi

lbl_80313530:
	stw      r3, 0xb8(r31)
	addi     r6, r23, 0xcc
	lwz      r4, 0x20(r1)
	lfs      f1, lbl_8051D840@sda21(r2)
	lwz      r3, 0xb8(r31)
	lwz      r5, 0xb0(r31)
	bl
registAnimGroupScreen__Q22og6ScreenFPQ32og6Screen9AnimGroupP10JKRArchiveP9J2DScreenPcf
	lwz      r5, 0xa8(r31)
	lis      r3, 0x75705F32@ha
	addi     r8, r3, 0x75705F32@l
	li       r4, 3
	addi     r5, r5, 8
	li       r0, 0
	stw      r5, 8(r1)
	addi     r6, r3, 0x5f31
	mr       r10, r8
	li       r5, 0x50
	stw      r4, 0xc(r1)
	li       r7, 0x50
	li       r9, 0x50
	stw      r4, 0x10(r1)
	stw      r0, 0x14(r1)
	lwz      r0, 0x20(r1)
	stw      r0, 0x18(r1)
	lwz      r3, 0xac(r31)
	bl
setCallBack_CounterRV__Q22og6ScreenFPQ29P2DScreen3MgrUxUxUxPUlUsUsbP10JKRArchive
	lwz      r5, 0xa8(r31)
	lis      r3, 0x70535F32@ha
	addi     r8, r3, 0x70535F32@l
	li       r4, 2
	addi     r5, r5, 0xc
	li       r0, 0
	stw      r5, 8(r1)
	addi     r6, r3, 0x5f31
	mr       r10, r8
	li       r5, 0x5075
	stw      r4, 0xc(r1)
	li       r7, 0x5075
	li       r9, 0x5075
	stw      r4, 0x10(r1)
	stw      r0, 0x14(r1)
	lwz      r0, 0x20(r1)
	stw      r0, 0x18(r1)
	lwz      r3, 0xac(r31)
	bl
setCallBack_CounterRV__Q22og6ScreenFPQ29P2DScreen3MgrUxUxUxPUlUsUsbP10JKRArchive
	lwz      r5, 0xa8(r31)
	lis      r4, 0x776E5F32@ha
	addi     r8, r4, 0x776E5F32@l
	li       r11, 3
	addi     r0, r5, 0x10
	lis      r3, 0x0050646F@ha
	stw      r0, 8(r1)
	addi     r5, r3, 0x0050646F@l
	li       r0, 0
	mr       r10, r8
	stw      r11, 0xc(r1)
	mr       r7, r5
	mr       r9, r5
	addi     r6, r4, 0x5f31
	stw      r11, 0x10(r1)
	stw      r0, 0x14(r1)
	lwz      r0, 0x20(r1)
	stw      r0, 0x18(r1)
	lwz      r3, 0xac(r31)
	bl
setCallBack_CounterRV__Q22og6ScreenFPQ29P2DScreen3MgrUxUxUxPUlUsUsbP10JKRArchive
	lwz      r5, 0xa8(r31)
	lis      r4, 0x6E535F32@ha
	addi     r8, r4, 0x6E535F32@l
	li       r11, 2
	addi     r0, r5, 0x14
	lis      r3, 0x50646F77@ha
	stw      r0, 8(r1)
	addi     r5, r3, 0x50646F77@l
	li       r0, 0
	mr       r10, r8
	stw      r11, 0xc(r1)
	mr       r7, r5
	mr       r9, r5
	addi     r6, r4, 0x5f31
	stw      r11, 0x10(r1)
	stw      r0, 0x14(r1)
	lwz      r0, 0x20(r1)
	stw      r0, 0x18(r1)
	lwz      r3, 0xac(r31)
	bl
setCallBack_CounterRV__Q22og6ScreenFPQ29P2DScreen3MgrUxUxUxPUlUsUsbP10JKRArchive
	li       r0, 0xff
	lis      r6, 0x6D303030@ha
	lis      r4, ItemMsgID_List__Q22og9newScreen@ha
	lis      r5, 0x54697465@ha
	lis      r3, EquipItemList__Q24Game5Equip@ha
	stb      r0, 0x38(r1)
	addi     r22, r4, ItemMsgID_List__Q22og9newScreen@l
	lis      r4, 0x6F6E3030@ha
	li       r11, 0
	addi     r20, r3, EquipItemList__Q24Game5Equip@l
	li       r12, 0xa0
	lis      r10, msVal__Q32og9newScreen12ObjSMenuItem@ha
	lis      r9, 0x66666667@ha
	lis      r8, 0x6D623030@ha
	lis      r7, 0x50697465@ha
	stb      r0, 0x39(r1)
	lis      r3, 0x00506963@ha
	addi     r21, r1, 0x48
	stb      r0, 0x3a(r1)
	addi     r0, r6, 0x6D303030@l
	addi     r24, r10, msVal__Q32og9newScreen12ObjSMenuItem@l
	addi     r25, r9, 0x66666667@l
	stw      r0, 0x78(r1)
	addi     r0, r5, 0x54697465@l
	addi     r27, r8, 0x6D623030@l
	addi     r14, r7, 0x50697465@l
	stw      r0, 0x7c(r1)
	addi     r0, r4, 0x6F6E3030@l
	li       r17, 0
	stw      r0, 0x80(r1)
	addi     r0, r3, 0x00506963@l
	stb      r12, 0x3b(r1)
	stw      r0, 0x84(r1)
	stb      r11, 0x34(r1)
	stb      r11, 0x35(r1)
	stb      r11, 0x36(r1)
	stb      r11, 0x37(r1)

lbl_80313718:
	mulhw    r5, r25, r17
	lwz      r3, 0xac(r31)
	srawi    r0, r5, 2
	srwi     r4, r0, 0x1f
	add      r0, r0, r4
	mulli    r0, r0, 0xa
	subf     r26, r0, r17
	srawi    r18, r26, 0x1f
	addc     r6, r26, r27
	adde     r7, r18, r14
	srawi    r0, r5, 2
	srwi     r4, r0, 0x1f
	add      r5, r0, r4
	mulhw    r0, r25, r5
	srawi    r0, r0, 2
	srwi     r4, r0, 0x1f
	add      r0, r0, r4
	mulli    r0, r0, 0xa
	subf     r0, r0, r5
	slwi     r28, r0, 8
	srawi    r19, r28, 0x1f
	addc     r6, r6, r28
	adde     r5, r7, r19
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	lwz      r0, 0x78(r1)
	mr       r5, r3
	lwz      r3, 0xac(r31)
	addc     r4, r26, r0
	lwz      r0, 0x7c(r1)
	adde     r0, r18, r0
	addc     r29, r4, r28
	mr       r4, r5
	adde     r30, r0, r19
	mr       r16, r4
	mr       r6, r29
	mr       r5, r30
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	lwz      r4, 0(r22)
	mr       r15, r3
	lwz      r5, 4(r22)
	lwz      r0, 0x80(r1)
	stw      r5, 0x1c(r15)
	addc     r3, r26, r0
	lwz      r0, 0x84(r1)
	stw      r4, 0x18(r15)
	adde     r0, r18, r0
	addc     r6, r3, r28
	lwz      r3, 0xac(r31)
	adde     r5, r0, r19
	bl       TagSearch__Q22og6ScreenFP9J2DScreenUx
	stw      r3, 0(r21)
	lwz      r0, 0(r21)
	cmplwi   r0, 0
	beq      lbl_8031390C
	lis      r4, msVal__Q32og9newScreen12ObjSMenuItem@ha
	mr       r3, r16
	addi     r5, r4, msVal__Q32og9newScreen12ObjSMenuItem@l
	addi     r4, r1, 0x30
	lwz      r0, 0(r5)
	lwz      r18, 0(r20)
	stw      r0, 0x30(r1)
	lwz      r12, 0(r16)
	lwz      r12, 0x12c(r12)
	mtctr    r12
	bctrl
	lwz      r0, 4(r24)
	mr       r3, r16
	addi     r4, r1, 0x2c
	stw      r0, 0x2c(r1)
	lwz      r12, 0(r16)
	lwz      r12, 0x128(r12)
	mtctr    r12
	bctrl
	lwz      r3, 0xa8(r31)
	addi     r0, r18, 0x18
	lbzx     r0, r3, r0
	cmplwi   r0, 0
	beq      lbl_8031386C
	lwz      r3, 0(r21)
	li       r0, 1
	cmplwi   r15, 0
	stb      r0, 0xb0(r3)
	beq      lbl_80313920
	stb      r0, 0xb0(r15)
	b        lbl_80313920

lbl_8031386C:
	lwz      r3, 0(r21)
	li       r5, 1
	lwz      r0, 0x38(r1)
	addi     r4, r1, 0x28
	stb      r5, 0xb0(r3)
	stw      r0, 0x28(r1)
	lwz      r12, 0(r3)
	lwz      r12, 0x12c(r12)
	mtctr    r12
	bctrl
	lwz      r0, 0x34(r1)
	addi     r4, r1, 0x24
	lwz      r3, 0(r21)
	stw      r0, 0x24(r1)
	lwz      r12, 0(r3)
	lwz      r12, 0x128(r12)
	mtctr    r12
	bctrl
	cmplwi   r15, 0
	beq      lbl_803138F8
	li       r0, 1
	lis      r3, 0x305F3030@ha
	stb      r0, 0xb0(r15)
	addi     r0, r3, 0x305F3030@l
	lis      r4, 0x00363133@ha
	mr       r3, r15
	stw      r0, 0x1c(r15)
	addi     r0, r4, 0x00363133@l
	li       r4, 0x80
	stw      r0, 0x18(r15)
	lwz      r12, 0(r15)
	lwz      r12, 0x24(r12)
	mtctr    r12
	bctrl
	b        lbl_80313920

lbl_803138F8:
	mr       r4, r29
	mr       r3, r30
	addi     r5, r1, 0x3c
	bl       TagToName__Q22og6ScreenFUxPc
	b        lbl_80313920

lbl_8031390C:
	addi     r3, r23, 0
	addi     r5, r23, 0xe4
	li       r4, 0x182
	crclr    6
	bl       panic_f__12JUTExceptionFPCciPCce

lbl_80313920:
	addi     r17, r17, 1
	addi     r21, r21, 4
	cmpwi    r17, 0xc
	addi     r20, r20, 4
	addi     r22, r22, 8
	blt      lbl_80313718
	lwz      r5, 0xac(r31)
	mr       r3, r31
	lwz      r4, 0x20(r1)
	bl
doCreateAfter__Q32og9newScreen12ObjSMenuBaseFP10JKRArchivePQ29P2DScreen3Mgr
lmw r14, 0x88(r1) lwz      r0, 0xd4(r1) mtlr     r0 addi     r1, r1, 0xd0
blr
	*/
}

/**
 * @note Address: 0x8031395C
 * @note Size: 0x128
 */
void ObjSMenuItem::doUpdateLAction()
{
	// LEFT = CONTROL OR PAUSE
	if (msBaseVal.mUseControlMenu) {
		::Screen::SetSceneArg arg(SCENE_PAUSE_MENU_CONTROLS, getDispMember());
		jump_L(arg);
		return;
	}

	og::Screen::DispMemberSMenuAll* disp = static_cast<og::Screen::DispMemberSMenuAll*>(getDispMember());
	if (disp->mSMenuMap.mInCave) {
		// different pause menu in cave
		::Screen::SetSceneArg arg(SCENE_PAUSE_MENU_DOUKUTU, getDispMember());
		jump_L(arg);
	} else {
		::Screen::SetSceneArg arg(SCENE_PAUSE_MENU, getDispMember());
		jump_L(arg);
	}
}

/**
 * @note Address: 0x80313A84
 * @note Size: 0x6C
 */
void ObjSMenuItem::doUpdateRAction()
{
	::Screen::SetSceneArg arg(SCENE_PAUSE_MENU_MAP, getDispMember());
	jump_R(arg);
}

/**
 * @note Address: 0x80313AF0
 * @note Size: 0xE8
 */
void ObjSMenuItem::commonUpdate()
{
	commonUpdateBase();
	setSMenuScale(msVal.mItemMenuScale.x, msVal.mItemMenuScale.y);
	mBitterSprayPane->move(msVal.mBitterSprayOffset.x, msVal.mBitterSprayOffset.y);
	mSpicySprayPane->move(msVal.mSpicySprayOffset.x, msVal.mSpicySprayOffset.y);
	mItemAnims->update();
	mSprayAnims->update();
	mScreenItems->setXY(mMovePos, 0.0f);
	mScreenItems->update();
	mScreenSprays->update();
}

/**
 * @note Address: 0x80313BD8
 * @note Size: 0x54
 */
bool ObjSMenuItem::doUpdate()
{
	commonUpdate();
	bool ret = ObjSMenuBase::doUpdate();
	mScreenItems->animation();
	return ret;
}

/**
 * @note Address: 0x80313C2C
 * @note Size: 0xD4
 */
void ObjSMenuItem::doDraw(Graphics& gfx)
{
	J2DPerspGraph* graf = &gfx.mPerspGraph;
	graf->setPort();
	if (mScreenItems) {
		mScreenItems->draw(gfx, *graf);
	}
	if (mScreenSprays) {
		PSMTXCopy(mBitterSprayPane->mGlobalMtx, mBitterSpraySubPane->mPositionMtx);
		PSMTXCopy(mSpicySprayPane->mGlobalMtx, mSpicySpraySubPane->mPositionMtx);
		mScreenSprays->draw(gfx, *graf);
	}
	drawYaji(gfx);
}

/**
 * @note Address: 0x80313D00
 * @note Size: 0x14
 */
void ObjSMenuItem::in_L()
{
	mState = MENUSTATE_OpenL;
	mAngle = 15.0f;
}

/**
 * @note Address: 0x80313D14
 * @note Size: 0x14
 */
void ObjSMenuItem::in_R()
{
	mState = MENUSTATE_OpenR;
	mAngle = 15.0f;
}

/**
 * @note Address: 0x80313D28
 * @note Size: 0xC
 */
void ObjSMenuItem::wait() { mState = MENUSTATE_Default; }

/**
 * @note Address: 0x80313D34
 * @note Size: 0x2C
 */
void ObjSMenuItem::out_L()
{
	mState = MENUSTATE_CloseL;
	ogSound->setSMenuLR();
}

/**
 * @note Address: 0x80313D60
 * @note Size: 0x2C
 */
void ObjSMenuItem::out_R()
{
	mState = MENUSTATE_CloseR;
	ogSound->setSMenuLR();
}

/**
 * @note Address: 0x80313D8C
 * @note Size: 0xD0
 */
bool ObjSMenuItem::doStart(::Screen::StartSceneArg const* arg)
{
	mItemAnims->setFrame(0.0f);
	mItemAnims->setRepeat(true);
	mItemAnims->setSpeed(1.0f);
	mItemAnims->start();

	mSprayAnims->setFrame(0.0f);
	mSprayAnims->setRepeat(true);
	mSprayAnims->setSpeed(1.0f);
	mSprayAnims->start();

	setYajiName('6052_00', '6050_00', '6051_00'); // "Menu" "Radar" "Items"
	stopYaji();
	return start_LR(arg);
}

/**
 * @note Address: 0x80313E5C
 * @note Size: 0x8
 */
bool ObjSMenuItem::doEnd(::Screen::EndSceneArg const*) { return true; }

/**
 * @note Address: 0x80313E64
 * @note Size: 0x20
 */
void ObjSMenuItem::doUpdateFinish() { ObjSMenuBase::doUpdateFinish(); }

/**
 * @note Address: 0x80313E84
 * @note Size: 0x4C
 */
bool ObjSMenuItem::doUpdateFadeout()
{
	commonUpdate();
	return updateFadeOut();
}

/**
 * @note Address: 0x80313ED0
 * @note Size: 0x4
 */
void ObjSMenuItem::doUpdateCancelAction() { }

ObjSMenuItem::StaticValues ObjSMenuItem::msVal;

} // namespace newScreen
} // namespace og
