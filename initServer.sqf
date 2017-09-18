// pre-process takistani setup
civilianSetup = compile preprocessFile "scripts\common\takistaniSetup.sqf";
voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";
createInsurgentGroup = compile preprocessFile "scripts\common\createInsurgentGroup.sqf";
createCivilianGroup = compile preprocessFile "scripts\common\createCivilianGroup.sqf";
selectAhmadayObjective = compile preprocessFile "scripts\objectivesAhmaday.sqf";
selectAhmadayCamp = compile preprocessFile "scripts\campsAhmaday.sqf";
createWeaponsCache = compile preprocessFile "scripts\createWeaponCacheObjective.sqf";
createIedCache = compile preprocessFile "scripts\createIedCacheObjective.sqf";

// Set up the public mission variable array
missionNamespace setVariable ["objectives", [], true];
missionNamespace setVariable ["debriefing_text", "This is the custom debriefing text.", true];

// objectives should be of the format:
// - objective type


// Set up the objective types
_objectiveTypes = ["weaponsCache", "iedCache"];
// Choose the cache type in Ahmaday
_objectiveTypeAhmaday = _objectiveTypes select (floor (random (count _objectiveTypes)));
diag_log format ["Objective type selected: %1", _objectiveTypeAhmaday];

// Choose the actual objective location in Ahmaday
_objectiveLocationAhmaday = [true] call selectAhmadayObjective;

switch (_objectiveTypeAhmaday) do { 
	case "weaponsCache" : {  _objectiveCreated = [_objectiveLocationAhmaday] call createWeaponsCache; }; 
	case "iedCache" : {  _objectiveCreated = [_objectiveLocationAhmaday] call createIedCache; }; 
	default {  /*...code...*/ }; 
};

// For every other cache area, add a civilians
_allAhmadayObjectives = [false] call selectAhmadayObjective;
{
  // if this cache is not the weapons cache location
  if (!(_x isEqualTo _objectiveLocationAhmaday)) then {
  	_civilianGroup = [_x] call createCivilianGroup;
  };
} forEach _allAhmadayObjectives;

// Add some insurgents to one of the nearby camps
_insurgentCamp = [] call selectAhmadayCamp;
_numberOfInsurgentsInCamp = (floor(random 3) + 1) * 2;
_insurgentCampDefense = [_insurgentCamp, _numberOfInsurgentsInCamp] call createInsurgentGroup;

