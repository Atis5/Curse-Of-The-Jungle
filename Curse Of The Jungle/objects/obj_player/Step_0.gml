 //Get Player input
key_left = keyboard_check(vk_left)or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)or keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space)
key_up = keyboard_check(vk_up)or keyboard_check(ord("W"));
key_down = keyboard_check(vk_down)or keyboard_check(ord("S"));
key_interact = keyboard_check(ord("E"));

//Calculate movement
var move = key_right - key_left;

horizontal_movement = move * player_speed;
vertical_movement = vertical_movement + player_gravity;


//Jump
if (place_meeting(x,y+1,obj_solid)) && (key_jump) or (is_on_vine = true) && (key_jump)
{
    vertical_movement = player_jump_force;
}

//Movement on the vine
if (place_meeting(x,y,obj_vine_swing)) 
{
    is_on_vine = true;
}
else
{
    is_on_vine = false;
}

if (is_on_vine = true) && (key_interact)
{
    vertical_movement = 0;
}


if (is_on_vine = true) && (key_up)
{
    vertical_movement = -climb_speed
}

if (is_on_vine = true) && (key_down)
{
    vertical_movement = climb_speed
}

//Movement on the tree
if (place_meeting(x,y,obj_climbable_tree)) 
{
    is_on_tree = true;
}
else
{
    is_on_tree = false;
}

if (is_on_tree = true) && (key_interact)
{
    vertical_movement = 0;
}

if (is_on_tree = true) && (key_up)
{
    vertical_movement = -climb_speed
}

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