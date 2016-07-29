
execVM "surveillerJoueur.sqf";

player enableFatigue false;

// player unassignItem "ItemMap";
// player removeItem "ItemMap";

// invincibilité anti spawn kill
player allowDamage false;
sleep 10;
player allowDamage true;