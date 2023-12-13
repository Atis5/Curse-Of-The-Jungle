/// @description Insert description here
// You can write your code in this editor
//rotation
rotation = lerp(rotation, 45, 0.1);

image_angle = rotation * oPlayer.image_xscale;

//Get input

var _mousePress = mouse_check_button(mb_left);

//Get breakable instance at mouse position

var _breakable = instance_position(mouse_x, mouse_y, oBreakableParent);


with (_breakable) {
	//Get distancec
	var _dist = distance_to_object(oPlayer);
	
	//In range?
	if (_dist < other.breakDistance) {
		
		//Click
		if(other.cooldown == 0 && _mousePress) {
		//reduce HP
		hp--;
		show_debug_message(hp)
		if (hp <= 0) {
			instance_destroy()
		}
		
		// If player is looking left use -90
		// if player is looking right use 90
		//Set rotation
		other.rotation = 90;
		
		
		//set cooldown
		other.cooldown = 20;
		}
	}
}

//cooldown
if(cooldown > 0) cooldown--;

if keyboard_check(vk_left) direction += 5;
if keyboard_check(vk_right) direction -= 5;