
/// ---------------------------------------------
/// ARRAY ELEMENTS MANIPULATION
function array_sort(array, ascend) {
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

/// ----------------------------------------------
/// EXTRACT AN INFORMATION FROM ARRAY
function array_empty(array){
	return array_length(array) == 0;	
}

function array_find_index(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) return i;
		i++;
	}
	
	return undefined;
}

function array_contains(array, value){
	var i = 0; repeat(array_length(array)){
		if(array[i] == value) return true;
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
	return array[ irandom( array_length(array) - 1) ];
}

/// ------------------------------------------------------
/// ARRAY CONCAT VALUES 
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
