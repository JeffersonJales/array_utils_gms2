/// @description 
my_arr = [1, "ola", 3, "hola", 5, "xau"];
show_debug_message(my_arr);

my_arr_map = array_map(my_arr, is_string);
my_arr_filter = array_filter(my_arr, is_string);

show_debug_message(my_arr_map);
show_debug_message(my_arr_filter);

game_end();