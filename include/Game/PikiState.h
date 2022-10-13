#ifndef _GAME_PIKISTATE_H
#define _GAME_PIKISTATE_H

#include "Game/StateMachine.h"
#include "Game/PlatInstance.h"
#include "Game/CollEvent.h"
#include "Game/Piki.h"
#include "SysShape/KeyEvent.h"
#include "SysShape/MotionListener.h"
#include "Sys/Triangle.h"
#include "Vector3.h"

namespace Game {
struct Piki;
struct Navi;
struct Creature;

enum PikiStateID {
	PIKISTATE_Walk        = 0,
	PIKISTATE_DemoWait    = 1,
	PIKISTATE_LookAt      = 2,
	PIKISTATE_GoHang      = 3,
	PIKISTATE_Hanged      = 4,
	PIKISTATE_WaterHanged = 5,
	PIKISTATE_Flying      = 6,
	PIKISTATE_KokeDamage  = 7,
	PIKISTATE_Blow        = 8,
	PIKISTATE_Flick       = 9,
	PIKISTATE_Drown       = 10,
	PIKISTATE_Swallowed   = 11,
	PIKISTATE_Nukare      = 12,
	PIKISTATE_Absorb      = 13,
	PIKISTATE_Growup      = 14,
	PIKISTATE_Tane        = 15,
	PIKISTATE_Dope        = 16,
	PIKISTATE_AutoNuki    = 17,
	PIKISTATE_HipDrop     = 18,
	PIKISTATE_Emotion     = 19,
	PIKISTATE_Pressed     = 20,
	PIKISTATE_Panic       = 21,
	PIKISTATE_DenkiDying  = 22,
	PIKISTATE_FallMeck    = 23,
	PIKISTATE_Dying       = 24,
	PIKISTATE_Dead        = 25,
	PIKISTATE_Suikomi     = 26,
	PIKISTATE_Holein      = 27,
	PIKISTATE_Fountainon  = 28,
	// no 29?
	PIKISTATE_Koke   = 30,
	PIKISTATE_Escape = 31,
	PIKISTATE_Carrot = 32,
	PIKISTATE_Count,
};

struct PikiState : public FSMState<Piki> {
	inline PikiState(int stateID, char* name) // likely, may need adjusting
	    : FSMState(stateID)
	{
		m_name = name;
	}

	virtual bool ignoreAtari(Piki*, Creature*) { return false; }  // _20 (weak)
	virtual void bounceCallback(Piki*, Sys::Triangle*) { }        // _24 (weak)
	virtual void collisionCallback(Piki*, CollEvent&) { }         // _28 (weak)
	virtual void platCallback(Piki*, PlatEvent&) { }              // _2C (weak)
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&) { } // _30 (weak)
	virtual void getInfo(char*);                                  // _34
	virtual void outWaterCallback(Piki*) { }                      // _38 (weak)
	virtual void wallCallback(Piki*, Vector3f&) { }               // _3C (weak)
	virtual bool invincible(Piki*) { return false; }              // _40 (weak)
	virtual bool callable() { return false; }                     // _44 (weak)
	virtual bool aiActive() { return false; }                     // _48 (weak)
	virtual bool dopable() { return false; }                      // _4C (weak)
	virtual bool releasable() { return false; }                   // _50 (weak)
	virtual bool throwable() { return false; }                    // _54 (weak)
	virtual bool dead() { return false; }                         // _58 (weak)
	virtual bool battleOK() { return false; }                     // _5C (weak)
	virtual bool pressable() { return true; }                     // _60 (weak)
	virtual bool transittable(int) { return true; }               // _64 (weak)
	virtual bool soft_transittable(int) { return true; }          // _68 (weak)
	virtual void onFlute(Piki*, Navi*) { }                        // _6C (weak)
	virtual void dump();                                          // _70

	// _00     = VTBL
	// _00-_0C = FSMState
	char* m_name; // _0C
};

struct PikiAbsorbState : public PikiState {
	inline PikiAbsorbState()
	    : PikiState(PIKISTATE_Absorb, "ABSORB")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
	void* _14;   // _14, code?
	u8 _18;      // _18
	u8 _19;      // _19
};

struct PikiAutoNukiState : public PikiState {
	inline PikiAutoNukiState()
	    : PikiState(PIKISTATE_AutoNuki, "AUTONUKI")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x8]; // _10, unknown
};

struct PikiBlowState : public PikiState {
	inline PikiBlowState()
	    : PikiState(PIKISTATE_Blow, "BLOW")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void bounceCallback(Piki*, Sys::Triangle*);        // _24
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)
	virtual bool pressable();                                  // _60 (weak)
	virtual void onFlute(Piki*, Navi*);                        // _6C

	// _00     = VTBL
	// _00-_10 = PikiState
	int _10;      // _10
	Piki* _14;    // _14
	Vector3f _18; // _18
	f32 _24;      // _24
	u8 _28;       // _28
	u8 _29;       // _29
	u16 _2A;      // _2A
};

struct PikiCarrotState : public PikiState {
	inline PikiCarrotState()
	    : PikiState(PIKISTATE_Carrot, "CARROT")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual void bounceCallback(Piki*, Sys::Triangle*); // _24
	virtual void collisionCallback(Piki*, CollEvent&);  // _28

	// _00     = VTBL
	// _00-_10 = PikiState
	f32 m_timeRemaining; // _10, remaining time alive, in seconds (max 10-13s)
	bool m_isPlanted;    // _14
	Vector3f m_position; // _18
};

struct PikiDeadState : public PikiState {
	inline PikiDeadState()
	    : PikiState(PIKISTATE_Dead, "DEAD")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual bool dead();                 // _58 (weak)
	virtual bool pressable();            // _60 (weak)
	virtual bool transittable(int);      // _64 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
};

struct PikiDemoWaitState : public PikiState {
	inline PikiDemoWaitState()
	    : PikiState(PIKISTATE_DemoWait, "DEMOWAIT")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool invincible(Piki*);      // _40 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
};

struct PikiDenkiDyingState : public PikiState {
	inline PikiDenkiDyingState()
	    : PikiState(PIKISTATE_DenkiDying, "DENKI_DYING")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool dead();                 // _58 (weak)
	virtual bool pressable();            // _60 (weak)
	virtual bool transittable(int);      // _64
	virtual bool soft_transittable(int); // _68

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};

struct PikiDopeState : public PikiState {
	inline PikiDopeState()
	    : PikiState(PIKISTATE_Dope, "DOPE")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual void onFlute(Piki*, Navi*);                        // _6C

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4];  // _10, unknown
	f32 _14;      // _14, dope timer?
	s16 _18;      // _18
	s16 _1A;      // _1A
	Navi* m_navi; // _1C
};

struct PikiDrownState : public PikiState {
	inline PikiDrownState()
	    : PikiState(PIKISTATE_Drown, "DROWN")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual void outWaterCallback(Piki*);                      // _38
	virtual bool soft_transittable(int);                       // _68
	virtual void onFlute(Piki*, Navi*);                        // _6C

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x24]; // _10, unknown
};

struct PikiDyingState : public PikiState {
	inline PikiDyingState()
	    : PikiState(PIKISTATE_Dying, "DYING")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool dead();                                       // _58 (weak)
	virtual bool pressable();                                  // _60 (weak)
	virtual bool transittable(int);                            // _64

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x8]; // _10, unknown
};

struct PikiEmotionState : public PikiState {
	inline PikiEmotionState()
	    : PikiState(PIKISTATE_Emotion, "EMOTION")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x18]; // _10, unknown
};

struct PikiEscapeState : public PikiState {
	inline PikiEscapeState()
	    : PikiState(PIKISTATE_Escape, "ESCAPE")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)

	void initRun(Piki*);

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};

struct PikiFallMeckState : public PikiState {
	inline PikiFallMeckState()
	    : PikiState(PIKISTATE_FallMeck, "FALLMECK")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual void bounceCallback(Piki*, Sys::Triangle*); // _24
	virtual void collisionCallback(Piki*, CollEvent&);  // _28
	virtual void platCallback(Piki*, PlatEvent&);       // _2C
	virtual bool pressable();                           // _60 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};

struct PikiFlickState : public PikiState, virtual SysShape::MotionListener {
	inline PikiFlickState()
	    : PikiState(PIKISTATE_Flick, "FLICK")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)
	virtual void onFlute(Piki*, Navi*);                        // _6C
	virtual void onKeyEvent(const SysShape::KeyEvent&);        // _74 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x1C]; // _10, unknown
};

struct PikiFlyingState : public PikiState {
	inline PikiFlyingState()
	    : PikiState(PIKISTATE_Flying, "FLYING")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual bool ignoreAtari(Piki*, Creature*);         // _20
	virtual void bounceCallback(Piki*, Sys::Triangle*); // _24
	virtual void collisionCallback(Piki*, CollEvent&);  // _28
	virtual bool callable();                            // _44 (weak)
	virtual void stopEffect();                          // _74
	virtual void restartEffect();                       // _78

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x24]; // _10, unknown
};

struct PikiFountainonState : public PikiState {
	inline PikiFountainonState()
	    : PikiState(PIKISTATE_Fountainon, "FOUNTAINON")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool invincible(Piki*);      // _40 (weak)
	virtual bool callable();             // _44 (weak)
	virtual bool soft_transittable(int); // _44 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x24]; // _10, unknown
};

struct PikiGoHangState : public PikiState {
	inline PikiGoHangState()
	    : PikiState(PIKISTATE_GoHang, "GOHANG")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool callable();             // _44 (weak)
	virtual bool throwable();            // _54 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
};

struct PikiGrowupState : public PikiState {
	inline PikiGrowupState()
	    : PikiState(PIKISTATE_Growup, "GROWUP")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};

struct PikiHangedState : public PikiState, virtual SysShape::MotionListener {
	inline PikiHangedState()
	    : PikiState(PIKISTATE_Hanged, "HANGED")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual bool ignoreAtari(Piki*, Creature*);         // _20
	virtual bool throwable();                           // _54 (weak)
	virtual void onKeyEvent(const SysShape::KeyEvent&); // _74 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
};

struct PikiHipDropState : public PikiState {
	inline PikiHipDropState()
	    : PikiState(PIKISTATE_HipDrop, "HIPDROP")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void bounceCallback(Piki*, Sys::Triangle*);        // _24
	virtual void collisionCallback(Piki*, CollEvent&);         // _28
	virtual void platCallback(Piki*, PlatEvent&);              // _2C
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30

	void dosin(Piki*);
	void earthquake(Piki*);

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x8]; // _10, unknown
};

struct PikiHoleinState : public PikiState {
	inline PikiHoleinState()
	    : PikiState(PIKISTATE_Holein, "HOLEIN")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool invincible(Piki*);      // _40 (weak)
	virtual bool callable();             // _44 (weak)
	virtual bool soft_transittable(int); // _68 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x3C]; // _10, unknown
};

struct PikiKokeDamageState : public PikiState {
	inline PikiKokeDamageState()
	    : PikiState(PIKISTATE_KokeDamage, "KOKEDAMAGE")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)
	virtual void onFlute(Piki*, Navi*);                        // _6C

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0xC]; // _10, unknown
};

struct PikiKokeState : public PikiState {
	inline PikiKokeState()
	    : PikiState(PIKISTATE_Koke, "KOKE")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool callable();                                   // _44 (weak)
	virtual void onFlute(Piki*, Navi*);                        // _6C

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};

struct PikiLookAtState : public PikiState, virtual SysShape::MotionListener {
	inline PikiLookAtState()
	    : PikiState(PIKISTATE_LookAt, "LOOKAT")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual bool callable();                            // _44 (weak)
	virtual void onFlute(Piki*, Navi*);                 // _6C
	virtual void onKeyEvent(const SysShape::KeyEvent&); // _74 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x8]; // _10, unknown
};

struct PikiNukareState : public PikiState {
	inline PikiNukareState()
	    : PikiState(PIKISTATE_Nukare, "NUKARE")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool soft_transittable(int);                       // _68

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x8]; // _10, unknown
};

struct PikiPanicState : public PikiState {
	inline PikiPanicState()
	    : PikiState(PIKISTATE_Panic, "PANIC")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual void bounceCallback(Piki*, Sys::Triangle*);        // _24
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool transittable(int);                            // _64
	virtual bool soft_transittable(int);                       // _68
	virtual void onFlute(Piki*, Navi*);                        // _6C

	void panicRun(Piki*);
	void panicLobster(Piki*);

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x1C]; // _10, unknown
};

struct PikiPressedState : public PikiState {
	inline PikiPressedState()
	    : PikiState(PIKISTATE_Pressed, "PRESSED")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool dead();                 // _58 (weak)
	virtual bool pressable();            // _60 (weak)
	virtual bool transittable(int);      // _64
	virtual bool soft_transittable(int); // _68

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};

struct PikiSuikomiState : public PikiState {
	inline PikiSuikomiState()
	    : PikiState(PIKISTATE_Suikomi, "SUIKOMI")
	{
	}

	virtual void init(Piki*, StateArg*);                       // _08
	virtual void exec(Piki*);                                  // _0C
	virtual void cleanup(Piki*);                               // _10
	virtual bool ignoreAtari(Piki*, Creature*);                // _20
	virtual void onKeyEvent(Piki*, const SysShape::KeyEvent&); // _30
	virtual bool pressable();                                  // _60 (weak)

	void execMouth(Piki*);
	void execString(Piki*);
	void execStomach(Piki*);

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x14]; // _10, unknown
};

struct PikiSwallowedState : public PikiState {
	inline PikiSwallowedState()
	    : PikiState(PIKISTATE_Swallowed, "SWALLOWED")
	{
	}

	virtual void init(Piki*, StateArg*);        // _08
	virtual void exec(Piki*);                   // _0C
	virtual void cleanup(Piki*);                // _10
	virtual bool ignoreAtari(Piki*, Creature*); // _20 (weak)
	virtual bool callable();                    // _44 (weak)
	virtual bool dead();                        // _58 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
};

struct PikiTaneState : public PikiState {
	inline PikiTaneState()
	    : PikiState(PIKISTATE_Tane, "TANE")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual void bounceCallback(Piki*, Sys::Triangle*); // _24
	virtual bool callable();                            // _44 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x8]; // _10, unknown
};

struct PikiWalkState : public PikiState {
	inline PikiWalkState()
	    : PikiState(PIKISTATE_Walk, "WALK")
	{
	}

	virtual void init(Piki*, StateArg*); // _08
	virtual void exec(Piki*);            // _0C
	virtual void cleanup(Piki*);         // _10
	virtual bool callable();             // _44 (weak)
	virtual bool aiActive();             // _48 (weak)
	virtual bool dopable();              // _4C (weak)
	virtual bool releasable();           // _50 (weak)
	virtual bool throwable();            // _54 (weak)
	virtual bool battleOK();             // _5C (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
};

struct PikiWaterHangedState : public PikiState, virtual SysShape::MotionListener {
	inline PikiWaterHangedState()
	    : PikiState(PIKISTATE_WaterHanged, "WATERHANGED")
	{
	}

	virtual void init(Piki*, StateArg*);                // _08
	virtual void exec(Piki*);                           // _0C
	virtual void cleanup(Piki*);                        // _10
	virtual bool ignoreAtari(Piki*, Creature*);         // _20
	virtual bool throwable();                           // _54 (weak)
	virtual void onKeyEvent(const SysShape::KeyEvent&); // _74 (weak)

	// _00     = VTBL
	// _00-_10 = PikiState
	u8 _10[0x4]; // _10, unknown
};
} // namespace Game

#endif
