/// @description Insert description here
// You can write your code in this editor


// Detect input
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var jump = keyboard_check(vk_up) || keyboard_check(vk_space) || keyboard_check(ord("W"));


// Calculate horizontal movement.
horizontal_movement = (right - left) * player_speed;


// Check collisions.
if (place_meeting (x + horizontal_movement, y, obj_solid))
{
	while (!place_meeting(x + sign(horizontal_movement), y, obj_solid))
	{
		x += sign(horizontal_movement);
	}
	
	horizontal_movement = 0;
}

if (place_meeting (x, y + vertical_movement, obj_solid))
{
	while (!place_meeting(x , y + sign(vertical_movement), obj_solid))
	{
		y += sign(vertical_movement)
	}
	
	vertical_movement = 0;
}

// Check if player is in the air, allow jump when touching ground.
if (not place_meeting(x,y + 1, obj_solid))
{
	vertical_movement += player_gravity;
}
else if (jump)
{
	vertical_movement = player_jump_force;
}

/// Movement.
x += horizontal_movement;
y += vertical_movement;




