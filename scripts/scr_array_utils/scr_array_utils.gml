/* 
	ARRAY UTILS | https://github.com/JeffersonJales/array_utils_gms2
	13/12/2022
*/

/// @desc With this function you can shuffle the given array.
/// @param {Array<Any>} array The index of the array to shuffle
/// @returns {Array<Any>} Re-ordered array 
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

/// @desc With this function you can swap the position of two values from the given array
/// @param {Array<Any>} array The index of the array
/// @param {Real} index1 The first position to swap
/// @param {Real} index2 The second position to swap
/// @return {Array<Any>} The index of the array
function array_swap(array, index1, index2){
	var _value = array[index2];
	array[index2] = array[index1];
	array[index1] = _value;
	return array;
}

/// @desc With this function you will copy all the given array to a new one
/// @param {Array<Any>} array The index of the array will be cloned
/// @returns {Array} An new array
function array_clone(array){
	var _len = array_length(array);
	var _arr = array_create(_len);
	array_copy(_arr, 0, array, 0, _len);
	return _arr;
}

/// @desc With this function you can clear the given array with a given value
/// @param {Array<Any>} array The index of the array to shuffle
/// @param {Any} value The new value for all array elements
/// @returns {Array<Any>} A array index
function array_clear(array, value){
	var i = 0; repeat(array_length(array)){
		array[i] = value;
		i++;
	}
	
	return array;
}

/// @desc With this function you can retrieve the value from the given array; It also handles out of bound index (including negative)
/// @param {Array<Any>} array The index of the array
/// @param {Real} index The index of the array to get the value from.
/// @return {Any} The array index value OR undefined in case the length of the array is zero (0)
function array_get_ext(array, index){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	while(index < 0) index += _len;
	while(index > _len) index -= _len;
	
	return array[index];
}

/// @desc With this function you can check if the given index is inside of the bounds of the given array
/// @param {Array<Any>} array The index of the array
/// @param {Real} index The index position to check
/// @return {Bool} 
function array_index_inside_bounds(array, index){
	return index >= 0 && array_length(array) > index; 
}

/// @desc With this function you can check if the given array is empty or not
/// @param {Array<Any>} array The index of the array
/// @return {Bool}					
function array_empty(array){
	return array_length(array) == 0;	
}

/// @desc With this function you can retrieve the position of the first entry of the given value on the given array 
/// @param {Array<Any>} array The index of the array
/// @param {real} value The value to search on the given array
/// @return {Any} undefined case don't find anything OR the position of the given value on the array (real)
function array_find_index_simple(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			return i;
		
		i++;
	}
	
	return undefined;
}

/// @desc With this function you can retrieve all positions of the given value on the given array 
/// @param {Array<Any>} array The index of the array
/// @param {real} value The value to search on the given array
/// @return {Array<Any>} The index of the array 
function array_find_index_all(array, value){
	var _list = ds_list_create();
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			ds_list_add(_list, i);	
			
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	return _arr;
}

/// @desc With this function you can remove all entries of the a given value from a given array 
/// @param {Array<Any>} array The index of the array
/// @param {Any} value The value to remove from the array
/// @return {Array<Any>} The index of the array 
function array_remove(array, value){
	var _indexes = array_find_index_all(array, value);
	var i = 0; repeat(array_length(_indexes)){
		array_delete(array, _indexes[i], 1);
		i++;
	}
	
	return array;
}

/// @desc With this function you can check if the given array have the given value inside of it
/// @param {Array<Any>} array The index of the array
/// @param {Any} value The value to check inside the array
/// @return {Bool}
function array_includes(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			return true;
		
		i++;
	}
	
	return false;
}

/// @desc With this function you can check the amount of times the given value appears in the given array
/// @param {Array<Any>} array The index of the array
/// @param {Any} value The value to check inside the array
/// @return {Real}
function array_includes_amount(array, value){
	var _amount = 0;
	var i = 0; repeat(array_length(array)){
		_amount += array[i] == value;
		i++;
	}
	
	return _amount;
}

/// @desc With this function you can retrieve the maximun value inside of the given array
/// @param {Array<Real>} array The index of the array
/// @return {Any} Undefined case array length equals zero OR the max value inside of the array
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

/// @desc With this function you can retrieve the minimum value inside of the given array
/// @param {Array<Real>} array The index of the array 
/// @return {Any} Undefined case array length equals zero OR the max value inside of the array
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

/// @desc With this function you can retrieve a random entry of the given array
/// @param {Array<Any>} array The index of the array
/// @return {Any} undefined in case length of the given array is zero OR the value of the a random entry of the given array
function array_get_random(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	return array[ irandom( _len - 1) ];
}

/// @desc With this function you can retrieve the last entry of the given array
/// @param {Array<Any>} array The index of the array
/// @return {Any} undefined in case length of the given array is zero OR the value of the last entry given array
function array_last(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	return array[_len - 1];	
}

/// @desc With this function you can loop through the given array indices executing a given function; The function will be executed for every 
/// entry of the array, receiving the value of the array index as an argument.
/// @param {Array<Any>} array The index of the array
/// @param {Function} func The function that will be called to every array entry
/// @param {Any} args You can parse more arguments to the function, but the first argumento of the func will be always the array entry
function array_foreach_args(array, func, args){
	var _arr_args = array_create(argument_count - 1);
	
	var i = 1; repeat(argument_count - 2){
		_arr_args[i] = argument[i + 1]
		i++;
	}
	
	var _func				= method(self, func);
	var _func_index = method_get_index(_func);
	
	i = 0; repeat(array_length(array)){
		_arr_args[0] = array[i++];
		script_execute_ext(_func_index, _arr_args);
	}
}

/// @desc With this function you creates a new array with all elements that pass the test implemented by the provided function.
/// @param {Array<Any>} array The index of the array
/// @param {Function} filter_func Function is a predicate, to test each element of the array. Return a value that coerces to true to keep the element, or to false otherwise.
/// It will receive the current element being processed in the array and have to return a boolean
/// @param {Any} args You can parse more arguments to the function, but the first argument of the func will be always the array entry
/// @return {Array<Any>} array A new array with the elements that pass the test. If no elements pass the test, an empty array will be returned.
function array_filter_args(array, filter_func, args){
	var _arr_args = array_create(argument_count - 1);
	var i = 1; repeat(argument_count - 2){
		_arr_args[i] = argument[i + 1]
		i++;
	}
	var _func = method(self, filter_func);
	var _func_index = method_get_index(_func);
	
	var _len = array_length(array);
	var _list = ds_list_create();
	
	i = 0; 
	repeat(_len){
		_arr_args[0] = array[i++];
		if(script_execute_ext(_func_index, _arr_args))
			ds_list_add(_list, _arr_args[0]);
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	return _arr;
}

/// @desc With this function you tests whether at least one element in the array passes the test implemented by the provided function
/// @param {Array<Any>} array The index of the array
/// @param {Function} filter_func Function is a predicate, to test each element of the array. Return a value that coerces to true to keep the element, or to false otherwise.
/// It will receive the current element being processed in the array and have to return a boolean
/// @param {Any} args You can parse more arguments to the function, but the first argument of the func will be always the array entry
/// @return {Bool} Return true if at least one element pass the test
function array_any_args(array, filter_func, args){
	var _arr_args = array_create(argument_count);
	var i = 0; repeat(argument_count){
		_arr_args[i] = argument[i]
		i++;
	}
	
	var _arr_filter = script_execute_ext(array_filter_ext, _arr_args);
	return array_length(_arr_filter) > 0;
}

/// @desc With this function you tests whether all elements in the array pass the test implemented by the provided function
/// @param {Array<Any>} array The index of the array
/// @param {Function} filter_func Function is a predicate, to test each element of the array. Return a value that coerces to true to keep the element, or to false otherwise.
/// It will receive the current element being processed in the array and have to return a boolean
/// @param {Any} args You can parse more arguments to the function, but the first argument of the func will be always the array entry
/// @return {Bool} Returns true if all elements pass the test
function array_all_args(array, filter_func, args){
	var _arr_args = array_create(argument_count);
	var i = 0; repeat(argument_count){
		_arr_args[i] = argument[i]
		i++;
	}
	
	var _arr_filter = script_execute_ext(array_filter_ext, _arr_args);
	return array_length(array) == array_length(_arr_filter);
}

/// @desc With this function you creates a new array populated with the results of calling a provided function on every element in the calling array.
/// @param {Array<Any>} array The index of the array
/// @param {Function} map_func Function that is called for every element of the given array. Each time it executes, the returned value is added to new array.
/// @param {Any} args You can parse more arguments to the function, but the first argument of the func will be always the array entry
/// @return {Array<Any>} An array index
function array_map_args(array, map_func, args){
	var _arr_args = array_create(argument_count - 1);
	
	var i = 1; repeat(argument_count - 2){
		_arr_args[i] = argument[i + 1]
		i++;
	}
	
	var _func = method(self, map_func);
	var _func_index = method_get_index(_func);
	
	var _len = array_length(array);
	var _array_map = array_create(_len);
	
	var f = 0; repeat(_len){
		_arr_args[0] = array[f]
		_array_map[f] = script_execute_ext(_func_index, _arr_args);
		f++;
	}
	
	return _array_map;
}

/// @desc With this function you can retrieve the all elements of the given array in a string format
/// @param {Array<Any>} array The index of the array
/// @param {String} sep A string symbol to sep every entry
/// @param {Bool} show_bound An flag to add the array bounds on the final string
/// @return {String} All elements on a string
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

/// @desc With this function you create a new array from the given array removing those values: false, zero (0), ""  and undefined 
/// @param {Array<Any>} array The index of the array
/// @return {Array} The index of the array
function array_compact(array){
	var _func = function(val){
		return !( val == false ||  val == "" || val == undefined )
	}
	
	return array_filter(array, _func);
}

/// @desc With this function you create an array where is length is the given size
/// Also, all array indices will be initialized with it indice position. 
/// @param {Real} size The size of the array to create.
/// @return {Array<Real>, Undefined} The index of the array
function array_create_range(size = 1){
	if(size < 0) return undefined;
	
	var _arr = array_create(size);
	var i = 0; repeat(size){
		_arr[i] = i;
		i++;
	}
	
	return _arr;
}

/// @desc With this function you create a new array where it elements will be all the elements of the first given array that doesn't exists in the second given array
/// @param {Array<Any>} array1 The index of the first array
/// @param {Array<Any>} array2 The index of the second array
/// @return {Array<Any>} The index of the array
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

/// @desc With this function you create a new ds_list from an array
/// @param {Array<Any>} array The index of the array
/// @return {Id.DsList<Any>} The index of the list
function array_to_list(array){
	var _list = ds_list_create();
	var i = 0; repeat(array_length(array)){
		_list[| i] = array[i];
		i++
	}
	
	return _list;
}

/// @desc With this function you create an array from a list (ds_list)
/// @param {Id.DsList<Any>} ds_list The index of the list
/// @return {Array<Any>} The index of the array 
function array_from_list(ds_list){
	var _len = ds_list_size(ds_list);
	var array = array_create( _len );	
	
	var i = 0; repeat(_len){
		array[i] = ds_list[| i];
		i++;
	}
	
	return array;
}

/// @desc With this function you create a new ds_stack from an array
/// @param {Array<Any>} array The index of the array
/// @return {Id.DsStack<Any>} The index of the stack
function array_to_stack(array){
	var _stack = ds_stack_create();
	var i = 0; repeat(array_length(array)){
		ds_stack_push(_stack, array[i]);
		i++;
	}
	return _stack;
}

/// @desc With this function you create an array from a stack (ds_stack)
/// @param {Id.DsStack<Any>} ds_stack The index of the stack
/// @return {Array<Any>} The index of the array
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

/// @desc With this function you create a ds_queue from an array
/// @param {Array<Any>} array The index of the array
/// @return {Id.DsQueue<Any>} The index of the queue
function array_to_queue(array){
	var _queue = ds_queue_create();
	var i = 0; repeat(array_length(array)){
		ds_queue_enqueue(_queue, array[i]);
		i++;
	}
	
	return _queue;
}

/// @desc With this function you create a new ds_queue from an array
/// @param {Id.DsQueue<Any>} ds_queue The Index of the queue
/// @return {Array<Any>} The index of the array 
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
