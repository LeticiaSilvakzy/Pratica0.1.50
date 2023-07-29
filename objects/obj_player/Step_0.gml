/// @description Insert description here
if !global.dialogue
{
	script_execute(state);
}

if keyboard_check_pressed(global.change_right)
{
	weapon += 1;
}

if keyboard_check_pressed(global.change_left)
{
	weapon -= 1;
}

if weapon >= Weapons.Altura
{
	weapon = 0
}else if weapon < 0
{
	weapon = Weapons.Altura - 1;
}

if distance_to_object(par_npc) <= 10
{
	if keyboard_check_pressed(global.interact) and global.dialogue = false
	{
		var _npc = instance_nearest(x, y, par_npc)
		var _dialogue = instance_create_layer(x, y, "Dialogs", obj_dialogue)
		_dialogue.npc_name = _npc.name_npc;
	}
}




