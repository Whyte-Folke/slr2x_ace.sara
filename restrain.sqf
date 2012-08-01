SLR_fnc_restrain = {
    private ["_camera"];
    SLR_var_isRestrained = true;
    
    _camera = "camera" camCreate (player modelToWorld [0,0,5]);  
    _camera cameraEffect ["internal", "back"]; 
    _camera camSetTarget player; 
    _camera camCommit 0;
    while {SLR_var_isRestrained} do {
    	sleep 1;    
    };
   	_camera cameraeffect ["terminate","back"];
	camDestroy _camera;
    [{ (_this select 0) switchMove "amovppnemstpsnonwnondnon"; }, [player]] call SLR_fnet_execPublic;
};

