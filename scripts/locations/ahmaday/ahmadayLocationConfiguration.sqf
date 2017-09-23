ahmadayLocations = compile preprocessFile "scripts\locations\ahmaday\objectiveMarkersAhmaday.sqf";

_ahmadayLocations = [false] call ahmadayLocations;

/*
Location configuration consists of:
- array of possible objective locations
- boolean to control whether civilians should be populated at the location
- percentage chance of an objective being found at that location
*/

_ahmadayLocationConfiguration = [_ahmadayLocations, true, 90];

_ahmadayLocationConfiguration;