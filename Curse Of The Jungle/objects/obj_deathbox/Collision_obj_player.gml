


if(!has_triggered) {
	if (global.human == false)
	{
		audio_play_sound(Death_sound,1,0,1);
	}
	else
	{
		audio_play_sound(death_sound_human,1,0,1);
	}
	has_triggered = true;
	target = other;
	


target.x = global.checkpoint_x;
target.y = global.checkpoint_y;
has_triggered = false;
}


