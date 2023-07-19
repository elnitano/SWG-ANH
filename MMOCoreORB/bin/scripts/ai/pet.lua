attackPet = {
	{id="2571844594",	name="Sequence",	pid="none"},
	{id="2163088287",	name="Not",	pid="2571844594"},
	{id="2896823263",	name="If",	pid="2163088287"},
	{id="1728581678",	name="CheckQueueSize",	pid="2896823263"},
	{id="3278792310",	name="Not",	pid="2571844594"},
	{id="737775493",	name="If",	pid="3278792310"},
	{id="3177206211",	name="CheckIsSwimming",	pid="737775493"},
	{id="3131619822",	name="RandomSelector",	pid="2571844594"},
	{id="1207017249",	name="WriteBlackboard",	pid="3131619822",	args={val=DEFAULT, key="attackType"}},
	{id="2663427717",	name="WriteBlackboard",	pid="3131619822",	args={val=DEFAULT, key="attackType"}},
	{id="1934836801",	name="WriteBlackboard",	pid="3131619822",	args={val=DEFAULT, key="attackType"}},
	{id="3605243030",	name="EraseBlackboard",	pid="3131619822",	args={param="attackType"}},
	{id="1167360521",	name="Sequence",	pid="2571844594"},
	{id="2057152981",	name="Sequence",	pid="1167360521"},
	{id="1765222686",	name="SelectAttack",	pid="2057152981",	args={attackNum=-1}},
	{id="3468400432",	name="If",	pid="2057152981"},
	{id="2285109384",	name="CheckAttackInRange",	pid="3468400432"},
	{id="3399948101",	name="If",	pid="2057152981"},
	{id="1739021609",	name="CheckAttackIsValid",	pid="3399948101"},
	{id="2496815121",	name="EnqueueAttack",	pid="2057152981"},
	{id="2125538853",	name="AlwaysSucceed",	pid="2057152981"},
	{id="288387210",	name="Sequence",	pid="2125538853"},
	{id="607631489",	name="If",	pid="288387210"},
	{id="3101412556",	name="CheckIsType",	pid="607631489",	args={condition=NPCTYPE}},
	{id="257014571",	name="SetAttackPosture",	pid="288387210"}}
addAiTemplate("attackPet", attackPet)

awarePet = {
	{id="2672408205",	name="Sequence",	pid="none"},
	{id="2428980616",	name="Not",	pid="2672408205"},
	{id="502701510",	name="If",	pid="2428980616"},
	{id="1498311304",	name="CheckIsInCombat",	pid="502701510"},
	{id="3748783887",	name="Not",	pid="2672408205"},
	{id="2777768044",	name="If",	pid="3748783887"},
	{id="2342952551",	name="CheckPetCommand",	pid="2777768044",	args={condition=PET_STAY}},
	{id="2624621770",	name="Not",	pid="2672408205"},
	{id="1629721978",	name="If",	pid="2624621770"},
	{id="854873693",	name="CheckMovementState",	pid="1629721978",	args={condition=PATROLLING}},
	{id="308986874",	name="Selector",	pid="2672408205"},
	{id="1334114988",	name="Sequence",	pid="308986874"},
	{id="433055137",	name="If",	pid="1334114988"},
	{id="3404289191",	name="CheckOwnerInRange",	pid="433055137",	args={condition=128.0}},
	{id="2381505880",	name="PetReturn",	pid="1334114988"},
	{id="3351684077",	name="SetMovementState",	pid="308986874",	args={state=FOLLOWING}},
	{id="303550960",	name="WriteBlackboard",	pid="2672408205",	args={val=RUN, key="moveMode"}},
	{id="559248213",	name="TreeSocket",	pid="2672408205",	args={slot=MOVE}}}
addAiTemplate("awarePet", awarePet)

equipPet = {
	{id="1108669613",	name="ParallelSequence",	pid="none"},
	{id="3049624129",	name="Sequence",	pid="1108669613"},
	{id="2950077037",	name="UpdateRangeToFollow",	pid="3049624129"},
	{id="3546972795",	name="Selector",	pid="3049624129"},
	{id="2776432698",	name="Sequence",	pid="3546972795"},
	{id="1603391341",	name="If",	pid="2776432698"},
	{id="3213921771",	name="CheckUseRanged",	pid="1603391341"},
	{id="1222896912",	name="If",	pid="2776432698"},
	{id="2306750106",	name="CheckHasRangedWeapon",	pid="1222896912"},
	{id="999404112",	name="WriteBlackboard",	pid="2776432698",	args={val=PRIMARYWEAPON, key="stagedWeapon"}},
	{id="304867271",	name="Sequence",	pid="3546972795"},
	{id="2705953215",	name="If",	pid="304867271"},
	{id="2625132548",	name="CheckHasMeleeWeapon",	pid="2705953215"},
	{id="142157700",	name="WriteBlackboard",	pid="304867271",	args={val=SECONDARYWEAPON, key="stagedWeapon"}},
	{id="1951510850",	name="WriteBlackboard",	pid="3546972795",	args={val=PRIMARYWEAPON, key="stagedWeapon"}},
	{id="3132206392",	name="EquipStagedWeapon",	pid="3049624129"},
	{id="50350698",	name="EraseBlackboard",	pid="1108669613",	args={param="stagedWeapon"}},
	{id="3927914430",	name="EraseBlackboard",	pid="1108669613",	args={param="followRange"}}}
addAiTemplate("equipPet", equipPet)

harvestPet = {
	{id="1067142705",	name="Sequence",	pid="none"},
	{id="4118537921",	name="Not",	pid="1067142705"},
	{id="1280510381",	name="If",	pid="4118537921"},
	{id="4057328645",	name="CheckIsInCombat",	pid="1280510381"},
	{id="3285446615",	name="If",	pid="1067142705"},
	{id="81979381",	name="CheckIsDroid",	pid="3285446615"},
	{id="3275634488",	name="If",	pid="1067142705"},
	{id="1696967841",	name="CheckIsHarvester",	pid="3275634488"},
	{id="3273106585",	name="If",	pid="1067142705"},
	{id="1682748011",	name="CheckHasHarvestTargets",	pid="3273106585"},
	{id="3307465105",	name="DroidHarvest",	pid="1067142705"},
	{id="933872980",	name="TreeSocket",	pid="1067142705",	args={slot=MOVE}}}
addAiTemplate("harvestPet", harvestPet)

idlePet = {
	{id="2602839395",	name="Selector",	pid="none"},
	{id="1196938563",	name="Sequence",	pid="2602839395"},
	{id="2159332246",	name="If",	pid="1196938563"},
	{id="2297306633",	name="CheckMovementState",	pid="2159332246",	args={condition=PATROLLING}},
	{id="2901314389",	name="WriteBlackboard",	pid="1196938563",	args={val=WALK, key="moveMode"}},
	{id="3579768154",	name="TreeSocket",	pid="1196938563",	args={slot=MOVE}},
	{id="3694282813",	name="Wait",	pid="1196938563",	args={duration=5.0}},
	{id="673054985",	name="AlwaysSucceed",	pid="1196938563"},
	{id="3420280652",	name="Sequence",	pid="673054985"},
	{id="700494132",	name="Not",	pid="3420280652"},
	{id="983575004",	name="If",	pid="700494132"},
	{id="3966243347",	name="CheckHasPatrol",	pid="983575004"},
	{id="4116302239",	name="RestorePetPatrols",	pid="3420280652"},
	{id="4089440207",	name="Sequence",	pid="2602839395"},
	{id="4147395704",	name="Not",	pid="4089440207"},
	{id="3397268825",	name="If",	pid="4147395704"},
	{id="1418550182",	name="CheckPetCommand",	pid="3397268825",	args={condition=PET_STAY}},
	{id="1539366576",	name="If",	pid="4089440207"},
	{id="1266622134",	name="CheckDestination",	pid="1539366576",	args={condition=0.0}},
	{id="4036559077",	name="WriteBlackboard",	pid="4089440207",	args={val=RUN, key="moveMode"}},
	{id="5946488",	name="AlwaysSucceed",	pid="4089440207"},
	{id="1805516334",	name="TreeSocket",	pid="5946488",	args={slot=MOVE}},
	{id="691694066",	name="Sequence",	pid="2602839395"},
	{id="27856860",	name="If",	pid="691694066"},
	{id="3534465851",	name="CheckPetCommand",	pid="27856860",	args={condition=PET_STAY}},
	{id="3007878385",	name="If",	pid="691694066"},
	{id="855976028",	name="CheckRetreat",	pid="3007878385",	args={condition=5}},
	{id="1430990324",	name="WriteBlackboard",	pid="691694066",	args={val=RUN, key="moveMode"}},
	{id="3088088980",	name="Leash",	pid="691694066"},
	{id="3026536590",	name="TreeSocket",	pid="691694066",	args={slot=MOVE}}}
addAiTemplate("idlePet", idlePet)

movePet = {
	{id="3554620412",	name="Selector",	pid="none"},
	{id="5634087",	name="Not",	pid="3554620412"},
	{id="2198896283",	name="Sequence",	pid="5634087"},
	{id="803210878",	name="If",	pid="2198896283"},
	{id="2465258569",	name="CheckPosture",	pid="803210878",	args={condition=UPRIGHT}},
	{id="3810468866",	name="If",	pid="2198896283"},
	{id="2565025743",	name="CheckDestination",	pid="3810468866",	args={condition=0.0}},
	{id="3808575642",	name="Sequence",	pid="3554620412"},
	{id="2714566339",	name="Not",	pid="3808575642"},
	{id="1610732848",	name="If",	pid="2714566339"},
	{id="580291233",	name="CheckOwnerInRange",	pid="1610732848",	args={condition=128.0}},
	{id="2044240713",	name="AlwaysFail",	pid="3808575642"},
	{id="2024110586",	name="PetReturn",	pid="2044240713"},
	{id="4111934468",	name="FindNextPosition",	pid="3554620412"}}
addAiTemplate("movePet", movePet)

rootPet = {
	{id="1392695167",	name="Selector",	pid="none"},
	{id="1145947200",	name="Sequence",	pid="1392695167"},
	{id="237728831",	name="If",	pid="1145947200"},
	{id="1833272288",	name="CheckIsInCombat",	pid="237728831"},
	{id="3540658805",	name="Not",	pid="1145947200"},
	{id="2406229846",	name="If",	pid="3540658805"},
	{id="912453904",	name="CheckPosture",	pid="2406229846",	args={condition=KNOCKEDDOWN}},
	{id="1287307442",	name="TreeSocket",	pid="1145947200",	args={slot=HEAL}},
	{id="654152705",	name="Sequence",	pid="1392695167"},
	{id="1421120974",	name="Not",	pid="654152705"},
	{id="2004961848",	name="If",	pid="1421120974"},
	{id="318962656",	name="CheckMovementState",	pid="2004961848",	args={condition=MOVING_TO_HEAL}},
	{id="3054290862",	name="TreeSocket",	pid="654152705",	args={slot=TARGET}},
	{id="706963786",	name="Sequence",	pid="654152705"},
	{id="1315818962",	name="TreeSocket",	pid="706963786",	args={slot=EQUIP}},
	{id="9283471",	name="TreeSocket",	pid="706963786",	args={slot=ATTACK}},
	{id="846004893",	name="TreeSocket",	pid="1392695167",	args={slot=HARVEST}},
	{id="4251953986",	name="TreeSocket",	pid="1392695167",	args={slot=AWARE}},
	{id="3476219463",	name="TreeSocket",	pid="1392695167",	args={slot=IDLE}}}
addAiTemplate("rootPet", rootPet)

targetPet = {
	{id="2727643421",	name="Selector",	pid="none"},
	{id="564148782",	name="Sequence",	pid="2727643421"},
	{id="2325957935",	name="Selector",	pid="564148782"},
	{id="1588174195",	name="Sequence",	pid="2325957935"},
	{id="2487017921",	name="If",	pid="1588174195"},
	{id="1805084865",	name="CheckPetCommand",	pid="2487017921",	args={condition=PET_GUARD}},
	{id="4093395222",	name="GetProspectFromTarget",	pid="1588174195"},
	{id="3411899925",	name="Sequence",	pid="2325957935"},
	{id="2270135938",	name="Selector",	pid="3411899925"},
	{id="2800276185",	name="If",	pid="2270135938"},
	{id="3458904446",	name="CheckPetCommand",	pid="2800276185",	args={condition=PET_ATTACK}},
	{id="2865585610",	name="If",	pid="2270135938"},
	{id="2172835025",	name="CheckPetCommand",	pid="2865585610",	args={condition=PET_SPECIAL_ATTACK1}},
	{id="2606935716",	name="If",	pid="2270135938"},
	{id="2878990487",	name="CheckPetCommand",	pid="2606935716",	args={condition=PET_SPECIAL_ATTACK2}},
	{id="4137584383",	name="GetProspectFromCommand",	pid="3411899925"},
	{id="89792960",	name="Sequence",	pid="2325957935"},
	{id="1148349928",	name="Selector",	pid="89792960"},
	{id="1780096631",	name="If",	pid="1148349928"},
	{id="3175965712",	name="CheckPetCommand",	pid="1780096631",	args={condition=PET_RANGED_ATTACK}},
	{id="1114936193",	name="If",	pid="1148349928"},
	{id="4248996732",	name="CheckPetCommand",	pid="1114936193",	args={condition=PET_PATROL}},
	{id="4288585165",	name="If",	pid="1148349928"},
	{id="4090806799",	name="CheckPetCommand",	pid="4288585165",	args={condition=PET_STAY}},
	{id="312457495",	name="Selector",	pid="89792960"},
	{id="312307422",	name="GetProspectFromThreatMap",	pid="312457495"},
	{id="869980090",	name="GetProspectFromDefenders",	pid="312457495"},
	{id="2780806186",	name="Selector",	pid="564148782"},
	{id="3340731485",	name="Sequence",	pid="2780806186"},
	{id="494241456",	name="If",	pid="3340731485"},
	{id="2930289772",	name="CheckTargetIsValid",	pid="494241456"},
	{id="2519156342",	name="If",	pid="3340731485"},
	{id="3430728011",	name="CheckTargetInOwnerRange",	pid="2519156342",	args={condition=128.0}},
	{id="734829524",	name="AlwaysFail",	pid="2780806186"},
	{id="532716569",	name="Sequence",	pid="734829524"},
	{id="2355980134",	name="DropProspectFromDefenders",	pid="532716569"},
	{id="3244187974",	name="EraseBlackboard",	pid="532716569",	args={param="targetProspect"}},
	{id="2191514309",	name="SetDefenderFromProspect",	pid="564148782"},
	{id="3536084980",	name="AlwaysFail",	pid="2727643421"},
	{id="2207924975",	name="ExitCombat",	pid="3536084980",	args={clearDefenders=1}}}
addAiTemplate("targetPet", targetPet)

