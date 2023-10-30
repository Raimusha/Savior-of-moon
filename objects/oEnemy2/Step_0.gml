// Reflect direction when hitting room boundaries
if (y <= 0 || y >= room_height - sprite_height/2) {
    direction = 360 - direction; // Reflect the direction vertically
}

// Check for collision with oWall
if (place_meeting(x, y, oWall)) {
    // Check the direction of movement to determine how to reflect
    if (abs(cos(degtorad(direction))) > 0.5) { // Moving primarily horizontally
        direction = 180 - direction;
    } else { // Moving primarily vertically
        direction = 360 - direction;
    }
}