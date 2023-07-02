/// @description Escala
var _cl = camera_get_view_width(view_camera[0]);
var _ca = camera_get_view_height(view_camera[0]);

scalex = display_get_gui_width()/_cl;
scaley = display_get_gui_height()/_ca;

hit = -1;
target = -1;
xx = target.x;
yy = target.y;

alpha = 1;
