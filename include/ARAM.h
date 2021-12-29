#ifndef _ARAM_H
#define _ARAM_H

#include "JSystem/JKR/JKRDvdRipper.h"
#include "types.h"

namespace ARAM {
struct Node : CNode {
	inline Node();
	~Node();

	inline int dvdToAram(char const*, bool);
	inline void aramToMainRam(unsigned char*, unsigned long, unsigned long,
	                          JKRExpandSwitch, unsigned long, JKRHeap*,
	                          JKRDvdRipper::EAllocDirection, int,
	                          unsigned long*);
	inline void dump();

	u32 m_status; // _18
};

struct Mgr {
	Mgr();

	static void init();
	u32 dvdToAram(char const*, bool);
	Node* search(char const* name);

	CNode m_node; // _00
};
}; // namespace ARAM
extern ARAM::Mgr* gAramMgr;

#endif
