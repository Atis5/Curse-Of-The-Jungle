/// @description Insert description here
// You can write your code in this editor



// Step Event of obj_breakable_floor
if place_meeting(x,y,obj_player){
timer += 1;

// Check if it's time to destroy the floor
if (timer >= 0.3 * room_speed) { // 3 seconds (room_speed is the number of steps per second)
    state += 1; // Move to the next state of destruction

    // Check if the final state is reached
    if (state > max_state) { // max_state is the number of destruction states
        // Destroy both the breakable floor and the associated solid object
        if (solid_instance != -1) {
            with (solid_instance) {
                instance_destroy();
            }
        }
        instance_destroy(); // Destroy the breakable floor object
    } else {
        // Change the sprite to the next stage of destruction
        sprite_index = asset_get_index("spr_breakable_floor_" + string(state));
        timer = 0; // Reset the timer for the next stage
    }
}


}