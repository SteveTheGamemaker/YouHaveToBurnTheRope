alpha = 0; // Unused but necessary bc used in oMap step event

// Create the sequence on a specific layer at coordinates (x, y)
seq_id = layer_sequence_create("Assets_1", camera_get_view_x(view_get_camera(view_current))+350, camera_get_view_y(view_get_camera(view_current))+250, EndingSequence);

// Play the sequence
layer_sequence_play(seq_id);

seq_length = layer_sequence_get_length(seq_id);

depth = oLifeBar.depth-1;