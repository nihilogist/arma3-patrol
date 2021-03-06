// Add the objective to the global objective list
_tempObjectives = missionNamespace getVariable "objectives";
_tempObjectives = _tempObjectives + ["iedCache"];
missionNamespace setVariable ["objectives", _tempObjectives, true];

// get the objective location
_objectiveItemLocation = _this select 0;
diag_log format ["Creating IED Cache at location %1", _objectiveItemLocation];

// Select a container type and place it near the location
_possibleCacheContainers = ["Land_WoodenBox_F"];
_cacheContainerType = _possibleCacheContainers select (floor (random (count _possibleCacheContainers)));

_cacheContainerPosition = [(getPos _objectiveItemLocation), 2, 10, 1, 0, 5, 0, []] call BIS_fnc_findSafePos;

_actualCacheContainer = _cacheContainerType createVehicle _cacheContainerPosition;

// Add some IEDs to that container
_actualCacheContainer addMagazineCargoGlobal ["IEDUrbanSmall_Remote_Mag", 5];

diag_log format ["Created IED cache and added IEDs at location %1", _objectiveItemLocation];

// Set up the IED cache task
_jipID = [_actualCacheContainer] remoteExec ["dave3_fnc_addIedCacheActionHandler", 0];

// Now add a group of units to the area near the container
_numberOfCacheDefenders = floor (random 2) + 1;
diag_log format ["Adding %1 defenders to IED cache", _numberOfCacheDefenders];
_cacheDefenseGroup = [_objectiveItemLocation, _numberOfCacheDefenders] call createInsurgentGroup;

_createdMine = createMine ["APERSTripMine", (getPos _actualCacheContainer), [], 2];
resistance revealMine _createdMine;

_objectiveItemLocation;