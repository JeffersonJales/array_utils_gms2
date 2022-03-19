/// ARRAY UTILS | https://github.com/JeffersonJales/array_utils_gms2

/// @description With this function you can shuffle the given array.
/// @param {array} array		The index of the array to shuffle
/// @returns {array}				Re-ordered array 
function array_shuffle(array){
	var _len = array_length(array), 
			_random_index = 0,
			_value;
			
	while(_len != 0){
		_random_index = irandom(--_len);
		
		_value = array[_len];
		array[_len] = array[_random_index];
		array[_random_index] = _value;
	}
	
	return array;
}

/// @description With this function you can reverse the array indices; The first element becomes the last, and the last array element becomes the first.
/// @param {array} array		The index of the array to reverse
/// @returns {array}				Reversed array
function array_reverse(array){
	var _len = array_length(array);
	var _value = 0, _last_index = 0;

	var i = 0; repeat(_len){
		_value = array[i];
		_last_index = _len - i - 1;
		
		array[i] = array[_last_index];
		array[_last_index] = _value;
		
		i++;
	}
	
	return array;
}

/// @description With this function you can swap the position of two values from the given array
/// @param {array} array		The index of the array
/// @param {Real} index1		The first position to swap
/// @param {Real} index2		The second position to swap
/// @return {array}					The index of the array
function array_swap(array, index1, index2){
	var _value = array[index2];
	array[index2] = array[index1];
	array[index1] = _value;
	return array;
}

/// @description With this function you will copy all the given array to a new one
/// @param {array} array		The index of the array will be cloned
/// @returns {array}				An new array
function array_clone(array){
	var _len = array_length(array);
	var _arr = array_create(_len);
	array_copy(_arr, 0, array, 0, _len);
	return _arr;
}

/// @description With this function you can clear the given array with a specific value
/// @param {array} array				The index of the array to shuffle
/// @param {ArgumentIdentity}		The new value for all array elements
/// @returns {array}						A array index
function array_clear(array, value){
	var i = 0; repeat(array_length(array)){
		array[i] = value;
		i++;
	}
	
	return array;
}

/// @description With this function you can retrieve the value from the given array; It also handles out of bound index (including negative)
/// @param {array} array		The index of the array
/// @param {Real} index			The index of the array to get the value from.
/// @return {Any}						The array index value OR undefined in case the length of the array is zero (0)
function array_get_ext(array, index){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	while(index < 0)		index += _len;
	while(index > _len) index -= _len;
	
	return array[index];
}

/// @description With this function you can check if the given index is inside of the bounds of the given array
/// @param {array} array		The index of the array
/// @param {Real} index			The index position to check
/// @return {Bool} 
function array_index_inside_bounds(array, index){
	return index >= 0 && array_length(array) > index; 
}

/// @description With this function you can convert the given index value to a valid index to the given array
/// @param {array} array		The index of the array
/// @param {Real} index			The index position to convert
/// @return {Any}						undefined case it can't be converted OR the new valid index value
function array_index_convert(array, index){
	var _len = array_length(array)
	if(_len == 0) return undefined;
	
	while(index < 0)		index += _len;
	while(index > _len) index -= _len;
	
	return index;
}

/// @description With this function you can check if the given array is empty or not
/// @param {array} array		The index of the array
/// @return {Bool}					
function array_empty(array){
	return array_length(array) == 0;	
}

/// @description With this function you can retrieve the position of the first entry of the given value on the given array 
/// @param {array} array		The index of the array
/// @param {real} value			The value to search on the given array
/// @return {Any}						undefined case don't find anything OR the position of the given value on the array (real)
function array_find_index(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			return i;
		
		i++;
	}
	
	return undefined;
}

/// @description With this function you can retrieve all positions of the given value on the given array 
/// @param {array} array		The index of the array
/// @param {real} value			The value to search on the given array
/// @return {array}					The index of the array 
function array_find_index_all(array, value){
	var _list = ds_list_create();
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			ds_list_add(_list, i);	
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	return _arr;
}

/// @description With this function you can remove all entries of the a given value from a given array 
/// @param {array} array		The index of the array
/// @param {Any} value			The value to remove from the array
/// @return {array}					The index of the array 
function array_remove(array, value){
	var _indexes = array_find_index_all(array, value);
	var i = 0; repeat(array_length(_indexes)){
		array_delete(array, _indexes[i], 1);	
	}
	
	return array;
}

/// @description With this function you can check if the given array have the given value inside of it
/// @param {array} array		The index of the array
/// @param {Any} value			The value to check inside the array
/// @return {Bool}
function array_includes(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			return true;
		
		i++;
	}
	
	return false;
}

/// @description With this function you can check the amount of times the given value appears in the given array
/// @param {array} array		The index of the array
/// @param {Any} value			The value to check inside the array
/// @return {Real}
function array_includes_amount(array, value){
	var _amount = 0;
	var i = 0; repeat(array_length(array)){
		_amount += array[i] == value;
		i++;
	}
	
	return _amount;
}

/// @description With this function you can retrieve the maximun value inside of the given array
/// @param {Array} array			The index of the array
/// @return {Any}							Undefined case array length equals zero OR the max value inside of the array
function array_get_max_value(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	var i = 0, f = -infinity;
	repeat(_len){
		if(array[i] > f) f = array[i];
		i++;	
	}
	
	return f;
}

/// @description With this function you can retrieve the minimum value inside of the given array
/// @param {Array} array			The index of the array 
/// @return {Any}							Undefined case array length equals zero OR the max value inside of the array
function array_get_min_value(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	var i = 0, f = infinity;
	repeat(_len){
		if(array[i] < f) f = array[i];
		i++;
	}
	
	return f;
}

/// @description With this function you can retrieve a random entry of the given array
/// @param {Array} array			The index of the array
/// @return {Any}							undefined in case length of the given array is zero OR the value of the a random entry of the given array
function array_get_random(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	return array[ irandom( _len - 1) ];
}

/// @description With this function you can retrieve the last entry of the given array
/// @param {Array} array		The index of the array
/// @return {Any}						undefined in case length of the given array is zero OR the value of the last entry given array
function array_last(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	return array[_len - 1];	
}

/// @description With this function you can loop through the given array indices executing a given function; The function will be executed for every 
/// entry of the array, receiving the value of the array index as an argument.
/// @param {Array} array				The index of the array
/// @param {Function} func			The function that will be called to every array entry
/// @return {N/A}
function array_foreach(array, func){
	var i = 0; repeat(array_length(array)){
		func(array[i++]);	
	}
}

/// @description With this function you creates a new array with all elements that pass the test implemented by the provided function.
/// @param {Array} array						The index of the array
/// @param {Function} filter_func		Function is a predicate, to test each element of the array. Return a value that coerces to true to keep the element, or to false otherwise.
/// It will receive the current element being processed in the array and have to return a boolean
/// @return {Array} array						A new array with the elements that pass the test. If no elements pass the test, an empty array will be returned.
function array_filter(array, filter_func){
	var _len = array_length(array);
	var _list = ds_list_create();
	
	var i = 0; repeat(_len){
		if(filter_func(array[i])) 
			ds_list_add(_list, array[i]);	
	
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	return _arr;
}

/// @description With this function you tests whether at least one element in the array passes the test implemented by the provided function
/// @param {Array} array						The index of the array
/// @param {Function} filter_func		Function is a predicate, to test each element of the array. Return a value that coerces to true to keep the element, or to false otherwise.
/// It will receive the current element being processed in the array and have to return a boolean
/// @return {Bool}									Return true if at least one element pass the test
function array_some(array, filter_func){
	if(array_length(array) == 0) return undefined;
	
	var _arr_filter = array_filter(array, filter_func);
	return array_length(_arr_filter) > 0;
}

/// @description With this function you tests whether all elements in the array pass the test implemented by the provided function
/// @param {Array} array							The index of the array
/// @param {Function} filter_func			Function is a predicate, to test each element of the array. Return a value that coerces to true to keep the element, or to false otherwise.
/// It will receive the current element being processed in the array and have to return a boolean
/// @return {Bool}										Returns true if all elements pass the test
function array_every(array, filter_func){
	var _arr_filter = array_filter(array, filter_func);
	return array_length(array) == array_length(_arr_filter);
}

/// @description With this function you creates a new array populated with the results of calling a provided function on every element in the calling array.
/// @param {Array} array					The index of the array
/// @param {Function} map_func		Function that is called for every element of the given array. Each time it executes, the returned value is added to new array.
/// @return {Array}								An array index
function array_map(array, map_func){
	var _len = array_length(array);
	var _array_map = array_create(_len);
	
	var i = 0; repeat(_len){
		_array_map[i] = map_func(array[i]);
		i++;
	}
	
	return _array_map;
}

/// @description With this function you can retrieve the sum of all elements of the given array
/// @param {Array} array		The index of the array
/// @return {Real}					The total sum
function array_reduce(array_real){
	var _sum = 0;
	var i = 0; repeat(array_length(array_real)){
		_sum += array_real[i++];
	}
	
	return _sum;
}

/// @description With this function you can retrieve the all elements of the given array in a string format
/// @param {Array} array				The index of the array
/// @param {String} sep					A string symbol to sep every entry
/// @param {Bool} show_bound		An flag to add the array bounds on the final string
/// @return {String}						All elements on a string
function array_join(array, sep = "", show_bound = false){
	var _str = "", _current;
	var _len = array_length(array)
	var i = 0; repeat(_len){
		_current = array[i++];
		_current ??= "";
		_str += string(_current) + ( i == _len ? "" : sep );
	}
	
	if(show_bound){
		_str += "]"
		_str = string_insert("[", _str, 1);
	}
	
	return _str;
}

/// @description With this function you create a new array from the given array removing those values: false, zero (0), ""  and undefined 
/// @param {Array} array	The index of the array
/// @return {Array}				The index of the array
function array_compact(array){
	var _func = function(val){
		return !( val == false ||  val == "" || val == undefined )
	}
	
	return array_filter(array, _func);
}

/// @description With this function you create an array where is length is the given size
/// Also, all array indices will be initialized with it indice position. 
/// @param {Real} size	The size of the array to create.
/// @return {Array}			The index of the array
function array_create_range(size = 1){
	if(size < 0) return undefined;
	
	var _arr = array_create(size);
	var i = 0; repeat(size){
		_arr[i] = i;
		i++;
	}
	
	return _arr;
}

/// @description With this function you create a new array where it elements will be all the elements from both given arrays; starting with the first given array
/// @param {Array} array1		The index of the first array
/// @param {Array} array2		The index of the second array
/// @return {Array}					 The index of the array
function array_merge(array1, array2){
	var _len1 = array_length(array1);
	var _len2 = array_length(array2);
	var _arr = array_create(_len1 + _len2);
	
	array_copy(_arr, 0, array1, 0, _len1);
	array_copy(_arr, _len1, array2, 0, _len2);
	
	return _arr;
}

/// @description With this function you create a new array where it elements will be all the elements that exists in both given arrays
/// @param {Array} array1		The index of the first array
/// @param {Array} array2		The index of the second array
/// @return {Array}					The index of the array
function array_intersection(array1, array2){
	var _list = ds_list_create();
	
	var i = 0; repeat(array_length(array1)){
		if(array_includes(array2, array1[i]))
			ds_list_add(_list, array1[i]);	
		
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	
	return _arr;
}

/// @description With this function you create a new array where it elements will be all the elements of the first given array that doesn't exists in the second given array
/// @param {Array} array1		The index of the first array
/// @param {Array} array2		The index of the second array
/// @return {Array}					The index of the array
function array_diff(array1, array2){
	var _list = ds_list_create();
	
	var i = 0; repeat(array_length(array1)){
		if(!array_includes(array2, array1[i]))
			ds_list_add(_list, array1[i])
			
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	
	return _arr;
}

/// @description With this function you creates a duplicate-free version from the given array
/// @param {array} array		The index of the array
/// @return {array}					The index of the new array
function array_unique(array){
	var _list = ds_list_create();
	
	var i = 0; repeat(array_length(array)){
		if(ds_list_find_index(_list, array[i]) == -1) 
			ds_list_add(_list, array[i]);
			
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	return _arr;
}

/// @description With this function you create a new ds_list from an array
/// @param {array} array		The index of the array
/// @return {Id.DsList}			The index of the list
function array_to_list(array){
	var _list = ds_list_create();
	var i = 0; repeat(array_length(array)){
		_list[| i] = array[i];
		i++
	}
	
	return _list;
}

/// @description With this function you create an array from a list (ds_list)
/// @param {Id.DsList} ds_list		The index of the list
/// @return {array}								The index of the array 
function array_from_list(ds_list){
	var _len = ds_list_size(ds_list);
	var array = array_create( _len );	
	
	var i = 0; repeat(_len){
		array[i] = ds_list[| i];
		i++;
	}
	
	return array;
}

/// @description With this function you create a new ds_stack from an array
/// @param {array} array		The index of the array
/// @return {Id.DsStack}		The index of the stack
function array_to_stack(array){
	var _stack = ds_stack_create();
	var i = 0; repeat(array_length(array)){
		ds_stack_push(_stack, array[i]);
		i++;
	}
	return _stack;
}

/// @description With this function you create an array from a stack (ds_stack)
/// @param {Id.DsStack} ds_stack		The index of the stack
/// @return {array}									The index of the array
function array_from_stack(ds_stack){
	var _len = ds_stack_size(ds_stack);
	var _arr = array_create(_len);

	var _stack_copy = ds_stack_create();
	ds_stack_copy(_stack_copy, ds_stack);
	
	var i = 0; repeat(_len){
		_arr[i] = ds_stack_pop(_stack_copy);
		i++;
	}
	
	ds_stack_destroy(_stack_copy);
	return _arr;
}

/// @description With this function you create a ds_queue from an array
/// @param {array} array		The index of the array
/// @return {Id.DsQueue}		The index of the queue
function array_to_queue(array){
	var _queue = ds_queue_create();
	var i = 0; repeat(array_length(array)){
		ds_queue_enqueue(_queue, array[i]);
		i++;
	}
	
	return _queue;
}

/// @description With this function you create a new ds_queue from an array
/// @param {Id.DsQueue} ds_queue		The Index of the queue
/// @return {array}									The index of the array 
function array_from_queue(ds_queue){
	
	var _len = ds_queue_size(ds_queue);
	var _arr = array_create(_len);
	var _queue_copy = ds_queue_create();
	ds_queue_copy(_queue_copy, ds_queue);
	
	var i = 0; repeat(_len){
		_arr[i] = ds_queue_dequeue(_queue_copy);
		i++;
	}
	
	ds_queue_destroy(_queue_copy);
	return _arr;
}
