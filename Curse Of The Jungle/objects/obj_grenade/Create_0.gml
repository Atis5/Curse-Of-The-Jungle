/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
forceX = 1; //horizontal force which starts with positive integer
forcey = -1; //vertical force, starts negatvive, goes up
whatToDo = "";
depth = -300;

alarm[0] = 600;// destroy after some time

horizontal_movement = 0;
vertical_movement = 0;


friction_add = 0.001; //counter value reduce horizontal flight
gravity_add = 0.01; //counter value which pulls down
flyDirect = "right"; //selector of fly direction
spin = 10; //rotation of the object

//drawing part setup
draw_steps = 410; // how many coordinates, you create per virtual step 2

forceX_draw = 1;
forceY_draw = -1;

drawX[0] = x; //start position on index 0
drawY[0] = y;

draw_checkOnce = false; //check once and set

//create those empty variables or array and set to 0

for (j = 1; j < draw_steps; j++) {
	drawX[j] = 0;	drawY[j] = 0;
	}