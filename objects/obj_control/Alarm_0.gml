/// @description Load
with par_gameplay instance_destroy();
	
if file_exists("savedgame.save")
{
	var _buffer = buffer_load("savedgame.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
		
	var _load_data = json_parse(_string);
		
	while array_length(_load_data) > 0
	{
		var _load_entity = array_pop(_load_data);
		with instance_create_layer(0, 0, "Instances", asset_get_index(_load_entity.obj))
		{
			switch object_index
			{
				default:
					x = _load_entity.x;
					y = _load_entity.y;
					life = _load_entity.life;			
				break;
				case obj_inventory:
					weapon_mod[Weapons.Sword] = _load_entity.weapon_mod_sword;
					weapon_mod[Weapons.Bow] = _load_entity.weapon_mod_bow;
				break;
			}
		}
	}
}
