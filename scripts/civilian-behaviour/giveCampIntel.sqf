// takes arguments [civilian]
_civilian = _this select 0;

// let the civilian move again
_civilian enableAI "MOVE";

// Get the details of the insurgent camp, just in case
_campDetails = missionNamespace getVariable "insurgentCamp";
_campPosition = getPos (_campDetails select 0);

// Find the direction to the camp and localise it.
_directionToCamp =_civilian getDir _campPosition;
_distanceToCamp = _civilian distance _campPosition;
diag_log format ["Actual camp details: heading: %1, distance: %2", _directionToCamp, _distanceToCamp];

// Things to consider:
// 1. Does the civilian know where the camp is?
// 2. How well does he know?
// 3. Will he tell them?
// 4. Does he speak enough English?

_chanceOfKnowingWhereCampIs = 33;
_accuracyOfKnowledge = 75;
// Chance of civilian knowing, and accuracy of that knowledge
if (_distanceToCamp < 500) then {
	_chanceOfKnowingWhereCampIs = 33;
	_accuracyOfKnowledge = 75;
} else {
	if (_distanceToCamp < 1500) then {
	  _chanceOfKnowingWhereCampIs = 10;
	  _accuracyOfKnowledge = 40;
	} else {
	  _chanceOfKnowingWhereCampIs = 1;
	  _accuracyOfKnowledge = 1;
	};
};

// Chance of telling: leave this at 100% for now
_response = "The civilian simply doesn't understand you well enough.";
_d100roll = floor (random 100);
if (_d100roll < _chanceOfKnowingWhereCampIs) then {
	_response = "The civilian thinks that there is an insurgent camp somewhere. ";
	_d100roll = floor (random 100);
	if (_d100roll > _accuracyOfKnowledge) then {
	  _distanceModifier = (floor (random 250)) - 125;
	  _directionModifier = (floor (random 50)) - 25;
	  _distanceToCamp = _distanceToCamp + _distanceModifier;
	  _directionToCamp = _directionToCamp + _directionModifier;
	  diag_log format ["Believed camp details: heading: %1, distance: %2", _directionToCamp, _distanceToCamp];
	};
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
	_response = _response + "They are not sure, but think that the camp is off to the " + _description;
	_response = _response + ". ";
	if (_distanceToCamp < 250) then {
		_response = _response + "They believe it to be very close.";
	} else {
		if (_distanceToCamp < 500) then {
			_response = _response + "They believe it to be fairly close.";
		} else {
			if (_distanceToCamp < 1000) then {
				_response = _response + "They believe it to be quite a long way away.";
			} else {
				_response = _response + "They believe it to be very far away, though.";
			};
		};
	};
} else {
	_response = "The civilian claims not to have any further information.";
};



hint _response;