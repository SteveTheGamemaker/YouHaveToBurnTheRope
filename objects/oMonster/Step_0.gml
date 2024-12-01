var _loc3_ = 0;
var _loc4_ = 0;
var _loc5_ = NaN;
var _loc6_ = NaN;

if(dying)
{
	dieTimer+=1;
	_loc3_ = 0;
	if(dieTimer > 30 * 3)
	{
		_loc3_ = 20;
		audio_play_sound(sndExplosionBig, 1, 0, 0.4);
		oPlayer.gamepad_vibrate_once(0, 1, 1, 15);
		instance_destroy();
        global.gameOver = true;
        global.gameOverTimer = 0;
	}
	else if(dieTimer % 10 == 0)
	{
		_loc3_ = 1;
		audio_play_sound(sndExplosionSmall, 1, 0, 0.4);
		oPlayer.gamepad_vibrate_once(0, 1, 1, 5);
	}
	_loc4_ = 0;
	while(_loc4_ < _loc3_)
	{
		_loc5_ = random(1) * pi * 2;
		_loc6_ = random(1) * 32 * 4;
		instance_create_depth((x + cos(_loc5_) * _loc6_)-16, (y + sin(_loc5_) * _loc6_ * 1.5)-16, -50, oSmoke);
		_loc4_++;
	}
}
else
{
	ai();
}

image_xscale=dir;

dir = (oPlayer.x < x ? -1 : 1);

if(vy > 32)
{
	vy = 32;
}

// Apply friction
vx *= FRICTION;

// Apply gravity
vy += GRAVITY;

onFloor = false;

// Horizontal collision
x += vx;
if (place_meeting(x, y, oGround)) {
    // Adjust position and velocity
    if (vx > 0) {
        // Moving right - adjust left
        while (place_meeting(x, y, oGround)) {
            x -= 1;
			state = 2;
        }
    } else if (vx < 0) {
        // Moving left - adjust right
        while (place_meeting(x, y, oGround)) {
            x += 1;
			state = 2;
        }
    }
    vx = 0;
}

// Vertical collision
y += vy;
if (place_meeting(x, y, oGround)) {
    // Adjust position and velocity
    if (vy > 0) {
        // Moving down - adjust upwards
        while (place_meeting(x, y, oGround)) {
            y -= 1;
			y = round(y);
        }
        vy = 0;
    } else if (vy < 0) {
        // Moving up - adjust downwards
        while (place_meeting(x, y, oGround)) {
            y += 1;
			y = round(y);
        }
        vy = 0;
    }
}

// Calculate the horizontal and vertical distances between the player and the monster
var player_bottom_y = oPlayer.y + oPlayer.sprite_height/2;
var player_center_x = oPlayer.x;
var monster_center_x = x;
var monster_center_y = y;

// Check if the player is above the monster and within a certain horizontal distance
var is_player_above = player_bottom_y < y;
var horizontal_distance = abs(player_center_x - monster_center_x);
var vertical_distance = abs(oPlayer.y - monster_center_y) * 0.75;

if(dying)
{
	dir=1;
	sprite_index=MonsterDying;
}
else if(cooldown > 0)
{
	sprite_index=MonsterAttack;
}
else if (is_player_above && horizontal_distance < vertical_distance) 
{
    dir = 1;
    sprite_index = MonsterLookup;
}
else if(abs(vx) > 1)
{
	sprite_index=MonsterWalk;
}
else
{
	sprite_index=MonsterStand;
}

// Keep in the boss bounds
x = clamp(x, 3937, 4543);