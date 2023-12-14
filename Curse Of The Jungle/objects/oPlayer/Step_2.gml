/// @description Spitzhacke checken
// You can write your code in this editor


if (instance_exists(heldItem)) {
	heldItem.x = x - 3 * image_xscale;
	heldItem.y = y - 3;
}
if instance_change(oPlayer, true){
	instance_destroy(Weapons)
}	