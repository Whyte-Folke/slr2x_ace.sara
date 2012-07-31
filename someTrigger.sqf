// Triggers console if debug mode is on
if ((interndebug) and ((name player == "MAD T") or (name player == "Unforgiven") or (name player == "Jason") or (name player == "Dave"))) then {
	[] execVM "consoleFunc.sqf";									
	RadioTrigger_0 = createTrigger      ["EmptyDetector", [0,0,0]];                            														
	RadioTrigger_0 setTriggerArea       [0, 0, 0, false];                                      		
	RadioTrigger_0 setTriggerActivation ["JULIET", "NOT PRESENT", true];                       													
	RadioTrigger_0 setTriggerStatements ["this", "[""create""] execVM ""debugConsole.sqf"";", ""];  												
	10 setRadioMsg "Debug Console";
};