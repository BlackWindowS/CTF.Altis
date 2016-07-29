// nul = [] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
// player addEventHandler ["Explosion", {[_this select 0, _this select 1] execVM "effetIED.sqf"}];

BwS_fn_transitionZone = {
	titleText ["Changement de zone...", "BLACK IN", 3];
	titleText ["Changement de zone...", "BLACK"];

	sleep 3;

	titleFadeOut 3;
};

BwS_fn_fumigene = {
	_loc = _this select 0;
	_aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];
			
	0 = _aslLoc spawn {
	
		_aslLoc = _this;
		
		_smoke1 = "#particlesource" createVehicleLocal _aslLoc;
		_smoke1 setposasl _aslLoc;
		_smoke1 setParticleCircle [0, [0, 0, 0]];
		_smoke1 setParticleRandom [0, [15 + random 10, 15 + random 10, 8], [1.5, 1.5, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 45, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.5], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke1 setDropInterval .01;
		
		_smokes = [_smoke1];
		waituntil {tempsRestant == 0};
		{
			deletevehicle _x;
		} foreach _smokes;
		
	};
};

nul = [] execVM "intro.sqf";