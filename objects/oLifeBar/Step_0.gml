if(dying)
{
	health1 *= 0.95;
}
else
{
	if(health1 < 100)
	{
		health1 += (100 - health1) * 0.03;
		if(health1 > 100)
		{
			health1 = 100;
		}
		if(health1 < 25)
		{
			health1 = 25;
		}
	}
}

offx = camera_get_view_x(view_get_camera(view_current));
offy = camera_get_view_y(view_get_camera(view_current));