///server_handle_connect(socket_id);

var socket_id = argument0;

var startx = room_width/2;
var starty = room_height/2;


l = instance_create_layer(startx, starty, "Instances", objClient);
l.socket_id = socket_id;
l.client_id = client_id_counter++;

if (client_id_counter >= 65000){
	client_id_counter = 0;
}

clientMap[? string(socket_id)] = l;

var client_id_current = clientMap[? string(socket_id)].client_id;


// tell each client to make this new player (even themself)
	buffer_seek(bufferSend, buffer_seek_start, 0);
	buffer_write(bufferSend, buffer_u8, networkEvents.connect);
	buffer_write(bufferSend, buffer_u16, client_id_current);
	buffer_write(bufferSend, buffer_u16, startx);
	buffer_write(bufferSend, buffer_u16, starty);
	with(objClient){
		network_send_packet(self.socket_id, other.bufferSend, buffer_tell(other.bufferSend));
	}
	
	with objClient {
	scrUpdateHealth(id);	
	}