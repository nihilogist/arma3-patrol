_abandonedFarmAllObjectives = [
	abandoned_farm_compound
];

diag_log format ["Possible objectives for Abandoned Farm %1", _abandonedFarmAllObjectives];

_getSpecificObjective = _this select 0;

if (_getSpecificObjective) then {
	_objectiveToReturn = _abandonedFarmAllObjectives select (floor (random (count _abandonedFarmAllObjectives)));
	diag_log format ["Choosing objective %1 for Abandoned Farm", _objectiveToReturn];
	_objectiveToReturn;
} else {
	diag_log format ["Returning all objective locations for Abandoned Farm."];
	_objectiveToReturn = _abandonedFarmAllObjectives;
	_objectiveToReturn;
}