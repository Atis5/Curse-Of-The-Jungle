/// @description Insert description here
// You can write your code in this editor

// Step Event of obj_rope
// Update the rope's length to match the distance between the player and the anchor
// Assuming the anchor's instance ID is stored in anchor_id and the player's instance ID is stored in player_id
if instance_exists(obj_player) && instance_exists(obj_anchor) {
    var playerObj = instance_find(obj_player,ropeLength);
    var anchorObj = instance_find(obj_anchor,ropeLength);
    
    // Calculate the distance between the player and the anchor
    ropeLength = point_distance(playerObj.x, playerObj.y, anchorObj.x, anchorObj.y);
}

