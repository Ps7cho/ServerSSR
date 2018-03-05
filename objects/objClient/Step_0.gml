/// @description 

var move_speed_this_frame = move_speed*global.seconds_passed;

var move_xinput = 0;
var move_yinput = 0;

for ( var i = 0; i < array_length_1d(movement_inputs); i++){
    var this_key = movement_inputs[i];
    if keyboard_check(this_key) {
        var this_angle = i*90;
        move_xinput += lengthdir_x(1, this_angle);
        move_yinput += lengthdir_y(1, this_angle);
    }
}
 
var moving = ( point_distance(0,0,move_xinput,move_yinput) > 0 );
if moving  {
    var move_dir = point_direction(0,0,move_xinput,move_yinput);
    move(move_speed_this_frame,  move_dir);
}

if Health <= 0 {
	scrRespawn();
}


		buffer_seek(objServer.bufferSend, buffer_seek_start, 0);
		buffer_write(objServer.bufferSend, buffer_u8, networkEvents.position);
		buffer_write(objServer.bufferSend, buffer_u16, client_id);
		buffer_write(objServer.bufferSend, buffer_u16, x);
		buffer_write(objServer.bufferSend, buffer_u16, y);
		
		
		collision_rectangle(x-1340,y-900,x+1340,y+900,objClient,0,false){
			network_send_packet(self.socket_id, objServer.bufferSend, buffer_tell(objServer.bufferSend));
		}
		