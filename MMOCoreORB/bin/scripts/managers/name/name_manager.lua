package.path = package.path .. ";scripts/managers/name/?.lua"

DECLINED_DEVELOPER = 1;
DECLINED_FICT_RESERVED = 2;
DECLINED_PROFANE = 3;
DECLINED_RESERVED = 6;

require("species.bothan")
require("species.human")
require("species.ithorian")
require("species.moncal")
require("species.rodian")
require("species.sullustan")
require("species.trandoshan")
require("species.twilek")
require("species.wookiee")
require("species.zabrak")

require("resource.energy")
require("resource.mineral")
require("resource.plain")
require("resource.reactiveGas")

-- Imperial Trooper Prefixes
stormtrooperPrefixes = { "GK", "LK", "RK", "TK", "VK" };
scouttrooperPrefixes = { "SX", "GX", "VX", "CX", "NX" };
darktrooperPrefixes = { "JLB", "RAR", "KNP", "BCP", "RTZ" };
swamptrooperPrefixes = { "GL", "TL", "RL", "NL", "CL" };

reservedNames = {
	{ "health", DECLINED_PROFANE },
	{ "strength", DECLINED_PROFANE },
	{ "constitution", DECLINED_PROFANE },
	{ "action", DECLINED_PROFANE },
	{ "quickness", DECLINED_PROFANE },
	{ "stamina", DECLINED_PROFANE },
	{ "mind", DECLINED_PROFANE },
	{ "focus", DECLINED_PROFANE },
	{ "willpower", DECLINED_PROFANE },
	{ "dump", DECLINED_PROFANE },
	{ "anal", DECLINED_PROFANE },
	{ "ass", DECLINED_PROFANE },
	{ "biatch", DECLINED_PROFANE },
	{ "bitch", DECLINED_PROFANE },
	{ "boob", DECLINED_PROFANE },
	{ "christ", DECLINED_PROFANE },
	{ "clit", DECLINED_PROFANE },
	{ "cock", DECLINED_PROFANE },
	{ "cum", DECLINED_PROFANE },
	{ "cunt", DECLINED_PROFANE },
	{ "damn", DECLINED_PROFANE },
	{ "dick", DECLINED_PROFANE },
	{ "dingleberry", DECLINED_PROFANE },
	{ "dong", DECLINED_PROFANE },
	{ "fag", DECLINED_PROFANE },
	{ "fuck", DECLINED_PROFANE },
	{ "fuk", DECLINED_PROFANE },
	{ "fuxxor", DECLINED_PROFANE },
	{ "george lucas", DECLINED_PROFANE },
	{ "gook", DECLINED_PROFANE },
	{ "hooker", DECLINED_PROFANE },
	{ "jackoff", DECLINED_PROFANE },
	{ "jesus", DECLINED_PROFANE },
	{ "jew", DECLINED_PROFANE },
	{ "jizz", DECLINED_PROFANE },
	{ "kike", DECLINED_PROFANE },
	{ "kunt", DECLINED_PROFANE },
	{ "labia", DECLINED_PROFANE },
	{ "masterbait", DECLINED_PROFANE },
	{ "masterbate", DECLINED_PROFANE },
	{ "masturbait", DECLINED_PROFANE },
	{ "nazi", DECLINED_PROFANE },
	{ "negro", DECLINED_PROFANE },
	{ "nigg", DECLINED_PROFANE },
	{ "nipple", DECLINED_PROFANE },
	{ "penis", DECLINED_PROFANE },
	{ "piss", DECLINED_PROFANE },
	{ "prick", DECLINED_PROFANE },
	{ "pussy", DECLINED_PROFANE },
	{ "satan", DECLINED_PROFANE },
	{ "sex", DECLINED_PROFANE },
	{ "shit", DECLINED_PROFANE },
	{ "skank", DECLINED_PROFANE },
	{ "slut", DECLINED_PROFANE },
	{ "spawnthemonkey", DECLINED_PROFANE },
	{ "spick", DECLINED_PROFANE },
	{ "sucks", DECLINED_PROFANE },
	{ "system", DECLINED_PROFANE },
	{ "tit", DECLINED_PROFANE },
	{ "twat", DECLINED_PROFANE },
	{ "vagina", DECLINED_PROFANE },
	{ "whore", DECLINED_PROFANE },
	{ "wtf", DECLINED_PROFANE },
	{ "admiral", DECLINED_PROFANE },
	{ "admirals", DECLINED_PROFANE },
	{ "allah", DECLINED_PROFANE },
	{ "anakin", DECLINED_PROFANE },
	{ "asshole", DECLINED_PROFANE },
	{ "ballbeater", DECLINED_PROFANE },
	{ "ballhitter", DECLINED_PROFANE },
	{ "balllicker", DECLINED_PROFANE },
	{ "ballsucker", DECLINED_PROFANE },
	{ "bangher", DECLINED_PROFANE },
	{ "bastard", DECLINED_PROFANE },
	{ "bastid", DECLINED_PROFANE },
	{ "bitch", DECLINED_PROFANE },
	{ "blowme", DECLINED_PROFANE },
	{ "bobba", DECLINED_PROFANE },
	{ "bodhisattva", DECLINED_PROFANE },
	{ "boobie", DECLINED_PROFANE },
	{ "bothan", DECLINED_PROFANE },
	{ "breast", DECLINED_PROFANE },
	{ "buddha", DECLINED_PROFANE },
	{ "captain", DECLINED_PROFANE },
	{ "captains", DECLINED_PROFANE },
	{ "chewbackka", DECLINED_PROFANE },
	{ "christ", DECLINED_PROFANE },
	{ "cock", DECLINED_PROFANE },
	{ "commander", DECLINED_PROFANE },
	{ "commanders", DECLINED_PROFANE },
	{ "coonass", DECLINED_PROFANE },
	{ "cracka", DECLINED_PROFANE },
	{ "crap", DECLINED_PROFANE },
	{ "csr", DECLINED_PROFANE },
	{ "cum", DECLINED_PROFANE },
	{ "cunt", DECLINED_PROFANE },
	{ "darth", DECLINED_PROFANE },
	{ "dick", DECLINED_PROFANE },
	{ "diq", DECLINED_PROFANE },
	{ "donkeypunch", DECLINED_PROFANE },
	{ "fack", DECLINED_PROFANE },
	{ "fag", DECLINED_PROFANE },
	{ "fett", DECLINED_PROFANE },
	{ "feck", DECLINED_PROFANE },
	{ "fuck", DECLINED_PROFANE },
	{ "fuk", DECLINED_PROFANE },
	{ "fuqu", DECLINED_PROFANE },
	{ "general", DECLINED_PROFANE },
	{ "generals", DECLINED_PROFANE },
	{ "ghey", DECLINED_PROFANE },
	{ "-gm", DECLINED_PROFANE },
	{ "_gm", DECLINED_PROFANE },
	{ "gm-", DECLINED_PROFANE },
	{ "gm_", DECLINED_PROFANE },
	{ "god", DECLINED_PROFANE },
	{ "hillbilly", DECLINED_PROFANE },
	{ "human", DECLINED_PROFANE },
	{ "isuccacocc", DECLINED_PROFANE },
	{ "ithorian", DECLINED_PROFANE },
	{ "jango", DECLINED_PROFANE },
	{ "jedi", DECLINED_PROFANE },
	{ "jehovah", DECLINED_PROFANE },
	{ "jehova", DECLINED_PROFANE },
	{ "jesus", DECLINED_PROFANE },
	{ "klukluxklan", DECLINED_PROFANE },
	{ "kneegrow", DECLINED_PROFANE },
	{ "kunt", DECLINED_PROFANE },
	{ "lando", DECLINED_PROFANE },
	{ "leia", DECLINED_PROFANE },
	{ "lesbian", DECLINED_PROFANE },
	{ "lieutenant", DECLINED_PROFANE },
	{ "lieutenants", DECLINED_PROFANE },
	{ "major", DECLINED_PROFANE },
	{ "majors", DECLINED_PROFANE },
	{ "marshal", DECLINED_PROFANE },
	{ "marshals", DECLINED_PROFANE },
	{ "messiah", DECLINED_PROFANE },
	{ "moncalomari", DECLINED_PROFANE },
	{ "nazi", DECLINED_PROFANE },
	{ "niga", DECLINED_PROFANE },
	{ "nigga", DECLINED_PROFANE },
	{ "nigger", DECLINED_PROFANE },
	{ "nympho", DECLINED_PROFANE },
	{ "officer", DECLINED_PROFANE },
	{ "officers", DECLINED_PROFANE },
	{ "padme", DECLINED_PROFANE },
	{ "penis", DECLINED_PROFANE },
	{ "panis", DECLINED_PROFANE },
	{ "player", DECLINED_PROFANE },
	{ "poon", DECLINED_PROFANE },
	{ "prick", DECLINED_PROFANE },
	{ "private", DECLINED_PROFANE },
	{ "privates", DECLINED_PROFANE },
	{ "pubic", DECLINED_PROFANE },
	{ "pussy", DECLINED_PROFANE },
	{ "quirfag", DECLINED_PROFANE },
	{ "qunt", DECLINED_PROFANE },
	{ "raghead", DECLINED_PROFANE },
	{ "redneck", DECLINED_PROFANE },
	{ "rodian", DECLINED_PROFANE },
	{ "seaman", DECLINED_PROFANE },
	{ "seamans", DECLINED_PROFANE },
	{ "seeman", DECLINED_PROFANE },
	{ "seemen", DECLINED_PROFANE },
	{ "semen", DECLINED_PROFANE },
	{ "sith", DECLINED_PROFANE },
	{ "skank", DECLINED_PROFANE },
	{ "skanq", DECLINED_PROFANE },
	{ "skywalker", DECLINED_PROFANE },
	{ "slut", DECLINED_PROFANE },
	{ "snatch", DECLINED_PROFANE },
	{ "solo", DECLINED_PROFANE },
	{ "spoog", DECLINED_PROFANE },
	{ "stfu", DECLINED_PROFANE },
	{ "suck", DECLINED_PROFANE },
	{ "suckme", DECLINED_PROFANE },
	{ "sullistan", DECLINED_PROFANE },
	{ "swganh", DECLINED_PROFANE },
	{ "swgemu", DECLINED_PROFANE },
	{ "tarbaby", DECLINED_PROFANE },
	{ "testicle", DECLINED_PROFANE },
	{ "trandoshan", DECLINED_PROFANE },
	{ "twi'lek", DECLINED_PROFANE },
	{ "vader", DECLINED_PROFANE },
	{ "vagina", DECLINED_PROFANE },
	{ "wanker", DECLINED_PROFANE },
	{ "warrant officers", DECLINED_PROFANE },
	{ "warrants", DECLINED_PROFANE },
	{ "wetback", DECLINED_PROFANE },
	{ "whore", DECLINED_PROFANE },
	{ "wookie", DECLINED_PROFANE },
	{ "yoda", DECLINED_PROFANE },
	{ "yahweh", DECLINED_PROFANE },
	{ "yahveh", DECLINED_PROFANE },
	{ "zabrak", DECLINED_PROFANE },
	{ "skiiwalker", DECLINED_PROFANE },
	{ "jedi", DECLINED_PROFANE },
	{ "jeedi", DECLINED_PROFANE },
	{ "jedii", DECLINED_PROFANE },
	{ "jiidi", DECLINED_PROFANE },
	{ "hitler", DECLINED_PROFANE },
	{ "lootmeh", DECLINED_PROFANE },
	{ "loot", DECLINED_PROFANE },
	{ "lawlicake", DECLINED_PROFANE },
	{ "lawli", DECLINED_PROFANE },
	{ "medirty", DECLINED_PROFANE },
	{ "lester", DECLINED_PROFANE },
	{ "mohlester", DECLINED_PROFANE },
	{ "moelester", DECLINED_PROFANE },
	{ "eyep", DECLINED_PROFANE },
	{ "eyepfreely", DECLINED_PROFANE },
	{ "airmarshall", DECLINED_PROFANE },
	{ "medic", DECLINED_PROFANE },
	{ "doctor", DECLINED_PROFANE },
	{ "sittstain", DECLINED_PROFANE },
	{ "shitstain", DECLINED_PROFANE },
	{ "sitt", DECLINED_PROFANE },
	{ "stain", DECLINED_PROFANE },
	{ "emperor", DECLINED_PROFANE },
	{ "palpatine", DECLINED_PROFANE },
	{ "palpatin", DECLINED_PROFANE },
	{ "darklord", DECLINED_PROFANE },
	{ "derklord", DECLINED_PROFANE },
	{ "lord", DECLINED_PROFANE },
	{ "sith", DECLINED_PROFANE },
	{ "siith", DECLINED_PROFANE },
	{ "sithlord", DECLINED_PROFANE },
	{ "aarrba", DECLINED_FICT_RESERVED },
	{ "aayla secura", DECLINED_FICT_RESERVED },
	{ "achk med-beq", DECLINED_FICT_RESERVED },
	{ "ackmena", DECLINED_FICT_RESERVED },
	{ "acros-krik", DECLINED_FICT_RESERVED },
	{ "adi gallia", DECLINED_FICT_RESERVED },
	{ "admiral ozzel", DECLINED_FICT_RESERVED },
	{ "admiral ackbar", DECLINED_FICT_RESERVED },
	{ "admiral daala", DECLINED_FICT_RESERVED },
	{ "admiral piett", DECLINED_FICT_RESERVED },
	{ "admiral screed", DECLINED_FICT_RESERVED },
	{ "admiral thrawn", DECLINED_FICT_RESERVED },
	{ "agen kolar", DECLINED_FICT_RESERVED },
	{ "ak-rev", DECLINED_FICT_RESERVED },
	{ "aks moe", DECLINED_FICT_RESERVED },
	{ "aldar beedo", DECLINED_FICT_RESERVED },
	{ "amaiza", DECLINED_FICT_RESERVED },
	{ "anakin skywalker", DECLINED_FICT_RESERVED },
	{ "anakin solo", DECLINED_FICT_RESERVED },
	{ "anchor blue", DECLINED_FICT_RESERVED },
	{ "anduvil", DECLINED_FICT_RESERVED },
	{ "antidar williams", DECLINED_FICT_RESERVED },
	{ "ark roose", DECLINED_FICT_RESERVED },
	{ "aron peacebringer", DECLINED_FICT_RESERVED },
	{ "asajj ventress", DECLINED_FICT_RESERVED },
	{ "ask aak", DECLINED_FICT_RESERVED },
	{ "augara jowil", DECLINED_FICT_RESERVED },
	{ "auren yomm", DECLINED_FICT_RESERVED },
	{ "aurra sing", DECLINED_FICT_RESERVED },
	{ "ayy vida", DECLINED_FICT_RESERVED },
	{ "axkva min", DECLINED_FICT_RESERVED },
	{ "bail organa", DECLINED_FICT_RESERVED },
	{ "bana breemu", DECLINED_FICT_RESERVED },
	{ "bane malar", DECLINED_FICT_RESERVED },
	{ "barada", DECLINED_FICT_RESERVED },
	{ "baron papanoida", DECLINED_FICT_RESERVED },
	{ "barquin d'an", DECLINED_FICT_RESERVED },
	{ "barriss offee", DECLINED_FICT_RESERVED },
	{ "bastila shan", DECLINED_FICT_RESERVED },
	{ "ben kenobi", DECLINED_FICT_RESERVED },
	{ "ben quadinaros", DECLINED_FICT_RESERVED },
	{ "beru lars", DECLINED_FICT_RESERVED },
	{ "bib fortuna", DECLINED_FICT_RESERVED },
	{ "biggs darklighter", DECLINED_FICT_RESERVED },
	{ "boba fett", DECLINED_FICT_RESERVED },
	{ "boles roor", DECLINED_FICT_RESERVED },
	{ "borsk fey'lya", DECLINED_FICT_RESERVED },
	{ "boss nass", DECLINED_FICT_RESERVED },
	{ "bossk", DECLINED_FICT_RESERVED },
	{ "brakiss", DECLINED_FICT_RESERVED },
	{ "bren derlin", DECLINED_FICT_RESERVED },
	{ "bria tharen", DECLINED_FICT_RESERVED },
	{ "bultar swan", DECLINED_FICT_RESERVED },
	{ "callista", DECLINED_FICT_RESERVED },
	{ "calo nord", DECLINED_FICT_RESERVED },
	{ "canderous ordo", DECLINED_FICT_RESERVED },
	{ "cane adiss", DECLINED_FICT_RESERVED },
	{ "captain needa", DECLINED_FICT_RESERVED },
	{ "captain panaka", DECLINED_FICT_RESERVED },
	{ "captain rekab", DECLINED_FICT_RESERVED },
	{ "captain tarpals", DECLINED_FICT_RESERVED },
	{ "captain typho", DECLINED_FICT_RESERVED },
	{ "captain-supervisor grammel", DECLINED_FICT_RESERVED },
	{ "carl", DECLINED_FICT_RESERVED },
	{ "carlist rieekan", DECLINED_FICT_RESERVED },
	{ "carth onasi", DECLINED_FICT_RESERVED },
	{ "cebann veekan", DECLINED_FICT_RESERVED },
	{ "chancellor valorum", DECLINED_FICT_RESERVED },
	{ "charal", DECLINED_FICT_RESERVED },
	{ "chewbacca", DECLINED_FICT_RESERVED },
	{ "chi eekway", DECLINED_FICT_RESERVED },
	{ "chief chirpa", DECLINED_FICT_RESERVED },
	{ "chukha-trok", DECLINED_FICT_RESERVED },
	{ "chyler", DECLINED_FICT_RESERVED },
	{ "cindel towani", DECLINED_FICT_RESERVED },
	{ "clegg holdfast", DECLINED_FICT_RESERVED },
	{ "cliegg lars", DECLINED_FICT_RESERVED },
	{ "coleman trebor", DECLINED_FICT_RESERVED },
	{ "commander bacara", DECLINED_FICT_RESERVED },
	{ "commander bly", DECLINED_FICT_RESERVED },
	{ "commander cody", DECLINED_FICT_RESERVED },
	{ "commander gree", DECLINED_FICT_RESERVED },
	{ "commander neyo", DECLINED_FICT_RESERVED },
	{ "commander thire", DECLINED_FICT_RESERVED },
	{ "conan motti", DECLINED_FICT_RESERVED },
	{ "corde", DECLINED_FICT_RESERVED },
	{ "corla metonae", DECLINED_FICT_RESERVED },
	{ "corran horn", DECLINED_FICT_RESERVED },
	{ "count cooku", DECLINED_FICT_RESERVED },
	{ "crix cadine", DECLINED_FICT_RESERVED },
	{ "daakman barrek", DECLINED_FICT_RESERVED },
	{ "dack ralter", DECLINED_FICT_RESERVED },
	{ "dannl faytonni", DECLINED_FICT_RESERVED },
	{ "darth bandon", DECLINED_FICT_RESERVED },
	{ "darth malak", DECLINED_FICT_RESERVED },
	{ "darth maul", DECLINED_FICT_RESERVED },
	{ "darth sidious", DECLINED_FICT_RESERVED },
	{ "darth vader", DECLINED_FICT_RESERVED },
	{ "dash rendar", DECLINED_FICT_RESERVED },
	{ "daultay dofine", DECLINED_FICT_RESERVED },
	{ "davik kang", DECLINED_FICT_RESERVED },
	{ "deej warrick", DECLINED_FICT_RESERVED },
	{ "dengar", DECLINED_FICT_RESERVED },
	{ "depa billaba", DECLINED_FICT_RESERVED },
	{ "dexter jettster", DECLINED_FICT_RESERVED },
	{ "diva shaliqua", DECLINED_FICT_RESERVED },
	{ "doc", DECLINED_FICT_RESERVED },
	{ "doctor evazan", DECLINED_FICT_RESERVED },
	{ "doda boedonawieedo", DECLINED_FICT_RESERVED },
	{ "dorme", DECLINED_FICT_RESERVED },
	{ "droopy mccool", DECLINED_FICT_RESERVED },
	{ "dud bolt", DECLINED_FICT_RESERVED },
	{ "durge", DECLINED_FICT_RESERVED },
	{ "ebe endocott", DECLINED_FICT_RESERVED },
	{ "eeth koth", DECLINED_FICT_RESERVED },
	{ "elan mak", DECLINED_FICT_RESERVED },
	{ "elan sleazebaggano", DECLINED_FICT_RESERVED },
	{ "ephant mon", DECLINED_FICT_RESERVED },
	{ "even piell", DECLINED_FICT_RESERVED },
	{ "exar kun", DECLINED_FICT_RESERVED },
	{ "fang zar", DECLINED_FICT_RESERVED },
	{ "fema baab", DECLINED_FICT_RESERVED },
	{ "fiolla", DECLINED_FICT_RESERVED },
	{ "foul moudama", DECLINED_FICT_RESERVED },
	{ "gaeriel captison", DECLINED_FICT_RESERVED },
	{ "gaff", DECLINED_FICT_RESERVED },
	{ "gallandro", DECLINED_FICT_RESERVED },
	{ "garindan", DECLINED_FICT_RESERVED },
	{ "garm bel", DECLINED_FICT_RESERVED },
	{ "gasgano", DECLINED_FICT_RESERVED },
	{ "general grievous", DECLINED_FICT_RESERVED },
	{ "general tagge", DECLINED_FICT_RESERVED },
	{ "general veers", DECLINED_FICT_RESERVED },
	{ "general yavid", DECLINED_FICT_RESERVED },
	{ "ghent", DECLINED_FICT_RESERVED },
	{ "giddean danu", DECLINED_FICT_RESERVED },
	{ "gilad pellaeon", DECLINED_FICT_RESERVED },
	{ "gizor dellso", DECLINED_FICT_RESERVED },
	{ "governor koong", DECLINED_FICT_RESERVED },
	{ "gragra", DECLINED_FICT_RESERVED },
	{ "greeata", DECLINED_FICT_RESERVED },
	{ "greedo", DECLINED_FICT_RESERVED },
	{ "grizz frix", DECLINED_FICT_RESERVED },
	{ "halla", DECLINED_FICT_RESERVED },
	{ "han solo", DECLINED_FICT_RESERVED },
	{ "hermi odle", DECLINED_FICT_RESERVED },
	{ "hermione bagwa", DECLINED_FICT_RESERVED },
	{ "horox ryyder", DECLINED_FICT_RESERVED },
	{ "iaco stark", DECLINED_FICT_RESERVED },
	{ "indiana jones", DECLINED_FICT_RESERVED },
	{ "isolder", DECLINED_FICT_RESERVED },
	{ "ister paddie", DECLINED_FICT_RESERVED },
	{ "jabba", DECLINED_FICT_RESERVED },
	{ "jacen solo", DECLINED_FICT_RESERVED },
	{ "jaina solo", DECLINED_FICT_RESERVED },
	{ "jan dodonna", DECLINED_FICT_RESERVED },
	{ "jango fett", DECLINED_FICT_RESERVED },
	{ "jann tosh", DECLINED_FICT_RESERVED },
	{ "janu godalhi", DECLINED_FICT_RESERVED },
	{ "janus greejatus", DECLINED_FICT_RESERVED },
	{ "jar-jar binks", DECLINED_FICT_RESERVED },
	{ "jasper mcknives", DECLINED_FICT_RESERVED },
	{ "jaxxon", DECLINED_FICT_RESERVED },
	{ "jek porkins", DECLINED_FICT_RESERVED },
	{ "jem ysanna", DECLINED_FICT_RESERVED },
	{ "jessa", DECLINED_FICT_RESERVED },
	{ "jessica meade", DECLINED_FICT_RESERVED },
	{ "jira", DECLINED_FICT_RESERVED },
	{ "jobal naberrie", DECLINED_FICT_RESERVED },
	{ "jocasta nu", DECLINED_FICT_RESERVED },
	{ "joh yowza", DECLINED_FICT_RESERVED },
	{ "jolee bindo", DECLINED_FICT_RESERVED },
	{ "joruus c'baoth", DECLINED_FICT_RESERVED },
	{ "juhani", DECLINED_FICT_RESERVED },
	{ "k'kruhk", DECLINED_FICT_RESERVED },
	{ "kabe", DECLINED_FICT_RESERVED },
	{ "kaink", DECLINED_FICT_RESERVED },
	{ "kalyn garnmir", DECLINED_FICT_RESERVED },
	{ "ketwol", DECLINED_FICT_RESERVED },
	{ "ki-adi-mundi", DECLINED_FICT_RESERVED },
	{ "kir kanos", DECLINED_FICT_RESERVED },
	{ "kit fisto", DECLINED_FICT_RESERVED },
	{ "kitik keed'kak", DECLINED_FICT_RESERVED },
	{ "kitster", DECLINED_FICT_RESERVED },
	{ "kleb zellock", DECLINED_FICT_RESERVED },
	{ "komari vosa", DECLINED_FICT_RESERVED },
	{ "kybo ren-cha", DECLINED_FICT_RESERVED },
	{ "kyp durron", DECLINED_FICT_RESERVED },
	{ "lama su", DECLINED_FICT_RESERVED },
	{ "lando calrissian", DECLINED_FICT_RESERVED },
	{ "lars needa", DECLINED_FICT_RESERVED },
	{ "leektar", DECLINED_FICT_RESERVED },
	{ "leia organa", DECLINED_FICT_RESERVED },
	{ "lexi dio", DECLINED_FICT_RESERVED },
	{ "lieutenant oicunn", DECLINED_FICT_RESERVED },
	{ "lobot", DECLINED_FICT_RESERVED },
	{ "logray", DECLINED_FICT_RESERVED },
	{ "lott dod", DECLINED_FICT_RESERVED },
	{ "luke skywalker", DECLINED_FICT_RESERVED },
	{ "luminara unduli", DECLINED_FICT_RESERVED },
	{ "lumiya", DECLINED_FICT_RESERVED },
	{ "lushros Dofine", DECLINED_FICT_RESERVED },
	{ "lyn me", DECLINED_FICT_RESERVED },
	{ "mace towani", DECLINED_FICT_RESERVED },
	{ "mace windu", DECLINED_FICT_RESERVED },
	{ "magaloof", DECLINED_FICT_RESERVED },
	{ "male-fee", DECLINED_FICT_RESERVED },
	{ "mara-jade skywalker", DECLINED_FICT_RESERVED },
	{ "mars guo", DECLINED_FICT_RESERVED },
	{ "mas amedda", DECLINED_FICT_RESERVED },
	{ "mawhonic", DECLINED_FICT_RESERVED },
	{ "max rebo", DECLINED_FICT_RESERVED },
	{ "maxiron agolerga", DECLINED_FICT_RESERVED },
	{ "meena tills", DECLINED_FICT_RESERVED },
	{ "melas", DECLINED_FICT_RESERVED },
	{ "melee", DECLINED_FICT_RESERVED },
	{ "merumeru", DECLINED_FICT_RESERVED },
	{ "mission vao", DECLINED_FICT_RESERVED },
	{ "moff jerjerrod", DECLINED_FICT_RESERVED },
	{ "moff tarkin", DECLINED_FICT_RESERVED },
	{ "momaw nadon", DECLINED_FICT_RESERVED },
	{ "mon julpa", DECLINED_FICT_RESERVED },
	{ "mon mothma", DECLINED_FICT_RESERVED },
	{ "muftak", DECLINED_FICT_RESERVED },
	{ "mungo baobab", DECLINED_FICT_RESERVED },
	{ "myhr Rho", DECLINED_FICT_RESERVED },
	{ "nar hida", DECLINED_FICT_RESERVED },
	{ "nee alavar", DECLINED_FICT_RESERVED },
	{ "nem bees", DECLINED_FICT_RESERVED },
	{ "neva kee", DECLINED_FICT_RESERVED },
	{ "niai fieso", DECLINED_FICT_RESERVED },
	{ "nien nunb", DECLINED_FICT_RESERVED },
	{ "nilo", DECLINED_FICT_RESERVED },
	{ "noa briqualon", DECLINED_FICT_RESERVED },
	{ "nom anor", DECLINED_FICT_RESERVED },
	{ "nute gunray", DECLINED_FICT_RESERVED },
	{ "nym", DECLINED_FICT_RESERVED },
	{ "nyrat agira", DECLINED_FICT_RESERVED },
	{ "oakie dokes", DECLINED_FICT_RESERVED },
	{ "obi-wan kenobi", DECLINED_FICT_RESERVED },
	{ "odumin", DECLINED_FICT_RESERVED },
	{ "ody mandrell", DECLINED_FICT_RESERVED },
	{ "olana chion", DECLINED_FICT_RESERVED },
	{ "onaconda farr", DECLINED_FICT_RESERVED },
	{ "onara kuat", DECLINED_FICT_RESERVED },
	{ "oola", DECLINED_FICT_RESERVED },
	{ "oppo rancisis", DECLINED_FICT_RESERVED },
	{ "orn free taa", DECLINED_FICT_RESERVED },
	{ "oro dassyne", DECLINED_FICT_RESERVED },
	{ "orrimaarko", DECLINED_FICT_RESERVED },
	{ "ottegru grey", DECLINED_FICT_RESERVED },
	{ "owen lars", DECLINED_FICT_RESERVED },
	{ "pablo-jill", DECLINED_FICT_RESERVED },
	{ "padme amidala", DECLINED_FICT_RESERVED },
	{ "palpatine", DECLINED_FICT_RESERVED },
	{ "paploo", DECLINED_FICT_RESERVED },
	{ "pash cracken", DECLINED_FICT_RESERVED },
	{ "passel argente", DECLINED_FICT_RESERVED },
	{ "pax bonkik", DECLINED_FICT_RESERVED },
	{ "paxi sylo", DECLINED_FICT_RESERVED },
	{ "pello scrambas", DECLINED_FICT_RESERVED },
	{ "plo koon", DECLINED_FICT_RESERVED },
	{ "po nudo", DECLINED_FICT_RESERVED },
	{ "poggle", DECLINED_FICT_RESERVED },
	{ "ponda baba", DECLINED_FICT_RESERVED },
	{ "pooja naberrie", DECLINED_FICT_RESERVED },
	{ "pote snitkin", DECLINED_FICT_RESERVED },
	{ "prince xizor", DECLINED_FICT_RESERVED },
	{ "princess leia", DECLINED_FICT_RESERVED },
	{ "queen apailana", DECLINED_FICT_RESERVED },
	{ "queen izrina", DECLINED_FICT_RESERVED },
	{ "queen jamillia", DECLINED_FICT_RESERVED },
	{ "qui-bon jinn", DECLINED_FICT_RESERVED },
	{ "quinlan bos", DECLINED_FICT_RESERVED },
	{ "rappertunie", DECLINED_FICT_RESERVED },
	{ "ratts tyerell", DECLINED_FICT_RESERVED },
	{ "red", DECLINED_FICT_RESERVED },
	{ "ree-yees", DECLINED_FICT_RESERVED },
	{ "rekkon", DECLINED_FICT_RESERVED },
	{ "rep been", DECLINED_FICT_RESERVED },
	{ "rep teers", DECLINED_FICT_RESERVED },
	{ "reti", DECLINED_FICT_RESERVED },
	{ "ric olie", DECLINED_FICT_RESERVED },
	{ "romeo treblanc", DECLINED_FICT_RESERVED },
	{ "ronet coorr", DECLINED_FICT_RESERVED },
	{ "roron corobb", DECLINED_FICT_RESERVED },
	{ "rukh", DECLINED_FICT_RESERVED },
	{ "rune haako", DECLINED_FICT_RESERVED },
	{ "ruwee naberrie", DECLINED_FICT_RESERVED },
	{ "ryoo naberrie", DECLINED_FICT_RESERVED },
	{ "rystall", DECLINED_FICT_RESERVED },
	{ "sabe", DECLINED_FICT_RESERVED },
	{ "saelt-marae", DECLINED_FICT_RESERVED },
	{ "saesee tiin", DECLINED_FICT_RESERVED },
	{ "sagoro autem", DECLINED_FICT_RESERVED },
	{ "salacious crumb", DECLINED_FICT_RESERVED },
	{ "salla zend", DECLINED_FICT_RESERVED },
	{ "salporin", DECLINED_FICT_RESERVED },
	{ "san hill", DECLINED_FICT_RESERVED },
	{ "saul karath", DECLINED_FICT_RESERVED },
	{ "sebulba", DECLINED_FICT_RESERVED },
	{ "sei taria", DECLINED_FICT_RESERVED },
	{ "seib nod", DECLINED_FICT_RESERVED },
	{ "sena midanyl", DECLINED_FICT_RESERVED },
	{ "serji-x arrogantus", DECLINED_FICT_RESERVED },
	{ "sha'a gi", DECLINED_FICT_RESERVED },
	{ "shaak ti", DECLINED_FICT_RESERVED },
	{ "shmi skywalker", DECLINED_FICT_RESERVED },
	{ "shodu", DECLINED_FICT_RESERVED },
	{ "shu mai", DECLINED_FICT_RESERVED },
	{ "silya shessaun", DECLINED_FICT_RESERVED },
	{ "sio bibble", DECLINED_FICT_RESERVED },
	{ "siri tachi", DECLINED_FICT_RESERVED },
	{ "sly moore", DECLINED_FICT_RESERVED },
	{ "slyther bushforb", DECLINED_FICT_RESERVED },
	{ "sola naberrie", DECLINED_FICT_RESERVED },
	{ "sora bulq", DECLINED_FICT_RESERVED },
	{ "stass allie", DECLINED_FICT_RESERVED },
	{ "swilla corey", DECLINED_FICT_RESERVED },
	{ "sy snootles", DECLINED_FICT_RESERVED },
	{ "talon karrde", DECLINED_FICT_RESERVED },
	{ "tanith shire", DECLINED_FICT_RESERVED },
	{ "tannon praji", DECLINED_FICT_RESERVED },
	{ "tarfful", DECLINED_FICT_RESERVED },
	{ "tarkov", DECLINED_FICT_RESERVED },
	{ "tarr seirr", DECLINED_FICT_RESERVED },
	{ "tas kee", DECLINED_FICT_RESERVED },
	{ "taun we", DECLINED_FICT_RESERVED },
	{ "teckla", DECLINED_FICT_RESERVED },
	{ "teek", DECLINED_FICT_RESERVED },
	{ "teemto pagalies", DECLINED_FICT_RESERVED },
	{ "terak", DECLINED_FICT_RESERVED },
	{ "terr taneel", DECLINED_FICT_RESERVED },
	{ "tessek", DECLINED_FICT_RESERVED },
	{ "theomet danle", DECLINED_FICT_RESERVED },
	{ "tikkes", DECLINED_FICT_RESERVED },
	{ "tion medon", DECLINED_FICT_RESERVED },
	{ "toonbuck toora", DECLINED_FICT_RESERVED },
	{ "toryn farr", DECLINED_FICT_RESERVED },
	{ "tru veld", DECLINED_FICT_RESERVED },
	{ "tsavong lah", DECLINED_FICT_RESERVED },
	{ "tundra dowmeia", DECLINED_FICT_RESERVED },
	{ "tzizvvt", DECLINED_FICT_RESERVED },
	{ "ulic qel-droma", DECLINED_FICT_RESERVED },
	{ "umpass-stay", DECLINED_FICT_RESERVED },
	{ "vergere", DECLINED_FICT_RESERVED },
	{ "vilmarh grahrk", DECLINED_FICT_RESERVED },
	{ "voolvif monn", DECLINED_FICT_RESERVED },
	{ "wald", DECLINED_FICT_RESERVED },
	{ "wam lufba", DECLINED_FICT_RESERVED },
	{ "wan sandage", DECLINED_FICT_RESERVED },
	{ "wat tambor", DECLINED_FICT_RESERVED },
	{ "watto", DECLINED_FICT_RESERVED },
	{ "wedge antilles", DECLINED_FICT_RESERVED },
	{ "wes janson", DECLINED_FICT_RESERVED },
	{ "wicket warrick", DECLINED_FICT_RESERVED },
	{ "willrow hood", DECLINED_FICT_RESERVED },
	{ "willy", DECLINED_FICT_RESERVED },
	{ "winter", DECLINED_FICT_RESERVED },
	{ "wuher", DECLINED_FICT_RESERVED },
	{ "yaddle", DECLINED_FICT_RESERVED },
	{ "yarael poof", DECLINED_FICT_RESERVED },
	{ "yarna d'al gargan", DECLINED_FICT_RESERVED },
	{ "yoda", DECLINED_FICT_RESERVED },
	{ "yoxgit", DECLINED_FICT_RESERVED },
	{ "ysanne isard", DECLINED_FICT_RESERVED },
	{ "zaalbar", DECLINED_FICT_RESERVED },
	{ "zam wesell", DECLINED_FICT_RESERVED },
	{ "zett jukassa", DECLINED_FICT_RESERVED },
	{ "zev senesca", DECLINED_FICT_RESERVED },
	{ "zuckuss", DECLINED_FICT_RESERVED },
	{ "kryat", DECLINED_RESERVED },
	{ "human", DECLINED_RESERVED },
	{ "twi'lek", DECLINED_RESERVED },
	{ "moncalamari", DECLINED_RESERVED },
	{ "wookiee", DECLINED_RESERVED },
	{ "zabrak", DECLINED_RESERVED },
	{ "bothan", DECLINED_RESERVED },
	{ "rodian", DECLINED_RESERVED },
	{ "trandoshan", DECLINED_RESERVED },
	{ "bank", DECLINED_RESERVED },
	{ "city", DECLINED_RESERVED },
	{ "guild", DECLINED_RESERVED },
	{ "tip", DECLINED_RESERVED },
	{ "citizens", DECLINED_RESERVED },
	{ "self", DECLINED_RESERVED }
}
