/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
offset_y = 0;
host = self;
next_rope = instance_create_layer(x,y,+offset_y, obj_rope);


attach = physics_joint_distance_create(host, next_rope, host.x, host.y, next_rope.x, next_rope.y, false);;
	physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
	physics_joint_set_value(attach, phy_joint_frequency, 10);


with(next_rope) {
	parent = other.id;
	}


repeat (10) {
	offset_y  += 1;
	last_rope = next_rope;
	next_rope = instance_create_layer(x,y + offset_y, obj_rope);
	
	
link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y,next_rope.x,next_rope.y, false);
	physics_joint_set_value(link, phy_joint_damping_ratio, 1 );
	physics_joint_set_value(link, phy_joint_frequency, 10 );
	with(next_rope) {
		parent = other.last_rope;
	}
	
}