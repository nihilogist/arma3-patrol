if (isServer) then {

_civilian = _this select 0;

_homePosition = getPos _civilian;

_homeRadius = _this select 1;

while {true} do {
	// check to see if civilian is in fleeing state
	_fleeing = (_civilian getVariable ["civilian_is_flee_state", false]);

	if (! _fleeing) then {
		// unit not fleeing so OK for script to operate

		// so we grab the group the civilian is in
		_civilianGroup = group _civilian;
		// find the waypoints for that group
		_groupWaypoints = waypoints (_civilianGroup);
		// and delete them all
		for "_i" from 0 to (count _groupWaypoints) do {
			deleteWaypoint[_civilianGroup, 0];
		};

		// now generate a new position near home and set a waypoint towards it
		_destination = [_homePosition, 0, _homeRadius, 0, 0, 0, 0, [], _homePosition, _homePosition] call BIS_fnc_findSafePos;
		_waypoint = (_civilianGroup) addWaypoint [_destination, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "LIMITED";
	};

	// now sleep for random number of seconds - don't want script firing too often
	_delay = 30 + (floor random 10);
	sleep _delay;
};

};