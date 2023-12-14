
// Detect input
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var jump = keyboard_check(vk_up) || keyboard_check(vk_space) || keyboard_check(ord("W"));
var fly = keyboard_check(ord("F"));
var switching = keyboard_check_pressed(vk_enter)

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

// Flying. Works the same as jump, but doesn't check if you touch the ground.
if (fly)
{
	vertical_movement = player_jump_force;
}

// Bounce
if (place_meeting(x,y, obj_bounce))
{
	vertical_movement = player_bounce_force;
}

// Apply movement.
x += horizontal_movement;
y += vertical_movement;

//switching from this placeholer to human back

if switching {
	instance_change(oPlayer,true )
}
