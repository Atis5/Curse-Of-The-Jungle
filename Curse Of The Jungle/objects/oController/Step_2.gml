/// @description Insert description here
// You can write your code in this editor
//DEPTH (char vor und hinter den boxen (objects)

var _playerExists = instance_exists(oPlayer);
var _heldItem = noone;
if (_playerExists) _heldItem = oPlayer.heldItem;


with (all) {
	depth = -bbox_bottom;
	
	//expection for the held item of char
	if (_playerExists && _heldItem == id) {
		depth -= 12;
	}
}