var key_jump = keyboard_check(vk_up) || keyboard_check(vk_space) || gamepad_button_check(0, gp_face1) || gamepad_button_check(0, gp_padu);
var key_right = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0.1);
var key_left = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < -0.1);
var key_attack = false || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_face4);

if (keyboard_check_pressed(vk_anykey)) {
    if (keyboard_lastkey != vk_left && keyboard_lastkey != vk_right && keyboard_lastkey != vk_up && keyboard_lastkey != vk_space && keyboard_lastkey != vk_f6 && keyboard_lastkey != vk_f7) {
        key_attack = true;
    }
}

// Hurt logic
if(hurt)
{
	hurtTimer-=1;
	visible = ((hurtTimer / 5) % 1 == 0);
	if(hurtTimer == 0)
	{
		visible = true;
		hurt = false;
	}
}

// Set hurt flag(_loc3_)
var _loc3_ = hurt && hurtTimer > HURT_TIME;

// Tick fire timer
if(onFire)
{
	fireTimer-=1;
	if(fireTimer <= 0)
	{
		fireTimer = 0;
		onFire = false;
	}
}

// Determine onfloor variable
on_floor = place_meeting(x, y + 1, oGround); 

// Activate scary cave music just before boss room
if y + 15 / 2 >> 5 > 17 && scarycave = false { 
	scarycave = true;
	audio_sound_gain(MusicCaveNormal, 0, 3000);
	audio_play_sound(MusicCaveScary, 1, 1, 1);
	audio_sound_gain(MusicCaveScary, 0, 0);
	audio_sound_gain(MusicCaveScary, 1, 3000);
}

// 'Lock' the door behind you when you enter the boss room
if x > 109 << 5 && locked = false { 
	locked = true;
	oLifeBar.visible = true;
	instance_create_depth(3424, 864-32, depth-1, oGround);
	instance_create_depth(3424, 864-64, depth-1, oGround);
	instance_create_depth(3424+16, (864-32)+16, depth-2, oSmoke);
	instance_create_depth(3424+16, (864-64)+16, depth-2, oSmoke);
	audio_play_sound(SoundClose, 1, 0, 0.4);
	audio_play_sound(SoundBoom, 1, 0, 0.4);
	if audio_is_playing(MusicCaveScary) {
		audio_stop_sound(MusicCaveScary);
	}
	if audio_is_playing(MusicCaveNormal) {
		audio_stop_sound(MusicCaveNormal);
	}
	audio_play_sound(MusicBoss, 1, 1);
	gamepad_vibrate_once(0, 1, 1, 5);
}

// Handle movement input
if(!hurt || hurtTimer < HURT_TIME)
{
	if (key_right) {
		if started = false && x > 240 {
			started = true;
			audio_play_sound(MusicCaveNormal, 1, 1);
			audio_sound_gain(MusicCaveNormal, 1, 0);
		}
	    vx += ACCELERATION;
	    dir = 1; // Facing right
	}
	if (key_left) {
	    vx -= ACCELERATION;
	    dir = -1; // Facing left
	}
}

// Apply friction
vx *= FRICTION;

// Apply gravity
vy += GRAVITY;

// Update sprite/animation
{
image_xscale = dir;
if(_loc3_)
{
	sprite_index=sHurt;
	image_speed=0.5;
}
else if(cooldown > 0)
{
	sprite_index=sAttack;
	image_speed=0.5;
}
else if(on_floor)
{
	if(abs(vx) < 1)
	{
		sprite_index=sWalk;
		image_index=0;
		image_speed=0;
	}
	else
	{
		sprite_index=sWalk;
		image_speed=0.5;
	}
	torchYOffset=1;
	torchXOffset=0;
}
else if(vy < 0)
{
	torchXOffset=1*-dir;
	sprite_index=sprJump;
}
else
{
	torchYOffset=-4;
	torchXOffset=0;
	sprite_index=sFall;
}
}

// Limit vertical speed
if(vy > 32)
{
	vy = 32;
}

// Tick cooldown timer
if(cooldown > 0)
{
	cooldown-=1;
}

// Attack
if(key_attack && !_loc3_)
{
	if(!attackKeyDown && cooldown == 0)
	{
		attackKeyDown = true;
		fireTimer = 0;
		cooldown = 4;
		instance_create_depth(x+vx, y, -5, oAxe);
		audio_play_sound(sndAttack, 1, 0, 0.4);
	}
}
else if(!_loc3_)
{
	attackKeyDown = false;
}

// Jump initiation
if (key_jump && !jump_key_down && !_loc3_) {
    jump_key_down = true;

    if (on_floor) {
        on_floor = false;
        jump_count += 1;
        vy = 0;
        jump_velocity = MAX_JUMP_VELOCITY;
		audio_play_sound(sJump, 1, 0, 0.4*0.7);
    }
	
} else if (!key_jump) {
    jump_key_down = false;
}

// Jump physics
if (jump_velocity > 0) {
    vy -= jump_velocity;
    if (key_jump) {
        jump_velocity -= JUMP_VELOCITY_DECREASE_HOLD;
    } else {
        jump_velocity -= JUMP_VELOCITY_DECREASE_RELEASE;
    }
    if (jump_velocity < 0) {
        jump_velocity = 0;
    }
}

// Horizontal movement/collision
{
x += vx;
if (place_meeting(x, y, oGround)) {
    // Adjust position and velocity
    if (vx > 0) {
        // Moving right - adjust left
        while (place_meeting(x, y, oGround)) {
            x -= 1;
        }
    } else if (vx < 0) {
        // Moving left - adjust right
        while (place_meeting(x, y, oGround)) {
            x += 1;
        }
    }
    vx = 0;
}
}

// Vertical movement/collision
{
y += vy;
if (place_meeting(x, y, oGround)) {
    // Adjust position and velocity
    if (vy > 0) {
        // Moving down - adjust upwards
        while (place_meeting(x, y, oGround)) {
            y -= 1;
			y = round(y);
        }
		if vy = 32 {
			instance_create_depth(x, y+(sprite_height/2), depth-1, oPlume);
			var rPlume = instance_create_depth(x, y+(sprite_height/2), depth-1, oPlume);
			rPlume.image_xscale=-1;
			fireTimer = 0;
			audio_play_sound(sndLand, 1, 0, 0.4);
			gamepad_vibrate_once(0, 1, 1, 5);
		}
        vy = 0;
        jump_count = 0;
    } else if (vy < 0) {
        // Moving up - adjust downwards
        while (place_meeting(x, y, oGround)) {
            y += 1;
        }
        vy = 0;
        jump_velocity = 0;
    }
}
}

// Camera
{
// Get the camera ID associated with view[0]
var cam = view_camera[0];

// Get the camera's current position
cam_x = camera_get_view_x(cam);
cam_y = camera_get_view_y(cam);

// Get the camera's center position
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);
var cam_center_x = cam_x + (cam_width / 2);
var cam_center_y = cam_y + (cam_height / 2);

// Calculate the player's center position
var player_center_x = x;
var player_center_y = y;

// Calculate the difference between player and camera centers
var diff_x = player_center_x - cam_center_x;
var diff_y = player_center_y - cam_center_y;

// Move towards the player
var move_x = round(diff_x * 0.37);
var move_y = round(diff_y * 0.37);

// Update the camera position
var new_cam_x = cam_x + move_x;
var new_cam_y = cam_y + move_y;

// Limit how far to the left the screen can scroll after being locked in the boss area
if x > 3712 {
	leftlimit = 3712-350;
}

new_cam_x = clamp(new_cam_x, leftlimit, room_width - cam_width);
new_cam_y = clamp(new_cam_y, 0, room_height - cam_height);

// Set the camera to the new position
camera_set_view_pos(cam, new_cam_x, new_cam_y);
}

if gamepadvibrating {
	if gamepadvibratetime > 0 {
		gamepadvibratetime-=1;
	}
	else
	{
		gamepadvibrating = false;
		gamepad_set_vibration(0, 0, 0);
	}
}