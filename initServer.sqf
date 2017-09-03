// pre-process takistani setup
civilianSetup = compile preprocessFile "scripts\common\takistaniSetup.sqf";
voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";
createInsurgentGroup = compile preprocessFile "scripts\common\createInsurgentGroup.sqf";
createCivilianGroup = compile preprocessFile "scripts\common\createCivilianGroup.sqf";

// Setup the possible cache locations in Ahmaday
_ahmadayPossibleCachesLocation0 = [ahmaday_cache_0_loc, ahmaday_cache_00, ahmaday_cache_01, ahmaday_cache_02, ahmaday_cache_03, ahmaday_cache_04];
_ahmadayPossibleCachesLocation1 = [ahmaday_cache_1_loc, ahmaday_cache_10];
_ahmadayPossibleCachesLocation2 = [ahmaday_cache_2_loc, ahmaday_cache_20];
_ahmadayPossibleCachesLocation3 = [ahmaday_cache_3_loc, ahmaday_cache_30];
_ahmadayPossibleCachesLocation4 = [ahmaday_cache_4_loc, ahmaday_cache_40];

_ahmadayListAllCaches = [_ahmadayPossibleCachesLocation0, _ahmadayPossibleCachesLocation1,
	 _ahmadayPossibleCachesLocation2, _ahmadayPossibleCachesLocation3, _ahmadayPossibleCachesLocation4];

// Set up the cache types
_cacheTypeWeapons = [["arifle_AKM_F", 2, "weapon"], ["30Rnd_762x39_Mag_F", 10, "magazine"]];
_cacheTypeIed = [["IEDUrbanSmall_Remote_Mag", 5, "magazine"]];
_cacheTypes = [_cacheTypeWeapons, _cacheTypeIed];




// Choose the actual cache location
_cacheLocationAhmaday = _ahmadayListAllCaches select (floor (random (count _ahmadayListAllCaches)));
_containerToSelect = (floor (random (count _cacheLocationAhmaday)));
_containerToSelect = _containerToSelect + 1;
diag_log format ["Selected location %1 and container %2", _cacheLocationAhmaday, _containerToSelect];
_cacheContainerAhmaday = _cacheLocationAhmaday select _containerToSelect;
diag_log format ["Selected container %1", _cacheContainerAhmaday];


// Choose the cache type in Ahmaday
_cacheTypeAhmaday = _cacheTypes select (floor (random (count _cacheTypes)));

{
	diag_log format ["Adding %1 items to cache container %2", _x, _cacheContainerAhmaday];
  // For each entry in the cache type
  _itemToAdd = _x select 0;
  _quantityToAdd = _x select 1;
  _mode = _x select 2;
  // Put the relevant stuff into the inventory of the cache container
  switch (_mode ) do { 
  	case "weapon" : {  _cacheContainerAhmaday addWeaponCargoGlobal [_itemToAdd, _quantityToAdd] }; 
  	case "magazine" : {  _cacheContainerAhmaday addMagazineCargoGlobal [_itemToAdd, _quantityToAdd] };  
  };
} forEach _cacheTypeAhmaday;

// Now add a group of units to the area near the container
_numberOfCacheDefenders = floor (random 3) + 1;
_cacheDefenseGroup = [_cacheLocationAhmaday select 0, _numberOfCacheDefenders] call createInsurgentGroup;

// For every other cache area, add a civilians
{
  // if this cache is not the weapons cache location
  if (!(_x isEqualTo _cacheLocationAhmaday)) then {
  	_civilianGroup = [_x select 0] call createCivilianGroup;
  };
} forEach _ahmadayListAllCaches;