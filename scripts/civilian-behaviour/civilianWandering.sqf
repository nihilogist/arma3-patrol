_civilian = _this select 0;

_homePosition = getPos _civilian;

while {true} do {
	// check to see if civilian is in fleeing state
	_fleeing = (_civilian getVariable "civilian_is_flee_state");

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
		_destination = [_homePosition, 0, 30, 0, 0, 0, 0, [], _homePosition, _homePosition] call BIS_fnc_findSafePos;
		_waypoint = (_civilianGroup) addWaypoint [_destination, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "LIMITED";
	};

	// now sleep for 30 seconds - don't want script firing too often
	sleep 30;
};

