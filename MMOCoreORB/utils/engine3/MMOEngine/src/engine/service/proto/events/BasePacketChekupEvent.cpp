/*
** Copyright (C) 2007-2019 SWGEmu
** See file COPYING for copying conditions.
*/


#include "BasePacketChekupEvent.h"

#include "engine/service/proto/BasePacket.h"
#include "engine/service/proto/BaseClient.h"

BasePacketChekupEvent::BasePacketChekupEvent(BaseClient* cl, uint32 time, uint32 minTime, uint32 maxTime) : Task(time) {
	client = cl;
	checkupTime = time;
	minCheckupTime = minTime;
	maxCheckupTime = maxTime;
	lastUpdateTimeStamp.updateToCurrentTime(Time::MONOTONIC_TIME);

#if defined(BASECLIENT_DISABLE_STATSD) and defined(COLLECT_TASKSTATISTICS)
	setStatsSample(0);
#endif
}

void BasePacketChekupEvent::run() {
	Reference<BaseClient*> client = this->client.get();

	if (client != nullptr)
		client->checkupServerPackets(packet);
}
