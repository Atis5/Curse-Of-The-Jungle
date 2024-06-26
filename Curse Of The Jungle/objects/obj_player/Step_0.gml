//Get Player input
var key_left = keyboard_check(vk_left)or keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right)or keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space)
var key_up = keyboard_check(vk_up)or keyboard_check(ord("W"));
var key_down = keyboard_check(vk_down)or keyboard_check(ord("S"));
var key_interact = keyboard_check_pressed(ord("E")) or mouse_check_button(mb_left);
var key_screen = keyboard_check_pressed(vk_enter);
var switching = keyboard_check_pressed(ord("X"));


// Check if player is on the ground
if (place_meeting(x,y+1,[global.tiles, obj_solid, obj_breakable_floor, obj_breakable_rocks]))
{
	grounded = true;
} 
else 
{
    grounded = false;
}



//Switching forms
if ((place_meeting(x,y,obj_switching)) || (switching)) && (switching_cooldown < 1) 
{
	switching_cooldown = 100;
	audio_play_sound(transition_sound,1,0,1);
	for (i=random_range(1,5); i>=0; i--;)
	{
		instance_create_layer(x, y-60,"Player", obj_smoke);
	}
	if (global.human = true)
	{
		global.human = false;
	}
	else
	{
		global.human = true;
	}
}
if (switching_cooldown > 0) && (!place_meeting(x,y,obj_switching))
{	
	switching_cooldown -= 1;
}

//play walking sound





// Animation move
if (horizontal_movement != 0) && (grounded == true) && (is_landing == false)
{	
	if (global.human == true)
	{
		sprite_index = spr_prof_run;
	}
	else
	{
		sprite_index = spr_monkey_run;
	}
	
}



// Animation for the idle
else if (horizontal_movement == 0) && (grounded == true)
{	
	if (global.human == true)
	{
		sprite_index = spr_prof_idle;
	}
	else
	{
		sprite_index = spr_monkey_idle;
	}
}



// Jumping animation
if (is_jumping == true)
{
	if (global.human == true)
	{
		sprite_index = spr_prof_jump;
	}
	else
	{
		sprite_index = spr_monkey_jump;
	}
	if(image_index >= 5)
		{
			is_jumping = false;
		}
}



// Airborne animation
else if (grounded == false) && (is_jumping == false)
{
	if (global.human == true)
	{
		sprite_index = spr_prof_air;
	}
	else
	{
		sprite_index = spr_monkey_air;
	}
}



// Direction or flip sprite
if (horizontal_movement != 0)
{
	if (global.human == true)
	{
		image_xscale = sign(horizontal_movement);
	}
	else
	{
		image_xscale = sign(horizontal_movement);
	}
}



//Calculate movement
var move = key_right - key_left;
horizontal_movement = move * player_speed;
vertical_movement = vertical_movement + player_gravity;



//Jump
if ((grounded == true) || (is_on_vine = true)) && (key_jump)
{
	audio_play_sound(Jump_sound,1,0,1);
	is_jumping = true;
    vertical_movement = player_jump_force;
	stick_to_vine = false;
}



//Collision on the vine
if (collision_line(x-50,y,x+50,y,obj_vine_swing,true,true) ) && (global.human = false)
{
	is_on_vine = true;
}
else
{
    is_on_vine = false;
	stick_to_vine = false;
}



// Pressing interact button to stick to vine
if (key_interact) && (interact_cooldown<1)
{
	stick_to_vine = !stick_to_vine;
	interact_cooldown = 20; // How long the cooldown lasts.
}
if(interact_cooldown > -1)
{
	interact_cooldown -= 1;
	show_debug_message(interact_cooldown);
}



// Pulling player towards the vine
if (is_on_vine = true) && (stick_to_vine)
{
	sprite_index = spr_monkey_climbing;
    vertical_movement = 0;
	var _col = instance_nearest(x, y, obj_vine_swing);
	//show_debug_message(_col);
	x = lerp(x, _col.x, .1);
	//show_debug_message(x);
	
	// Movement on vine
	if (is_on_vine = true) && (key_up)
	{
	    vertical_movement = -climb_speed
	}
	if (is_on_vine = true) && (key_down)
	{
	    vertical_movement = climb_speed
	}
}



//Movement on the tree
if (place_meeting(x,y,obj_climbable_tree)) && (global.human = false) 
{
    is_on_tree = true;
}
else
{
    is_on_tree = false;
}



// Climb up
if (is_on_tree = true) && (key_up)
{
    vertical_movement = -climb_speed
	sprite_index = spr_monkey_climbing;
}



// Climb down
if (is_on_tree = true) && (key_down)
{
    vertical_movement = climb_speed
	sprite_index = spr_monkey_climbing;
}



//Horizontal collision
if(place_meeting(x+horizontal_movement,y,[global.tiles, obj_solid, obj_breakable_floor, obj_breakable_rocks]))
{
    while (!place_meeting(x+sign(horizontal_movement),y,[global.tiles, obj_solid, obj_breakable_floor, obj_breakable_rocks]))
    {
        x = x + sign(horizontal_movement);
    }
    horizontal_movement = 0;
}
x = x + horizontal_movement;



//Vertical collision
if(place_meeting(x,y+vertical_movement,[global.tiles, obj_solid, obj_breakable_floor, obj_breakable_rocks]))
{
    while (!place_meeting(x,y+sign(vertical_movement),[global.tiles, obj_solid, obj_breakable_floor, obj_breakable_rocks]))
    {
        y = y + sign(vertical_movement);
    }
    vertical_movement = 0;
}
y = y + vertical_movement;



//Bouncing on the Leaf
if (place_meeting(x,y,obj_bounce)) && (bounce_cooldown < 1)
{
	vertical_movement = player_bounce_force;
	audio_play_sound(bounce_sound,1,0,1);
	bounce_cooldown = 30; // How long the cooldown lasts.
}
// Cooldown for bouncing.
if(bounce_cooldown > 0)
{
	bounce_cooldown -= 1; 
}

//throw the grenade on mb_left
if (key_interact) && global.human = true && (throw_cooldown<1) { 
	var _throw = instance_create_layer(obj_player.x , obj_player.y - 40, "Player",obj_grenade);
	_throw.whatToDo = "fly"	
	   if (image_xscale ==  1) {   _throw.flyDirect = mouse_x 
		   }
	   if (image_xscale == -1) {   _throw.flyDirect = mouse_y
		   }
	throw_cooldown = 35; // How long the cooldown lasts.
	}
// Cooldown for throwing.
if(throw_cooldown > 0)
{
	throw_cooldown -= 1;
	show_debug_message(throw_cooldown);
}



if (moveX != 0) image_xscale = sign(moveX);

//move instance
x += moveX;
y += moveY;



//rope swing

if (isSwinging) {
    // Apply swinging physics when a key is pressed (e.g., spacebar)
    if (keyboard_check_pressed(vk_space)) {
        // Simulate swinging by adjusting swing angle
        swingAngle += swingSpeed;
        
        // Limit swing angle
        if (swingAngle > maxSwingAngle) {
            swingAngle = maxSwingAngle;
        }
        
        // Apply swinging force to the player
        var swingAngleRadians = degtorad(swingAngle);
        var swingForce = 5; // Adjust this for the swing force
        var swingX = lengthdir_x(swingForce, swingAngleRadians);
        var swingY = lengthdir_y(swingForce, swingAngleRadians);
        
        x += swingX;
        y += swingY;
    }
}




// Set fullscreen on ENTER
if key_screen
{
    if window_get_fullscreen()
    {
        window_set_fullscreen(false);
    }
    else
    {
        window_set_fullscreen(true);
    }
}