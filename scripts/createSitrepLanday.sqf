situation_report_01 = createTrigger["emptyDetector", getpos player];
situation_report_01 setTriggerActivation["BRAVO", "NONE", false]; 
situation_report_01 setTriggerText "Situation Report: Landay"; 
situation_report_01 setTriggerStatements["true", "[area_hq, 'Message received. Good work.'] remoteExec ['sideChat', 0]; missionNamespace setVariable ['landay_patrol_complete', 1, true]", ""];