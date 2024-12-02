if device_mouse_x_to_gui(0) > x && device_mouse_x_to_gui(0) < x+sprite_width && device_mouse_y_to_gui(0) > y && device_mouse_y_to_gui(0) < y+sprite_height {
	if global.music {
		global.music = false;
		if audio_group_get_gain(Music) = 1 {
			audio_group_set_gain(Music, 0, 0);
		}
	}
	else
	{
		global.music = true;
		if audio_group_get_gain(Music) = 0 {
			audio_group_set_gain(Music, 1, 0);
		}
	}
}