function rle_encode_2d_array(array){
	//Initialize the compressed array array
	var compressed_array = [];

	// Loop through each row in the original array
	for (var i = 0; i < array_length(array); i += 1) {
	    var row = array[i];
	    var compressed_row = [];
	    var count = 1;
	    var prev_value = row[0];
    
	    // Loop through each element in the row starting from the second element
	    for (var j = 1; j < array_length(row); j += 1) {
	        var value = row[j];
	        if (value == prev_value) {
	            count += 1;
	        } else {
	            array_push(compressed_row, [prev_value, count]);
	            prev_value = value;
	            count = 1;
	        }
	    }
	    // Add the last run
	    array_push(compressed_row, [prev_value, count]);
    
	    // Add the compressed row to the compressed array
	    array_push(compressed_array, compressed_row);
	}

	return compressed_array;
}