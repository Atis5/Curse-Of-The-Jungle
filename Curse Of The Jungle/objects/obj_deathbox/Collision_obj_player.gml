


if(!has_triggered) {
	audio_play_sound(Death_sound,1,0,1);
	has_triggered = true;
	target = other;
	


target.x = global.checkpoint_x;
target.y = global.checkpoint_y;
has_triggered = false;
}


