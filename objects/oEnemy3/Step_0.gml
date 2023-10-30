// Reflect direction when hitting room boundaries
if (y <= 0 || y >= room_height - sprite_height/2) {
    direction = 360 - direction; // Reflect the direction vertically
}