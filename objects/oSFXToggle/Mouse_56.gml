if window_mouse_get_x() > x && window_mouse_get_x() < x+sprite_width && window_mouse_get_y() > y && window_mouse_get_y() < y+sprite_height {
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