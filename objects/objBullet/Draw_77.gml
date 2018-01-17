/// @description collision

if (place_meeting(x,y,objWalls)) instance_destroy();

if (place_meeting(x,y,objClient)){
	/// @description Hit
	if ID = objClient.socket_id {
		objClient.Health -= 15;

		
		instance_destroy();
	
		

		buffer_seek(objServer.bufferSend, buffer_seek_start, 0);
		buffer_write(objServer.bufferSend, buffer_u8, networkEvents.hit);
		buffer_write(objServer.bufferSend, buffer_u16, client_id);
		buffer_write(objServer.bufferSend, buffer_u16, objClient.Health);
		
		with(objClient){
			network_send_packet(other.socket_id, objServer.bufferSend, buffer_tell(objServer.bufferSend));
		}
	}
}