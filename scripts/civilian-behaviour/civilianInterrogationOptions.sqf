if (isServer) then {
	_civilian = _this select 0;
		// add interrogation action
		[
	    _civilian,                                                                       // Object the action is attached to
	    "Interrogate Civilian",                                                        // Title of the action
	    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
	    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
	    "(_this distance _target < 3)",             // Condition for the action to be shown
	    "(_caller distance _target < 3)",                                                           // Condition for the action to progress
	    {((_this select 1) lookAt (_this select 0));(_this select 0) disableAI "MOVE"},                                                        // Code executed when action starts
	    {},                                                                                         // Code executed on every progress tick
	    {[(_this select 0)] execVM "scripts\civilian-behaviour\giveCampIntel.sqf";}, // Code executed on completion
	    {(_this select 0) enableAI "MOVE"},                                                                                  // Code executed on interrupted
	    [],                                                                                  // Arguments passed to the scripts as _this select 3
	    6,                                                                                  // Action duration [s]
	    0,                                                                                   // Priority
	    true,                                                                                // Remove on completion
	    false                                                                                // Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd"];


};