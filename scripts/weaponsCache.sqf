_weaponsCache = _this select 0;

_weaponsCache addEventHandler ["ContainerOpened", {
	// set the weapons cache variable	
	_weaponsCache = _this select 0;
	// remove this event handler so it doesn't get fired again
	_weaponsCache removeAllEventHandlers "ContainerOpened";
	// find the nearest settlement
	_nearestTown = text ((nearestLocations [(getPos _weaponsCache),["NameCityCapital","NameCity","NameVillage"],10000]) select 0);

	
}	
];