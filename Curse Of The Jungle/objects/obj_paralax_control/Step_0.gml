/// @description Insert description here
// You can write your code in this editor

var near = layer_get_id("near");
var mid = layer_get_id("Mid");
var far = layer_get_id("far");

layer_x(near, lerp(0, camera_get_view_x(view_camera[0]), 0.5  )    )
layer_x(mid, lerp(0, camera_get_view_x(view_camera[0]), 0.7  )    )
layer_x(far, lerp(0, camera_get_view_x(view_camera[0]), 0.85  )    )