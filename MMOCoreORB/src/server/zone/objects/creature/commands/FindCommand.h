/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef FINDCOMMAND_H_
#define FINDCOMMAND_H_

#include "server/zone/objects/player/sessions/FindSession.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"

class FindCommand: public QueueCommand {

public:

	FindCommand(const String& name, ZoneProcessServer* server) :
		QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		try {

			CreatureObject* player = cast<CreatureObject*>(creature);
			StringTokenizer args(arguments.toString());
			String location;

			ManagedReference<Facade*> facade = player->getActiveSession(SessionFacadeType::FIND);
			ManagedReference<FindSession*> session = dynamic_cast<FindSession*>(facade.get());

			if (session == nullptr) {
				session = new FindSession(player);
			}

			if (args.hasMoreTokens()) {
				args.getStringToken(location);
				location = location.toLowerCase();

				if (location == "clear") {
					PlayerObject* po = player->getPlayerObject();

					po->removeWaypointBySpecialType(WaypointObject::SPECIALTYPE_FIND, true);

					return SUCCESS;
				}else if (location == "lots") {

					return getLots(creature);
				}
				String mapLocType = location;

				if (!mapLocType.isEmpty())
					session->findPlanetaryObject(mapLocType);

			} else {
				session->initalizeFindMenu();
				return SUCCESS;
			}

		} catch (Exception& e) {
			creature->sendSystemMessage("@base_player:find_general_error"); // /Find was unable to complete your request. Please try again.

		}

		return SUCCESS;
	}

	int getLots(CreatureObject* creature) const {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int lotsRemaining = ghost->getLotsRemaining();

		StringBuffer body;

		body << "Player Name:\t" << creature->getFirstName() << endl;
		body << "Unused Lots:\t" << String::valueOf(lotsRemaining) << endl << endl;
		body << "Player Structures:";

		for (int i = 0; i < ghost->getTotalOwnedStructureCount(); i++) {
			ManagedReference<StructureObject*> structure = creature->getZoneServer()->getObject(ghost->getOwnedStructure(i)).castTo<StructureObject*>();

			int num = i + 1;
			body << endl << String::valueOf(num) << ". ";

			if (structure == nullptr) {
				body << "nullptr Structure" << endl << endl;
				continue;
			}

			String buildingName = structure->getDisplayedName();

			while (buildingName.contains("\\#")) {
				int nameIndex = buildingName.indexOf("\\#");
				String sub = "\\" + buildingName.subString(nameIndex, nameIndex + 2);
				buildingName = buildingName.replaceFirst(sub,"");
			}

			body << "    Name:\t" << buildingName << endl;
			body << "    Type:\t" << structure->getObjectTemplate()->getFullTemplateString() << endl;
			body << "    Lots:\t" << String::valueOf(structure->getLotSize()) << endl;
			body << "    Remaining Maintenance:\t" << String::valueOf(structure->getSurplusMaintenance()) << endl;

			if (structure->getBasePowerRate() > 0) {
				body << "    Remaining Power:\t" << String::valueOf(structure->getSurplusPower()) << endl;
			}

			body << "    Zone:\t";
			Zone* zone = structure->getZone();
			if (zone == nullptr) {
				body << "nullptr" << endl;
			} else {
				body << zone->getZoneName() << endl;
				body << "    World Position:\t" << structure->getWorldPositionX() << ", " << structure->getWorldPositionY() << endl;
			}
		}

		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, 0);
		box->setPromptTitle("Lots for " + creature->getFirstName());
		box->setPromptText(body.toString());
		box->setUsingObject(ghost);
		box->setForceCloseDisabled();

		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());

		return SUCCESS;
	}

};

#endif //FINDCOMMAND_H_
