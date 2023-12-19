/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
//create grenade 
if (mouse_check_button_released(mb_left)) { 
	
	var _throw = instance_create_layer(oPlayer.x , oPlayer.y - 40, "Instances",obj_grenade);
	_throw.whatToDo = "fly"	
	   if (image_xscale ==  1) {   _throw.flyDirect = "right" 
		   }
	   if (image_xscale == -1) {   _throw.flyDirect = "left" 
		   }	
	}




	// see projection by holing right mouse button
if (mouse_check_button_released(mb_right)) { 

		var showProjection = instance_create_layer(oPlayer.x  , oPlayer.y - 40, "Instances",obj_grenade  );
	   	showProjection.whatToDo = "show";
	   if (image_xscale ==  1) {   showProjection.flyDirection = "right"        }
	   if (image_xscale == -1) {   showProjection.flyDirection = "left"         }	
		
	} 	
	
