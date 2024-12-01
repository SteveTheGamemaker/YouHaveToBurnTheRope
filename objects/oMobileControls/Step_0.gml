// Step Event

// Reset variables at the start of each step
global.up = false;
global.left = false;
global.right = false;

// Check if the screen is being touched
if (mouse_check_button(mb_left))
{
    // Get the touch position
    var touch_x = window_mouse_get_x();
    var touch_y = window_mouse_get_y();
    
    // Get the screen dimensions
	
    var screen_width = display_get_gui_width();
    var screen_height = display_get_gui_height();
    
    // Determine if the touch is on the left or right side
    if (touch_x < screen_width / 2)
    {
        global.left = 1;
        global.right = 0;
    }
    else
    {
        global.left = 0;
        global.right = 1;
    }
    
    // Determine if the touch is on the top or bottom half
	show_debug_message("Touch Y: " + string(touch_y));
	show_debug_message("Screen height / 2: " + string(screen_height / 2));
    if (touch_y < screen_height / 2)
    {
        global.up = 1;
    }
    else
    {
        global.up = 0;
    }
}