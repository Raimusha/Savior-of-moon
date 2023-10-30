/// @description Insert description here
// You can write your code in this editor
// Get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);

// Calculate Movement
// Horizontal movement
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    hsp = -move_speed;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    hsp = move_speed;
}

// Vertical movement
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    vsp = -move_speed;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    vsp = move_speed;
}

// Apply friction
hsp *= 0.95; // Horizontal friction
vsp *= 0.95; // Vertical friction

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

// State handling
switch(state)
{
    case "normal":
        // Detect if there is player movement input
        if (key_left || key_right || key_up || key_down) {
            isMoving = true;
        } else {
            isMoving = false;
        }

        // Change sprite and rotation based on movement
        if (isMoving) {
            sprite_index = sPlayerSpin;
            image_speed = 1;

            // Flip sprite based on horizontal movement direction
            if (hsp < 0) { // moving left
                image_xscale = -1;
            } else if (hsp > 0) { // moving right
                image_xscale = 1;
            }
        } else {
            sprite_index = sPlayer;
            image_speed = 0;
        }
        break;

    case "powered":
        // Powered state behaviors
        if (superArmor) {
            sprite_index = sPlayerPowerSpin;  // Assuming you want the powered-up version to also have a spin animation
        } else {
            sprite_index = sPlayerPower;
        }
        break;
}

// Horizontal boundaries
if (x < leftBoundary) {
    x = leftBoundary;
    if (object_index == oEnemy) {  // If it's the enemy, reverse direction
        direction = 1;
    }
}
if (x > rightBoundary) {
    x = rightBoundary;
    if (object_index == oEnemy) {  // If it's the enemy, reverse direction
        direction = -1;
    }
}

// Vertical boundaries (only necessary for oPlayer if it can move vertically)
if (y < topBoundary) {
    y = topBoundary;
}
if (y > bottomBoundary) {
    y = bottomBoundary;
}

// Check for collision with enemy
if(place_meeting(x, y, oEnemy) || place_meeting(x, y, oEnemy2) || place_meeting(x, y, oEnemy3)) {
    switch(state) {
        case "normal":
            // Player dies and level restarts
            instance_destroy(); // Destroys the player.
            room_restart();     // Restarts the current room.
            break;
        case "powered":
            // Player destroys the enemy
            instance_destroy(instance_place(x, y, oEnemy));
            break;
    }
}


