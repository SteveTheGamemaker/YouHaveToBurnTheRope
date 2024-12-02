image_index = global.sfx;

if device_mouse_x_to_gui(0) > x-16 && device_mouse_x_to_gui(0) < x+sprite_width+16 && device_mouse_y_to_gui(0) > y-16 && device_mouse_y_to_gui(0) < y+sprite_height+16 {
	image_alpha = lerp(image_alpha, 1, 0.5);
}
else
{
	image_alpha = lerp(image_alpha, 0, 0.5);
}

if device_mouse_x_to_gui(0) > x && device_mouse_x_to_gui(0) < x+sprite_width && device_mouse_y_to_gui(0) > y && device_mouse_y_to_gui(0) < y+sprite_height {
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