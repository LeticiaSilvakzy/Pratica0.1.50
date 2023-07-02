/// @description Variaveis
event_inherited();
state = scr_player_walking;

#region Moviment
	hspd = -1;
	vspd = -1;
	spd_dir = -1;
	spd = -1;
	dir = -1;
	
	dash_spd = 5;
	dash_dir = -1;
	dash_cooldown = true;
#endregion

#region Combat
	enum Weapons
	{
		Sword,
		Bow,
		Altura
	}

	attack_enemy = ds_list_create();
	weapon = 0;
	
	life = 100;
	damage = 1;
	get_hit = true;
	knockback_dir = 0;

	attack = false;

	hit_alpha = -1;
#endregion
