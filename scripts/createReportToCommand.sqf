[area_hq, 
 ["Report Patrol Status", {
   [area_hq, 'Welcome back. We will look over your report and provide a debriefing shortly.'] remoteExec ['sideChat', 0];
   missionNamespace setVariable ['patrol_reported_in', true, true];
   }
 ]
] remoteExec ["addAction", 0, area_hq];