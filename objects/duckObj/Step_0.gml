/// @description Insert description here
// You can write your code in this editor

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

if(coyote_time > 0)
	coyote_time -=1

if(grounded){
	if(collision_line( x-213*test_scale, y+origin_height+1, x+213*test_scale,y+origin_height+1,platform,0,0) < 0){
		grounded = false
		coyote_time = 10
	}
}
	

//vertical movement
if(keyboard_check_pressed(vk_space)){
	if(grounded || (coyote_time > 0)){
		grounded = false
		vspeed = jump_speed
	}
	else{
		if(flaps > 0){
			flaps -= 1
			vspeed = flap_speed
			flap_state = true
			alarm[0] = flap_time
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
		if(!keyboard_check(vk_right) && !keyboard_check(vk_left))
			sprite_index = duckIdleSprt
		else
			sprite_index = duckRunSprt
	}
	else{
		if(vspeed < -1)
			sprite_index = duckJumpSprt
		else
			sprite_index = duckFallSprt
	}
}