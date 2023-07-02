/// @description Insert description here
var _inst = instance_create_layer(x, y, "Instances", obj_arrow_fx);
_inst.sprite_index = sprite_index;
_inst.image_angle = image_angle;

if place_meeting(x, y, obj_wall)
{
	instance_destroy();
}
