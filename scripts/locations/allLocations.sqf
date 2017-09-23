ahmadayLocationConfiguration = compile preprocessFile "scripts\locations\ahmaday\ahmadayLocationConfiguration.sqf";
abandonedFarmLocationConfiguration = compile preprocessFile "scripts\locations\abandoned-farm\abandonedFarmLocationConfiguration.sqf";
hamletLocationConfiguration = compile preprocessFile "scripts\locations\hamlet\hamletLocationConfiguration.sqf";
landayLocationConfiguration = compile preprocessFile "scripts\locations\landay\landayLocationConfiguration.sqf";


_ahmadayLocationConfiguration = [false] call ahmadayLocationConfiguration;
_abandonedFarmLocationConfiguration = [false] call abandonedFarmLocationConfiguration;
_hamletLocationConfiguration = [false] call hamletLocationConfiguration;
_landayLocationConfiguration = [false] call landayLocationConfiguration;

_allLocationConfigurations = [
	_ahmadayLocationConfiguration,
	_abandonedFarmLocationConfiguration,
	_hamletLocationConfiguration,
	_landayLocationConfiguration
	];

_allLocationConfigurations;