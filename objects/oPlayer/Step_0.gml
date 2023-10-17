/// @description Insert description here
// You can write your code in this editor
//Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);


//Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

if (place_meeting(x,y+1, oWall)) && (key_jump)
{
	vsp = -7;
		
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

// Change sprite and rotation based on movement
if (isMoving) {
	// Set the spinning sprite and rotation
	sprite_index = sPlayerSpin; // Replace with spinning sprite name
	image_angle += rotation_speed;
	
} else {
	// Set to idle sprite and reset rotation
	sprite_index = sPlayer; // replace with your idle sprite name
	image_angle = 0;
}