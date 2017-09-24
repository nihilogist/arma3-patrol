vehicleParkingLocations = compile preprocessFile "scripts\civilian-behaviour\vehicleParkingLocations.sqf";

diag_log format ["Starting civilian driver spawn: %1", true];

_possibleLocations = [] call vehicleParkingLocations;

diag_log format ["Possible vehicle positions: %1", _possibleLocations];

_positionToCreate = selectRandom _possibleLocations;

diag_log format ["Creating civvy driver at : %1", _positionToCreate];

_civilianGroup = createGroup civilian;

_civilianUnit = _civilianGroup createUnit ["C_man_1", _positionToCreate, [], 5, "FORM"];
_civilianGroup setBehaviour "CARELESS";
_civilianGroup enableDynamicSimulation true;

_vehicle = "C_Offroad_01_F" createVehicle (getPos _positionToCreate);
_vehicle limitSpeed 50;

_civilianUnit assignAsDriver _vehicle;
[_civilianUnit] orderGetIn true;

_positionToMoveTo = selectRandom _possibleLocations;

diag_log format ["Driving to : %1", _positionToMoveTo];

_moveToWaypoint = _civilianGroup addWaypoint [getPos(_positionToMoveTo), 0];
_moveToWaypoint setWaypointType "MOVE";