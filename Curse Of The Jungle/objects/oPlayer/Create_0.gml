/// @description basic object speed 
// You can write your code in this editor
//player speed

moveSpeed = 2;

//variables

moveX = 0;

moveY = 0;

//create Pickaxe
heldItem = instance_create_layer(x, y, "Weapons", oSpitzhacke);

player_speed = 5;
player_jump_force = -7;
player_bounce_force = -12;
player_gravity = 0.25;

horizontal_movement = 0;
vertical_movement = 0;


