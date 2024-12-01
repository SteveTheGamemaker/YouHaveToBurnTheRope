image_speed=0.5;

SPEED = 6;
vx=0;
vy=0;
time=0;

vx = lengthdir_x(SPEED, point_direction(x, y, oPlayer.x, oPlayer.y));
vy = lengthdir_y(SPEED, point_direction(x, y, oPlayer.x, oPlayer.y));