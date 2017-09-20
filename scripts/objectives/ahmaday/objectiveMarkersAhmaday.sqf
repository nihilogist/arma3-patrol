_ahmadayAllObjectives = [
	ahmaday_cache_0_loc,
	ahmaday_cache_1_loc,
	ahmaday_cache_2_loc,
	ahmaday_cache_3_loc,
	ahmaday_cache_4_loc
];

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
