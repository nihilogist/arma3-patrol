reinforcementRequest = [];

supportReinforcementsCommand = [player,"callReinforcements", nil, nil, "reinforcementsAvailable"] call BIS_fnc_addCommMenuItem;
[player, supportReinforcementsCommand] call BIS_fnc_removeCommMenuItem;