_chakchakAllObjectives = [
	chakchak_compound_01
];

diag_log format ["Possible objectives for ChakChak %1", _chakchakAllObjectives];

_getSpecificObjective = _this select 0;

if (_getSpecificObjective) then {
	_objectiveToReturn = selectRandom _chakchakAllObjectives;
	diag_log format ["Choosing objective %1 for ChakChak", _objectiveToReturn];
	_objectiveToReturn;
} else {
	diag_log format ["Returning all objective locations for ChakChak."];
	_objectiveToReturn = _chakchakAllObjectives;
	_objectiveToReturn;
}