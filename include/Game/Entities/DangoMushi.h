#ifndef _GAME_ENTITIES_DANGOMUSHI_H
#define _GAME_ENTITIES_DANGOMUSHI_H

#include "Game/EnemyStateMachine.h"
#include "Game/EnemyAnimatorBase.h"
#include "Game/EnemyParmsBase.h"
#include "Game/EnemyMgrBase.h"
#include "Game/EnemyBase.h"
#include "Game/JointFuncs.h"

/**
 * --Header for Segmented Crawbster (DangoMushi)--
 */

namespace efx {
// TODO: make headers for these
struct TDangoWallBreak;
struct TDangoAttack2;
struct TChasePos2;
} // namespace efx

namespace Sys {
struct MatLoopAnimator;
} // namespace Sys

namespace Game {
namespace DangoMushi {
struct FSM;

struct Obj : public EnemyBase {
	Obj();

	//////////////// VTABLE
	virtual void onInit(CreatureInitArg*);                  // _30
	virtual void onKill(CreatureKillArg*);                  // _34
	virtual void doDirectDraw(Graphics&);                   // _50
	virtual void collisionCallback(CollEvent&);             // _EC
	virtual void getShadowParam(ShadowParam&);              // _134
	virtual bool needShadow();                              // _138
	virtual ~Obj();                                         // _1BC (weak)
	virtual void setInitialSetting(EnemyInitialParamBase*); // _1C4
	virtual void doUpdate();                                // _1CC
	virtual void doUpdateCommon();                          // _1D0
	virtual void doAnimationUpdateAnimator();               // _1D8
	virtual void doDebugDraw(Graphics&);                    // _1EC
	virtual void changeMaterial();                          // _200
	virtual void getCommonEffectPos(Vector3f&);             // _204
	virtual void initWalkSmokeEffect();                     // _230
	virtual WalkSmokeEffect::Mgr* getWalkSmokeEffectMgr();  // _234
	virtual EnemyTypeID::EEnemyTypeID getEnemyTypeID();     // _258 (weak)
	virtual bool damageCallBack(Creature*, f32, CollPart*); // _278
	virtual bool earthquakeCallBack(Creature*, f32);        // _28C
	virtual void doStartStoneState();                       // _2A4
	virtual void doFinishStoneState();                      // _2A8
	virtual f32 getDamageCoeStoneState();                   // _2AC (weak)
	virtual void startCarcassMotion();                      // _2C4
	virtual void wallCallback(const MoveInfo&);             // _2E8
	virtual f32 getDownSmokeScale();                        // _2EC (weak)
	virtual void doStartMovie();                            // _2F0
	virtual void doEndMovie();                              // _2F4
	virtual void setFSM(FSM*);                              // _2F8
	//////////////// VTABLE END

	void addShadowScale();
	void setRandTarget();
	void isReachedTarget();
	void getSearchedTarget();
	void rollingMove();
	void createCrashEnemy();
	void getFallEggNum();
	void getFallPosition(int);
	void setupCollision();
	void setBodyCollision(bool);
	void flickHandCollision(Creature*);
	void isNoDamageCollision();
	void resetMapCollisionSize(bool);
	void updateMapCollisionSize();
	void flickHandCollision();
	void startBlendAnimation(int, bool);
	void endBlendAnimation();
	void startBossFlickBGM();
	void startBossAttackLoopBGM();
	void finishBossAttackLoopBGM();
	void updateBossBGM();
	void resetBossAppearBGM();
	void setBossAppearBGM();
	void createEffect();
	void setupEffect();
	void createDeadSmokeEffect();
	void createDeadBombEffect();
	void createBodyTurnEffect();
	void createWallBreakEffect();
	void createFlickAttackEffect();
	void createBodyDamageEffect();
	void createBodyWallCrashEffect(Vector3f);
	void startRollingMoveEffect();
	void finishRollingMoveEffect();
	void createEnemyBounceEffect();
	void createMoveHandEffect();
	void createAppearSmokeEffect();
	void effectDrawOn();
	void effectDrawOff();

	// _00 		= VTBL
	// _00-_2BC	= EnemyBase
	u8 _2BC[0x4];                            // _2BC, unknown
	u8 _2C0;                                 // _2C0
	u8 _2C1;                                 // _2C1
	u8 _2C2;                                 // _2C2
	f32 _2C4;                                // _2C4, timer?
	u8 _2C8[0x4];                            // _2C8, unknown
	int _2CC;                                // _2CC
	Vector3f _2D0;                           // _2D0
	u8 _2DC[0xC];                            // _2DC, unknown
	WalkSmokeEffect::Mgr m_walkSmokeMgr;     // 2E8
	Sys::MatLoopAnimator* m_matLoopAnimator; // _2F0
	efx::TDangoWallBreak* m_efxWallBreak;    // _2F4
	efx::TDangoAttack2* m_efxAttack2;        // _2F8
	efx::TChasePos2* m_efxRun;               // _2FC, TDangoRun?
	u8 _300[0x8];                            // _300, unknown
	                                         // _308 = PelletView
};

struct Mgr : public EnemyMgrBase {
	Mgr(int, u8);

	virtual ~Mgr();                                     // _58 (weak)
	virtual void createObj(int);                        // _A0
	virtual EnemyBase* getEnemy(int);                   // _A4
	virtual void doAlloc();                             // _A8
	virtual EnemyTypeID::EEnemyTypeID getEnemyTypeID(); // _AC (weak)
	virtual SysShape::Model* createModel();             // _B0
	virtual void loadModelData();                       // _C8
	virtual void loadTexData();                         // _D0
	virtual J3DModelData* doLoadBmd(void*);             // _D4 (weak)

	// _00 		= VTBL
	// _00-_44	= EnemyMgrBase
};

struct Parms : public EnemyParmsBase {
	struct ProperParms : public Parameters {
		inline ProperParms(); // likely

		Parm<f32> m_fp01; // _804
		Parm<f32> m_fp02; // _82C
		Parm<f32> m_fp03; // _854
		Parm<f32> m_fp10; // _87C
	};

	Parms();

	virtual void read(Stream&); // _08 (weak)

	// _00-_7F8	= EnemyParmsBase
	ProperParms m_properParms; // _7F8
};

struct ProperAnimator : public EnemyBlendAnimatorBase {
	virtual ~ProperAnimator(); // _08 (weak)

	// _00 		= VTBL
	// _00-_60	= EnemyBlendAnimatorBase
};

/////////////////////////////////////////////////////////////////
// STATE MACHINE DEFINITIONS
struct FSM : public EnemyStateMachine {
	virtual void init(EnemyBase*); // _08

	// _00		= VTBL
	// _00-_1C	= EnemyStateMachine
};

struct State : public EnemyFSMState {
	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateAppear : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateAttack : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateDead : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateFlick : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateMove : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateRecover : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateStay : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateTurn : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};

struct StateWait : public State {
	virtual void init(EnemyBase*, StateArg*); // _08
	virtual void exec(EnemyBase*);            // _0C
	virtual void cleanup(EnemyBase*);         // _10

	// _00		= VTBL
	// _00-_10 	= EnemyFSMState
};
/////////////////////////////////////////////////////////////////
} // namespace DangoMushi
} // namespace Game

#endif