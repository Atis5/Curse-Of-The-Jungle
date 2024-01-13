/// @description Insert description here
// You can write your code in this editor
//instance_create_layer(x,y,"Collectables",obj_collectable);

if (global.human == false)
{
	instance_destroy()
	audio_play_sound(sound_collectable,1,0,1)
}

//do {
//	x = random_range(32, room_width - 32);
//	y = random_range(32, room_height - 32);
//}

//until (point_distance(x,y,obj_player.x, obj_player.y) >= range);

//var xx = random(room_width);
//var yy = random(room_height);

//do {
//	xx = random_range(32, room_width - 32);
//	yy = random_range(32, room_height - 32);
//}

//until (point_distance(xx,yy,obj_player.x, obj_player.y) >= range);

//instance_create_layer(x,y,"Collectables",obj_collectable);


//do {
//	x = random_range(32, room_width - 32);
//	y = random_range(32, room_height - 32);
//}

//until (point_distance(x,y,obj_solid.x, obj_solid.y) >= range);