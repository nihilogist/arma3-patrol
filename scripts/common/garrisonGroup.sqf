// takes arguments:
// 1. group of units
// 2. location to move to
// 3. radius to search
getEnterableBuildings = compile preprocessFile "scripts\common\getEnterableBuildings.sqf";

_groupToGarrison = _this select 0;
_locationToSearch = _this select 1;
_searchRadius = _this select 2;

_groupSize = count units _groupToGarrison;

_nearbyBuildings = [_locationToSearch, _searchRadius] call getEnterableBuildings;

_buildingsWithSpace = [];

{
  _possiblePositions = _x call BIS_fnc_buildingPositions;
  diag_log format ["Building %1 has positions %2", _x, _possiblePositions];
  if (count _possiblePositions > _groupSize) then {
  	_buildingsWithSpace pushBack _x;
  };
} forEach _nearbyBuildings;

diag_log format ["Buildings with space for group: %1", _buildingsWithSpace];

if (count _buildingsWithSpace > 0) then {
     _selectedBuildingToGarrison = selectRandom _buildingsWithSpace;
     _possiblePositions = _selectedBuildingToGarrison call BIS_fnc_buildingPositions;
     _destination = selectRandom _possiblePositions;
     _waypoint = (_groupToGarrison) addWaypoint [_destination, 0];     
};
