JediManager = require("managers.jedi.jedi_manager")
local ObjectManager = require("managers.object.object_manager")

jediManagerName = "HologrindJediManager"

NUMBEROFPROFESSIONSTOMASTER = 5
MAXIMUMNUMBEROFPROFESSIONSTOSHOWWITHHOLOCRON = 0

HologrindJediManager = JediManager:new {
	screenplayName = jediManagerName,
	jediManagerName = jediManagerName,
	jediProgressionType = HOLOGRINDJEDIPROGRESSION,
	startingEvent = nil,
}

-- Return a list of all professions and their badge number that are available for the hologrind
-- @return a list of professions and their badge numbers.
function HologrindJediManager:getGrindableProfessionList()
	local grindableProfessions = {
		-- String Id, badge number, profession name
		{ "crafting_architect_master", 		CRAFTING_ARCHITECT_MASTER  }, 		--1
		{ "crafting_armorsmith_master", 	CRAFTING_ARMORSMITH_MASTER  },  	--2
		{ "crafting_artisan_master", 		CRAFTING_ARTISAN_MASTER  },		--3
		{ "outdoors_bio_engineer_master", 	OUTDOORS_BIOENGINEER_MASTER  },		--4
		{ "combat_bountyhunter_master", 	COMBAT_BOUNTYHUNTER_MASTER  },		--5
		{ "combat_brawler_master", 		COMBAT_BRAWLER_MASTER  },		--6
		{ "combat_carbine_master", 		COMBAT_CARBINE_MASTER  },		--7
		{ "crafting_chef_master", 		CRAFTING_CHEF_MASTER  },		--8
		{ "science_combatmedic_master", 	SCIENCE_COMBATMEDIC_MASTER  },		--9
		{ "combat_commando_master", 		COMBAT_COMMANDO_MASTER  },		--10
		{ "outdoors_creaturehandler_master", 	OUTDOORS_CREATUREHANDLER_MASTER  },	--11
		{ "social_dancer_master", 		SOCIAL_DANCER_MASTER  },		--12
		{ "science_doctor_master", 		SCIENCE_DOCTOR_MASTER  },		--13
		{ "crafting_droidengineer_master", 	CRAFTING_DROIDENGINEER_MASTER  },	--14
		{ "social_entertainer_master", 		SOCIAL_ENTERTAINER_MASTER  },		--15
		{ "combat_1hsword_master", 		COMBAT_1HSWORD_MASTER  },		--16
		{ "social_imagedesigner_master", 	SOCIAL_IMAGEDESIGNER_MASTER  },		--17
		{ "combat_marksman_master", 		COMBAT_MARKSMAN_MASTER  },		--18
		{ "science_medic_master", 		SCIENCE_MEDIC_MASTER  },		--19
		{ "crafting_merchant_master", 		CRAFTING_MERCHANT_MASTER  },		--20
		{ "social_musician_master", 		SOCIAL_MUSICIAN_MASTER  },		--21
		{ "combat_polearm_master", 		COMBAT_POLEARM_MASTER  },		--22
		{ "combat_pistol_master", 		COMBAT_PISTOL_MASTER  },		--23
		{ "outdoors_ranger_master", 		OUTDOORS_RANGER_MASTER  },		--24
		{ "combat_rifleman_master", 		COMBAT_RIFLEMAN_MASTER  },		--25
		{ "outdoors_scout_master", 		OUTDOORS_SCOUT_MASTER  },		--26
		{ "combat_smuggler_master", 		COMBAT_SMUGGLER_MASTER  },		--27
		{ "outdoors_squadleader_master", 	OUTDOORS_SQUADLEADER_MASTER  },		--28
		{ "combat_2hsword_master", 		COMBAT_2HSWORD_MASTER  },		--29
		{ "crafting_tailor_master", 		CRAFTING_TAILOR_MASTER  },		--30
		{ "crafting_weaponsmith_master", 	CRAFTING_WEAPONSMITH_MASTER  },		--31
		{ "combat_unarmed_master", 		COMBAT_UNARMED_MASTER  },		--32
	}
	return grindableProfessions
end

-- Handling of the onPlayerCreated event.
-- Hologrind professions will be generated for the player.
-- @param pCreatureObject pointer to the creature object of the created player.
function HologrindJediManager:onPlayerCreated(pCreatureObject)
	local skillList = self:getGrindableProfessionList()

	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	for i = 1, NUMBEROFPROFESSIONSTOMASTER, 1 do
		local numberOfSkillsInList = #skillList
		local skillNumber = getRandomNumber(1, numberOfSkillsInList)
		PlayerObject(pGhost):addHologrindProfession(skillList[skillNumber][2])
		table.remove(skillList, skillNumber)
	end
end

-- Check and count the number of mastered hologrind professions.
-- @param pCreatureObject pointer to the creature object of the player which should get its number of mastered professions counted.
-- @return the number of mastered hologrind professions.
function HologrindJediManager:getNumberOfMasteredProfessions(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return 0
	end

	local professions = PlayerObject(pGhost):getHologrindProfessions()
	local masteredNumberOfProfessions = 0
	for i = 1, #professions, 1 do
		if PlayerObject(pGhost):hasBadge(professions[i]) then
			masteredNumberOfProfessions = masteredNumberOfProfessions + 1
		end
	end
	return masteredNumberOfProfessions
end

-- Check if the player is jedi.
-- @param pCreatureObject pointer to the creature object of the player to check if he is jedi.
-- @return returns if the player is jedi or not.
function HologrindJediManager:isJedi(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):isJedi()
end

-- Sui window ok pressed callback function.
function HologrindJediManager:notifyOkPressed()
-- Do nothing.
end

-- Send a sui window to the player about unlocking jedi and award jedi status and force sensitive skill.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function HologrindJediManager:sendSuiWindow(pCreatureObject)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(pCreatureObject, pCreatureObject, "@quest/force_sensitive/intro:force_sensitive", "Perhaps you should meditate somewhere alone...", "@ok", "HologrindJediManager", "notifyOkPressed")
end

-- Award skill and jedi status to the player.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function HologrindJediManager:awardJediStatusAndSkill(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):setJediState(2)

	awardSkill(pCreatureObject, "force_title_jedi_rank_02")
	
	CreatureObject(pCreatureObject):playEffect("clienteffect/trap_electric_01.cef", "")
	CreatureObject(pCreatureObject):playMusicMessage("sound/music_become_jedi.snd")
	
	local pInventory = SceneObject(pCreatureObject):getSlottedObject("inventory")

	if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pCreatureObject):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
	else
		local pInventory = CreatureObject(pCreatureObject):getSlottedObject("inventory")
		local pItem = giveItem(pInventory, "object/tangible/wearables/robe/robe_jedi_padawan.iff", -1)
	end
end

-- Check if the player has mastered all hologrind professions and send sui window and award skills.
-- @param pCreatureObject pointer to the creature object of the player to check the jedi progression on.
function HologrindJediManager:checkIfProgressedToJedi(pCreatureObject)
	if self:getNumberOfMasteredProfessions(pCreatureObject) >= NUMBEROFPROFESSIONSTOMASTER and not self:isJedi(pCreatureObject) then
		self:sendSuiWindow(pCreatureObject)
		self:awardJediStatusAndSkill(pCreatureObject)
	end
end

-- Event handler for the BADGEAWARDED event.
-- @param pCreatureObject pointer to the creature object of the player who was awarded with a badge.
-- @param pCreatureObject2 pointer to the creature object of the player who was awarded with a badge.
-- @param badgeNumber the badge number that was awarded.
-- @return 0 to keep the observer active.
function HologrindJediManager:badgeAwardedEventHandler(pCreatureObject, pCreatureObject2, badgeNumber)
	if (pCreatureObject == nil) then
		return 0
	end

	self:checkIfProgressedToJedi(pCreatureObject)

	return 0
end

-- Register observer on the player for observing badge awards.
-- @param pCreatureObject pointer to the creature object of the player to register observers on.
function HologrindJediManager:registerObservers(pCreatureObject)
	createObserver(BADGEAWARDED, "HologrindJediManager", "badgeAwardedEventHandler", pCreatureObject)
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pCreatureObject pointer to the creature object of the player who logged in.
function HologrindJediManager:onPlayerLoggedIn(pCreatureObject)
	if (pCreatureObject == nil) then
		return
	end

	self:checkIfProgressedToJedi(pCreatureObject)
	self:registerObservers(pCreatureObject)
end

-- Get the profession name from the badge number.
-- @param badgeNumber the badge number to find the profession name for.
-- @return the profession name associated with the badge number, Unknown profession returned if the badge number isn't found.
function HologrindJediManager:getProfessionStringIdFromBadgeNumber(badgeNumber)
	local skillList = self:getGrindableProfessionList()
	for i = 1, #skillList, 1 do
		if skillList[i][2] == badgeNumber then
			return skillList[i][1]
		end
	end
	return "Unknown profession"
end

-- Find out and send the response from the holocron to the player
-- @param pCreatureObject pointer to the creature object of the player who used the holocron.
function HologrindJediManager:sendHolocronMessage(pCreatureObject)
	if self:getNumberOfMasteredProfessions(pCreatureObject) >= MAXIMUMNUMBEROFPROFESSIONSTOSHOWWITHHOLOCRON then
		-- The Holocron is quiet. The ancients' knowledge of the Force will no longer assist you on your journey. You must continue seeking on your own.
		CreatureObject(pCreatureObject):sendSystemMessage("@jedi_spam:holocron_quiet")
		return true
	else
		local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

		if (pGhost == nil) then
			return false
		end

		local professions = PlayerObject(pGhost):getHologrindProfessions()
		for i = 1, #professions, 1 do
			if not PlayerObject(pGhost):hasBadge(professions[i]) then
				local professionText = self:getProfessionStringIdFromBadgeNumber(professions[i])
				CreatureObject(pCreatureObject):sendSystemMessageWithTO("@jedi_spam:holocron_light_information", "@skl_n:" .. professionText)
			end
		end

		return false
	end
end

-- Handling of the useItem event.
-- @param pSceneObject pointer to the item object.
-- @param itemType the type of item that is used.
-- @param pCreatureObject pointer to the creature object that used the item.
function HologrindJediManager:useItem(pSceneObject, itemType, pCreatureObject)
	if (pCreatureObject == nil or pSceneObject == nil) then
		return
	end

	if itemType == ITEMHOLOCRON then
		local isSilent = self:sendHolocronMessage(pCreatureObject)
		if isSilent then
			return
		else
			SceneObject(pSceneObject):destroyObjectFromWorld()
			SceneObject(pSceneObject):destroyObjectFromDatabase()
		end
	end
end

function HologrindJediManager:canLearnSkill(pPlayer, skillName)
	return true
end

registerScreenPlay("HologrindJediManager", true)

return HologrindJediManager
