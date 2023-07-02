if initialize = false
{
	scr_dialogs();
	initialize = true;
	alarm[0] = 1;
}


if characters < string_length(text_grid[# Info_Text.Text, page])
{
	if keyboard_check_pressed(global.interact) or mouse_check_button_pressed(mb_left)
	{
		characters = string_length(text_grid[# Info_Text.Text, page]);
	}
}
else
{
	if page < ds_grid_height(text_grid) - 1
	{
		if keyboard_check_pressed(global.interact) or mouse_check_button_pressed(mb_left)
		{
			alarm[0] = 1;
			characters = 0;
			page++
		}
	}
	else
	{
		if option_number != 0
		{
			option_draw = true;
		}
		else
		{
			if keyboard_check_pressed(global.interact) or mouse_check_button_pressed(mb_left)
			{
				global.dialogue = false;
				instance_destroy();
			}
		}
	}
}
