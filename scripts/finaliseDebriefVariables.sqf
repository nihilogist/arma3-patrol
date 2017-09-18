if (isServer) then {
	diag_log format ["Finalising debriefing variables: %1", true];
	_incompleteObjectives = missionNamespace getVariable "objectives";
	{
	  switch (_x) do { 
	  	case "weaponsCache" : {
	  		missionNamespace setVariable ["debriefing_text", "An undiscovered weapons cache has meant that the insurgency has been able to equip new recruits", true];
	  	}; 
	  	case "iedCache" : {  
	  		missionNamespace setVariable ["debriefing_text", "An undiscovered IED cache has meant that the insurgency has been able to strike at our patrols.", true];
	  	}; 
	  	default {  /*...code...*/ }; 
	  };
	} forEach _incompleteObjectives;
	missionNamespace setVariable ['ready_to_end_mission', true, true];	
};
