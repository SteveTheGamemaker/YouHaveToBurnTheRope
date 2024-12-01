var _loc1_ = 0;
var _loc3_ = 0;
var _loc2_ = 0;
var _loc4_ = NaN;
var _loc5_ = NaN;

if(burnRope)
{
	burnTimer+=1;
	_loc1_ = 5;
	if(burnTimer % _loc1_ == 0)
	{
		_loc2_ = ((burnTimer / _loc1_) * 14)-16;
		
		if(burnUp)
		{
			if(!instance_position(132 * 32 + 16,burnY - _loc2_, oGround))
			{
				instance_create_depth(132 * 32 + 16, burnY - _loc2_, -50, oSmoke);
			}
			else
			{
				burnUp = false;
			}
		}
		
		if(burnDown)
        {
			if(burnY + _loc2_ >> 5 <= 10)
			{
				instance_create_depth(132 * 32 + 16, burnY + _loc2_, -50, oSmoke);
			}
			else
			{
				burnDown = false;
			}
		}
		
		if(!burnUp && !burnDown)
		{
			burnRope = false;
			instance_destroy(oRope);
			chandelierFall = true;
			gamepad_set_vibration(0, 0, 0);
			vy = 0;
			oMonster.timeToDie=true;
		}
		else
		{
			audio_play_sound(sndBurn, 1, 0);
		}
	}
}

if(chandelierFall)
{
	vy += 0.6;
	
	if(vy > 32)
	{
		vy = 32;
	}
	
	y += vy;
	
	if(y > 15 << 5)
	{
		chandelierFall = false;
		_loc3_ = 0;
		
		while(_loc3_ < 20)
		{
			_loc4_ = random(1) * pi * 2;
			_loc5_ = random(1) * 32 * 4;
			instance_create_depth((132 * 32 + 16 +(cos(_loc4_) * _loc5_))-16, (21 * 32 + 16 + (sin(_loc4_) * _loc5_))-16, -5, oSmoke);
			_loc3_ += 1;
		}
		audio_play_sound(sndExplosionBig, 1, 0);
		oPlayer.gamepad_vibrate_once(0, 1, 1, 10);
		instance_destroy();
		oMonster.dying = true;
		oLifeBar.dying = true;
        oMonster.dieTimer = 0;
	}
}