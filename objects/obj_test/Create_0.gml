arr1 = [0, 4, 2, 5, 3, 2];
arr2 = [0, 4, 3, false, "", undefined, "olá"];
arr3 = ["Hello ", "World"];

print( array_join(arr1));
print( array_join(arr1, "-"));

println

print(array_merge (arr1, arr2) );
print(array_union(arr1, arr2) );
print(array_intersection(arr1, arr2));
print(array_diff(arr1, arr2));

print(array_sort2(arr1, true));
print(array_sort2(arr1, false));
print(array_shuffle(arr1));

print(array_clone(arr2));

print(array_get_max_value(arr1));
print(array_get_min_value(arr1));
print(array_random_item(arr1));
print(array_last(arr1));
print(array_reverse(arr1));
print(array_compact(arr2));

println
array_foreach(arr1, function(value){ print(value); });
println

print(array_empty(arr1));
print(array_find_index(arr1, 2));
print(array_includes_amount(arr1, 0));

print(array_filter(arr2, is_string));
print(array_some(arr2, is_string));
print(array_every(arr2, is_string));
print(array_map(arr1, function(value){ return value % 2 == 0 } ));


println
print(array_reduce(arr1));
print(array_join(arr3));


print(array_range(11));
print(array_clear(arr1, 0));
print(array_delete_index(arr1, 2)); 
array_delete_index_self(arr1, 1); print(arr1);
array_clear_self(arr1, 2); print(arr1);

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