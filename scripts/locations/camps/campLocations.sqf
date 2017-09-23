_campAhmaday01 = ahmaday_camp_01;
_campAhmaday02 = ahmaday_camp_02;
_campAhmaday03 = ahmaday_camp_03;
_campAhmaday04 = ahmaday_camp_04;
_campAhmaday05 = ahmaday_camp_05;

_allCamps = [
	_campAhmaday01,
	_campAhmaday02, 
	_campAhmaday03, 
	_campAhmaday04, 
	_campAhmaday05
];

_campToReturn = _allCamps select (floor (random (count _allCamps)));
_campToReturn;