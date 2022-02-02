#ifndef _GAME_ENTITIES_KOGANE_H
#define _GAME_ENTITIES_KOGANE_H

#include "Game/EnemyAnimatorBase.h"

namespace Game {
namespace Kogane {
struct ProperAnimator : public EnemyAnimatorBase {
	virtual ~ProperAnimator() {};                                     // _00
	virtual void setAnimMgr(SysShape::AnimMgr*);                      // _04
	virtual SysShape::Animator& getAnimator() { return m_animator; }; // _08
	virtual SysShape::Animator& getAnimator(int);                     // _0C

	SysShape::Animator m_animator; // _10
};
} // namespace Kogane
} // namespace Game

#endif
