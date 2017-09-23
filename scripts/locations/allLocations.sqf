ahmadayLocationConfiguration = compile preprocessFile "scripts\locations\ahmaday\ahmadayLocationConfiguration.sqf";
abandonedFarmLocationConfiguration = compile preprocessFile "scripts\locations\abandoned-farm\abandonedFarmLocationConfiguration.sqf";
hamletLocationConfiguration = compile preprocessFile "scripts\locations\hamlet\hamletLocationConfiguration.sqf";
landayLocationConfiguration = compile preprocessFile "scripts\locations\landay\landayLocationConfiguration.sqf";
chakchakLocationConfiguration = compile preprocessFile "scripts\locations\chakchak\chakchakLocationConfiguration.sqf";


_ahmadayLocationConfiguration = [false] call ahmadayLocationConfiguration;
_abandonedFarmLocationConfiguration = [false] call abandonedFarmLocationConfiguration;
_hamletLocationConfiguration = [false] call hamletLocationConfiguration;
_landayLocationConfiguration = [false] call landayLocationConfiguration;
_chakchakLocationConfiguration = [false] call chakchakLocationConfiguration;


_allLocationConfigurations = [
	_ahmadayLocationConfiguration,
	_abandonedFarmLocationConfiguration,
	_hamletLocationConfiguration,
	_landayLocationConfiguration,
	_chakchakLocationConfiguration
	];

_allLocationConfigurations;