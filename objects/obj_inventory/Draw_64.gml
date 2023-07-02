/// @description Insert description here
var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();

if inventory == true
{
	var _invx = _guiw/2 - inventory_w/2;
	var _invy = _guih/2 - inventory_h/2;
	
	var _weaponsx = _invx + start_x;
	var _weaponsy = _invy + start_y;
	
	var _modsx = (_invx * 2) + buffer_x;
	var _modsy = _invy + buffer_y;
	
	var _c = c_white;
	draw_set_font(fnt_test);
	
	draw_sprite_ext(spr_inventario_weapons, 0, _invx, _invy, scale, scale, 0, c_white, 1);
	
	if !inputting
	{
		var _mod_selected;
		for (var i = 0; i < Weapons.Altura; i++)
		{
			var _check = 0;
			while weapon_mod[i] != grid_items[# Info.Mod, _check] { _check++; }
			_mod_selected[i] = grid_items[# Info.Name, _check];
		}
		if weapon = 0
		{
			draw_sprite_ext(spr_items_weapons, 0, _weaponsx, _weaponsy - 50, weapon_scale, weapon_scale, 0, c_white, 1);
			draw_text_color(_weaponsx + 50, _weaponsy + 200, "Sword", _c, _c, _c, _c, 1);
			
			draw_text_color(_weaponsx + 50, _weaponsy + 250, "Mod Selected: " + string(_mod_selected[0]), _c, _c, _c, _c, 1);
			
			draw_sprite_ext(spr_items_weapons, 1, _weaponsx * 2, _weaponsy, weapon_scale, weapon_scale, 0, c_white, 1);
			draw_text_color(_weaponsx * 2, _weaponsy + 250, "Bow", _c, _c, _c, _c, 1);
			
			draw_text_color(_weaponsx * 2, _weaponsy + 300, "Mod Selected: " + string(_mod_selected[1]), _c, _c, _c, _c, 1);
		}
		else
		{
			draw_sprite_ext(spr_items_weapons, 0, _weaponsx, _weaponsy, weapon_scale, weapon_scale, 0, c_white, 1);
			draw_text_color(_weaponsx + 50, _weaponsy + 250, "Sword", _c, _c, _c, _c, 1);
			
			draw_text_color(_weaponsx + 50, _weaponsy + 300, "Mod Selected: " + string(_mod_selected[0]), _c, _c, _c, _c, 1);
	
			draw_sprite_ext(spr_items_weapons, 1, _weaponsx * 2, _weaponsy - 50, weapon_scale, weapon_scale, 0, c_white, 1);
			draw_text_color(_weaponsx * 2, _weaponsy + 200, "Bow", _c, _c, _c, _c, 1);
			
			draw_text_color(_weaponsx * 2, _weaponsy + 250, "Mod Selected: " + string(_mod_selected[1]), _c, _c, _c, _c, 1);
		}
	}
	else
	{
		draw_sprite_ext(spr_items_weapons, weapon, _weaponsx, _weaponsy, weapon_scale, weapon_scale, 0, c_white, 1);
		draw_text_color(_weaponsx + 50, _weaponsy + 250, "Select a Mod", _c, _c, _c, _c, 1);
		
		var _ds_height = ds_grid_height(grid_items);
		var  _x;
		for (var i = 0; i < _ds_height; i++;)
		{
			_x = 0;
			if i = mod_selected { _x = 15; }
			if grid_items[# Info.Mod, i] = Mod.None
			{
				draw_text_color(_modsx + _x, _modsy, grid_items[# Info.Name, i], _c, _c, _c, _c, 1);
			}
			else if grid_items[# Info.Mod, i] != -1
			{
				draw_sprite(spr_items_inimigos, grid_items[# Info.Mod, i] - 1, _modsx + _x, _modsy + (buffer_y * i));
				draw_text_color(_modsx + 15 + _x, _modsy + (buffer_y * i), grid_items[# Info.Name, i], _c, _c, _c, _c, 1);
			}
		}
	}
}
