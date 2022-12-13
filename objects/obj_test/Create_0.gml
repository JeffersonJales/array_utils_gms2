#macro print show_debug_message
#macro println print("")

arr1 = [0, 4, 2, 5, 3, 2];
arr2 = [0, 4, 3, false, "", undefined, "olá"];
arr3 = ["Hello", "World"];


print( array_join(arr1));
print( array_join(arr1, "-"));

println

print(array_diff(arr1, arr2));

print(array_shuffle(arr1));

print(array_clone(arr2));

print(array_get_max_value(arr1));
print(array_get_min_value(arr1));
print(array_get_random(arr1));
print(array_last(arr1));
print(array_compact(arr2));


print(array_empty(arr1));
print(array_includes_amount(arr1, 0));


println
print(array_join(arr3, " ", false));
print(array_join(arr2, " ", true));


print(array_create_range(11));
print(array_clear(arr1, 0));

stack = ds_stack_create();
ds_stack_push(stack, 0, 1, 2, 3, 4, 6);

queue = ds_queue_create();
ds_queue_enqueue(queue, 8, 4, 6, 2, 3);

arr_stack = array_from_stack(stack)
arr_queue = array_from_queue(queue);

print(arr_stack);
print(arr_queue);

stack2 = array_to_stack(arr_stack);
queue2 = array_to_queue(arr_queue);

print(stack2);
print(queue2);


game_end();