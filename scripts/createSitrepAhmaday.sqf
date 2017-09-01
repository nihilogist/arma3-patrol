// Create a trigger at the player position
situation_report_01 = createTrigger["emptyDetector", getpos player];
// Set trigger to Radio ALPHA, activatable only once
situation_report_01 setTriggerActivation["ALPHA", "NONE", false];
// Set radio text title
situation_report_01 setTriggerText "Situation Report: Ahmaday";
situation_report_01 setTriggerStatements["true", "[area_hq, 'Message received. Make sure you search the building for posssible sympathisers and bring them in.'] remoteExec ['sideChat', 0]; missionNamespace setVariable ['ahmaday_patrol_complete', 1, true]", ""];