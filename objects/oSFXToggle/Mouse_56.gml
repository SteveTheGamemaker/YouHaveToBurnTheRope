if device_mouse_x_to_gui(0) > x && device_mouse_x_to_gui(0) < x+sprite_width && device_mouse_y_to_gui(0) > y && device_mouse_y_to_gui(0) < y+sprite_height {
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