/// @description respawn_ crop
/// @arg grid_x
/// @arg grid_y
/// @arg crop_type
/// @arg days_old
function respawn_crop(){
var xx = argument0*cellSize;
var yy = argument1*cellSize;
//Create the instance 
var inst =instance_create_layer(xx+(cellSize/2), yy+(cellSize/2),"Instances", obj_crop);
ds_crops_instances[# argument0, argument1] = inst;
show_debug_message("Respawned a " +ds_crops_types);
// Give Crop its characteristics
	with(inst){
		cropType = argument2;
		daysOld= argument3;
		growthStageDuration = crops.ds_crops_types[# 0, cropType]

}}