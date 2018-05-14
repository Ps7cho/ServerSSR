///server_handle_connect(socket_id);

var socket_id = argument0;
var team = scrTeamPicker();

var startx = team.x +250
var starty = team.y 

l = instance_create_layer(startx, starty, "Instances", objClient);
l.socket_id = socket_id;
l.client_id = client_id_counter++;
l.teamNumber = team.teamNumber;
l.Team = team.teamNumber;

if (client_id_counter >= 65000){
	client_id_counter = 0;
}

clientMap[? string(socket_id)] = l;

var client_id_current = clientMap[? string(socket_id)].client_id;



// tell each client to make this new player (even themselves)
	buffer_seek(bufferSend, buffer_seek_start, 0);
	buffer_write(bufferSend, buffer_u8, networkEvents.connect);
	buffer_write(bufferSend, buffer_u16, client_id_current);
	buffer_write(bufferSend, buffer_u16, startx);
	buffer_write(bufferSend, buffer_u16, starty);
	buffer_write(bufferSend, buffer_u8, team.teamNumber);
	buffer_write(bufferSend, buffer_u16, team.Credits);
	
	with(objClient){
		network_send_packet(self.socket_id, other.bufferSend, buffer_tell(other.bufferSend));
	}
	
	with objClient {
	scrUpdateHealth(id);	
	}
	
	
	//Build all the buildings
	if instance_exists(objBuildingParent){
		with (objBuildingParent){
			buffer_seek(other.bufferSend, buffer_seek_start, 0);
			buffer_write(other.bufferSend, buffer_u8, networkEvents.building);
			buffer_write(other.bufferSend, buffer_u8, buildingType); //Building type (building.Generic)
			buffer_write(other.bufferSend, buffer_u16, x);
			buffer_write(other.bufferSend, buffer_u16, y);
			buffer_write(other.bufferSend, buffer_u16, id);
			buffer_write(other.bufferSend, buffer_s8, Team);
			buffer_write(other.bufferSend, buffer_u16, team.Credits);
			
			network_send_packet(socket_id, other.bufferSend, buffer_tell(other.bufferSend));
		}
	}

	//Build all the Resources
	if instance_exists(objResourceParent){
		with (objResourceParent){
			buffer_seek(other.bufferSend, buffer_seek_start, 0);
			buffer_write(other.bufferSend, buffer_u8, networkEvents.building);
			buffer_write(other.bufferSend, buffer_u8, buildingType); //Building type (building.Generic)
			buffer_write(other.bufferSend, buffer_u16, x);
			buffer_write(other.bufferSend, buffer_u16, y);
			buffer_write(other.bufferSend, buffer_u16, id);
			buffer_write(other.bufferSend, buffer_s8, Team);
			buffer_write(other.bufferSend, buffer_u16, team.Credits);
			
			network_send_packet(socket_id, other.bufferSend, buffer_tell(other.bufferSend));
		}
	}
	
		//Build all the Resources
	if instance_exists(objWalls){
		with (objWalls){
			buffer_seek(other.bufferSend, buffer_seek_start, 0);
			buffer_write(other.bufferSend, buffer_u8, networkEvents.building);
			buffer_write(other.bufferSend, buffer_u8, buildingType); //Building type (building.Generic)
			buffer_write(other.bufferSend, buffer_u16, x);
			buffer_write(other.bufferSend, buffer_u16, y);
			buffer_write(other.bufferSend, buffer_u16, id);
			buffer_write(other.bufferSend, buffer_s8, Team);
			buffer_write(other.bufferSend, buffer_u16, team.Credits);
			
			network_send_packet(socket_id, other.bufferSend, buffer_tell(other.bufferSend));
		}
	}
	
		//Build all the Robots
	if instance_exists(objRobot){
		with (objRobot){
			scrRobot(x,y,Team,target, true, id);
		}
	}
	
	
