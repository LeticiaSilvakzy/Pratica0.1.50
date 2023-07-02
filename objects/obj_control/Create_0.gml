/// @description Insert description here
enum Config
{
	Up,
	Down,
	Left,
	Right,
	Dash,
	Interact,
	Change_left,
	Change_right,
	Inventory,
	Resolution,
	Window,
	Master,
	Sounds,
	Music
}

if file_exists("gameconfig.save")
{
	var _buffer = buffer_load("gameconfig.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	

	var _load_data = json_parse(_string);
	show_debug_message(_load_data);
	
	global.up = _load_data[Config.Up];
	global.down = _load_data[Config.Down];
	global.left = _load_data[Config.Left];
	global.right = _load_data[Config.Right];
	global.dash = _load_data[Config.Dash];
	global.interact = _load_data[Config.Interact];
	global.change_left = _load_data[Config.Change_left];
	global.change_right = _load_data[Config.Change_right];
	global.inventory = _load_data[Config.Inventory];

	global.resolution = _load_data[Config.Resolution];
	global.window = _load_data[Config.Window];

	global.master = _load_data[Config.Master];
	global.sounds = _load_data[Config.Sounds];
	global.music = _load_data[Config.Music];
}
else
{
	global.up = ord("W");
	global.down = ord("S");
	global.left = ord("A");
	global.right = ord("D");
	global.dash = vk_space;
	global.interact = ord("F");
	global.change_left = ord("Q");
	global.change_right = ord("E");
	global.inventory = ord("I");

	global.resolution = 1;
	global.window = 1;

	global.master = 0.5;
	global.sounds = 0.25;
	global.music = 1;
}

global.dialogue = false;
