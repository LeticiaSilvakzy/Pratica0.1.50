// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_select_state(){
	scr_slime_check_player();
	next_state = choose(scr_slime_walking, scr_slime_idle);
	
	if next_state == scr_slime_walking{
		state = scr_slime_walking;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	}else if next_state == scr_slime_idle{
		state = scr_slime_idle;
	}
}

function scr_slime_check_player(){
	if distance_to_object(obj_player) <= aggro_range{
		state = scr_slime_chase;
	}
}

function scr_slime_collision(){
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
}

function scr_slime_walking(){
	scr_slime_check_player();
	image_speed = 1;
	
	if distance_to_point(dest_x, dest_y) > spd
	{
		var _dir = point_direction(x, y, dest_x, dest_y);
		hspd = lengthdir_x(spd, _dir);
		vspd = lengthdir_y(spd, _dir);
	}
	else
	{
		x = dest_x;
		y = dest_y;
	}
	
	scr_slime_collision();
}

function scr_slime_idle(){
	scr_slime_check_player();
	image_speed = 0.5;
}

function scr_slime_chase(){
	image_speed = 1.5;
	
	dest_x = obj_player.x;
	dest_y = obj_player.y;
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hspd = lengthdir_x(chase_spd, _dir);
	vspd = lengthdir_y(chase_spd, _dir);
	
	scr_slime_collision();
	
	if distance_to_object(obj_player) >= desaggro_range
	{
		state = scr_slime_select_state;
		alarm[0] = irandom_range(120, 240);
	}
}
	
function scr_slime_hit(){
	alarm[2] = 180;
	knockback_spd = lerp(knockback_spd, 0, 0.05)
	
	hspd = lengthdir_x(knockback_spd, knockback_dir);
	vspd = lengthdir_y(knockback_spd, knockback_dir);
	
	scr_slime_collision();
}
	

