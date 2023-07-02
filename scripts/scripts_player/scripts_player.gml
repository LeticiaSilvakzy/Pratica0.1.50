function scr_player_collision()
{
	if place_meeting(x + hspd, y, obj_wall)
	{
		while !place_meeting(x + sign(hspd), y, obj_wall)
		{
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;
	
	if place_meeting(x, y + vspd, obj_wall)
	{
		while !place_meeting(x, y + sign(vspd), obj_wall)
		{
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd;
	
	if obj_inventory.inventory
	{
		hspd = 0;
		vspd = 0;
	}
}

function scr_player_walking()
{
	if !obj_inventory.inventory
	{
		hspd = (keyboard_check(global.right) - keyboard_check(global.left));
		vspd = (keyboard_check(global.down) - keyboard_check(global.up));
	}
	
	spd_dir = point_direction(x, y, x + hspd, y + vspd);
	
	if hspd != 0 || vspd != 0
	{
		spd = 2;	
	}
	else
	{
		spd = 0;
	}
	
	hspd = lengthdir_x(spd, spd_dir);
	vspd = lengthdir_y(spd, spd_dir);
	
	scr_player_collision();
	
	dir = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90);
	if hspd != 0 || vspd != 0
	{
		switch dir
		{
			default:
				sprite_index = spr_personagem_correndo_direita;
			break;
			case 1:
				sprite_index = spr_personagem_correndo_cima;
			break;
			case 2:
				sprite_index = spr_personagem_correndo_esquerda;
			break;
			case 3:
				sprite_index = spr_personagem_correndo_baixo;
			break;
		}
	}
	else
	{
		switch dir
		{
			default:
				sprite_index = spr_personagem_parado_direita;
			break;
			case 1:
				sprite_index = spr_personagem_parado_cima;
			break;
			case 2:
				sprite_index = spr_personagem_parado_esquerda;
			break;
			case 3:
				sprite_index = spr_personagem_parado_baixo;
			break;
		}
	}
	
	if keyboard_check_pressed(global.dash) and dash_cooldown
	{
		dash_cooldown = false;
		alarm[0] = 10;
		dash_dir = point_direction(x, y, mouse_x, mouse_y);
		state = scr_player_dash;
		alarm[1] = 60;
	}
	
	if mouse_check_button_pressed(mb_left)
	{
		get_hit = false;
		ds_list_clear(attack_enemy);
		if weapon == Weapons.Sword
		{
			image_index = 0;
			switch dir
			{
				default:
					sprite_index = spr_personagem_atacando_direita;
					mask_index = spr_personagem_atacando_direita_hb;
				break;
				case 1:
					sprite_index = spr_personagem_atacando_cima;
					mask_index = spr_personagem_atacando_cima_hb;
				break;
				case 2:
					sprite_index = spr_personagem_atacando_esquerda;
					mask_index = spr_personagem_atacando_esquerda_hb;
				break
				case 3:
					sprite_index = spr_personagem_atacando_baixo;
					mask_index = spr_personagem_atacando_baixo_hb;
				break;
			}
		
			state = scr_player_attack;
		}
	}
	
	if mouse_check_button(mb_right)
	{
		if weapon == Weapons.Bow
		{
			
			image_index = 0;
			state = scr_player_bow;
		}
	}
}

function scr_player_attack()
{
	var enemies_in_hitbox = ds_list_create();
	var enemies = instance_place_list(x, y, par_enemies, enemies_in_hitbox, false);
	
	if (enemies) > 0
	{
		for (var i = 0; i < enemies; i++)
		{
			var enemiesID = enemies_in_hitbox[| i];
			if(ds_list_find_index(attack_enemy, enemiesID)) == -1
			{
				ds_list_add(attack_enemy, enemiesID);
				
				with(enemiesID)
				{
					switch obj_inventory.weapon_mod[Weapons.Sword]
					{
						case Mod.None:
							life -= obj_player.damage;
							var _dir = point_direction(obj_player.x, obj_player.y, other.x, other.y);
							knockback_dir = _dir;
							knockback_spd = 6;
							state = scr_slime_hit;
					
							alarm[1] = 5;
							hit = true;
					
							var _inst = instance_create_layer(x, y, "Instances", obj_hit);
							_inst.target = other;
							_inst.hit = obj_player.damage;
						break;
						case Mod.Slime:
							life -= obj_player.damage;
							var _dir = point_direction(obj_player.x, obj_player.y, other.x, other.y);
							knockback_dir = _dir;
							knockback_spd = 6;
							state = scr_slime_hit;
					
							alarm[1] = 5;
							hit = true;
					
							var _inst = instance_create_layer(x, y, "Instances", obj_hit);
							_inst.target = other;
							_inst.hit = obj_player.damage;
							poison = true;
						break;
						case Mod.Helmet:
							life -= obj_player.damage;
							var _dir = point_direction(obj_player.x, obj_player.y, other.x, other.y);
							knockback_dir = _dir;
							knockback_spd = 12;
							state = scr_slime_hit;
					
							alarm[1] = 5;
							hit = true;
					
							var _inst = instance_create_layer(x, y, "Instances", obj_hit);
							_inst.target = other;
							_inst.hit = obj_player.damage;
						break;
						case Mod.Teeth:
							life -= obj_player.damage + 4;
							var _dir = point_direction(obj_player.x, obj_player.y, other.x, other.y);
							knockback_dir = _dir;
							knockback_spd = 6;
							state = scr_slime_hit;
					
							alarm[1] = 5;
							hit = true;
					
							var _inst = instance_create_layer(x, y, "Instances", obj_hit);
							_inst.target = other;
							_inst.hit = obj_player.damage + 4;
						break;
					}
				}
			}
		}
	}
	
	ds_list_destroy(enemies_in_hitbox);
	
	if end_animation()
	{
		mask_index = spr_personagem_correndo_baixo;
		state = scr_player_walking;
		attack = false;
		get_hit = true;
	}
}

function scr_player_hit()
{
	if alarm[2] > 0
	{
		hspd = lengthdir_x(3, knockback_dir);
		vspd = lengthdir_y(3, knockback_dir);
	
		scr_player_collision();
	}
	else
	{
		state = scr_player_walking;
	}
}

function scr_player_bow()
{
	dir = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90);
	
	switch dir
	{
		default://direita
			sprite_index = spr_personagem_arco_direita;
		break;
		case 1://cima
			sprite_index = spr_personagem_arco_cima;
		break;
		case 2://esquerda
			sprite_index = spr_personagem_arco_esquerda;
		break;
		case 3://baixo
			sprite_index = spr_personagem_arco_baixo;
		break;
	}
	
	if end_animation()
	{
		image_index = 4;
	}
	
	if mouse_check_button_released(mb_right)
	{
		if image_index >= 4
		{
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			var _xx = lengthdir_x(5, _dir);
			var _yy = lengthdir_y(5, _dir);
			
			var _inst = instance_create_layer(x + _xx, y + _yy, "Instances", obj_arrow);
			_inst.direction = _dir;
			_inst.image_angle = _dir;
			_inst.speed = 12;
			
			knockback_dir = point_direction(mouse_x, mouse_y, x, y)
			alarm[2] = 5;
			state = scr_player_hit;
		}else
		{
			state = scr_player_walking
		}
	}
}

function scr_player_dash()
{
	get_hit = false;
	hspd = lengthdir_x(dash_spd, dash_dir);
	vspd = lengthdir_y(dash_spd, dash_dir);
	
	scr_player_collision();
	
	var _inst = instance_create_layer(x, y, "Instances", obj_dash);
	_inst.sprite_index = sprite_index;
}
