_landayAllObjectives = [
	landay_compound_01,
	landay_compound_02,
	landay_compound_03,
	landay_compound_04,
	landay_compound_05,
	landay_compound_06,
	landay_compound_07,
	landay_compound_08
];

diag_log format ["Possible objectives for Landay %1", _landayAllObjectives];

_getSpecificObjective = _this select 0;

if (_getSpecificObjective) then {
	_objectiveToReturn = _landayAllObjectives select (floor (random (count _landayAllObjectives)));
	diag_log format ["Choosing objective %1 for Landay", _objectiveToReturn];
	_objectiveToReturn;
} else {
	diag_log format ["Returning all objective locations for Landay."];
	_objectiveToReturn = _landayAllObjectives;
	_objectiveToReturn;
}