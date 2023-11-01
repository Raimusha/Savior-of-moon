// Step Event
if (instance_exists(oPlayer)) {
    xTo = oPlayer.x;
    yTo = oPlayer.y;
    // Other camera following code
} else {
    // Optional: Code to handle the case when the player does not exist
    // You might want to fix the camera's position, transition to a different room, etc.
}


x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Clamp the camera position
x = clamp(x, minX, maxX);
y = clamp(y, minY, maxY);

camera_set_view_pos(view_camera[0], x - (camWidth * 1), y - (camHeight * 1));
