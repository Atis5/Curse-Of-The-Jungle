/// @description Insert description here
// You can write your code in this editor

if (transitioning)
{
	transitionTimer++;

var transitionProgress = transitionTimer / transitionDuration;

if (transitionProgress >= 1) {
	currentSprite = targetSprite;
	transitioning = false;
	
}
	
} else {
	transitionTimer = 0;
	
}




if (keyboard_check_pressed(vk_space) && !transitioning) {
	transitioning = true;
sprite_index = spr_transtition_end



}





