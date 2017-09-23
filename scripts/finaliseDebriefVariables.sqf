if (isServer) then {
	diag_log format ["Finalising debriefing variables: %1", true];
	_incompleteObjectives = missionNamespace getVariable "objectives";
	_completedObjectives = missionNamespace getVariable "completed_objectives";

	_weaponsCachesDecommissioned = 0;
	_iedCachesDecommissioned = 0;
	_weaponsCachesMissed = 0;
	_iedCachesMissed = 0;

	{
	  switch (_x) do { 
	  	case "weaponsCache" : {  _weaponsCachesDecommissioned = _weaponsCachesDecommissioned + 1 }; 
	  	case "iedCache" : {  _iedCachesDecommissioned = _iedCachesDecommissioned + 1 }; 
	  	default {  /*...code...*/ }; 
	  };
	} forEach _completedObjectives;

	diag_log format ["Debrief summary - weapons caches complete: %1, ied caches complete: %2", _weaponsCachesDecommissioned, _iedCachesDecommissioned];

	{
	  switch (_x) do { 
	  	case "weaponsCache" : {  _weaponsCachesMissed = _weaponsCachesMissed + 1 }; 
	  	case "iedCache" : {  _iedCachesMissed = _iedCachesMissed + 1 }; 
	  	default {  /*...code...*/ }; 
	  };
	} forEach _incompleteObjectives;

	diag_log format ["Debrief summary - weapons caches missed: %1, ied caches missed: %2", _weaponsCachesMissed, _iedCachesMissed];


	_completedObjectivesText = "";
	_incompleteObjectivesText = "";
	if ((count _completedObjectives) > 0) then {
		_completedObjectivesText = "<t size='2'>Notable successes</t>";
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
		if (_weaponsCachesDecommissioned == 1) then {
		    _completedObjectivesText = _completedObjectivesText + "<br />A weapons cache was successfully retrieved and decomissioned, reducing the insurgency's ability to function as a military force.";
		};  
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
		if (_weaponsCachesDecommissioned > 1) then {
		    _completedObjectivesText = _completedObjectivesText + "<br />" + _weaponsCachesDecommissioned + " weapons caches were successfully retrieved and decomissioned, reducing the insurgency's ability to function as a military force.";
		};
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
		if (_iedCachesDecommissioned == 1) then {
		    _completedObjectivesText = _completedObjectivesText + "<br />An IED cache was successfully retrieved and decomissioned, reducing the insurgency's ability to carry out bombing attacks on our forces.";
		};  
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
		if (_iedCachesDecommissioned > 1) then {
		    _completedObjectivesText = _completedObjectivesText + "<br />" + _iedCachesDecommissioned + " IED caches were successfully retrieved and decomissioned, reducing the insurgency's ability to carry out bombing attacks on our forces.";
		};
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
	};

	if ((count _incompleteObjectives) > 0) then {
		_incompleteObjectivesText = "<t size='2'>Intelligence findings</t>";
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
		if (_weaponsCachesMissed > 0) then {
			_incompleteObjectivesText = _incompleteObjectivesText + "<br />An increase in armed insurgent activity indicates that a supply of weapons was not found on the patrol.";
		};
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
		if (_iedCachesMissed > 0) then {
			_incompleteObjectivesText = _incompleteObjectivesText + "<br />An increase in IED attacks indicates that a supply of explosives or their precursors was not found on the patrol.";
		};
		diag_log format ["Building debrief text: %1", _completedObjectivesText];
	};
	
	_debriefInformation = _completedObjectivesText + "<br /><br />" + _incompleteObjectivesText;
	missionNamespace setVariable ["debriefing_text", _debriefInformation, true];


	
	// Call the end mission routine
	if ((count _incompleteObjectives) == 0) then {
		"CompleteSuccessPatrol" call BIS_fnc_endMissionServer; 
	} else {
		"PartialSuccessPatrol" call BIS_fnc_endMissionServer;
	};
	missionNamespace setVariable ['ready_to_end_mission', true, true];	
};
