/// @description Insert description here
// You can write your code in this editor

if (global.game_state == "game_over") {
    visible = true;  // Make the object visible when the game is over.
    
    if (keyboard_check_pressed(vk_enter)) {
        game_restart();  // Restart the game when Enter is pressed.
    }
} else {
    visible = false;  // Keep the object invisible when the game is not over.
}



