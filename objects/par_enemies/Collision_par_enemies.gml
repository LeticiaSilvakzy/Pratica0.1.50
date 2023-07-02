/// @description colisão entre inimigos
var _dir = point_direction(x, y, other.x, other.y);
var _push = 2;
var _pushx = lengthdir_x(_push, _dir);
var _pushy = lengthdir_y(_push, _dir);


other.x += _pushx;
other.y += _pushy;

/*
x -= _pushx;
y -= _pushy;
*/
