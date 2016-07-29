private ["_nombreAlea", "_zone", "_pos"];

_i = 0;

_tab = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]  call BIS_fnc_arrayShuffle;

while {true} do 
{
	// purgeur
	{deletevehicle _x} forEach allDead;
	
	// changement de zone c�t� client
	[0, "BwS_fn_transitionZone", true, false, false] call BIS_fnc_MP; 
	sleep 2;
	
	// d�finition de la zone
	_nombreAlea = _tab select (_i%12);
	_i = _i + 1;
	
	// Placement des murs
	_zone = format ["zone_%1", _nombreAlea];
	_pos = getMarkerPos _zone;

	nul = [_pos] execVM "wallplacement.sqf";
	
	CTF = round random 1;
	publicVariable "CTF";
	
	// placement du quadrillage
	"zonecombat" setMarkerPos (getMarkerPos _zone);
	
	// placement des triggers de capture
	zoneA setPos (getMarkerPos (format ["zoneA_%1", _nombreAlea]));
	zoneB setPos (getMarkerPos (format ["zoneB_%1", _nombreAlea]));
	zoneC setPos (getMarkerPos (format ["zoneC_%1", _nombreAlea]));
	
	// placement des t�ches
	secteurA setPos (getMarkerPos (format ["zoneA_%1", _nombreAlea]));
	secteurB setPos (getMarkerPos (format ["zoneB_%1", _nombreAlea]));
	secteurC setPos (getMarkerPos (format ["zoneC_%1", _nombreAlea]));
	
	// placement des drapeaux
	drapeauA setpos position secteurA;
	drapeauB setpos position secteurB;
	drapeauC setpos position secteurC;
	
	// personne ne poss�de les modules
	secteurA setVariable ["owner", sideUnknown, true];
	secteurB setVariable ["owner", sideUnknown, true];
	secteurC setVariable ["owner", sideUnknown, true];
	
	// changement des spawns
	"respawn_west" setMarkerPos (getMarkerPos (format ["resp_west_%1", _nombreAlea]));
	"respawn_east" setMarkerPos (getMarkerPos (format ["resp_east_%1", _nombreAlea]));
	
	// TP des joueurs � leurs spawns
		// ---> d�plac� dans surveillerJoueur.sqf	
		
	sleep 0.5;
	
	// fumi sur les spawns
	// [[(getMarkerPos "respawn_west")], "BwS_fn_fumigene", true, true, false] call BIS_fnc_MP; 
	// [[(getMarkerPos "respawn_east")], "BwS_fn_fumigene", true, true, false] call BIS_fnc_MP; 
	
	tempsRestant = 900;
	waitUntil {sleep 1; 
				tempsRestant = tempsRestant - 1; 
				publicVariable "tempsRestant";
				tempsRestant == 0}; // 15 minutes entre chaque round
				
};