/// @description Insert description here
// You can write your code in this editor
// Initialize variables in the Create Event
hsp = 0;
vsp = 0;
//accel = 2;  // Reduced for smoother acceleration
//friction = 0.1;
move_speed = 5;
// check for player movement
isMoving = false;

//Speed the player object rotates
rotation_speed = 5;

//Super Armor Variable
superArmor = false;

// control the state of the player
state = "normal";


//Set the boundaries
leftBoundary = 0;
rightBoundary = room_width;
topBoundary = 0;
bottomBoundary = room_height;

global.game_state = "playing";
global.game_state = "game_over";
// Create a variable in the Create Event of oPlayer
player_state = "alive";
death_alpha = 1;

alarm[0] = -1;  // Initialize the alarm to -1 (inactive)
alarm[1] = -1;
death_counter = -1; // -1 means the counter is not active
