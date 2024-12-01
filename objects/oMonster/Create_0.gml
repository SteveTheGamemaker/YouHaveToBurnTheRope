x = 4000;
y = 736;

vy = 0;
vx = 0;
height = sprite_height;
width = 192;

timeToDie=false;
dying=false;
timer=0;
maxTimer=30;
cooldown=0;
onFloor=false;
dir=-1;
state=0;
dieTimer=0;

FRICTION = 0.6;
GRAVITY = 1.5;

image_speed=0.5;

function ai() {
	timer+=1;
	
	if(timer > maxTimer)
	{
		timer = 0;
		state = floor(random(1) * 3);
	}
	
	var _loc1_ = (oPlayer.y > 10 << 5 && oPlayer.x > 114 << 5 && oPlayer.x < 150 << 5);
	
	if(cooldown > 0)
	{
		cooldown-=1;
	}
	
	if(_loc1_ && !timeToDie)
	{
		switch(state)
		{
			case 0:
				if(cooldown == 0)
				{
					instance_create_depth(x + (dir*75), y - 12, -5, oBullet);
					cooldown = 5;
					audio_play_sound(SoundMonsterAttack, 1, 0, 0.4);
				}
				maxTimer = 30;
				break;
			case 1:
				var _loc2_ = oPlayer.x - (x);
				if(abs(_loc2_) > 10)
				{
					vx += _loc2_ < 0 ? -3 : 3;
				}
				maxTimer = 100;
				break;
			case 2:
				maxTimer = 30;
		}
	}
	else if(timeToDie || oPlayer.x > 114 << 5 && oPlayer.x < 150 << 5)
	{
		var _loc3_ = 132 * 32 + 16 - (x);
		if(abs(_loc3_) > 15)
		{
			vx += _loc3_ < 0 ? -3 : 3;
		}
	}
	dir = oPlayer.x < x ? -1 : 1;
}