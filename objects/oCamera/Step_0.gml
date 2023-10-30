// Step Event
if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Clamp the camera position
x = clamp(x, minX, maxX);
y = clamp(y, minY, maxY);

camera_set_view_pos(view_camera[0], x - (camWidth * 1), y - (camHeight * 1));
