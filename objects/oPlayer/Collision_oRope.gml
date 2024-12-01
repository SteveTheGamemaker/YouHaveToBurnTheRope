if !oChandelier.burnRope && onFire {
	audio_stop_sound(MusicBoss);
	onFire = false;
	burnt = true;
	oChandelier.burnY = (y+15)+5;
	oChandelier.burnRope=true;
	gamepad_set_vibration(0, 0.5, 0.5);
}