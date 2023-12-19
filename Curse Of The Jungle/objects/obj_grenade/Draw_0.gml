/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
//if (whatToDo == "fly") {draw_self(); }



// draw projection

if (whatToDo == "show") {
for (var k = 0; k < 400; k= k+ 10;) {

   draw_sprite_ext(spr_Fly_ProjectionPoint, 0, drawX[k],  drawY[k], 0.5,0.5, 0, c_white, 0.6 );


}}

draw_self(); //draw the grenade itself

//draw an interval of an integer

for (k = 0; k < 400; k = k + 5 ) {
	
	//here we draw the sprite, can be draw_circle everything
	draw_sprite(spr_Fly_ProjectionPoint,0, drawX[k], drawY[k] );
	
	}
	
