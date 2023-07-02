/// @description Insert description here
var _grid = global.grid_depth;
var _num = instance_number(par_objects);

ds_grid_resize(_grid, 2, _num);

var i = 0;
with(par_objects)
{
	_grid[# 0, i] = id;
	_grid[# 1, i] = y;
	i++;
}

ds_grid_sort(_grid, 1, true);
//ds_grid_sort(_grid, 0, true);

for	(i = 0; i < ds_grid_height(_grid); i++)
{
	var _isnt = _grid[# 0, i];
	with(_isnt)
	{
		event_perform(ev_draw, 0);
	}
}
