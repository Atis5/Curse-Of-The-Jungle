/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben


// Step Event of obj_solid
if (!instance_exists(oBreakableParent)) {
    instance_destroy(); // Destroy the solid object if the breakable object is not present
}
