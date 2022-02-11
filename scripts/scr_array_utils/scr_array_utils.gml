#macro print show_debug_message
#macro println print("\n")

/// ---------------------------------------------
/// ARRAY ELEMENTS MANIPULATION
function array_sort2(array, ascend) {
	var _list	= ds_list_create();
	var _len	= array_length(array);
	
	var i = 0; repeat(_len){
		_list[| i] = array[i];	
		i++;
	}
	
	ds_list_sort(_list, ascend);
	
	i = 0; repeat(_len){
		array[i] = _list[| i];
		i++
	}
	
	ds_list_destroy(_list);
	return array;
}

function array_shuffle(array){
	var _list = ds_list_create();
	var _len = array_length(array);
	
	var i = 0; repeat(_len){
		_list[| i] = array[i];
		i++;
	}
	
	ds_list_shuffle(_list);
	
	i = 0; repeat(_len){
		array[i] = _list[| i];
		i++;
	}
	
	return array;
}

function array_clone(array){
	var _len = array_length(array);
	var _arr = array_create(_len);
	array_copy(_arr, 0, array, 0, _len);
	return _arr;
}

function array_clear(array, value){
	var i = 0; repeat(array_length(array)){
		array[i] = value;
		i++;
	}
	
	return array;
}

function array_clear_self(array, value){
		var i = 0; repeat(array_length(array)){
		array[@ i] = value;
		i++;
	}
}

function array_delete_index(array, index){
	var _arr_clone = array_clone(array);
	array_delete_index_self(_arr_clone, index);
	return _arr_clone;
}

function array_delete_index_self(array, index){
	var _len = array_length(array);
	if(index > _len) return;
	array_delete(array, index, 1);
}

/// ----------------------------------------------
/// EXTRACT AN INFORMATION FROM ARRAY
function array_empty(array){
	return array_length(array) == 0;	
}

function array_find_index(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			return i;
		
		i++;
	}
	
	return undefined;
}

function array_contains(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) 
			return true;
		
		i++;
	}
	
	return false;
}

function array_contains_amount(array, value){
	var _amount = 0;
	var i = 0; repeat(array_length(array)){
		_amount += array[i] == value;
		i++;
	}
	
	return _amount;
}

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

function array_random_item(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	return array[ irandom( _len - 1) ];
}

function array_last(array){
	var _len = array_length(array);
	if(_len == 0) return undefined;
	
	return array[_len - 1];	
}

/// ------------------------------------------------------
/// ARRAY CONCAT VALUES 
function array_foreach(array, func){
	var i = 0; repeat(array_length(array)){
		func(array[i++]);	
	}
}

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

function array_some(array, filter_func){
	if(array_length(array) == 0) return undefined;
	
	var _arr_filter = array_filter(array, filter_func);
	return array_length(_arr_filter) > 0;
}

function array_every(array, filter_func){
	var _arr_filter = array_filter(array, filter_func);
	return array_length(array) == array_length(_arr_filter);
}

function array_map(array, map_func){
	var _len = array_length(array);
	var _array_map = array_create(_len);
	
	var i = 0; repeat(_len){
		_array_map[i] = map_func(array[i]);
		i++;
	}
	
	return _array_map;
}

function array_reduce(array_real){
	var _sum = 0;
	var i = 0; repeat(array_length(array_real)){
		_sum += array_real[i++];
	}
	
	return _sum;
}

function array_reduce_str(array_str){
	var _str = "";
	var i = 0; repeat(array_length(array_str)){
		_str += array_str[i++];	
	}
	
	return _str;
}

function array_reverse(array){
	var _len = array_length(array);
	var _arr = array_create(_len);
	
	var i = 0; repeat(_len){
		_arr[i] = array[_len - i - 1];	
		i++;
	}
	
	return _arr;
}

function array_compact(array){
	var _func = function(val){
		return !( (is_bool(val) && val == false) || val == undefined || val == "")
	}
	
	var _arr = array_filter(array, _func);
	return _arr;
}

function array_range(size = 1){
	var _arr = array_create(size);
	var i = 0; repeat(size){
		_arr[i] = i;
		i++;
	}
	
	return _arr;
}


/// -----------------------------------------
/// CANCAT ARRAYS 
function array_merge(array1, array2){
	var _len1 = array_length(array1);
	var _len2 = array_length(array2);
	var _arr = array_create(_len1 + _len2);
	
	array_copy(_arr, 0, array1, 0, _len1);
	array_copy(_arr, _len1, array2, 0, _len2);
	
	return _arr;
}

function array_intersection(array1, array2){
	var _list = ds_list_create();
	
	var i = 0; repeat(array_length(array1)){
		if(array_contains(array2, array1[i]))
			ds_list_add(_list, array1[i]);	
		
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	
	return _arr;
}

function array_diff(array1, array2){
	var _list = ds_list_create();
	
	var i = 0; repeat(array_length(array1)){
		if(!array_contains(array2, array1[i]))
			ds_list_add(_list, array1[i])
			
		i++;
	}
	
	var _arr = array_from_list(_list);
	ds_list_destroy(_list);
	
	return _arr;
}

/// array_chunk / array_flat / array_slice

/// ------------------------------------------------------
/// CONVERT TO / FROM ARRAY

/// DS_LIST 
function array_to_list(array){
	var _list = ds_list_create();
	var i = 0; repeat(array_length(array)){
		_list[| i] = array[i];
		i++
	}
	
	return _list;
}

function array_from_list(list){
	var _len = ds_list_size(list);
	var array = array_create( _len );	
	
	var i = 0; repeat(_len){
		array[i] = list[| i];
		i++;
	}
	
	return array;
}

/// DS_STACK
function array_to_stack(array){
	var _stack = ds_stack_create();
	var i = 0; repeat(array_length(array)){
		ds_stack_push(_stack, array[i]);
		i++;
	}
	return _stack;
}

function array_from_stack(stack){
	var _len = ds_stack_size(stack);
	var _arr = array_create(_len);

	var _stack_copy = ds_stack_create();
	ds_stack_copy(_stack_copy, stack);
	
	var i = 0; repeat(_len){
		_arr[i] = ds_stack_pop(_stack_copy);
		i++;
	}
	
	ds_stack_destroy(_stack_copy);
	return _arr;
}

/// DS_QUEUE
function array_to_queue(array){
	var _queue = ds_queue_create();
	var i = 0; repeat(array_length(array)){
		ds_queue_enqueue(_queue, array[i]);
		i++;
	}
	
	return _queue;
}

function array_from_queue(queue){
	
	var _len = ds_queue_size(queue);
	var _arr = array_create(_len);
	var _queue_copy = ds_queue_create();
	ds_queue_copy(_queue_copy, queue);
	
	var i = 0; repeat(_len){
		_arr[i] = ds_queue_dequeue(_queue_copy);
		i++;
	}
	
	ds_queue_destroy(_queue_copy);
	return _arr;
}

