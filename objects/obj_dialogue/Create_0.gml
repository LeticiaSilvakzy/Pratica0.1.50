/// @description Insert description here
enum Info_Text
{
	Text,
	Name,
	Side,
	Height
}

npc_name = "";
text_grid = ds_grid_create(Info_Text.Height, 0);
page = 0;

option[0] = "";
option_answer[0] = "";
option_number = 0;
option_selected = 0;
option_draw = false;

initialize = false;

characters = 0;
alarm[0] = 1;
