/// @description Objekt / char bewegung coden
// You can write your code in this editor
 //Player basic movement
 
var _right = keyboard_check(vk_right)or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left)or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down)or keyboard_check(ord("S"));
var _up = keyboard_check(vk_up)or keyboard_check(ord("W"));
var jump = keyboard_check(vk_space) 
var switching = keyboard_check_pressed(vk_enter)




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

//collisions
if (collision(x + moveX, y)) {
	while (!collision(x + sign(moveX), y)) {
		x += sign(moveX);
	}
	
	moveX = 0;

}

if (collision(x, y + moveY)) {
	while (!collision(x, y + sign(moveY))){
		
		y += sign(moveY);
		
	
	}
	
	
	moveY = 0;
}

//move instance
x += moveX;
y += moveY;

// animation move
if (moveX != 0 or moveY != 0) {
	sprite_index = spr_Professor_walking;
}
//flip sprite (for not mouse using games thats why I stated this as a comment now!) following will be the sprite for facing the ouse direction
//if (moveX != 0) image_xscale = sign(moveX);
//}


//Animatiaon: IDle
else {
	sprite_index = spr_Professor_Idle;
}
//direction

var _signMouse = sign(mouse_x - x);
if (_signMouse != 0) {
	image_xscale = _signMouse;
}

//Animation Speed (checking if the plaer faces 1 direction and moving the other)

if moveX != 0 && sign(moveX) != _signMouse {
	image_speed = -1;
}
else {
	image_speed = 1;
}

var _signMouse = sign(mouse_x - x);

if (_signMouse !=0){
	image_xscale = _signMouse;

}



//Switching from Human to Monkey form

if switching {
	instance_change(obj_player,true )
	instance_deactivate_object(oSpitzhacke)
	view_visible[1] = 0;
	view_visible[2] = 1;
}

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
	


 

