/// @description Insert description here
// You can write your code in this editor
// Draw Event of oGameController
// Draw Event of oGameController
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camWidth = camera_get_view_width(view_camera[0]);
var camHeight = camera_get_view_height(view_camera[0]);

// Calculate the position to draw the text
var drawX = camX + xOffset;
var drawY = camY + yOffset;

// Draw the text
draw_set_font(font);
draw_set_color(color);
draw_text(drawX, drawY, message);





