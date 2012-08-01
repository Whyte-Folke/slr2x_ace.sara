
_chknuke = createTrigger ["EmptyDetector", getPos snuke]; 
_chknuke setTriggerArea [0, 0, 0, false];
_chknuke setTriggerActivation ["NONE", "NOT PRESENT", false];
_chknuke setTriggerStatements ["!(alive snuke)", "nul = [] execVM ""snuke\nuke.sqf""" , ""];
