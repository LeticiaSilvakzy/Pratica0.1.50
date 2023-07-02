/// @description dano
var _dano = obj_player.damage[obj_player.level];
var _dir = point_direction(x, y, other.x, other.y);

other.knockback_dir = _dir;
other.knockback_spd = 6;
other.hit = true;
other.alarm[1] = 5;
other.state = scr_slime_hit;
other.life -= _dano;

var _inst = instance_create_layer(x, y, "Instances", obj_hit);
_inst.target = other;
_inst.hit = _dano;

instance_destroy();

