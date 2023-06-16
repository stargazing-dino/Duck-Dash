/// @description Insert description here
// You can write your code in this editor

if(duckObj.yprevious + duckObj.origin_height <= y +1){
	duckObj.y = y - 1 - duckObj.origin_height
	duckObj.vspeed = 0
	duckObj.grounded = true
	duckObj.flaps = duckObj.max_flaps
}