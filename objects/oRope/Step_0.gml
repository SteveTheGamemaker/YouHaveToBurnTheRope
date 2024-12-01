if oChandelier.burnRope {
	if fade > 0 {
		fade-=0.02;
	}
	else
	{
		instance_destroy();
	}
}