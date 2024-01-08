/// @description Objekt / char bewegung coden
// You can write your code in this editor
 //Player basic movement
 
var _right = keyboard_check(vk_right)or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left)or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down)or keyboard_check(ord("S"));
var _up = keyboard_check(vk_up)or keyboard_check(ord("W"));
var jump = keyboard_check(vk_space) 
var switching = keyboard_check(vk_enter); //from human to monkey
var switching_2 = keyboard_check(ord("E")); //from monkey to human

//Switching from Human to Monkey form

if switching && (place_meeting(x,y+1,obj_solid)) && (human = true)
{
	sprite_index = spr_monkey_idle_test_placeholder;
	human = false;
}
else if switching && (place_meeting(x,y+1,obj_solid)) && (human = false)
{
	sprite_index = spr_prof_idle;
	human = true;
}


	


// animation move
if (horizontal_movement != 0 or vertical_movement != 0) {
	sprite_index = spr_prof_unused;


//direction or flip sprite
if (horizontal_movement != 0) image_xscale = sign(horizontal_movement);
}

//animation for the idle
else {
	sprite_index = spr_prof_idle;
}



// Calculate horizontal movement.
horizontal_movement = (_right - _left) * player_speed;


// Check collisions.
if (place_meeting (x + horizontal_movement, y, obj_solid))
{
	while (!place_meeting(x + sign(horizontal_movement), y, obj_solid))
	{
		x += sign(horizontal_movement);
	}
	
	horizontal_movement = 0;
}

// Apply gravity.
if (place_meeting (x, y + vertical_movement, obj_solid))
{
	while (!place_meeting(x , y + sign(vertical_movement), obj_solid))
	{
		y += sign(vertical_movement)
	}
	
	vertical_movement = 0;
}

// Check if player is in the air.
if (not place_meeting(x,y + 1, obj_solid))
{
	vertical_movement += player_gravity;
}

// Allow jump when touching ground.
else if (jump)
{
	vertical_movement = player_jump_force;
}

if (place_meeting(x,y, obj_bounce))
{
	vertical_movement = player_bounce_force;
}

// Apply movement.
x += horizontal_movement;
y += vertical_movement;



//move instance
x += moveX;
y += moveY;





//throw the grenade on mb_left
if (mouse_check_button_released(mb_left)) { 
	
	var _throw = instance_create_layer(oPlayer.x , oPlayer.y - 40, "Instances",obj_grenade);
	_throw.whatToDo = "fly"	
	   if (image_xscale ==  1) {   _throw.flyDirect = "right" 
		   }
	   if (image_xscale == -1) {   _throw.flyDirect = "left" 
		   }	
	}




	// see projection by holing right mouse button
if (mouse_check_button_released(mb_right)) { 

		var showProjection = instance_create_layer(oPlayer.x  , oPlayer.y - 40, "Instances",obj_grenade  );
	   	showProjection.whatToDo = "show";
	   if (image_xscale ==  1) {   showProjection.flyDirection = "right"        }
	   if (image_xscale == -1) {   showProjection.flyDirection = "left"         }	
		
	} 	
	


 


