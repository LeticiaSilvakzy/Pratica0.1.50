/// @description passos do slime
script_execute(state);

if poison
{
	alarm[3] = 60;
	poison = false;
}


if life <= 0
{
	/*if obj_player.level < 5
	{
		obj_player.xp += 25;
	}*/
	instance_destroy();
}
