if(global.gameOver)
{
	global.gameOverTimer+=1;
	if(global.gameOverTimer > 30 * 4)
	{
		if(ending)
		{
			if(ending.alpha < 1)
			{
				ending.alpha += 1 / (30 * 2);
			}
			else
			{
				instance_destroy(oPlayer);
			}
		}
		else
		{
			audio_play_sound(sndCredits, 1, 0);
			ending = instance_create_depth(0, 0, 0, oEnding);
		}
	}
}

if !surface_exists(tilesurface) {
	tilesurface = surface_create(width*32, height*32);
	surface_set_target(tilesurface);

	for (var i = 0; i < array_length(map_compressed); i += 1) {
	    var compressed_row = map_compressed[i];
	    var ii = 0; // Horizontal position in the map
	    for (var j = 0; j < array_length(compressed_row); j += 1) {
	        var tileindex = compressed_row[j][0];
	        var count = compressed_row[j][1];
        
	        // Check if the tile index requires drawing (tiles not covered by ground objects)
	        if tileindex < 3 || tileindex > 5 {
	            // Draw the tiles for the run length
	            for (var k = 0; k < count; k += 1) {
	                var x_pos = (ii + k) * 32;
	                var y_pos = i * 32;
                
	                // Calculate left and top
	                var left = (tileindex mod 3) * 32; // 3 tiles per row, each 32 pixels wide
	                var top = (tileindex div 3) * 32;  // Move down a row every 3 tiles
                
	                // Draw the specific 32x32 part of the sprite
	                draw_sprite_part(TileSheet, 0, left, top, 32, 32, x_pos, y_pos);
	            }
	        }
	        // Move the horizontal position forward by the count
	        ii += count;
	    }
	}

	surface_reset_target();
}