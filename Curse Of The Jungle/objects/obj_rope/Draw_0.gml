/// @description Insert description here
// You can write your code in this editor
 var playerObj = instance_find(obj_player,0);
    var anchorObj = instance_find(obj_anchor,1);
// Draw Event of obj_rope
// Draw the rope between the player and the anchor
// Assuming you have a sprite for the rope (spr_rope) or use primitives to draw a line
if instance_exists(obj_player) && instance_exists(obj_anchor) {
    draw_line(playerObj.x, playerObj.y, anchorObj.x, anchorObj.y);
}
