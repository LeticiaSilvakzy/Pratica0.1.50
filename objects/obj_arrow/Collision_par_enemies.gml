/// @description Insert description here
switch obj_inventory.weapon_mod[Weapons.Bow]
{
	case Mod.None:
		var _dano = obj_player.damage;
		var _dir = point_direction(x, y, other.x, other.y);

		other.knockback_dir = _dir;
		other.knockback_spd = 6;
		other.hit = true;
		other.alarm[1] = 5;
		other.state = scr_slime_hit;
		other.life -= _dano;

		var _inst = instance_create_layer(x, y, "Instances", obj_hit);
		_inst.target = other;
		_inst.hit = _dano;
	break;
	case Mod.Slime:
		var _dano = obj_player.damage;
		var _dir = point_direction(x, y, other.x, other.y);

		other.knockback_dir = _dir;
		other.knockback_spd = 6;
		other.hit = true;
		other.alarm[1] = 5;
		other.state = scr_slime_hit;
		other.life -= _dano;

		var _inst = instance_create_layer(x, y, "Instances", obj_hit);
		_inst.target = other;
		_inst.hit = _dano + 4;
		other.poison = true;
	break;
	case Mod.Helmet:
		var _dano = obj_player.damage;
		var _dir = point_direction(x, y, other.x, other.y);

		other.knockback_dir = _dir;
		other.knockback_spd = 12;
		other.hit = true;
		other.alarm[1] = 5;
		other.state = scr_slime_hit;
		other.life -= _dano;

		var _inst = instance_create_layer(x, y, "Instances", obj_hit);
		_inst.target = other;
		_inst.hit = _dano;
	break;
	case Mod.Teeth:
		var _dano = obj_player.damage + 4;
		var _dir = point_direction(x, y, other.x, other.y);

		other.knockback_dir = _dir;
		other.knockback_spd = 6;
		other.hit = true;
		other.alarm[1] = 5;
		other.state = scr_slime_hit;
		other.life -= _dano;

		var _inst = instance_create_layer(x, y, "Instances", obj_hit);
		_inst.target = other;
		_inst.hit = _dano;
	break;
}

instance_destroy();
