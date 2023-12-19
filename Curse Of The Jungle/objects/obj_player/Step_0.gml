 //Get Player input
key_left = keyboard_check(vk_left)or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)or keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space)
key_up = keyboard_check(vk_up)or keyboard_check(ord("W"));
key_down = keyboard_check(vk_down)or keyboard_check(ord("S"));
key_interact = keyboard_check_pressed(ord("E"));
var switching = keyboard_check_pressed(vk_enter);

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
if (place_meeting(x,y, obj_vine_swing)) 
{
	is_on_vine = true;
}
else
{
    is_on_vine = false;
	stick_to_vine = false;
}

if (key_interact) 
{
	stick_to_vine = !stick_to_vine;	
}


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
if (place_meeting(x,y,obj_climbable_tree)) 
{
    is_on_tree = true;
}
else
{
    is_on_tree = false;
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


	
//Switching from Human to Monkey form

if  switching && (place_meeting(x,y+1,obj_solid)) {
	instance_change(oPlayer,true)
	instance_deactivate_object(oSpitzhacke)
	view_visible[1] = 1;
	view_visible[2] = 0;
}

if (moveX != 0) image_xscale = sign(moveX);

//move instance
x += moveX;
y += moveY;

// animation move
if (moveX != 0 or moveY != 0) {
	sprite_index = spr_monkey_idle_test_placeholder;
}
//flip sprite (for not mouse using games thats why I stated this as a comment now!) following will be the sprite for facing the ouse direction
//if (moveX != 0) image_xscale = sign(moveX);
//}


//Animatiaon: IDle
else {
	sprite_index = spr_monkey_idle_test_placeholder;
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