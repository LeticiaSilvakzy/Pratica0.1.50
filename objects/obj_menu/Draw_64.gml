/// @description Insert description here
if (global.pause or room = Menu)
{
	//display_set_gui_size(global.width, global.height);
	draw_set_font(fnt_test);
	var _gwidth = display_get_gui_width()/*global.width*/, _gheight = display_get_gui_height()/*global.height*/;

	var _ds_grid = menu_pages[page], _ds_height = ds_grid_height(_ds_grid);
	var _y_buffer = 18, _x_buffer = 8;
	var _start_y = (_gheight/2) - (((_ds_height - 1)/2) * _y_buffer), _start_x;
	
	if (room = Menu) { _start_x = _gheight/1.1; } else { _start_x = _gheight/2; }

	var _c = c_black;
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, _gwidth, _gheight, _c, _c, _c, _c, false);
	draw_set_alpha(1);

	draw_set_valign(fa_middle);
	
	if room = Menu and (menu_pages[page] = menu_main or menu_pages[page] = menu_settings)
	{
		draw_set_halign(fa_center);
	}
	else
	{
		draw_set_halign(fa_right);
	}
	
	var _ltx = _start_x - _x_buffer, _lty, _x;

	for(var _y = 0; _y < _ds_height; _y++)
	{
		_lty = _start_y + (_y * _y_buffer);
		_c = c_white; _x = 0;
		
		if (_y = menu_options[page])
		{
			_x = -(_x_buffer / 2);
		}
		
		draw_text_color(_ltx + _x, _lty, _ds_grid[# 0, _y], _c, _c, _c, _c, 1);
	}

	draw_set_halign(fa_left);

	var _rtx = _start_x + _x_buffer, _rty;

	for(_y = 0; _y < _ds_height; _y++)
	{
		_rty = _start_y + (_y * _y_buffer);
		switch(_ds_grid[# 1, _y])
		{
			case menu_element.shift: 
				var _current_val = _ds_grid[# 3, _y];
				var _current_array = _ds_grid[# 4, _y];
				var _left_shift = "<< ";
				var _right_shift = " >>";
			
				if (_current_val = 0) _left_shift = "";
				if (_current_val = array_length_1d(_ds_grid[# 4, _y]) -1) _right_shift = "";
			
				_c = c_white;
				if (inputting and _y = menu_options[page]) { _c = c_yellow; }
				draw_text_color(_rtx, _rty, _left_shift+_current_array[_current_val]+_right_shift, _c, _c, _c, _c, 1);
			break;
			
			case menu_element.slider:
				var _len = 64;
				var _current_val = _ds_grid[# 3, _y];
				var _current_array = _ds_grid[# 4, _y];
				var _circle_pos = ((_current_val - _current_array[0]) / (_current_array[1] - _current_array[0]));
				_c = c_white;
				
				draw_line_width(_rtx, _rty, _rtx + _len, _rty, 2);
				
				if (inputting and _y = menu_options[page]) { _c = c_yellow; }
				draw_circle_color(_rtx + (_circle_pos * _len), _rty, 4, _c, _c, false);
				draw_text_color(_rtx + (_len * 1.2), _rty, string(floor(_circle_pos * 100))+"%", _c, _c, _c, _c, 1);
			break;
			
			case menu_element.toggle:
				var _current_val = _ds_grid[# 3, _y];
				var _c1, _c2;
				_c = c_white;
				
				if (inputting and _y = menu_options[page]) { _c = c_yellow; }
				
				if (_current_val = 0) { _c1 = _c; _c2 = c_dkgray; }
				else { _c1 = c_dkgray; _c2 = _c; }
				
				draw_text_color(_rtx, _rty, "ON", _c1, _c1, _c1, _c1, 1);
				draw_text_color(_rtx + 32, _rty, "OFF", _c2, _c2, _c2, _c2, 1);
			break;
			
			case menu_element.input:
				var _current_val = _ds_grid[# 3, _y];
				var _string_val;
				
				switch(_current_val)
				{
					case vk_up: _string_val = "UP KEY"; break;
					case vk_down: _string_val = "DOWN KEY"; break;
					case vk_left: _string_val = "LEFT KEY"; break;
					case vk_right: _string_val = "RIGHT KEY"; break;
					case vk_space: _string_val = "SPACE KEY"; break;
					default: _string_val = chr(_current_val); break;
				}
				
				_c = c_white;
				if (inputting and _y = menu_options[page]) { _c = c_yellow; }
				draw_text_color(_rtx, _rty, _string_val, _c, _c, _c, _c, 1);
			break;
		}
	}

	draw_set_valign(fa_top);
	//display_set_gui_size(-1, -1);
}
