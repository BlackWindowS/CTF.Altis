sleep 3;
while {alive player} do 
{
	if (player distance getMarkerPos "zonecombat" > 600) then // téléportation changement de zone
	{
		if (side player == east) then {player setPos getMarkerPos "respawn_east"}
		else {player setPos getMarkerPos "respawn_west"};
		player setDamage 0;
		vehicle player setVehicleAmmoDef 1;
	};
	
	if (damage player > 0) then {
		player setDamage (damage player)-0.00005;
	};
	
	// ********* HUD ***********
	private ["_text"];
	
	// Nom du joueur
	_text = format ["<t size='2' color='#00ff00'>%1</t><br />", name player]; 
	
	// Santé du joueur
	_text = _text + format ["<br /><t size='1' align='left'>HP : %1%2</t><br />", 100-floor(damage player *100), "%"]; 
	
	// Affichage du temps restant
	_text = _text + format ["<br /><t size='1' align='left'>Temps restant/Time remaining : </t><t size='1.3' align='left' %3>%1:%2</t><br />", floor(tempsRestant / 60), (tempsRestant % 60), if (tempsRestant < 120) then {"color='#ff0000'"} else {"color='#00ff00'"}]; 
	
	{
		_text = _text + format ["<br /><t size='1.4' align='center' color='%1'>%2%3</t>", switch (_x getVariable "owner") do {case side player : {"#00ff00"}; case sideUnknown : {"#77777777"}; default {"#ff0000"}},
																						switch (_x getVariable "owner") do {case side player : {"HOLD/TENIR "}; case sideUnknown: {"NUL "}; default {"CAPTURE "}},
																						switch (_x) do {case secteurA : {"A"}; case secteurB : {"B"}; case secteurC : {"C"};}];
	
	} forEach [secteurA, secteurB, secteurC];

	// affichage des joueurs
	{
		_text = _text + format ["<br /><t size='0.8' align='left' %1>%2</t>", switch (side _x) do {case side player:{"color='#00ff00'"}; default {"color='#ff0000'"}}, name _x];
	} forEach allPlayers;
	
	// Hint final
	hintsilent parseText _text;
	sleep 0.01;
};