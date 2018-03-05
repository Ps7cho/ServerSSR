///scrCredit(team, credits);

var team = argument0;
var credit = argument1;

buffer_seek(objServer.bufferSend, buffer_seek_start, 0);
buffer_write(objServer.bufferSend, buffer_u8, networkEvents.credits);
buffer_write(objServer.bufferSend, buffer_s8, team);
buffer_write(objServer.bufferSend, buffer_u16, credit);

with(objClient){
	network_send_packet(self.socket_id,	objServer.bufferSend, buffer_tell(objServer.bufferSend));
}