selectContainer = compile preprocessFile "scripts\selectContainerInObjective.sqf";
createInsurgentGroup = compile preprocessFile "scripts\common\createInsurgentGroup.sqf";

// get the objective location
_objectiveLocation = _this select 0;
diag_log format ["Objective location %1", _objectiveLocation];

// from that, choose one of the containers to be the cache.
_iedCacheContainer = [_objectiveLocation] call selectContainer;

// Add some weapons to that container
_iedCacheContainer addMagazineCargoGlobal ["IEDUrbanSmall_Remote_Mag", 5];

// Now add a group of units to the area near the container
_numberOfCacheDefenders = floor (random 2) + 1;
_cacheDefenseGroup = [_objectiveLocation select 0, _numberOfCacheDefenders] call createInsurgentGroup;

_createdMine = createMine ["APERSTripMine", (_objectiveLocation select 0), [], 2];
resistance revealMine _createdMine;

_objectiveLocation;