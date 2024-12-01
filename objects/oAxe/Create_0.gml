vx = 8 * oPlayer.dir + oPlayer.vx;
vy = -10;
dir=-oPlayer.dir*45;

image_angle = dir;

if instance_exists(oEnding) {
	depth=oEnding.depth+1000;
}