/// @description Insert description here
// You can write your code in this editor

// Update timer
timer += 1;


// Check if it's time to destroy the floor
if (timer >= 0.4* room_speed) { // 3 seconds (room_speed is the number of steps per second)
    state += 1; // Move to the next state of destruction

    // Check if the final state is reached
    if (state > max_state) { // max_state is the number of destruction states
        instance_destroy(); // Destroy the object
    } else {
        // Change the sprite to the next stage of destruction
        sprite_index = asset_get_index("spr_breakable_floor_" + string(state));
        timer = 0; // Reset the timer for the next stage
    }
}

