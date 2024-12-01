time+=1;

x += vx;
y += vy;

if(time > 70)
{
	instance_destroy();
	instance_create_depth(x, y, -5, oSmoke);
}