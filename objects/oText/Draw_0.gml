/// @description Insert description here
// You can write your code in this editor

// oText Draw Event
if (instance_exists(parent_instance)) {
    // Draw the text at the parent instance’s position with the specified offset
    var _x = parent_instance.x + x_offset;
    var _y = parent_instance.y + y_offset;
    draw_text(_x, _y, text);
}



