//Get Player input
key_left = keyboard_check(vk_left)or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)or keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space)
key_up = keyboard_check(vk_up)or keyboard_check(ord("W"));
key_down = keyboard_check(vk_down)or keyboard_check(ord("S"));
key_interact = keyboard_check_pressed(ord("E"));
var switching = keyboard_check_pressed(vk_enter);



//Switching from Monkey to Human
if (place_meeting(x,y,obj_trans_totem)) && (interact_cooldown < 1)
{
	if (human = true)
	{
		sprite_index = spr_monkey_idle;
		human = false;
		interact_cooldown = 100;
	}
	else
	{
		sprite_index = spr_Professor_Idle;
		human = true;
		interact_cooldown = 100;
	}
}



// Animation move
if (horizontal_movement != 0 || vertical_movement != 0) && (human = false) 
{
	sprite_index = spr_monkey_idle;
}



// Direction or flip sprite
if (horizontal_movement != 0)
{
	image_xscale = sign(horizontal_movement);
}

// Animation for the idle
else if (human = false) 
{
	sprite_index = spr_monkey_idle;
}



// Animation move for human
if (horizontal_movement != 0 or vertical_movement != 0) && (human = true) 
{
	sprite_index = spr_Professor_walking;
}



// Direction or flip sprite for human
if (horizontal_movement != 0)
{
	image_xscale = sign(horizontal_movement);
}



// Animation for the idle for human
else if (human = true) 
{
	sprite_index = spr_Professor_walking;
}



//Calculate movement
var move = key_right - key_left;
horizontal_movement = move * player_speed;
vertical_movement = vertical_movement + player_gravity;



//Jump
if (place_meeting(x,y+1,obj_solid)) && (key_jump) || (is_on_vine = true) && (key_jump) || (is_on_tree = true) && (key_jump)
{
    vertical_movement = player_jump_force;
	stick_to_vine = false;
}



//Collision on the vine
if (place_meeting(x,y, obj_vine_swing)) && (human = false)
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
	interact_cooldown = 20;
}
if(interact_cooldown > 0)
{
	interact_cooldown -= 1;
}



// Pulling player towards the vine
if (is_on_vine = true) && (stick_to_vine)
{
    vertical_movement = 0;
	var _col = instance_place(x, y, obj_vine_swing);
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
if (place_meeting(x,y,obj_climbable_tree)) && (human = false) 
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
}



// Climb down
if (is_on_tree = true) && (key_down)
{
    vertical_movement = climb_speed
}



//Horizontal collision
if(place_meeting(x+horizontal_movement,y,obj_solid))
{
    while (!place_meeting(x+sign(horizontal_movement),y,obj_solid))
    {
        x = x + sign(horizontal_movement);
    }
    horizontal_movement = 0;
}
x = x + horizontal_movement;



//Vertical collision
if(place_meeting(x,y+vertical_movement,obj_solid))
{
    while (!place_meeting(x,y+sign(vertical_movement),obj_solid))
    {
        y = y + sign(vertical_movement);
    }
    vertical_movement = 0;
}
y = y + vertical_movement;



//Bouncing on the Leaf
if (place_meeting(x,y,obj_bounce))
{
	vertical_movement = player_bounce_force;
}

//throw the grenade on mb_left
if (mouse_check_button_released(mb_left)) && human = true { 
	
	var _throw = instance_create_layer(obj_player.x , obj_player.y - 40, "Instances",obj_grenade);
	_throw.whatToDo = "fly"	
	   if (image_xscale ==  1) {   _throw.flyDirect = "right" 
		   }
	   if (image_xscale == -1) {   _throw.flyDirect = "left" 
		   }	
	}



if (moveX != 0) image_xscale = sign(moveX);

//move instance
x += moveX;
y += moveY;