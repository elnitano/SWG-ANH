/*
** Copyright (C) 2007-2019 SWGEmu
** See file COPYING for copying conditions.
*/
/*
 * ObserverImplementation.cpp
 *
 *  Created on: 20/06/2010
 *      Author: victor
 */

#include "Observer.h"

uint64 ObserverImplementation::getObjectID() {
	return _this.getReferenceUnsafeStaticCast()->_getObjectID();
}
