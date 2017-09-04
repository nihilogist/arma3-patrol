selectContainer = compile preprocessFile "scripts\selectContainerInObjective.sqf";
//createInsurgentGroup = compile preprocessFile "scripts\common\createInsurgentGroup.sqf";

// get the objective location
_objectiveLocation = _this select 0;
diag_log format ["Objective location %1", _objectiveLocation];

// from that, choose one of the containers to be the cache.
_weaponsCacheContainer = [_objectiveLocation] call selectContainer;

// Add some weapons to that container
_weaponsCacheContainer addWeaponCargoGlobal ["arifle_AKM_F", 2];
_weaponsCacheContainer addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 10];

// Now add a group of units to the area near the container
_numberOfCacheDefenders = floor (random 3) + 1;
_cacheDefenseGroup = [_objectiveLocation select 0, _numberOfCacheDefenders] call createInsurgentGroup;

_objectiveLocation;