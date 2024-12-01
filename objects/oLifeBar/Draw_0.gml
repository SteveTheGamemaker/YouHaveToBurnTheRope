// White background/outline
draw_rectangle_color(x+offx, y+offy, x+offx+660, y+offy+15, c_white, c_white, c_white, c_white, 0);
draw_rectangle_color(x+offx, y+offy+15, x+offx+144, y+offy+34, c_white, c_white, c_white, c_white, 0);

// Black part
draw_rectangle_color(x+offx+1, y+offy+1, x+offx+659, y+offy+14, c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(x+offx+1, y+offy+14, x+offx+143, y+offy+33, c_black, c_black, c_black, c_black, 0);

// Health bar
if health1 > 0.4 {
	draw_rectangle_color(x+offx+3, y+offy+3, x+offx+(657)*(health1/100), y+offy+12, c_red, c_red, c_red, c_red, 0);
}

// Name
draw_set_font(Font2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x+offx+71, y+offy+24, "Grinning Colossus", 0.5, 0.5, 0);