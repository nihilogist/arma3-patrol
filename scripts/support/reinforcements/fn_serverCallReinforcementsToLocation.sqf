_caller = _this select 0;
_position = _this select 1;
_target = _this select 2;
_is3D = _this select 3;
_id = _this select 4;

diag_log format ["Reinforcements called by %1", _caller];
diag_log format ["Reinforcements called to %1", _position];

_reinforcementsGroup = reinforcement_team;
_reinforcementsGroup setCombatMode "YELLOW";
_reinforcementsGroup setBehaviour "CARELESS";
_reinforcementsGroup setSpeedMode "FULL";
_reinforcementUnits = units _reinforcementsGroup;
_reinforcementsTransport = reinforcement_transport;

// Assign them to the transport
(_reinforcementUnits select 0) assignAsDriver _reinforcementsTransport;
{
  _x assignAsCargo _reinforcementsTransport;
} forEach [(_reinforcementUnits select 1),(_reinforcementUnits select 2),(_reinforcementUnits select 3)];

// find the waypoints for the reinforcements team
_groupWaypoints = waypoints (_reinforcementsGroup);
// and delete them all
for "_i" from 0 to (count _groupWaypoints) do {
	deleteWaypoint[_reinforcementsGroup, 0];
};

// Get all units into the truck
{
  [_x] orderGetIn true;
} forEach _reinforcementUnits;

// get position of caller:
_positionToReinforce = getPos _caller;

_moveToTeamWaypoint = _reinforcementsGroup addWaypoint [getPos(_caller), 1];
_moveToTeamWaypoint setWaypointType "GETOUT";
_moveToTeamWaypoint setWaypointCompletionRadius 100;


_joinGroupWaypoint = _reinforcementsGroup addWaypoint [(group _caller), 2];
_joinGroupWaypoint waypointAttachVehicle _caller;
_joinGroupWaypoint setWaypointBehaviour "COMBAT";
_joinGroupWaypoint setWaypointType "JOIN";

