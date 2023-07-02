/// @description Insert description here
menu_pause = false;
global.pause = false;

global.width = camera_get_view_width(view_camera[0]);
global.height = camera_get_view_height(view_camera[0]);

//display_set_gui_size(global.width, global.height);

enum menu_page
{
	main,
	settings,
	audio,
	video,
	controls,
	height
}

enum menu_element
{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

if room = Menu
{
	menu_main = scr_create_menu_page
	(
		["Start Game",menu_element.script_runner, scr_start_game],
		["Continue",  menu_element.script_runner, scr_load_game],
		["Settings",  menu_element.page_transfer, menu_page.settings],
		["Exit",	  menu_element.script_runner, scr_exit_game]
	);
}
else
{
	menu_main = scr_create_menu_page
	(
		["Resume",	 menu_element.script_runner, scr_resume_game],
		["Save Game",menu_element.script_runner, scr_save_game],
		["Load Game",menu_element.script_runner, scr_load_game],
		["Settings", menu_element.page_transfer, menu_page.settings],
		["Exit",	 menu_element.script_runner, scr_exit_game]
	);
}

menu_settings = scr_create_menu_page
(
	["Audio",	 menu_element.page_transfer, menu_page.audio],
	["Video",	 menu_element.page_transfer, menu_page.video],
	["Controls", menu_element.page_transfer, menu_page.controls],
	["Back",	 menu_element.page_transfer, menu_page.main]
);

menu_audio = scr_create_menu_page
(
	["Master", menu_element.slider, scr_change_volume, global.master, [0, 1]],
	["Sounds", menu_element.slider, scr_change_volume, global.sounds, [0, 1]],
	["Music",  menu_element.slider, scr_change_volume, global.music,  [0, 1]],
	["Back",   menu_element.page_transfer, menu_page.settings]
);

menu_video = scr_create_menu_page
(
	["Resolution",  menu_element.shift, scr_change_resolution, global.resolution, ["1280 x 768", "1366 x 768"]],
	["Fullscreen", menu_element.toggle, scr_change_window, global.window, ["ON", "OFF"]],
	["Back",		menu_element.page_transfer, menu_page.settings]
);

menu_controls = scr_create_menu_page
(
	["Up",	  menu_element.input, "up",	   global.up],
	["Down",  menu_element.input, "down",  global.down],
	["Left",  menu_element.input, "left",  global.left],
	["Right", menu_element.input, "right", global.right],
	["Dash", menu_element.input, "dash", global.dash],
	["Interact", menu_element.input, "interact", global.interact],
	["Change Weapon Left", menu_element.input, "change_left", global.change_left],
	["Change Weapon Right", menu_element.input, "change_right", global.change_right],
	["Inventory", menu_element.input, "inventory", global.inventory],
	["Back",  menu_element.page_transfer, menu_page.settings]
);

page = 0;
menu_pages = [menu_main, menu_settings, menu_audio, menu_video, menu_controls];

var _array_len = array_length_1d(menu_pages);
for(var i = 0; i < _array_len; i++)
{
	menu_options[i] = 0;
}

inputting = false;

audio_group_load(audiogroup_musics);
audio_group_load(audiogroup_soundeffects);
