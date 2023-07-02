/// @description Insert description here
if other.get_hit == true
{
	var _dir = point_direction(x, y, other.x, other.y);

	with(other)
	{
		knockback_dir = _dir;
		state = scr_player_hit;
		alarm[2] = 10;
		alarm[3] = 90;
		get_hit = false;
		life -= 1
	}
	
	var _inst = instance_create_layer(x, y, "Instances", obj_hit);
	_inst.target = other;
	_inst.hit = 1;
}
