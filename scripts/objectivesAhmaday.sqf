_ahmadayObjectiveLocation0 = [ahmaday_cache_0_loc, [ahmaday_cache_00, ahmaday_cache_01, ahmaday_cache_02, ahmaday_cache_03, ahmaday_cache_04]];
_ahmadayObjectiveLocation1 = [ahmaday_cache_1_loc, [ahmaday_cache_10]];
_ahmadayObjectiveLocation2 = [ahmaday_cache_2_loc, [ahmaday_cache_20, ahmaday_cache_21]];
_ahmadayObjectiveLocation3 = [ahmaday_cache_3_loc, [ahmaday_cache_30]];
_ahmadayObjectiveLocation4 = [ahmaday_cache_4_loc, [ahmaday_cache_40]];

_ahmadayAllObjectives = [
	_ahmadayObjectiveLocation0,
	_ahmadayObjectiveLocation1,
	_ahmadayObjectiveLocation2,
	_ahmadayObjectiveLocation3,
	_ahmadayObjectiveLocation4
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
