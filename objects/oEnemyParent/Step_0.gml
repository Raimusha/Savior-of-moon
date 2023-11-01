/// @description Insert description here
// You can write your code in this editor
// Reflect direction when hitting room boundaries
if (x <= 0 || x >= room_width - sprite_width/2) {
    direction = 180 - direction; // Reflect the direction horizontally
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

// If you want the enemy sprite to face its direction of movement, you can use:
image_xscale = sign(cos(degtorad(direction)));




