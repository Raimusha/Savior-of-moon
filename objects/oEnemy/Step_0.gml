// Reflect direction when hitting room boundaries
if (x <= 0 || x >= room_width - sprite_width/2) {
    direction = 180 - direction; // Reflect the direction horizontally
}

// If you want the enemy sprite to face its direction of movement, you can use:
image_xscale = sign(cos(degtorad(direction)));
