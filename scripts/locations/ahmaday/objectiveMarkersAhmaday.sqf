_ahmadayAllObjectives = [
	ahmaday_compound_01,
	ahmaday_compound_02,
	ahmaday_compound_03,
	ahmaday_compound_04,
	ahmaday_fields
];

diag_log format ["Possible objectives for Ahmaday %1", _ahmadayAllObjectives];

_getSpecificObjective = _this select 0;

if (_getSpecificObjective) then {
	_objectiveToReturn = _ahmadayAllObjectives select (floor (random (count _ahmadayAllObjectives)));
	diag_log format ["Choosing objective %1 for Ahmaday", _objectiveToReturn];
	_objectiveToReturn;
} else {
	diag_log format ["Returning all objective locations for Ahmaday."];
	_objectiveToReturn = _ahmadayAllObjectives;
	_objectiveToReturn;
}
