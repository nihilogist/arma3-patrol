[area_hq, 
	["Report for briefing", 
	{
		[area_hq, "Good morning. This morning's patrol will take you our to the west of base. You've two villages to check; full details are in the briefing notes here. Call in any updates across the radio."] remoteExec ['commandChat', 0]; 
 		missionNamespace setVariable ['reported_for_duty', true, true]; 
		["report_for_briefing","Succeeded",true] call BIS_fnc_taskSetState; 
	},
	nil,
	1,
	false,
	true,
	"",
	"leader group player == player",
	3
	]
] remoteExec ["addAction", 0, area_hq];