private ["_killer"];

deleteVehicle (_this select 0);

_killer = _this select 1;

if (side player != side _killer) then {
	_killer setVariable ["nombreKill", (_killer getVariable ["nombreKill", 0]) + 1, true];
}
else {
	_killer setVariable ["nombreKill", (_killer getVariable ["nombreKill", 0]) - 1, true];
	_killer setDamage 1;
};