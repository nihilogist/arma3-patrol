voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";

_locationForGroup = _this select 0;
_numberOfAdditionalMembers = _this select 1;

_possibleCacheDefense = ["CUP_I_TK_GUE_Soldier", "CUP_I_TK_GUE_Guerilla_Medic", "CUP_I_TK_GUE_Sniper", "CUP_I_TK_GUE_Guerilla_Enfield", "CUP_I_TK_GUE_Soldier_AT"];

_cacheDefenseGroup = createGroup resistance;

_cacheDefenseUnit = _cacheDefenseGroup createUnit ["CUP_I_TK_GUE_Soldier_TL", _locationForGroup, [], 5, "FORM"];

for "_i" from 0 to _numberOfAdditionalMembers do {
	_nextUnit = _possibleCacheDefense select (floor (random (count _possibleCacheDefense)));
	_cacheDefenseUnit = _cacheDefenseGroup createUnit [_nextUnit, _locationForGroup, [], 5, "FORM"];
	_cacheDefenseUnit = [_cacheDefenseUnit] call voiceSetup;
};

_cacheDefenseGroup;