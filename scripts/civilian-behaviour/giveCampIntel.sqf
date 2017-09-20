// takes arguments [civilian]
_civilian = _this select 0;

_civilian enableAI "MOVE";

_campDetails = missionNamespace getVariable "insurgentCamp";

_campPosition = getPos (_campDetails select 0);

_directionToCamp =_civilian getDir _campPosition;
_description = "North";

if (_directionToCamp > 45 && _directionToCamp < 135) then {
	_description = "East";
};
if (_directionToCamp > 135 && _directionToCamp < 225) then {
	_description = "South";
};
if (_directionToCamp > 225 && _directionToCamp < 315) then {
	_description = "West";
};

hint format ["Camp is to the %1, bearing %2", _description, _directionToCamp];