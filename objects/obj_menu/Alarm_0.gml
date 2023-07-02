/// @description Save
if file_exists("savedgame.save") file_delete("savedgame.save");

var _save_data = array_create(0);
	
with par_gameplay
{
	switch object_index
	{
		default:
			var _save_entity =
			{
				obj : object_get_name(object_index),
				y : y,
				x : x,
				life : life,
			}
			array_push(_save_data, _save_entity);
		break;
		case obj_inventory:
			var _save_entity =
			{
				obj : object_get_name(object_index),
				weapon_mod_sword : weapon_mod[Weapons.Sword],
				weapon_mod_bow : weapon_mod[Weapons.Bow],
			}
			array_push(_save_data, _save_entity);
		break;
	}
}
	
var _string = json_stringify(_save_data);
var  _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);
show_debug_message(_string);
