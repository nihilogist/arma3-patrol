hamletLocations = compile preprocessFile "scripts\locations\hamlet\locationsHamlet.sqf";

_hamletLocations = [false] call hamletLocations;

/*
Location configuration consists of:
- array of possible objective locations
- boolean to control whether civilians should be populated at the location
- percentage chance of an objective being found at that location
*/

_hamletLocationConfiguration = [_hamletLocations, true, 10];

_hamletLocationConfiguration;