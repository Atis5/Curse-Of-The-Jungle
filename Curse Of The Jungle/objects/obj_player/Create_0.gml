//Player stats
player_speed = 5;
player_jump_force = -7;
player_bounce_force = -12;
player_gravity = 0.25;
climb_speed = 2.5;

// Necessary vars
horizontal_movement = 0;
vertical_movement = 0;
stick_to_vine = false;
is_on_vine = false;
is_on_tree = false; 
interact_cooldown = 0;
switching_cooldown = 0;
throw_cooldown = 0;
bounce_cooldown = 0;
grounded = true;
global.tiles = layer_tilemap_get_id("Tiles");
is_jumping = false;
is_landing = false;


//player speed

moveSpeed = 2;

//variables

moveX = 0;

moveY = 0;
global.human = true;

//ROPE SWing
isSwinging = false;
swingAngle = 0;
swingSpeed = 3;
maxSwingAngle = 90;