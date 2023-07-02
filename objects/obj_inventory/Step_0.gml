/// @description Insert description here
if keyboard_check_pressed(global.inventory)
{
	inventory = !inventory;
}

input_enter = keyboard_check_pressed(vk_enter);

if inventory
{
	if !inputting
	{
		var _w_change = keyboard_check_pressed(global.right) - keyboard_check_pressed(global.left);
		if _w_change != 0
		{
			weapon += _w_change
			if weapon > 1 { weapon = 0; }
			if weapon < 0 { weapon = 1; }
		}
	}
	else
	{
		var _check = 0;
		if grid_items[# Info.Mod, ds_grid_height(grid_items) - 1] = -1
		{
			var _grid = grid_items;
			while _grid[# Info.Mod, _check] != -1
			{
				_check++;
			}
		}
		else
		{
			_check = ds_grid_height(grid_items);
		}
		var _mod_change = keyboard_check_pressed(global.down) - keyboard_check_pressed(global.up);
		if _mod_change != 0
		{ 
			mod_selected += _mod_change;
			if mod_selected > _check - 1
			{ 
				mod_selected = 0;
			}
			else if mod_selected < 0
			{
				mod_selected = _check - 1;
			}
		}
	}

	if !inputting and input_enter
	{
		inputting = !inputting;
	}
	else if inputting and input_enter
	{
		inputting = !inputting;
		weapon_mod[weapon] = grid_items[# Info.Mod, mod_selected];
	}
}
