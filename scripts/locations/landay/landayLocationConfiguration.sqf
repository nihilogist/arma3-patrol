landayLocations = compile preprocessFile "scripts\locations\landay\locationsLanday.sqf";

_landayLocations = [false] call landayLocations;

/*
Location configuration consists of:
- array of possible objective locations
- boolean to control whether civilians should be populated at the location
- percentage chance of an objective being found at that location
*/

_landayLocationConfiguration = [_landayLocations, true, 90];

_landayLocationConfiguration;