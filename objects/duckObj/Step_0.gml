//horizontal movement

if(keyboard_check(vk_left)){
	
	m_speed_current -= m_speed
	
	if(m_speed_current < -m_max_speed)
		m_speed_current = -m_max_speed
	image_xscale = test_scale
}
else{
	if(m_speed_current < 0)
		m_speed_current += m_speed
}

if(keyboard_check(vk_right)){
	
	m_speed_current += m_speed
	
	if(m_speed_current > m_max_speed)
		m_speed_current = m_max_speed
	image_xscale = -test_scale
}
else{
	if(m_speed_current > 0)
		m_speed_current -= m_speed
}

x += m_speed_current * scale

if(x < 30)
	x = 30
if(x > room_width - 30)
	x = room_width -30

if(coyote_time > 0)
	coyote_time -=1

if(grounded){
	if(collision_line( x-20*test_scale, y+origin_height+1, x+20*test_scale,y+origin_height+1,platform,0,0) < 0){
		grounded = false
		coyote_time = 10
	}
}
	

//vertical movement
if(keyboard_check_pressed(vk_space)){
	if(grounded || (coyote_time > 0)){
		grounded = false
		vspeed = jump_speed
		audio_play_sound(duck_quacks[irandom_range(0, array_length_1d(duck_quacks) - 1)], 1, false);
	}
	else{
		if(flaps > 0){
			flaps -= 1
			vspeed = flap_speed
			flap_state = true
			alarm[0] = flap_time
			audio_play_sound(duck_quacks[irandom_range(0, array_length_1d(duck_quacks) - 1)], 1, false);
		}
	}
}

if(!grounded){
		vspeed += player_gravity
		if(vspeed > max_fall_speed)
			vspeed = max_fall_speed
}

//animations
if(flap_state){
	sprite_index = duckFallSprt
}
else{
	if(grounded){
		if(!keyboard_check(vk_right) && !keyboard_check(vk_left)){
			sprite_index = duckIdleSprt
        }
		else{
			sprite_index = duckRunSprt
            if (!audio_is_playing(duck_walking)) {
                audio_play_sound(duck_walking, 1, false);
            }
        }
	}
	else{
		if(vspeed < -1)
			sprite_index = duckJumpSprt
		else
			sprite_index = duckFallSprt
	}
}