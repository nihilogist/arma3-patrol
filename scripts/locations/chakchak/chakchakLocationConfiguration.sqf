chakchakLocations = compile preprocessFile "scripts\locations\chakchak\locationsChakChak.sqf";

_chakchakLocations = [false] call chakchakLocations;

/*
Location configuration consists of:
- array of possible objective locations
- boolean to control whether civilians should be populated at the location
- percentage chance of an objective being found at that location
*/

_chakchakLocationConfiguration = [_chakchakLocations, true, 0];

_chakchakLocationConfiguration;