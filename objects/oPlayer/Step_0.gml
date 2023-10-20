/// @description Insert description here
// You can write your code in this editor
//Get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
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

// Change sprite and rotation based on movement TBD
