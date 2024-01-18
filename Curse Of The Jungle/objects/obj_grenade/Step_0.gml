/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
//horizontal, apply force with friction, 0 is the max horizontal speed




if (flyDirect == "right") {
	forceX = clamp(forceX, 0, forceX - friction_add);
	x += forceX;
		
		
		spin = -10}
		


if (flyDirect == "left") {
	forceX = clamp(forceX, 0, forceX - friction_add);
	x+= forceX;
		
		
		spin = 10;}
	

//gravity vertical, apply the force with gravity, 2 is max gravity fall speed
forcey = clamp(forcey, forcey + gravity_add, 2);
y += forcey

//rotate the image of the grenade
image_angle += spin;

//setup drawing once
if (draw_checkOnce == false) { draw_checkOnce = true;
	
	//simulate with start index of 1 for i not o
	for (i = 1; i < 400; i++;) {
		
		drawX[i] = drawX[i-1]; //we get the last postion with 
		drawY[i] = drawY[i-1];// get the last position with index 0
	}
//check which direction you need

if (flyDirect == "right") {
	
	forceX_draw = clamp(forceX_draw, 0, forceX_draw - friction_add);
	drawX[i] += forceX_draw}
	
	
if (flyDirect == "left") {

forceX_draw = clamp(forceX_draw, 0, forceX_draw - friction_add);
drawX[i] -= forceX_draw}


				forceY_draw  = clamp(forceY_draw, forceY_draw + gravity_add, 2);
				drawY[i] += forceY_draw}
				
				

	
//Horizontal collision
if(place_meeting(x+horizontal_movement,y,[obj_solid, global.tiles]))
{
    while (!place_meeting(x+sign(horizontal_movement),y,[obj_solid, global.tiles]))
    {
        x = x + sign(horizontal_movement);
    }
    horizontal_movement = 0;
	instance_destroy();
}
x = x + horizontal_movement;

//Vertical collision
if(place_meeting(x,y+vertical_movement,[obj_solid, global.tiles]))
{
    while (!place_meeting(x,y+sign(vertical_movement),[obj_solid, global.tiles]))
    {
        y = y + sign(vertical_movement);
    }
    vertical_movement = 0;
	instance_destroy()
}
y = y + vertical_movement;

if collision_line(xprevious, yprevious, x, y, [obj_solid, global.tiles], 1, 0) {
	event_perform(ev_collision, obj_solid);
}


