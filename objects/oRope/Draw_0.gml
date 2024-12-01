draw_self();
draw_set_color(c_black);
draw_set_alpha(1-fade);
draw_rectangle(x-sprite_width/2, y, x+sprite_width/2, y+sprite_height, 0);
draw_set_alpha(1);
draw_set_color(c_white);