///receivedPacket(buffer, socketSelf);

var buffer = argument[0];
var socket_id = argument[1];
var msgid = buffer_read(buffer, buffer_u8),
client_id_current = clientMap[? string(socket_id)].client_id;

switch(msgid){ 
		//Ping
	case networkEvents.ping:
		var time = buffer_read(buffer, buffer_u32);
		
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(bufferSend, buffer_u8, networkEvents.ping);
		buffer_write(bufferSend, buffer_u32, time);
		network_send_packet(socket_id, bufferSend, buffer_tell(bufferSend));
	break;	
	
	// "a"
	case networkEvents.a: 
		with(objClient){
			if(client_id = client_id_current){
				movement_inputs[0] = buffer_read(buffer, buffer_bool);
			}
		}
	break;

	// "s"
	case networkEvents.s: 
		with(objClient){
			if(client_id = client_id_current){
				movement_inputs[1] = buffer_read(buffer, buffer_bool);
			}
		}
	break;
	
	// "d"
	case networkEvents.d: 
		with(objClient){
			if(client_id = client_id_current){
				movement_inputs[2] = buffer_read(buffer, buffer_bool);
			}
		}
	break;
	
	// "w"
	case networkEvents.w: 
		with(objClient){
			if(client_id = client_id_current){
				movement_inputs[3] = buffer_read(buffer, buffer_bool);
			}
		}
	break;
/*	
	//Projectiles
	case 3: 
		var 
		startx = buffer_read(buffer, buffer_u16),
		starty = buffer_read(buffer, buffer_u16),
		pointx = buffer_read(buffer, buffer_u16),
		pointy = buffer_read(buffer, buffer_u16);
		
		buffer_seek(bufferSend, buffer_seek_start, 0);
		buffer_write(bufferSend, buffer_u8, 3);
		buffer_write(bufferSend, buffer_u16, client_id_current);
		buffer_write(bufferSend, buffer_u16, startx);
		buffer_write(bufferSend, buffer_u16, starty);
		buffer_write(bufferSend, buffer_u16, pointx);
		buffer_write(bufferSend, buffer_u16, pointy);

		with(objClient){
			if(client_id != client_id_current){
				network_send_packet(self.socket_id, other.bufferSend, buffer_tell(other.bufferSend));
			}	
		}
		
		
	break;
	*/
	// disconnect 
	case networkEvents.disconnect: 

		
		
	break;
	
}