voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";
garrisonGroup = compile preprocessFile "scripts\common\garrisonGroup.sqf";

_locationForGroup = _this select 0;
_numberOfAdditionalMembers = _this select 1;

_possibleCacheDefense = ["CUP_I_TK_GUE_Soldier", 
                         "CUP_I_TK_GUE_Soldier",
                         "CUP_I_TK_GUE_Soldier", 
                         "CUP_I_TK_GUE_Guerilla_Medic", 
                         "CUP_I_TK_GUE_Sniper", 
                         "CUP_I_TK_GUE_Demo",
                         "CUP_I_TK_GUE_Guerilla_Enfield", 
                         "CUP_I_TK_GUE_Soldier_AT"];

_cacheDefenseGroup = createGroup resistance;

_cacheDefenseUnit = _cacheDefenseGroup createUnit ["CUP_I_TK_GUE_Soldier_TL", _locationForGroup, [], 5, "FORM"];

for "_i" from 0 to _numberOfAdditionalMembers do {
	_nextUnit = _possibleCacheDefense select (floor (random (count _possibleCacheDefense)));
	_cacheDefenseUnit = _cacheDefenseGroup createUnit [_nextUnit, _locationForGroup, [], 5, "FORM"];
	_cacheDefenseUnit addMagazine ["SmokeShell", 2];
	_cacheDefenseUnit = [_cacheDefenseUnit] call voiceSetup;
     _cacheDefenseUnit setSkill ["aimingAccuracy", 0.4];
     _cacheDefenseUnit setSkill ["aimingShake", 0.4];
     _cacheDefenseUnit setSkill ["aimingSpeed", 0.4];
     _cacheDefenseUnit setSkill ["spotDistance", 0.4];
     _cacheDefenseUnit setSkill ["spotTime", 0.6];
     _cacheDefenseUnit setSkill ["commanding", 0.4];
};

_cacheDefenseGroup setCombatMode "YELLOW";
_cacheDefenseGroup setBehaviour "STEALTH";
diag_log format ["Garrisoning units"];
[_cacheDefenseGroup, _locationForGroup, 20] call garrisonGroup;


_cacheDefenseGroup enableDynamicSimulation true;
_cacheDefenseGroup;