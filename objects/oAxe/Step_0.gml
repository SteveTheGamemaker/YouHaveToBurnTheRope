x += vx;
y += vy;
vy += 2;
vx *= 0.98;

image_angle += dir * 45;

if instance_exists(oEnding) {
	depth=oMap.depth-1;
}