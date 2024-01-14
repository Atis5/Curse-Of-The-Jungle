/// @description Insert description here
// You can write your code in this editor

// Create Event of obj_parent_breakable
solid_obj = -1; // Initialize the variable

// The rest of your existing code...

// After the existing code, create the solid object
solid_obj = instance_create_layer(x, y, "Collisions", obj_solid);



solid_instance = -1;
solid_collison = instance_create_layer(oBreakableParent.x, oBreakableParent.y,"Collisions", obj_solid);