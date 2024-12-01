image_index = global.sfx;

if window_mouse_get_x() > x-16 && window_mouse_get_x() < x+sprite_width+16 && window_mouse_get_y() > y-16 && window_mouse_get_y() < y+sprite_height+16 {
	image_alpha = lerp(image_alpha, 1, 0.5);
}
else
{
	image_alpha = lerp(image_alpha, 0, 0.5);
}

if window_mouse_get_x() > x && window_mouse_get_x() < x+sprite_width && window_mouse_get_y() > y && window_mouse_get_y() < y+sprite_height {
	mouseOver = true;
	window_set_cursor(cr_handpoint);
}
else
{
	if mouseOver = true {
		mouseOver = false;
		window_set_cursor(cr_default);
	}
}

if gamepad_button_check_pressed(0, gp_start) {
	image_alpha=25000;
	if global.sfx {
		global.sfx = false;
		if audio_group_get_gain(SFX) = 1 {
			audio_group_set_gain(SFX, 0, 0);
		}
	}
	else
	{
		global.sfx = true;
		if audio_group_get_gain(SFX) = 0 {
			audio_group_set_gain(SFX, 1, 0);
		}
	}
}