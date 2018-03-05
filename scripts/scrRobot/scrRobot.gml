///scrRobot(x,y,Team,target,create,ID);
var xx = argument0;
var yy = argument1;
var team = argument2;
var target = argument3;
var create = argument4;
var ID = argument5;

buffer_seek(objServer.bufferSend, buffer_seek_start, 0);
buffer_write(objServer.bufferSend, buffer_u8, networkEvents.robot);
buffer_write(objServer.bufferSend, buffer_u16, xx);
buffer_write(objServer.bufferSend, buffer_u16, yy);
buffer_write(objServer.bufferSend, buffer_s8, team);
buffer_write(objServer.bufferSend, buffer_s8, target);
buffer_write(objServer.bufferSend, buffer_u16, ID);
buffer_write(objServer.bufferSend, buffer_s8, create);
		

with(objClient){
	network_send_packet(self.socket_id,	objServer.bufferSend, buffer_tell(objServer.bufferSend));
}