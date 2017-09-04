_campAhmaday01 = ahmaday_camp_01;
_campAhmaday02 = ahmaday_camp_02;
_campAhmaday03 = ahmaday_camp_03;
_campAhmaday04 = ahmaday_camp_04;
_campAhmaday05 = ahmaday_camp_05;

_allAhmadayCamps = [
	_campAhmaday01,
	_campAhmaday02, 
	_campAhmaday03, 
	_campAhmaday04, 
	_campAhmaday05
];

_campToReturn = _allAhmadayCamps select (floor (random (count _allAhmadayCamps)));
diag_log format ["Choosing camp %1 for Ahmaday", _campToReturn];
_campToReturn;