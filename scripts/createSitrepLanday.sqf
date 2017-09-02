// Create trigger
situation_report_01 = createTrigger["emptyDetector", getpos player];
// Set trigger to activate on use of Radio Bravo, usable only once
situation_report_01 setTriggerActivation["BRAVO", "NONE", false]; 
// Set radio text title
situation_report_01 setTriggerText "Situation Report: Landay"; 
// Set trigger to broadcast message and set mission complete variable.
situation_report_01 setTriggerStatements["true", "[area_hq, 'Message received. Good work.'] remoteExec ['sideChat', 0]; missionNamespace setVariable ['landay_patrol_complete', 1, true]", ""];