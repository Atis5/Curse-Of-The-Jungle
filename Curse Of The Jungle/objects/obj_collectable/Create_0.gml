/// @description Insert description here
// You can write your code in this editor

range = 200;

do {
	x = random_range(32, room_width - 32);
	y = random_range(32, room_height - 32);
}

until (point_distance(x,y,obj_player.x, obj_player.y) >= range)


do {
	x = random_range(32, room_width - 32);
	y = random_range(32, room_height - 32);
}

until (point_distance(x,y,obj_solid.x, obj_solid.y) >= range)
