if window_mouse_get_x() > x && window_mouse_get_x() < x+sprite_width && window_mouse_get_y() > y && window_mouse_get_y() < y+sprite_height {
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