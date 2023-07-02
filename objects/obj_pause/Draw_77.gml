/// @description Insert description here
gpu_set_blendenable(false);

if (global.pause)
{
	surface_set_target(application_surface);
	if (surface_exists(pause_surf)) draw_surface(pause_surf, 0, 0);
	else
	{
		pause_surf = surface_create(resw, resh);
		buffer_set_surface(pause_surf_buffer, pause_surf, 0);
	}
	surface_reset_target();
}

if (keyboard_check_pressed(vk_escape) or obj_menu.menu_pause)
{
	obj_menu.menu_pause = false;
	if(!global.pause)
	{
		global.pause = true;
		
		instance_deactivate_all(true);
		instance_activate_object(obj_control);
		instance_activate_object(obj_menu);
		
		pause_surf = surface_create(resw, resh);
		surface_set_target(pause_surf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
		pause_surf_buffer = buffer_create(resw * resh * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surf_buffer, pause_surf, 0);
	}
	else
	{
		scr_save_config();
		global.pause = false;
		instance_activate_all();
		if (surface_exists(pause_surf)) surface_free(pause_surf);
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
	}
}

gpu_set_blendenable(true);
