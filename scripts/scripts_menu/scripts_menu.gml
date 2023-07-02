// Script assets have changed for v2.3.0 see
function scr_create_menu_page()
{
	///@arg ["Name1", type1, entries1...]
	///@arg ["Name2", type2, entries2...]
	
	var _arg;
	for(var i = 0; i < argument_count; i++)
	{
		_arg[i] = argument[i];
	}
	
	var _ds_grid_id = ds_grid_create(5, argument_count);
	for(var i = 0; i < argument_count; i++)
	{
		var _array = _arg[i];
		var _array_len = array_length_1d(_array);
		
		for (var _x = 0; _x < _array_len; _x++)
		{
			_ds_grid_id[# _x, i] = _array[_x];
		}
	}
	
	return _ds_grid_id;
}

function scr_resume_game()
{
	menu_pause = true;
}

function scr_exit_game()
{
	game_end();
}

function scr_change_volume()
{
	var _type = menu_options[page];
	
	switch (_type)
	{
		case 0: audio_master_gain(argument0); global.master = argument0; break;
		case 1: audio_group_set_gain(audiogroup_soundeffects, argument0, 0); global.sounds = argument0; break;
		case 2: audio_group_set_gain(audiogroup_musics, argument0, 0); global.music = argument0; break;
	}
}

function scr_change_resolution()
{
	switch(argument0)
	{
		case 0: window_set_size(1280, 768); break;
		case 1: window_set_size(1366, 768); break;
	}
	global.resolution = argument0;
}

function scr_change_window()
{
	switch (argument0)
	{
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}
	
	global.window = argument0;
}

function scr_start_game()
{
	scr_save_config();
	room_goto(Room1);
}

function scr_save_game()
{
	menu_pause = true;
	alarm[0] = 1;
}

function scr_load_game()
{
	if room = Menu
	{
		room_goto(Room1);
	}
	else
	{
		menu_pause = true;
	}
	obj_control.alarm[0] = 1;
}
