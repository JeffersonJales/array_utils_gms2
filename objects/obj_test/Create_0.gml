arr1 = [0, 4, 2, 5, 3];
arr2 = [0, 4, 3, false, "", undefined, "olá"];
arr3 = ["Hello ", "World"];

print( array_join(arr1));
print( array_join(arr1, "-"));

println

print( array_merge (arr1, arr2) );
print( array_union(arr1, arr2) );
print( array_intersection(arr1, arr2));
print( array_diff(arr1, arr2));
game_end();
/*
print(array_sort2(arr1, true));
print(array_sort2(arr1, false));
print(array_shuffle(arr1));
println

print(array_clone(arr2));
print(array_clear(arr1, 0));

print(array_delete_index(arr1, 2));
print(arr1);

array_delete_index_self(arr1, 1);
print(arr1);

println
array_foreach(arr1, function(value){ print(value); });
println


print(array_filter(arr2, is_string));
print(array_some(arr2, is_string));
print(array_every(arr2, is_string));
print(array_map(arr1, function(value){ return value % 2 == 0 } ));

println
print(array_reduce(arr1));
print(array_join(arr3));


print(array_range(11));
game_end();