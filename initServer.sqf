civilianSetup = compile preprocessFile "scripts\common\takistaniSetup.sqf";
voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";
createInsurgentGroup = compile preprocessFile "scripts\common\createInsurgentGroup.sqf";
createCivilianGroup = compile preprocessFile "scripts\common\createCivilianGroup.sqf";
selectObjectiveType = compile preprocessFile "scripts\objectives\objectiveTypes.sqf";
createObjective = compile preprocessFile "scripts\objectives\createObjective.sqf";
selectAhmadayObjective = compile preprocessFile "scripts\locations\ahmaday\objectiveMarkersAhmaday.sqf";
selectInsurgentCamp = compile preprocessFile "scripts\locations\camps\campLocations.sqf";

getAllLocations = compile preprocessFile "scripts\locations\allLocations.sqf";
createObjectiveAtLocationConfiguration = compile preprocessFile "scripts\objectives\createObjectiveAtLocationConfiguration.sqf";

execVM "scripts\ied.sqf";


// Set up the public mission variable array
missionNamespace setVariable ["objectives", [], true];
missionNamespace setVariable ["completed_objectives", [], true];
missionNamespace setVariable ["debriefing_text", "This is the custom debriefing text.", true];

// Get all possible objective locations
_allLocations = [] call getAllLocations;
diag_log format ["All mission locations %1", _allLocations];

// Iterate over that collection
{
  // Create an objective at that location
  diag_log format ["Analysing location configuration %1", _x];
  [_x] call createObjectiveAtLocationConfiguration;
} forEach _allLocations;


// Add some insurgents to one of the nearby camps
_insurgentCamp = [] call selectInsurgentCamp;
_numberOfInsurgentsInCamp = (floor(random 3) + 1) * 2;
_insurgentCampDefense = [_insurgentCamp, _numberOfInsurgentsInCamp] call createInsurgentGroup;
missionNamespace setVariable ["insurgentCamp", [_insurgentCamp, _numberOfInsurgentsInCamp], true];

