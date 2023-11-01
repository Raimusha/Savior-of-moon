/// @description Insert description here
// You can write your code in this editor
// Get player input
// Get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Calculate Movement
var move_h = 0;
var move_v = 0;

if (key_left) {
    move_h -= 1;
}
if (key_right) {
    move_h += 1;
}
if (key_up) {
    move_v -= 1;
}
if (key_down) {
    move_v += 1;
}

// Apply movement speed
hsp = move_h * move_speed;
vsp = move_v * move_speed;

// Horizontal Collision
if (!place_meeting(x + hsp, y, oWall)) {
    x += hsp;
} else {
    while (!place_meeting(x + sign(hsp), y, oWall)) {
        x += sign(hsp);
    }
    hsp = 0;
}

// Vertical Collision
if (!place_meeting(x, y + vsp, oWall)) {
    y += vsp;
} else {
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y += sign(vsp);
    }
    vsp = 0;
}


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

// Check for collision with any enemy
var enemy = instance_place(x, y, oEnemyParent);
if (enemy != noone) {
    switch(state) {
        case "normal":
            // Player dies
            player_state = "dying";
            death_alpha = 1;
            
            // Set an alarm for 3 seconds (assuming your room speed is 60 fps)
            
  
            break;
        case "powered":
            // Player destroys the enemy
            audio_play_sound(sndEnemyDeath, 10, false);
            instance_destroy(enemy);
            break;
    }
}



if (place_meeting(x, y, oSpikes)) {
    if (state == "normal") {
       player_state = "dying";
     
    } else if (state == "powered") {
        // Player can move through spikes
        // You can add any additional powered-up behaviors here
    }
}

// Manage player death state

// Manage player death state
if (player_state == "dying") {
    if (alarm[1] == -1) { // Check if the alarm isn't already set
        alarm[1] = 60; // Set alarm 1 to trigger after 3 seconds
    }
	audio_play_sound(sndPlayerDeath, 3, false);
    death_alpha -= 0.02; // Adjust this value as needed to make the fade slower or faster
    image_alpha = death_alpha;
    
    if (death_alpha <= 0) {
        // At this point, the player has fully faded out, but we're waiting for the alarm to transition to the game over screen
        // You could potentially add a 'waiting' state here if needed.
    }
} else {
    // Other game logic...
}


if (place_meeting(x, y, oLever)) {
    audio_play_sound(sndPlayerVictory, 3, false);
    room_goto(rmTBD);  // Go to the next room
}



// Gameover state

if (global.game_state == "playing") {
    // Existing player movement and action code
} else if (global.game_state == "game_over") {
    hsp = 0;
    vsp = 0;
    
    // Wait for the player to press Enter to restart
    if (player_state == "dying") {
    // Existing code for the dying state...

    // Wait for the player to press Enter to restart
    if (keyboard_check_pressed(vk_enter)) {
        room_restart();  // Restart the current room
        global.game_state = "playing";  // Set the game state back to playing
        with (oGameOver) {
            visible = false;  // Hide the game over message
        }
        player_state = "alive";  // Reset the player state
        death_alpha = 1;  // Reset the death alpha if necessary
        image_alpha = 1;  // Reset the image alpha if necessary
    }
}

}

