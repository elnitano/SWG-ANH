-- Allows players to choose a mission level range, regardless of their own CL/Group Level

mission_level_choice = ScreenPlay:new {
	numberOfActs = 1,

	levels = {
		{levelRange = "Reset Level Range", levelSelect = 0},
		{levelRange = "Level 5-10", levelSelect = 1},
		{levelRange = "Level 10-20", levelSelect = 5},
		{levelRange = "Level 20-35", levelSelect = 10},
		{levelRange = "Level 30-50", levelSelect = 15},
		{levelRange = "Level 40-55", levelSelect = 20},
	}
}

function mission_level_choice:start()

end

function mission_level_choice:openWindow(pPlayer)
	if (pPlayer == nil) then
		return
	end

	self:showLevels(pPlayer)
end

function mission_level_choice:showLevels(pPlayer)

	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local sui = SuiListBox.new("mission_level_choice", "levelSelection") -- calls levelSelection on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Mission Level Selection")

	local promptText = "Use this menu to select a mission level range to aim for.  After you have chosen, use the mission terminal to get a selection of missions (if any exist) within that range.  \n\nIf no missions are offered to you, it is because no missions in that level range exist for this planet.  You will need to choose another range.\n\nWhen you want to go back to the 'normal' offering of missions for your skill level/group level, just choose Reset Level Range."

	sui.setPrompt(promptText)

	for i = 1,  #self.levels, 1 do
		sui.add(self.levels[i].levelRange, "")
	end

	sui.sendTo(pPlayer)
end

function  mission_level_choice:levelSelection(pPlayer, pSui, eventIndex, args)

	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return 
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No level was selected...")
		return
	end

	local selectedLevelIndex = tonumber(args)+1

	local selectedLevel = self.levels[selectedLevelIndex].levelSelect
	local selectedRange = self.levels[selectedLevelIndex].levelRange
	
	writeScreenPlayData(pPlayer, "mission_level_choice", "levelChoice", selectedLevel) 

	if (tonumber(selectedLevel) == 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have selected: " .. selectedRange .. ".  You may now choose missions suited to your own skill/group level.")
	else	
		CreatureObject(pPlayer):sendSystemMessage("You have selected: " .. selectedRange .. ".  These missions would be considered suitable for a player or group of level " .. selectedLevel .. ".")

	end

end
