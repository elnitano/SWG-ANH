
#include "server/zone/managers/mission/DestroyMissionLairObserver.h"
#include "templates/mobile/LairTemplate.h"
#include "server/zone/objects/creature/ai/CreatureTemplate.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/managers/creature/CreatureTemplateManager.h"
#include "server/zone/managers/creature/LairAggroTask.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/ai/Creature.h"
#include "server/zone/objects/tangible/LairObject.h"

void DestroyMissionLairObserverImplementation::checkForHeal(TangibleObject* lair, TangibleObject* attacker, bool forceNewUpdate) {
	if (getMobType() == LairTemplate::NPC)
		return;

	LairObserverImplementation::checkForHeal(lair, attacker, forceNewUpdate);
}

bool DestroyMissionLairObserverImplementation::checkForNewSpawns(TangibleObject* lair, TangibleObject* attacker, bool forceSpawn) {
	Zone* zone = lair->getZone();

	if (zone == nullptr)
		return false;

	CreatureManager* creatureManager = zone->getCreatureManager();

	if (creatureManager == nullptr)
		return false;

	int spawnLimitAdjustment = 0;

	if (difficulty == 0) {
		spawnLimitAdjustment = -3;
	} else if (difficulty == 4) {
		spawnLimitAdjustment = 3;
	}

	int spawnLimit = lairTemplate->getSpawnLimit() + spawnLimitAdjustment;
	spawnLimitAdjustment = spawnLimit;

	LairObject* lairObject = cast<LairObject*>(lair);

	if (lairObject != nullptr && lairObject->isRepopulated())
		spawnLimit *= 2;

	if (forceSpawn) {
		spawnNumber.increment();
	} else if (getMobType() == LairTemplate::NPC) {
		return false;
	} else {
		if (spawnedCreatures.size() >= spawnLimit && !lairTemplate->hasBossMobs())
			return true;

		int conditionDamage = lair->getConditionDamage();
		int maxCondition = lair->getMaxCondition();

		switch (spawnNumber) {
		case 0:
			spawnNumber.increment();
			break;
		case 1:
			if (conditionDamage > (maxCondition / 10)) {
				spawnNumber.increment();
			} else {
				return false;
			}
			break;
		case 2:
			if (conditionDamage > (maxCondition / 2)) {
				spawnNumber.increment();
			} else {
				return false;
			}
			break;
		case 3:
			if (lairTemplate->hasBossMobs() && conditionDamage > ((maxCondition * 9) / 10)) {
				spawnNumber.increment();
			} else {
				return false;
			}
			break;
		default:
			return false;
			break;
		}
	}

	VectorMap<String, int> objectsToSpawn; // String mobileTemplate, int number to spawn

	if (spawnNumber == 4) {
		if (System::random(100) > 4)
			return false;

		const VectorMap<String, int>* mobs = lairTemplate->getBossMobiles();

		for (int i = 0; i < mobs->size(); i++) {
			objectsToSpawn.put(mobs->elementAt(i).getKey(), mobs->elementAt(i).getValue());
		}

	} else {
		const Vector<String>* mobiles = lairTemplate->getWeightedMobiles();
		int amountToSpawn = 0;

		if (getMobType() == LairTemplate::CREATURE) {
			amountToSpawn = spawnLimitAdjustment / 3;
		} else {
			amountToSpawn = System::random(2) + (spawnLimitAdjustment / 3);
		}

		if (amountToSpawn < 1)
			amountToSpawn = 1;

		for (int i = 0; i < amountToSpawn; i++) {
			int num = System::random(mobiles->size() - 1);
			const String& mob = mobiles->get(num);

			int find = objectsToSpawn.find(mob);

			if (find != -1) {
				int& value = objectsToSpawn.elementAt(find).getValue();

				++value;
			} else {
				objectsToSpawn.put(mob, 1);
			}
		}
	}

	uint32 lairTemplateCRC = getLairTemplateName().hashCode();

	for(int i = 0; i < objectsToSpawn.size(); ++i) {

		if (spawnNumber != 4 && spawnedCreatures.size() >= spawnLimit)
			return true;

		String templateToSpawn = objectsToSpawn.elementAt(i).getKey();
		int numberToSpawn = objectsToSpawn.elementAt(i).getValue();

		CreatureTemplate* creatureTemplate = CreatureTemplateManager::instance()->getTemplate(templateToSpawn);

		if (creatureTemplate == nullptr)
			continue;

		float tamingChance = creatureTemplate->getTame();

		for (int j = 0; j < numberToSpawn; j++) {
			if (lair->getZone() == nullptr)
				break;

			float x = lair->getPositionX() + (size - System::random(size * 20) / 10.0f);
			float y = lair->getPositionY() + (size - System::random(size * 20) / 10.0f);
			float z = zone->getHeight(x, y);

			ManagedReference<CreatureObject*> creo = nullptr;

			if (j > 0 && creatureManager->checkSpawnAsBaby(tamingChance, babiesSpawned, DestroyMissionLairObserver::BABY_SPAWN_CHANCE)) {
				creo = creatureManager->spawnCreatureAsBaby(templateToSpawn.hashCode(), x, z, y);
				babiesSpawned++;
			}

			if (creo == nullptr)
				creo = creatureManager->spawnCreatureWithAi(templateToSpawn.hashCode(), x, z, y);

			if (creo == nullptr)
				continue;

			if (!creo->isAiAgent()) {
				error("spawned non player creature with template " + templateToSpawn);
			} else {
				AiAgent* agent = cast<AiAgent*>(creo.get());

				Locker clocker(agent, lair);

				agent->setDespawnOnNoPlayerInRange(false);
				agent->setHomeLocation(x, z, y);
				agent->setRespawnTimer(0);
				agent->setHomeObject(lair);
				agent->setLairTemplateCRC(lairTemplateCRC);

				spawnedCreatures.add(creo);

				// Must be at least the baby and one other creature on the spawn to set a adult creature to social follow
				if (spawnedCreatures.size() > 1 && agent->isCreature()) {
					Creature* creature = cast<Creature*>(agent);

					if (creature != nullptr && creature->isBaby()) {
						ManagedReference<CreatureObject*> adultCreo = spawnedCreatures.get(0);

						if (adultCreo != nullptr && adultCreo->getObjectID() != creo->getObjectID()) {
							Locker adultLock(adultCreo, agent);

							agent->addCreatureFlag(CreatureFlag::ESCORT);
							agent->addCreatureFlag(CreatureFlag::FOLLOW);

							agent->setFollowObject(adultCreo);
							agent->setMovementState(AiAgent::FOLLOWING);

							agent->setAITemplate();

							Vector3 formationOffset;
							formationOffset.setX(2.0);
							agent->writeBlackboard("formationOffset", formationOffset);
						}
					}
				}
			}
		}
	}

	if (spawnNumber == 4) {
		Reference<LairAggroTask*> task = new LairAggroTask(lair, attacker, _this.getReferenceUnsafeStaticCast(), true);
		task->schedule(1000);
	}

	return objectsToSpawn.size() > 0;
}

