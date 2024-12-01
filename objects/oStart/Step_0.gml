if (gamepad_button_check_pressed(0, gp_face1) || mouse_check_button_released(mb_left)) {
	room_goto_next();
	oTimer.timeH = 0;
}