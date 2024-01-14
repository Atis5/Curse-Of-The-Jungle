/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben


// Collision Event with obj_parent_breakable
with (other) {
    instance_destroy(); // Destroy the breakable object
    solid_obj.instance_destroy(); // Destroy the associated solid object
}
