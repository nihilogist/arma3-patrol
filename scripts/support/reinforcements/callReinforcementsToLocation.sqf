private ["_caller","_position","_target","_is3D","_id"];

_callingArray = _this select 0;

_jipId = _callingArray remoteExec ["dave3_fnc_serverCallReinforcementsToLocation", 2];
_jipId = _callingArray remoteExec ["dave3_fnc_removeReinforcementsOptionFromPlayers", -2];




