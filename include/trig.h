#ifndef _TRIG_H
#define _TRIG_H

#include "types.h"
#include "Vector3.h"
#include "JSystem/JMath.h"

#define TAU 6.2831855f

inline bool checkASinCosBounds(float x) { return (x >= -1.0f) && (x <= 1.0f); }

inline float pikmin2_sinf(float x)
{
	if (x < 0.0f) {
		return -JMath::sincosTable_.m_table[((int)(x *= -325.9493f) & 0x7ffU)].first;
	}
	return JMath::sincosTable_.m_table[((int)(x *= 325.9493f) & 0x7ffU)].first;
}

inline float pikmin2_cosf(float x)
{
	if (x < 0.0f) {
		x = -x;
	}
	return JMath::sincosTable_.m_table[((int)(x *= 325.9493f) & 0x7ffU)].second;
}

inline float pikmin2_acos(float x)
{
	if (x >= 1.0f) {
		return 0.0f;
	} else if (x <= -1.0f) {
		return PI;
	} else if (x < 0.0f) {
		float dumb = HALF_PI;
		float acos = JMath::asinAcosTable_.m_table[(u32)(-x * 1023.5f)];
		return acos + dumb;
	} else {
		return HALF_PI - JMath::asinAcosTable_.m_table[(u32)(x * 1023.5f)];
	}
}

#endif
