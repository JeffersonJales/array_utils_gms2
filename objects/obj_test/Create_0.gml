concat = function(){
	var _str = "";
	for(var i = 0; i < argument_count; i++){
		_str += string(argument[i]) + " ";
	}
	
	return _str;
}
#macro print show_debug_message
#macro s print(concat( 
#macro o ))


#macro println print("")
#macro finish game_end() exit


arr1 = [0, 4, 2, 5, 3, 2];
arr2 = [0, 4, 3, false, "", undefined, "olá"];
arr3 = ["Hello", "World"];

list = ds_list_create(); ds_list_add(list, 1, 6, 9, 10);
var _arr_list = array_from_list(list);
var _list = array_to_list(arr3);

stack = ds_stack_create(); ds_stack_push(stack, 0, 1, 2, 3, 4, 6);
var _arr_stack = array_from_stack(stack);
var _stack = array_to_stack(arr2);

queue = ds_queue_create(); ds_queue_enqueue(queue, 8, 4, 6, 2, 3);
var _arr_queue = array_from_queue(queue);
var _queue = array_to_queue(arr1)

print(list)
print(_arr_list)
print(_list)

print(stack)
print(_arr_stack)
print(_stack)

print(queue)
print(_arr_queue)
print(_queue)

println

s "Array before change", arr1 o 

array_shuffle(arr1);
s "Shuffled:", arr1 o

array_swap(arr1, 0, 2);
s "Swaped:", arr1 o

array_clear(arr1, 2);
s "Cleared:", arr1 o

finish