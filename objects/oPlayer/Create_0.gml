x = (4 << 5) + 15 + 15;
y = (4 << 5) + 15;

vx = 0;
vy = 0;

depth=oMap.depth-3;

//show_debug_log(true);

dir = 1;

jump_velocity = 0;
jump_count = 0;
jump_key_down = false;

attackKeyDown = false;

fireTimer = 900;

cooldown = 0;

hurtTimer = 0;

hurt = false;

onFire = false;

torchYOffset=1;
torchXOffset=0;

started = false;
plumed = false;
scarycave = false;
locked = false;

cam_x = 0;
cam_y = 0;

on_floor = false;

burnt = false;

gamepadvibrating = false;
gamepadvibratetime = 0;

function gamepad_vibrate_once(_padindex, _lstrength, _rstrength, _steps) {
	gamepad_set_vibration(_padindex, _lstrength, _rstrength);
	gamepadvibrating=true;
	gamepadvibratetime=_steps;
}

// Left camera limit
leftlimit=0;

ACCELERATION = 5;
FRICTION = 0.6;
GRAVITY = 1.5;
MAX_FALL_SPEED = 32;
MAX_JUMP_VELOCITY = 5;
JUMP_VELOCITY_DECREASE_HOLD = 0.6;
JUMP_VELOCITY_DECREASE_RELEASE = 5;
HURT_TIME = 80;
PARALYZED_TIME = 40;
BURN_TIME = 900;

function takeDamage(source) {
	var _loc2_ = false;
	if(!hurt)
	{
		hurt = true;
		hurtTimer = HURT_TIME + PARALYZED_TIME;
		if(source.object_index = oMonster)
		{
			_loc2_ = (source.x < x);
			vx += _loc2_ ? 90 : -90;
			vy += (random(1) - 0.5) * 30;
			dir = _loc2_ ? -1 : 1;
		}
		else if(vy > -15)
		{
			vy -= 15;
		}
		audio_play_sound(sndDamage, 1, 0, 0.4);
		gamepad_vibrate_once(0, 1, 1, 5);
		fireTimer = 0;
	}
}