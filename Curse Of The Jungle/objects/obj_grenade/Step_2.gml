/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
//endstep to collide granade with end
if collision_line(xprevious, yprevious, x, y, obj_solid, 1, 0) {
	event_perform(ev_collision, obj_solid);
}