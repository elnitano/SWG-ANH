--This is to be used for static spawns that are NOT part of caves, cities, dungeons, poi's, or other large screenplays.
--Unless your name is nitan, then you don't care what the text above says.
Yavin4StaticSpawnsScreenPlay = ScreenPlay:new {
	screenplayName = "Yavin4StaticSpawnsScreenPlay",

	planet = "yavin4",

	mobiles = {
		-- Light Jedi Enclave (-5575, 4910)
		{"light_jedi_sentinel", 10, -5579.0, 87.7, 4908.5, -179, 0},
		{"light_jedi_sentinel", 10, -5572.6, 87.7, 4908.2, -179, 0},

		-- Dark Jedi Enclave (5068, 310)
		{"dark_jedi_sentinel", 10, 5074.2, 78.8, 313.9, 90, 0},
		{"dark_jedi_sentinel", 10, 5074.3, 79.2, 306.4, 90, 0},

		-- Yavin4 Ruins (-6299, -1502)
		{"crazed_geonosian_guard",300,-6299.1,24.7,-1502,0,0},
		{"crazed_geonosian_guard",300,-6299.1,25.6,-1506.4,179,0},
		{"crazed_geonosian_guard",300,-6302.1,24.9,-1504.2,-90,0},
		{"crazed_geonosian_guard",300,-6296.0,25.3,-1504.2,90,0},

		-- Captain Eso & Yith Seenath's base of operations (1591, 1536)
		{"rebel_commando", 360, 1595.0, 102.5, 1531.9, -40, 0},
		{"rebel_commando", 360, 1595.0, 102.5, 1530.4, -30, 0},
		{"rebel_commando", 360, 1597.8, 102.9, 1530.3, -37, 0},
		{"rebel_commando", 360, 1595.3, 102.7, 1527.8, -26, 0},

		-- Imp base camp outside Massassi Temple POI
		{"stormtrooper", 360, -3196.7, 69.6, -3139.5, -100, 0},
		{"stormtrooper", 360, -3195.8, 69.8, -3130.7, -104, 0}
	},

	wild_acklay_spawn = {
		{
			{ -6945, 4535},
			{ -5359, 154},
			{ -1507, 443}
		},
		{
			{ 6950, 4130},
			{ 6666, 1000},
			{ 6400, -2080}
		}
	}
}

registerScreenPlay("Yavin4StaticSpawnsScreenPlay", true)

function Yavin4StaticSpawnsScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
	end
end

function Yavin4StaticSpawnsScreenPlay:spawnMobiles()
	local mobiles = self.mobiles

	for i = 1, #mobiles do
		local mobile = mobiles[i]

		local pMobile = spawnMobile(self.planet, mobile[1], mobile[2], mobile[3], mobile[4], mobile[5], mobile[6], mobile[7])

		if pMobile ~= nil then
			AiAgent(pMobile):addCreatureFlag(AI_STATIC)
		end
	end

	self:spawnWildAcklay(nil, "1")
	self:spawnWildAcklay(nil, "2")
end

function Yavin4StaticSpawnsScreenPlay:spawnWildAcklay(notused, spawnArea)
	local wildArea = tonumber(spawnArea)

	local wildSpawnLocations = self.wild_acklay_spawn[wildArea]
	local randomSpawn = math.random(1,#wildSpawnLocations)

	local wildAcklayPos = wildSpawnLocations[randomSpawn]

	local randomXPos = wildAcklayPos[1] + math.random(-150, 150)
	local randomYPos = wildAcklayPos[2] + math.random(-150, 150)

	local randomSpawnPoint

	randomSpawnPoint = getSpawnPointInArea(self.planet, randomXPos, randomYPos, 0)

	if(randomSpawnPoint == nil) then
		randomSpawnPoint = getSpawnPoint(self.planet, randomXPos, randomYPost, 50, 50, true)
	end

	if(randomSpawnPoint == nil) then
		randomSpawnPoint = { randomXPos, 0, randomYPos}
	end


	local pwildAcklay = spawnMobile(self.planet, "acklay", 0, randomSpawnPoint[1], randomSpawnPoint[2], randomSpawnPoint[3], 0, 0)

	Logger:logEvent("Wild Acklay: No: " .. wildArea .. " ID " ..SceneObject(pwildAcklay):getObjectID() .. " Spawned at location: " .. randomSpawn .. " at X: " ..  randomXPos .. " Y: " .. randomYPos, LT_INFO)
	if (pwildAcklay ~= nil)  then
		local packlayGuard_1 = spawnMobile(self.planet, "enhanced_kliknik", 0, randomSpawnPoint[1] - 5, randomSpawnPoint[2], randomSpawnPoint[3] - 5, 0, 0)
		local packlayGuard_2 = spawnMobile(self.planet, "enhanced_kliknik", 0, randomSpawnPoint[1] - 5, randomSpawnPoint[2], randomSpawnPoint[3] + 5, 0, 0)
		local packlayGuard_3 = spawnMobile(self.planet, "enhanced_kliknik", 0, randomSpawnPoint[1] + 5, randomSpawnPoint[2], randomSpawnPoint[3] - 5, 0, 0)
		local packlayGuard_4 = spawnMobile(self.planet, "enhanced_kliknik", 0, randomSpawnPoint[1] + 5, randomSpawnPoint[2], randomSpawnPoint[3] + 5, 0, 0)

		if(wildArea == 1) then
			writeData("wild_acklay_1:spawn", SceneObject(pwildAcklay):getObjectID())

			if (packlayGuard_1 ~= nil) then writeData("wild_acklay_1:guard_1", SceneObject(packlayGuard_1):getObjectID()) end
			if (packlayGuard_2 ~= nil) then	writeData("wild_acklay_1:guard_2", SceneObject(packlayGuard_2):getObjectID())	end
			if (packlayGuard_3 ~= nil) then	writeData("wild_acklay_1:guard_3", SceneObject(packlayGuard_3):getObjectID())	end
			if (packlayGuard_4 ~= nil) then	writeData("wild_acklay_1:guard_4", SceneObject(packlayGuard_4):getObjectID())	end
		elseif(wildArea == 2) then
			writeData("wild_acklay_2:spawn", SceneObject(pwildAcklay):getObjectID())

			if (packlayGuard_1 ~= nil) then writeData("wild_acklay_2:guard_1", SceneObject(packlayGuard_1):getObjectID()) end
			if (packlayGuard_2 ~= nil) then	writeData("wild_acklay_2:guard_2", SceneObject(packlayGuard_2):getObjectID())	end
			if (packlayGuard_3 ~= nil) then	writeData("wild_acklay_2:guard_3", SceneObject(packlayGuard_3):getObjectID())	end
			if (packlayGuard_4 ~= nil) then	writeData("wild_acklay_2:guard_4", SceneObject(packlayGuard_4):getObjectID())	end
		end

		AiAgent(pwildAcklay):addCreatureFlag(AI_STATIC)

		if (packlayGuard_1 ~= nil) then
			AiAgent(packlayGuard_1):addCreatureFlag(AI_STATIC)
		end
		if (packlayGuard_1 ~= nil) then
			AiAgent(packlayGuard_2):addCreatureFlag(AI_STATIC)
		end
		if (packlayGuard_1 ~= nil) then
			AiAgent(packlayGuard_3):addCreatureFlag(AI_STATIC)
		end
		if (packlayGuard_1 ~= nil) then
			AiAgent(packlayGuard_4):addCreatureFlag(AI_STATIC)
		end

		createObserver(OBJECTDESTRUCTION, "Yavin4StaticSpawnsScreenPlay", "wildAcklayKilled", pwildAcklay)
	end
end

function Yavin4StaticSpawnsScreenPlay:wildAcklayKilled(pwildAcklay)
	local removeGuardTimer = 600000 -- 10 minutes
	--local removeGuardTimer = 30000 -- 30 seconds

	local pWildAcklay1_ID = readData("wild_acklay_1:spawn")
	local pWildAcklay2_ID = readData("wild_acklay_2:spawn")

	local pWildAcklay_ID = SceneObject(pwildAcklay):getObjectID()
	local pWildAcklayArea = 0

	local pAcklayGuard1_ID = 0
	local pAcklayGuard2_ID = 0
	local pAcklayGuard3_ID = 0
	local pAcklayGuard4_ID = 0

	if(pWildAcklay_ID == pWildAcklay1_ID) then
		pWildAcklayArea = 1
		deleteData("wild_acklay_1:spawn")

		pAcklayGuard1_ID = readData("wild_acklay_1:guard_1")
		pAcklayGuard2_ID = readData("wild_acklay_1:guard_2")
		pAcklayGuard3_ID = readData("wild_acklay_1:guard_3")
		pAcklayGuard4_ID = readData("wild_acklay_1:guard_4")
	elseif(pWildAcklay_ID == pWildAcklay2_ID) then
		pWildAcklayArea = 2
		deleteData("wild_acklay_2:spawn")

		pAcklayGuard1_ID = readData("wild_acklay_2:guard_1")
		pAcklayGuard2_ID = readData("wild_acklay_2:guard_2")
		pAcklayGuard3_ID = readData("wild_acklay_2:guard_3")
		pAcklayGuard4_ID = readData("wild_acklay_2:guard_4")
	end

	if(pAcklayGuard1_ID ~= 0) then
		local pAcklayGuard_1 = getSceneObject(pAcklayGuard1_ID)
		createEvent(removeGuardTimer, "Yavin4StaticSpawnsScreenPlay", "removeGuards", pAcklayGuard_1, "")
		if(pWildAcklayArea == 1) then deleteData("wild_acklay_1:guard_1") end
		if(pWildAcklayArea == 2) then deleteData("wild_acklay_2:guard_1") end
	end

	if(pAcklayGuard2_ID ~= 0) then
		local pAcklayGuard_2 = getSceneObject(pAcklayGuard2_ID)
		createEvent(removeGuardTimer, "Yavin4StaticSpawnsScreenPlay", "removeGuards", pAcklayGuard_2, "")
		if(pWildAcklayArea == 1) then deleteData("wild_acklay_1:guard_2") end
		if(pWildAcklayArea == 2) then deleteData("wild_acklay_2:guard_2") end
	end

	if(pAcklayGuard3_ID ~= 0) then
		local pAcklayGuard_3 = getSceneObject(pAcklayGuard3_ID)
		createEvent(removeGuardTimer, "Yavin4StaticSpawnsScreenPlay", "removeGuards", pAcklayGuard_3, "")
		if(pWildAcklayArea == 1) then deleteData("wild_acklay_1:guard_3") end
		if(pWildAcklayArea == 2) then deleteData("wild_acklay_2:guard_3") end
	end

	if(pAcklayGuard4_ID ~= 0) then
		local pAcklayGuard_4 = getSceneObject(pAcklayGuard4_ID)
		createEvent(removeGuardTimer, "Yavin4StaticSpawnsScreenPlay", "removeGuards", pAcklayGuard_4, "")
		if(pWildAcklayArea == 1) then deleteData("wild_acklay_1:guard_4") end
		if(pWildAcklayArea == 2) then deleteData("wild_acklay_2:guard_4") end
	end

	local randomSpawntimer
	local randomTimeSelector = math.random(1,3)
	local MinuteToMs = 60000
	--local MinuteToMs = 1000 --for test purposes
	if(randomTimeSelector == 1) then randomSpawnTimer = 60 * MinuteToMs
	elseif(randomTimeSelector == 2) then randomSpawnTimer = 90 * MinuteToMs
	elseif(randomTimeSelector == 3) then randomSpawnTimer = 120 * MinuteToMs end
	Logger:logEvent("Wild Acklay: Killed No: " .. pWildAcklayArea .. ", next respawn timer: " ..  randomSpawnTimer/60000 ..  " minutes", LT_INFO)
	createEvent(randomSpawnTimer, "Yavin4StaticSpawnsScreenPlay", "spawnWildAcklay", nil, tostring(pWildAcklayArea))

	return 1
end

function Yavin4StaticSpawnsScreenPlay:removeGuards(packlayGuard)
	if (packlayGuard ~= nil) then
		SceneObject(packlayGuard):destroyObjectFromWorld()
		SceneObject(packlayGuard):destroyObjectFromDatabase()
	end

	return 1
end
