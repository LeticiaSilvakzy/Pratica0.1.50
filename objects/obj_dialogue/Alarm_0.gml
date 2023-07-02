/// @description Insert description here
if initialize
{
	if characters < string_length(text_grid[# Info_Text.Text, page])
	{
		characters++;
		alarm[0] = 1;
	}
}
