_hamletAllObjectives = [
	hamlet_compound_01,
	hamlet_compound_02,
	hamlet_fields_01,
	hamlet_fields_02
];

diag_log format ["Possible objectives for hamlet %1", _hamletAllObjectives];

_getSpecificObjective = _this select 0;

if (_getSpecificObjective) then {
	_objectiveToReturn = _hamletObjectives select (floor (random (count _hamletAllObjectives)));
	diag_log format ["Choosing objective %1 for hamlet", _objectiveToReturn];
	_objectiveToReturn;
} else {
	diag_log format ["Returning all objective locations for hamlet."];
	_objectiveToReturn = _hamletAllObjectives;
	_objectiveToReturn;
}