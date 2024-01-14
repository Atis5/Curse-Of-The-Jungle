// Collision Event with obj_parent_breakable
// Collision Event with obj_parent_breakable



// Collision Event with obj_parent_breakable
with (other) {
    if (solid_obj != -1 && instance_exists(solid_obj)) {
        instance_destroy(solid_obj); // Destroy the associated solid object
    }
    instance_destroy(); // Destroy the breakable object
}
