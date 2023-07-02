/// @description Insert description here
//if (!global.pause) exit;
if (global.pause or room = Menu)
{
	input_up = keyboard_check_pressed(global.up);
	input_down = keyboard_check_pressed(global.down);
	input_enter = keyboard_check_pressed(vk_enter);

	var _ds_grid = menu_pages[page], _ds_height = ds_grid_height(_ds_grid);

	if (inputting)
	{
		switch (_ds_grid[# 1, menu_options[page]])
		{
			case menu_element.shift:
				var _h_input = keyboard_check_pressed(global.right) - keyboard_check_pressed(global.left);
				if (_h_input != 0)
				{
					_ds_grid[# 3, menu_options[page]] += _h_input;
					_ds_grid[# 3, menu_options[page]] = clamp(_ds_grid[# 3, menu_options[page]], 0, array_length_1d(_ds_grid[# 4, menu_options[page]]) -1);
				}
			break;
			case menu_element.slider:
				var _h_input = keyboard_check(global.right) - keyboard_check(global.left);
				if (_h_input != 0)
				{
					_ds_grid[# 3, menu_options[page]] += _h_input * 0.01;
					_ds_grid[# 3, menu_options[page]] = clamp(_ds_grid[# 3, menu_options[page]], 0, 1);
				}
			break;
			case menu_element.toggle:
				var _h_input = keyboard_check_pressed(global.right) - keyboard_check_pressed(global.left);
				if (_h_input != 0)
				{
					_ds_grid[# 3, menu_options[page]] += _h_input;
					_ds_grid[# 3, menu_options[page]] = clamp(_ds_grid[# 3, menu_options[page]], 0, 1);
				}
			break;
			case menu_element.input:
				var _k = keyboard_lastkey;
				if _k != vk_enter //and _k != vk_escape
				{
					_ds_grid[# 3, menu_options[page]] = _k;
					variable_global_set(_ds_grid[# 2, menu_options[page]], _k);
				}
			break;
		}
	}
	else
	{
		var _o_change = input_down - input_up;
		if (_o_change != 0)
		{
			menu_options[page] += _o_change;
			if (menu_options[page] > _ds_height - 1) { menu_options[page] = 0; }
			if (menu_options[page] < 0 ) { menu_options[page] = _ds_height -1; }
		}
	}

	if (input_enter)
	{
		switch (_ds_grid[# 1, menu_options[page]])
		{
			case menu_element.script_runner: script_execute(_ds_grid[# 2, menu_options[page]]); break;
			case menu_element.page_transfer: page = _ds_grid[# 2, menu_options[page]]; break;
			case menu_element.shift: 
			case menu_element.slider: 
			case menu_element.toggle: if (inputting) { script_execute(_ds_grid[# 2, menu_options[page]], _ds_grid[# 3, menu_options[page]]); }
			case menu_element.input: 
				inputting = !inputting;
				break;
		}
	}
}
