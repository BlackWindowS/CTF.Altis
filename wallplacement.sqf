// usage [position] execVM "wallplacement.sqf";

private ["_zone", "_wallName", "_wallmultiplier", "_numWalls", "_walls"];
_zone = _this select 0;

_radius = 300;

_wallName = "Land_CncWall4_F";
_wallmultiplier = 0.2;
_numWalls = 2 * _radius * 3.14 * _wallmultiplier;
_walls = [];
for[{_i = 0}, {_i <= 360}, {_i = _i + (_radius / _numWalls)}] do
{
	_x = (_zone select 0) + (_radius * sin(_i));
	_y = (_zone select 1) + (_radius * cos(_i));
	_w = _wallName createVehicle [_x, _y,0];
	_w setPos [_x, _y, 0];
	_vectorUp = surfaceNormal [_x, _y, 0];
	_w setDir _i;
	_w setVectorUp _vectorUp;
	_walls pushBack _w;
};

waituntil {tempsRestant == 0};

{deleteVEhicle _x} forEach _walls;