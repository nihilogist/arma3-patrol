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


// Setup the possible sets of civilian clothes:
_civilianUniforms = [
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08",
	"CUP_O_TKI_Khet_Jeans_01",
	"CUP_O_TKI_Khet_Jeans_02",
	"CUP_O_TKI_Khet_Jeans_03",
	"CUP_O_TKI_Khet_Jeans_04"
];

_civilianHeadgear = [
	"CUP_H_TKI_Lungee_Open_01",
	"CUP_H_TKI_Lungee_Open_02",
	"CUP_H_TKI_Lungee_Open_03",
	"CUP_H_TKI_Lungee_Open_04",
	"CUP_H_TKI_Lungee_Open_05",
	"CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Lungee_01",
	"CUP_H_TKI_Lungee_02",
	"CUP_H_TKI_Lungee_03",
	"CUP_H_TKI_Lungee_04",
	"CUP_H_TKI_Lungee_05",
	"CUP_H_TKI_Lungee_06",
	"CUP_H_TKI_Skullcap_01",
	"CUP_H_TKI_Skullcap_02",
	"CUP_H_TKI_Skullcap_03",
	"CUP_H_TKI_Skullcap_04",
	"CUP_H_TKI_Skullcap_05",
	"CUP_H_TKI_Skullcap_06",
	"CUP_H_TKI_Pakol_01",
	"CUP_H_TKI_Pakol_02",
	"CUP_H_TKI_Pakol_03",
	"CUP_H_TKI_Pakol_04",
	"CUP_H_TKI_Pakol_05",
	"CUP_H_TKI_Pakol_06"
];

_civilianFacewear = [
	"TRYK_Beard_BK",
	"TRYK_Beard_BW",
	"TRYK_Beard_BK2",
	"TRYK_Beard_BW2",
	"TRYK_Beard_BK3",
	"TRYK_Beard_BW3",
	"TRYK_Beard_BK4",
	"TRYK_Beard_BW4",
	"TRYK_Beard_BK6",
	"TRYK_Beard_BW6",
	"CUP_TK_NeckScarf",
	"CUP_FR_NeckScarf",
	"CUP_FR_NeckScarf2"
];

// Choose the actual cache location
_cacheLocationAhmaday = _ahmadayListAllCaches select (floor (random (count _ahmadayListAllCaches)));
_cacheContainerAhmaday = _cacheLocationAhmaday select ((floor (random (count _cacheLocationAhmaday))) + 1);


// Choose the cache type in Ahmaday
_cacheTypeAhmaday = _cacheTypes select (floor (random (count _cacheTypes)));

{
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
};

// For every other cache area, add a civilians
{
	// if this cache is not the weapons cache location
  if (!(_x isEqualTo _cacheLocationAhmaday)) then {
    _civilianGroup = createGroup civilian;
    // create a civilian and give them useful clothing
    _civilianUnit = _civilianGroup createUnit ["C_man_1", getPos (_x select 0), [], 5, "FORM"];
    _civilianUnit addUniform (_civilianUniforms select (floor (random (count _civilianUniforms))));
    _civilianUnit addHeadgear (_civilianHeadgear select (floor (random (count _civilianHeadgear))));
    _civilianUnit addGoggles (_civilianFacewear select (floor (random (count _civilianFacewear))));
  };
} forEach _ahmadayListAllCaches;