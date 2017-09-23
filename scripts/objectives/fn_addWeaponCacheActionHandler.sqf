player sideChat "added action handler to cache.";
_weaponsCache = _this select 0;



// Add an 'on container opened' action handler
_weaponsCache addEventHandler ["ContainerOpened", {
	// set the weapons cache variable	
	_weaponsCache = _this select 0;

	_taskTitle = "Decomission Weapons Cache";
	_taskDescription = "A cache of weapons has been found. DO NOT remove weapons from the cache. Return it to base for analysis and decommisioning.";
	_task = [west,["weaponsCacheTask"],[_taskDescription,_taskTitle,_taskTitle],(getPos return_point),"CREATED",5,true] call BIS_fnc_taskCreate;
	// remove this event handler so it doesn't get fired again
	_jipId = [_weaponsCache, "ContainerOpened"] remoteExec ["removeAllEventHandlers", -2];

	// Create an action to hand in the cache for decomissioning
	[
	    _weaponsCache,                                                                       // Object the action is attached to
	    "Decommission Weapons Cache",                                                        // Title of the action
	    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
	    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
	    "(_this distance _target < 3) and (_target distance base_trigger_centre < 50)",             // Condition for the action to be shown
	    "(_caller distance _target < 3)",                                                           // Condition for the action to progress
	    {},                                                                                         // Code executed when action starts
	    {},                                                                                         // Code executed on every progress tick
	    {["weaponsCacheTask","Succeeded",true] call BIS_fnc_taskSetState; deleteVehicle _target; _tempObjectives = missionNamespace getVariable "objectives";_tempObjectives = _tempObjectives - ["weaponsCache"];missionNamespace setVariable ["objectives", _tempObjectives, true];}, // Code executed on completion
	    {},                                                                                  // Code executed on interrupted
	    [],                                                                                  // Arguments passed to the scripts as _this select 3
	    12,                                                                                  // Action duration [s]
	    0,                                                                                   // Priority
	    true,                                                                                // Remove on completion
	    false                                                                                // Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd"];                                                  // example for MP compatible implementation

}	
];