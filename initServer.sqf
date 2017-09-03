// pre-process takistani setup
civilianSetup = compile preprocessFile "scripts\common\takistaniSetup.sqf";
voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";

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
_possibleCacheDefense = ["CUP_I_TK_GUE_Soldier", "CUP_I_TK_GUE_Guerilla_Medic", "CUP_I_TK_GUE_Sniper", "CUP_I_TK_GUE_Guerilla_Enfield"];

_cacheDefenseGroup = createGroup resistance;

_cacheDefenseUnit = _cacheDefenseGroup createUnit ["CUP_I_TK_GUE_Soldier_TL", getPos (_cacheLocationAhmaday select 0), [], 5, "FORM"];

for "_i" from 0 to _numberOfCacheDefenders do {
	_nextUnit = _possibleCacheDefense select (floor (random (count _possibleCacheDefense)));
	_cacheDefenseUnit = _cacheDefenseGroup createUnit [_nextUnit, getPos (_cacheLocationAhmaday select 0), [], 5, "FORM"];
	_cacheDefenseUnit = [_cacheDefenseUnit] call voiceSetup;
	//[_cacheDefenseUnit, (_takistaniVoices select (floor (random (count _takistaniVoices))))] remoteExecCall ["setSpeaker", 0];
};

// For every other cache area, add a civilians
{
  // if this cache is not the weapons cache location
  if (!(_x isEqualTo _cacheLocationAhmaday)) then {
    _civilianGroup = createGroup civilian;
    _civiliansAtLocation = (floor (random 3)) + 1;
    for "_i" from 0 to _civiliansAtLocation do {
    	// create a civilian and give them useful clothing
	    _civilianUnit = _civilianGroup createUnit ["C_man_1", getPos (_x select 0), [], 5, "FORM"];
	    _civilianUnit = [_civilianUnit] call civilianSetup;
	    
	    // add the standard civilian behaviour
	    _handle = [_civilianUnit, 10] execVM "scripts\civilian-behaviour\civilianWandering.sqf"; 
	    _handle2 = [_civilianUnit] execVM "scripts\civilian-behaviour\onFiredNearActionHandler.sqf";
    };
    _civilianGroup setBehaviour "SAFE";
  };
} forEach _ahmadayListAllCaches;