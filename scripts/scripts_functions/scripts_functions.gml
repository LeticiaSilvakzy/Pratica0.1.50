function draw_text_colour_outline()
{
    //Created by Andrew McCluskey http://nalgames.com/
 
    ///@arg x
    ///@arg y
    ///@arg str
    ///@arg outwidth
    ///@arg outcol
    ///@arg outfidelity
    ///@arg separation
    ///@arg width
 
 
    //2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
    var dto_dcol = draw_get_color();
 
    draw_set_color(argument4);
 
    for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
    {
      //draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
      draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
    }
 
    draw_set_color(dto_dcol);
 
    draw_text_ext(argument0,argument1,argument2,argument6,argument7);
}

function end_animation()
{
	/// @description animation_end(sprite_index,image_index, rate)
    /// @param {real} <sprite_index> The index of the sprite being animated
    /// @param {real} <image_index> The current frame value
    /// @param {real} <rate> -See Below-
    ///     The rate of change in frames per step if not
    ///     using built in image_index/image_speed.  
    ///     Don't use if you don't think you need this.  You probably don't.
 
    //returns true if the animation will loop this step.
 
    //Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
    //https://www.reddit.com/r/gamemaker/wiki/discord
 
    var _sprite = sprite_index;
    var _image = image_index;
    if(argument_count > 0)   _sprite = argument[0];
    if(argument_count > 1)  _image = argument[1];
    var _type = sprite_get_speed_type(sprite_index);
    var _spd = sprite_get_speed(sprite_index)*image_speed;
    if(_type == spritespeed_framespersecond)
        _spd = _spd/room_speed;
    if(argument_count > 2) _spd = argument[2];
    return _image + _spd >= sprite_get_number(_sprite);
}

function ds_grid_add_item()
{
	///@arg Mod
	///@arg Name
	
	var _grid = obj_inventory.grid_items;
	
	var _check = 0;
	while _grid[# Info.Mod, _check] != -1
	{
		_check++;
	}
	
	_grid[# 0, _check] = argument[0];
	_grid[# 1, _check] = argument[1];
}

function ds_grid_add_row()
{
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);
}

function scr_save_config()
{
	if file_exists("gameconfig.save") file_delete("gameconfig.save");

	var _save_config;
	
	with obj_control
	{
		_save_config =
		[
			global.up,
			global.down,
			global.left,
			global.right,
			global.dash,
			global.interact,
			global.change_left,
			global.change_right,
			global.inventory,

			global.resolution,
			global.window,

			global.master,
			global.sounds,
			global.music
		];	
	}
	
	var _string = json_stringify(_save_config);
	var  _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "gameconfig.save");
	buffer_delete(_buffer);
	show_debug_message(_string);

}
