function npc_text_box()
{
// assign arguments to variables
var xx=argument0; // x/y location where you want to display textbox
var yy=argument1;
var text=argument2; // the text to be displayed
var font=argument3; // the font to use
var color=argument4; // the text color
var backcolor=argument5; // the background color

if(font_exists(font)) draw_set_font(font); // set font if it exists

var width=200; // maximum width of the textbox
var height=string_height_ext(text,-1,width);
var w=width div 2+4; // used in centering background around text
var h=height div 2+4;
var border=2; // how many pixel border

draw_set_halign(fa_center); // draw text centered both hor and vert
draw_set_valign(fa_middle);

// draw the background
draw_rectangle_colour(xx-w-border, yy-h-border, xx+w+border, yy+h+border, color,color,color,color,false);
draw_rectangle_colour(xx-w, yy-h, xx+w, yy+h, backcolor,backcolor,backcolor,backcolor,false);

// draw the text
draw_text_ext_colour(xx,yy,text,-1,width,color,color,color,color,1);

// reset character alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
}