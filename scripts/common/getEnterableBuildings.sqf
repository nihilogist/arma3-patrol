// Find all buildings within 10m
// Arguments - the requested position
diag_log format ["Searching for buildings within %2 meters of position %1", (_this select 0), (_this select 1)];
_buildings = nearestObjects [(_this select 0), ["house"], (_this select 1)];
diag_log format ["Found buildings: %1", _buildings]; 
	
// Filter that down to a list of enterable buildings
_enterableBuildings = [];
{
	if([_x, 1] call BIS_fnc_isBuildingEnterable) then {
		_enterableBuildings pushback _x
	}  
} forEach _buildings;

diag_log format ["Filtered to buildings: %1", _enterableBuildings];

_enterableBuildings;