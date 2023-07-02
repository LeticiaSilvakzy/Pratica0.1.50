/// @description Insert description here
script_execute(scr_change_resolution, global.resolution);
script_execute(scr_change_window, global.window);

audio_master_gain(global.master);
audio_group_set_gain(audiogroup_soundeffects, global.sounds, 0);
audio_group_set_gain(audiogroup_musics, global.music, 0);
