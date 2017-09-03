civilianSetup = compile preprocessFile "scripts\common\takistaniSetup.sqf";
voiceSetup = compile preprocessFile "scripts\common\takistaniVoiceSetup.sqf";

_positionToCreate = _this select 0;

_civilianGroup = createGroup civilian;
_civiliansAtLocation = (floor (random 3)) + 1;
for "_i" from 0 to _civiliansAtLocation do {
	// create a civilian and give them useful clothing
    _civilianUnit = _civilianGroup createUnit ["C_man_1", _positionToCreate, [], 5, "FORM"];
    _civilianUnit = [_civilianUnit] call civilianSetup;
    
    // add the standard civilian behaviour
    _handle = [_civilianUnit, 10] execVM "scripts\civilian-behaviour\civilianWandering.sqf"; 
    _handle2 = [_civilianUnit] execVM "scripts\civilian-behaviour\onFiredNearActionHandler.sqf";
};
_civilianGroup setBehaviour "SAFE";
_civilianGroup enableDynamicSimulation true;

_civilianGroup;