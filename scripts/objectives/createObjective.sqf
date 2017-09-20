// Arguments: [objectiveType, objectiveLocation]
createWeaponsCache = compile preprocessFile "scripts\createWeaponCacheObjective.sqf";
createIedCache = compile preprocessFile "scripts\createIedCacheObjective.sqf";

_objectiveType = _this select 0;
_objectiveLocation = _this select 1;

diag_log format ["Creating objective of type %1 at location %2", _objectiveType, _objectiveLocation];

switch (_objectiveType) do { 
	case "weaponsCache" : {  _objectiveCreated = [_objectiveLocation] call createWeaponsCache; }; 
	case "iedCache" : {  _objectiveCreated = [_objectiveLocation] call createIedCache; }; 
	default {  /*...code...*/ }; 
};