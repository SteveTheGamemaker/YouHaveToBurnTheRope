if timer = true {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(Font3);
	
	// Format the time to display three decimal places
	timeH_str = string_format(visTime, 2, 3);
	timeH_str = string_replace(timeH_str, " ", "0");

	draw_rectangle_color(610, 440, 700, 500, c_black, c_black, c_black, c_black, 0);

	draw_text(610, 440, "Walk\nClimb\nRope\nTime");
	draw_set_halign(fa_right);
	draw_text(700, 440, timeWalk_str + "\n" + timeClimb_str + "\n" + timeRope_str + "\n" + timeH_str);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
}