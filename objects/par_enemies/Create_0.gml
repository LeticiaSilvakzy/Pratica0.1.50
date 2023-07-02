/// @description variaveis do slime
//Moviment
randomize()
//Scripts
state = scr_slime_select_state;
next_state = 0;
//Moviment
hspd = 0;
vspd = 0;
spd = 0.2;
chase_spd = 0.5;

dest_x = 0;
dest_y = 0;

alarm[0] = 1;

aggro_range = 50;
desaggro_range = 100;

shadow = -1;

//Combat
max_life = 5;
life = max_life;
knockback_dir = 0;
knockback_spd = 0;
hit = false;
damage = 1;
poison = false;
poison_count = 0;
