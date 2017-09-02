_civilian = _this select 0;
// Disable fleeing
_civilian allowFleeing 0;
_civilian setVariable ["civilian_is_flee_state", false, false]; 


_civilian addEventHandler ["FiredNear",  
{
	// Set civilian to flee state
	(_this select 0) setVariable ["civilian_is_flee_state", true, false];

	// Find all buildings within 40m
	_buildings = nearestObjects [getPos (_this select 0), ["house"], 40]; 
	
	// Filter that down to a list of enterable buildings
	_enterableBuildings = [];
	{
		if([_x, 1] call BIS_fnc_isBuildingEnterable) then {
			_enterableBuildings pushback _x
		}  
	} forEach _buildings;


	// Select the first enterable building, and let's assume that it's the closest
	_selectedBuilding = _enterableBuildings select 0;

	// List the possible positions in that building
	_possiblePositions = _selectedBuilding call BIS_fnc_buildingPositions;

	// Select one of those positions to be used as a waypoint destination
	_destination = _possiblePositions select (floor random(count _possiblePositions));

	if (isNil "_destination") then {
		_destination = [getPos (_this select 0), 15, 40, 0, 0, 0, 0, [], getPos (_this select 0), getPos (_this select 0)] call BIS_fnc_findSafePos;
	};
	
	// Get the number of waypoints currently set for the civilian group
	_civilianGroup = group (_this select 0);
	_groupWaypoints = waypoints (_civilianGroup);
	_waypointCount = count _groupWaypoints;

	// delete all set waypoints
	for "_i" from 0 to _waypointCount do {
		deleteWaypoint[_civilianGroup, 0];
	};

	// Add a new waypoint set with the destination just selected
	_waypoint = (_civilianGroup) addWaypoint [_destination, 0];
	_waypoint setWaypointType "MOVE";
	_civilianGroup setSpeedMode "FULL";

	// Remove any 'firedNear' event handlers to avoid too much spam
	(_this select 0) removeAllEventHandlers "FiredNear";

	// Spawn a new process to get the civilian prone when the destination is reached
	[_civilianGroup, _waypoint] spawn 
	{
		_civilianGroup = _this select 0;
		_leadCivilian = (units _civilianGroup) select 0;
		_waypoint = _this select 1;
		
		waitUntil {
			if (isNull _civilianGroup) exitWith {true};
			sleep 1;

			_metersFromWayPoint = _leadCivilian distance waypointPosition _waypoint;

			_metersFromWayPoint < 2;
		};

		_leadCivilian setUnitPos "DOWN";
	};

}];