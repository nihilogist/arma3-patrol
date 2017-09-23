abandonedFarmLocations = compile preprocessFile "scripts\locations\abandoned-farm\locationsAbandonedFarm.sqf";

_abandonedFarmLocations = [false] call abandonedFarmLocations;

/*
Location configuration consists of:
- array of possible objective locations
- boolean to control whether civilians should be populated at the location
- percentage chance of an objective being found at that location
*/

_abandonedFarmLocationConfiguration = [_abandonedFarmLocations, false, 80];

_abandonedFarmLocationConfiguration;