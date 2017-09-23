if (isServer) then {
	missionNamespace setVariable ['reported_for_duty', false, true];
	[area_hq, 
		["Report for briefing", // title text
		{
			[area_hq, "Good morning, Sergeant. Your patrol this morning is to take 2nd Squad out to the west of the base. We've heard reports that there is insurgency activity in those areas, so make sure that everything is safe and secure out there. Further details are in the briefing notes."] remoteExec ['commandChat', 0]; 
	 		missionNamespace setVariable ['reported_for_duty', true, true]; 
			["report_for_briefing","Succeeded",true] call BIS_fnc_taskSetState; 
			[] remoteExec ["dave3_fnc_addReinforcementsOptionToPlayers", 0];
		}, // script on interaction
		nil, // arguments
		1, // priority
		false, // show 'window'
		true, // hide on use
		"", // no shortcut
		"(leader group player == player) && !(missionNamespace getVariable ['reported_for_duty', false])", // condition to show
		3 // radius in meters
		]
	] remoteExec ["addAction", 0, area_hq];
};
