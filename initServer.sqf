civilianSetup = compile preprocessFile "scripts\common\takistaniSetup.sqf";
voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";
createInsurgentGroup = compile preprocessFile "scripts\common\createInsurgentGroup.sqf";
createCivilianGroup = compile preprocessFile "scripts\common\createCivilianGroup.sqf";
selectObjectiveType = compile preprocessFile "scripts\objectives\objectiveTypes.sqf";
createObjective = compile preprocessFile "scripts\objectives\createObjective.sqf";
selectAhmadayObjective = compile preprocessFile "scripts\objectives\ahmaday\objectiveMarkersAhmaday.sqf";
selectInsurgentCamp = compile preprocessFile "scripts\objectives\camps\campLocations.sqf";


// Set up the public mission variable array
missionNamespace setVariable ["objectives", [], true];
missionNamespace setVariable ["completed_objectives", [], true];
missionNamespace setVariable ["debriefing_text", "This is the custom debriefing text.", true];

// Get the objective type for Ahmaday
_objectiveTypeAhmaday = [] call selectObjectiveType;

// Choose the actual objective location in Ahmaday
_objectiveLocationAhmaday = [true] call selectAhmadayObjective;

_objectiveCreated = [_objectiveTypeAhmaday, _objectiveLocationAhmaday] call createObjective;

// For every other cache area, add a civilians
_allAhmadayObjectives = [false] call selectAhmadayObjective;
{
  // if this cache is not the weapons cache location
  if (!(_x isEqualTo _objectiveLocationAhmaday)) then {
  	_civilianGroup = [_x] call createCivilianGroup;
  };
} forEach _allAhmadayObjectives;

// Add some insurgents to one of the nearby camps
_insurgentCamp = [] call selectInsurgentCamp;
_numberOfInsurgentsInCamp = (floor(random 3) + 1) * 2;
_insurgentCampDefense = [_insurgentCamp, _numberOfInsurgentsInCamp] call createInsurgentGroup;
missionNamespace setVariable ["insurgentCamp", [_insurgentCamp, _numberOfInsurgentsInCamp], true];

