/// @description Objekt / char bewegung coden
// You can write your code in this editor
 //Player basic movement
 
var _right = keyboard_check(vk_right)or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left)or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down)or keyboard_check(ord("S"));
var _up = keyboard_check(vk_up)or keyboard_check(ord("W"));

//input axis

var _inputX = _right - _left;
var _inputY = _down - _up;

//get movement speed

moveX = _inputX * moveSpeed;
moveY = _inputY * moveSpeed;


//collisions
if (Collision(x + moveX, y)) {
	while (!Collision(x + sign(moveX), y)) {
		x += sign(moveX);
	}
	
	moveX = 0;

}

if (Collision(x, y + moveY)) {
	while (!Collision(x, y + sign(moveY))){
		
		y += sign(moveY);
	}
	
	moveY = 0;
}

//move instance
x += moveX;
y += moveY;

// animation move
if (moveX != 0 or moveY != 0) {
	sprite_index = s_professor_walk;
}
//flip sprite (for not mouse using games thats why I stated this as a comment now!) following will be the sprite for facing the ouse direction
//if (moveX != 0) image_xscale = sign(moveX);
//}


//Animation: IDle
else {
	sprite_index = s_professor;
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