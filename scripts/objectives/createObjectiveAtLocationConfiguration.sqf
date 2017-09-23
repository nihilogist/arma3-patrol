// takes arguments of LocationConfiguration array
selectObjectiveType = compile preprocessFile "scripts\objectives\objectiveTypes.sqf";
createObjective = compile preprocessFile "scripts\objectives\createObjective.sqf";
createCivilianGroup = compile preprocessFile "scripts\common\createCivilianGroup.sqf";




_locationConfiguration = _this select 0;
_possibleObjectiveLocations = _locationConfiguration select 0;
_spawnCivilians = _locationConfiguration select 1;
_chanceOfObjective = _locationConfiguration select 2;

diag_log format ["Possible Objective Locations %1", _possibleObjectiveLocations];
diag_log format ["Spawn civilians at non-bjective locations %1", _spawnCivilians];
diag_log format ["Chance of objective spawning %1", _chanceOfObjective];

// determine whether to spawn objective
_spawnObjective = false;
_d100Roll = random 100;
if (_d100Roll < _chanceOfObjective) then {
	_spawnObjective = true;
};
diag_log format ["Objective spawning %1", _spawnObjective];
_objectiveLocation = "";

if (_spawnObjective) then {
	// If spawning objective, then select location
	_locationToSpawnObjective = selectRandom _possibleObjectiveLocations;
	// Select objective type
	_objectiveType = [] call selectObjectiveType;
	// Create the objective
	diag_log format ["Creating objective of type %1 at location %2", _objectiveType, _locationToSpawnObjective];
	_objectiveCreated = [_objectiveType, _locationToSpawnObjective] call createObjective;
	_objectiveLocation = _locationToSpawnObjective;
};

if (_spawnCivilians) then {
	{
		if (!(_x isEqualTo _objectiveLocation)) then {
		  diag_log format ["Creating civilian group at location %1", _x];
		_civilianGroup = [_x] call createCivilianGroup;
		};
	} forEach _possibleObjectiveLocations;
};


