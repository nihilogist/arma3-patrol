iedCacheTaskSetup = compile preprocessFile "scripts\iedCache.sqf";

// Add the objective to the global objective list
_tempObjectives = missionNamespace getVariable "objectives";
_tempObjectives = _tempObjectives + ["iedCache"];
missionNamespace setVariable ["objectives", _tempObjectives, true];

// get the objective location
_objectiveItemLocation = _this select 0;
_actualObjectiveItem = _objectiveItemLocation select 0;
diag_log format ["Objective location %1", _objectiveItemLocation];

// Select a container type and place it near the location
_possibleCacheContainers = ["Land_WoodenBox_F"];
_cacheContainerType = _possibleCacheContainers select (floor (random (count _possibleCacheContainers)));

_cacheContainerPosition = [(getPos _actualObjectiveItem), 2, 10, 1, 0, 5, 0, []] call BIS_fnc_findSafePos;

_actualCacheContainer = _cacheContainerType createVehicle _cacheContainerPosition;

// Add some weapons to that container
_actualCacheContainer addMagazineCargoGlobal ["IEDUrbanSmall_Remote_Mag", 5];

// Set up the weapons cache task
[_actualCacheContainer] call iedCacheTaskSetup;

// Now add a group of units to the area near the container
_numberOfCacheDefenders = floor (random 2) + 1;
_cacheDefenseGroup = [_objectiveItemLocation select 0, _numberOfCacheDefenders] call createInsurgentGroup;

_createdMine = createMine ["APERSTripMine", (getPos _actualCacheContainer), [], 2];
resistance revealMine _createdMine;

_objectiveItemLocation;