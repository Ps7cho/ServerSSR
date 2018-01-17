/// @description Send Location 60

		buffer_seek(objServer.bufferSend, buffer_seek_start, 0);
		buffer_write(objServer.bufferSend, buffer_u8, networkEvents.position);
		buffer_write(objServer.bufferSend, buffer_u16, client_id);
		buffer_write(objServer.bufferSend, buffer_u16, x);
		buffer_write(objServer.bufferSend, buffer_u16, y);
		
		with(objClient){
			network_send_packet(self.socket_id, objServer.bufferSend, buffer_tell(objServer.bufferSend));
		}
		
		
	alarm[0] = 10;
	
