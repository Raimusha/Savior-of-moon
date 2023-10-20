/// @description Insert description here
// You can write your code in this editor
//Get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);


//Calculate Movement
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

// Apply the speeds to the player's position
x += hsp;
y += vsp;

// Apply friction
hsp *= 0.95; // Horizontal friction
vsp *= 0.95; // Vertical friction





if (place_meeting(x,y+1, oWall)) && (key_jump)
{
	vsp = 0;
		
}

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;


//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Detect if there is player movement input
if (keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_down)) {
	isMoving = true;	
} else {
	isMoving = false;
}

// Change sprite and rotation based on movement TBD
