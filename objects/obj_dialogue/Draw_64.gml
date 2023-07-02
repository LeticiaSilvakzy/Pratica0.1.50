/// @description Insert description here
if initialize
{
	var _guiW = display_get_gui_width();
	var _guiH = display_get_gui_height();

	var _x = 0, _y = _guiH - 200, _c = c_black;
	//var _sprite = text_grid[# Info_Text.Portait, page]
	var _text = string_copy(text_grid[# Info_Text.Text, page], 0, characters);
	var _stgBuffer = 6;
	draw_set_font(fnt_test);

	if text_grid[# Info_Text.Side, page] = 0
	{
		draw_rectangle_color(_x + 200, _y, _guiW, _guiH, _c, _c, _c, _c, false);
		draw_rectangle_color(_x + 200, _y, _guiW, _guiH, c_white, c_white, c_white, c_white, true);
		var _stgW = string_width(text_grid[# Info_Text.Name, page]);
		draw_sprite_ext(spr_op_background, 0, _x + 216, _y - 32, (_stgW + _stgBuffer * 2)/16, 1, 0, c_white, 1);
		draw_text(_x + 216  + _stgBuffer, _y - 32, text_grid[# Info_Text.Name, page]);
		draw_text_ext(_x + 232, _y + 32, _text, 32, _guiW - 264);
		
		//draw_sprite_ext(_sprite, 0, 100, _guiH, 3, 3, 0, c_white, 1);
	}
	else
	{
		draw_rectangle_color(_x, _y, _guiW - 200, _guiH, _c, _c, _c, _c, false);
		draw_rectangle_color(_x, _y, _guiW - 200, _guiH, c_white, c_white, c_white, c_white, true);
		var _stgW = string_width(text_grid[# Info_Text.Name, page]);
		draw_sprite_ext(spr_op_background, 0, _guiW - 216 - _stgW, _y - 32, (_stgW + _stgBuffer * 2)/16, 1, 0, c_white, 1);
		draw_text(_guiW - 216 - _stgW + _stgBuffer, _y - 32, text_grid[# Info_Text.Name, page]);
		draw_text_ext(_x + 32, _y + 32, _text, 32, _guiW - 264);
		
		//draw_sprite_ext(_sprite, 0, _guiW - 100, _guiH, -3, 3, 0, c_white, 1);
	}
	
	if option_draw
	{
		var _opx = _x + 32;
		var _opy = _y - 48;
		var _opsep = 48;
		var _opBuffer = 6;
		
		option_selected += keyboard_check_pressed(global.up) - keyboard_check_pressed(global.down);
		option_selected = clamp(option_selected, 0, option_number - 1);
		
		for (var i = 0; i < option_number; i++)
		{
			var _stringW = string_width(option[i]);
			draw_sprite_ext(spr_op_background, 0, _opx, _opy - (_opsep * i), (_stringW + _opBuffer * 2)/16, 1, 0, c_white, 1);
			draw_text(_opx + _opBuffer, _opy - (_opsep * i), option[i]);
			
			if option_selected = i
			{
				draw_sprite(spr_op_selected, 0, _x + 14, _opy - (_opsep * i) + 14);
			}
		}
		
		if keyboard_check_pressed(global.interact) or mouse_check_button_pressed(mb_left)
		{
			var _dialogue = instance_create_layer(x, y, "Dialogs",	obj_dialogue);
			_dialogue.npc_name = option_answer[option_selected];
			
			instance_destroy();
		}
	}
}
