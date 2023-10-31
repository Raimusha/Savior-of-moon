/// @description Insert description here
// You can write your code in this editor

// Step Event for oStartButton

timer += 1;  // Increment the timer each step.

if (timer >= blinkRate) {
    visible = !visible;  // Toggle visibility.
    timer = 0;  // Reset the timer.
}


if (keyboard_check_pressed(vk_enter)) {
    room_goto(Room1);  // Replace "rm_game" with the name of your game room.
}



