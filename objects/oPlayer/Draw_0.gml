draw_self();

if onFire = true {
	draw_sprite_ext(sTorch, 0, x+torchXOffset, y+torchYOffset, dir, 1, 0, c_white, 1);
	draw_sprite_ext(sFire, (instance_exists(oFire) ? oFire.image_index : 0), x+(19*dir)+torchXOffset, y+torchYOffset, 1, 1, 0, c_white, 1); 
}