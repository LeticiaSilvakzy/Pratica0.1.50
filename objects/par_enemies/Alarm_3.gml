/// @description Poison
life -= 1;
var _inst = instance_create_layer(x, y, "Instances", obj_hit);
_inst.target = other;
_inst.hit = obj_player.damage;

if poison_count != 3
{
	alarm[3] = 60;
	poison_count++;
}
else
{
	poison_count = 0
}
