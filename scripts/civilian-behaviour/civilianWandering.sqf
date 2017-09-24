if (isServer) then {

	_civilian = _this select 0;
	_homePosition = getPos _civilian;
	_homeRadius = _this select 1;

	while {true} do {
		// Have a small delay at the start as well so everyone doesn't start moving at once
		_delay = (floor random 10);
		sleep _delay;

		// check to see if civilian is in fleeing state
		_fleeing = (_civilian getVariable ["civilian_is_flee_state", false]);

		if (! _fleeing) then {
			// unit not fleeing so OK for script to operate
			// so we grab the group the civilian is in
			_civilianGroup = group _civilian;
			// Set all the behaviours back to "SAFE", and unit position to AUTO
			_civilianGroup setBehaviour "SAFE";
			_civilian setUnitPos "AUTO";
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
		} else {
			// Now check to see if it's OK to leave the flee state
			diag_log format ["Checking for enemies near civilian %1", _civilian];
			_nearbyEnemyCount = 0;
			_nearestEnemies = nearestObjects [(getPos _civilian),["Man","Car","Tank"],150];
			{
				if ((side _x) isEqualTo "independent") then {
					_nearbyEnemyCount = _nearbyEnemyCount + 1;
				};
			} forEach _nearestEnemies;

			diag_log format ["Enemies nearby %1", _nearbyEnemyCount];
			if (_nearbyEnemyCount == 0) then {
				_civilian setVariable ["civilian_is_flee_state", false, false];
				// and add the action handler again so they can flee again.
				_handle2 = [_civilian] execVM "scripts\civilian-behaviour\onFiredNearActionHandler.sqf";
			};
			// But don't give them any instructions, to ensure they don't flee then stop fleeing too often
		};

		// now sleep for random number of seconds - don't want script firing too often
		_delay = 30 + (floor random 20);
		sleep _delay;
	};

};