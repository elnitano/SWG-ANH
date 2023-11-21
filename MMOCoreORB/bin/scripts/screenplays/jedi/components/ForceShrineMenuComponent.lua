ForceShrineMenuComponent = {}

function ForceShrineMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (CreatureObject(pPlayer):hasSkill("force_title_jedi_novice")) then
		menuResponse:addRadialMenuItem(120, 3, "@jedi_trials:meditate") -- Meditate
	end

	if (CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02")) then
		menuResponse:addRadialMenuItem(121, 3, "@force_rank:recover_jedi_items") -- Recover Jedi Items
		-- Added fix for Jedi Knight Trial which can bug out for certain players!
		if (JediTrials:isEligibleForKnightTrials(pPlayer)) then
			menuResponse:addRadialMenuItem(122, 3, "My trial is bugged, fix me sensai! (!Resets Trial!)")
		end
	end

end

function ForceShrineMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	if (selectedID == 120 and CreatureObject(pPlayer):hasSkill("force_title_jedi_novice")) then
		if (CreatureObject(pPlayer):getPosture() ~= CROUCHED) then
			CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:show_respect") -- Must respect
		else
			self:doMeditate(pObject, pPlayer)
		end
	elseif (selectedID == 121 and CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02")) then
		self:recoverRobe(pPlayer)
	-- If menu is selected it forces a reset to the player!
	elseif (selectedID == 122 and CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02")) then
		if (CreatureObject(pPlayer):getPosture() ~= CROUCHED) then
			CreatureObject(pPlayer):sendSystemMessage("Well.. You want me to fix this?.. Show me some respect first youngling!") -- Must respect
		else
			if (JediTrials:isEligibleForKnightTrials(pPlayer)) then
				KnightTrials:resetCompletedTrialsToStart(pPlayer)
				CreatureObject(pPlayer):sendSystemMessage("Your trial data has been reset!")
				self:doMeditate(pObject, pPlayer)
			else
				CreatureObject(pPlayer):sendSystemMessage("You've already completed the Trials, or you're still a youngling!")
			end
		end
	end

	return 0
end

function ForceShrineMenuComponent:doMeditate(pObject, pPlayer)
	if (tonumber(readScreenPlayData(pPlayer, "KnightTrials", "completedTrials")) == 1 and not CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_03")) then
		KnightTrials:resetCompletedTrialsToStart(pPlayer)
	end
	if (not CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02")) then
		local pGhost = CreatureObject(pPlayer):getPlayerObject()

		if (pGhost == nil) then
			return
		end
		
		local suiManager = LuaSuiManager()
		suiManager:sendMessageBox(pPlayer, pPlayer, "@quest/force_sensitive/intro:force_sensitive", "Your attunement to the force has not gone unnoticed. A strange force lightning struck you, and you're now elegible to train Jedi. Be mindful of your surroundings, you're a target now for certain professions.", "@ok", "HologrindJediManager", "notifyOkPressed")
		
		PlayerObject(pGhost):setJediState(2)

		awardSkill(pPlayer, "force_title_jedi_rank_02")
		
		CreatureObject(pPlayer):playEffect("clienteffect/trap_electric_01.cef", "")
		CreatureObject(pPlayer):playMusicMessage("sound/music_become_jedi.snd")
		
		local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
			CreatureObject(pCreatureObject):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
		else
			local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
			local pItem = giveItem(pInventory, "object/tangible/wearables/robe/robe_jedi_padawan.iff", -1)
		end
	elseif (JediTrials:isOnKnightTrials(pPlayer)) then
		local pPlayerShrine = KnightTrials:getTrialShrine(pPlayer)

		if (pPlayerShrine ~= nil and pObject ~= pPlayerShrine) then
			local correctShrineZone = SceneObject(pPlayerShrine):getZoneName()
			if (correctShrineZone ~= SceneObject(pObject):getZoneName()) then
				local messageString = LuaStringIdChatParameter("@jedi_trials:knight_shrine_reminder")
				messageString:setTO(getStringId("@jedi_trials:" .. correctShrineZone))
				CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())
			else
				CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:knight_shrine_wrong")
			end
			return
		end

		local currentTrial = JediTrials:getCurrentTrial(pPlayer)
		local trialsCompleted = JediTrials:getTrialsCompleted(pPlayer)

		if (currentTrial == 0 and trialsCompleted == 0) then
			local sui = SuiMessageBox.new("KnightTrials", "startNextKnightTrial")
			sui.setTitle("@jedi_trials:knight_trials_title")
			sui.setPrompt("@jedi_trials:knight_trials_start_query")
			sui.setOkButtonText("@jedi_trials:button_yes")
			sui.setCancelButtonText("@jedi_trials:button_no")
			sui.sendTo(pPlayer)
		else
			KnightTrials:showCurrentTrial(pPlayer)
		end
	else
		CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:force_shrine_wisdom_" .. getRandomNumber(1, 15))
	end
end

function ForceShrineMenuComponent:recoverRobe(pPlayer)
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
		return
	end

	local robeTemplate
	if (CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_03")) then
		local councilType = JediTrials:getJediCouncil(pPlayer)

		if (councilType == JediTrials.COUNCIL_LIGHT) then
			robeTemplate = "object/tangible/wearables/robe/robe_jedi_light_s01.iff"
		else
			robeTemplate = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff"
		end
	else
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_padawan.iff"
	end

	giveItem(pInventory, robeTemplate, -1)
	CreatureObject(pPlayer):sendSystemMessage("@force_rank:items_recovered")
end
