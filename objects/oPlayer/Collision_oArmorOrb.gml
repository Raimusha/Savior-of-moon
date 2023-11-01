// Give player the power-up
state = "powered";   // switch to powered state
superArmor = true;
audio_play_sound(sndPowerArmor, 3, false);

// Destroy the oArmorOrb
instance_destroy(other);  // "other" refers to the oArmorOrb in this collision event

// Set a timer for the power-up's duration (3 seconds = 180 frames at 60fps)
alarm[0] = 180;  // We'll use alarm[0] for this, but you can use any available alarm
