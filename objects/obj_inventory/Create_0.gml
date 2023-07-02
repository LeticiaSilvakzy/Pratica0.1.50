/// @description Insert description here
inventory = false;
scale = 3;
weapon_scale = 16;

start_x = 18 * scale;
start_y = 34 * scale;

buffer_x = 20 * scale;
buffer_y = 26 * scale;

inventory_w = sprite_get_width(spr_inventario) * scale;
inventory_h = sprite_get_height(spr_inventario) * scale;

weapon = 0;

inputting = false;
mod_selected = 0;

enum Mod
{
	None,
	Slime,
	Helmet,
	Teeth,
	Height
}

enum Info
{
	Mod,
	Name,
	Height
}

for (var i = 0; i < Weapons.Altura; i++)
{
	weapon_mod[i] = 0;
}

grid_items = ds_grid_create(Info.Height, Mod.Height);
ds_grid_set_region(grid_items, 0, 0, Info.Height, Mod.Height, -1);
ds_grid_add_item(Mod.None, "None");
ds_grid_add_item(Mod.Slime, "Slime");
ds_grid_add_item(Mod.Helmet, "Helmet");
ds_grid_add_item(Mod.Teeth, "Teeth");
