weaponsCacheTaskSetup = compile preprocessFile "scripts\weaponsCache.sqf";

// Add the objective to the global objective list
_tempObjectives = missionNamespace getVariable "objectives";
_tempObjectives = _tempObjectives + ["weaponsCache"];
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
_actualCacheContainer addWeaponCargoGlobal ["arifle_AKM_F", 2];
_actualCacheContainer addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 10];

// Set up the weapons cache task
[_actualCacheContainer] call weaponsCacheTaskSetup;

// Now add a group of units to the area near the container
_numberOfCacheDefenders = floor (random 4) + 1;
_cacheDefenseGroup = [_objectiveItemLocation select 0, _numberOfCacheDefenders] call createInsurgentGroup;

_objectiveItemLocation;