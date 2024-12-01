timeH+=30000/1000000;

if instance_exists(oPlayer) { 
	// Speedrun timer
	
	if instance_exists(oMonster) {
		visTime = timeH;
	}

	if(oPlayer.x-15 > 3392 && timeWalk = 0)
	{
		timeWalk = timeH;
		timeWalk_str = string_format(timeWalk, 2, 3);
		timeWalk_str = string_replace(timeWalk_str, " ", "0");
	}

	if(oPlayer.x-15 > 3650 && oPlayer.y-15 < 340 && timeClimb = 0)
	{
		timeClimb = timeH;
		timeClimb_str = string_format(timeClimb, 2, 3);
		timeClimb_str = string_replace(timeClimb_str, " ", "0");
	}
	if(oPlayer.burnt && timeRope = 0)
	{
		timeRope = timeH;
		timeRope_str = string_format(timeRope, 2, 3);
		timeRope_str = string_replace(timeRope_str, " ", "0");
	}
}

if keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0, gp_shoulderl) {
	audio_stop_all();
	room_restart();
	timeH = 0;
	timeWalk = 0;
	timeClimb = 0;
	timeRope = 0;
	timeWalk_str = "";
	timeClimb_str = "";
	timeRope_str = "";
	timeH_str = "";
}

if gamepad_button_check_pressed(0, gp_shoulderr) { 
	timer = !timer;
}