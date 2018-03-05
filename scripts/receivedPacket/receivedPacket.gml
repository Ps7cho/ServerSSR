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
	
	case networkEvents.shoot:
		with(objClient){
			if(client_id = client_id_current){
				shooting = buffer_read(buffer, buffer_bool);
				if shooting = true{
					pointx = buffer_read(buffer, buffer_u16);
					pointy = buffer_read(buffer, buffer_u16);
					
				}
			}
		}
	break;
	
	case networkEvents.building:
		
		var building = buffer_read(buffer, buffer_u8);
		var team = buffer_read(buffer, buffer_u8);
		x_pos = buffer_read(buffer, buffer_u16);
		y_pos = buffer_read(buffer, buffer_u16);
		
		//check if this point is avalible 
		var checkBuilding = scrBuildingPicker(building);
		Test = instance_create_layer(10,10,"Buildings",checkBuilding);
		with (Test){
			var space = !place_meeting(other.x_pos, other.y_pos,objBuildingParent);
		}

		// create if the space is free
		if space{
			thisTeam = scrObjTeam(team);
			if checkBuilding.BuildingCost <= thisTeam.Credits {
				var blding = instance_create_layer(x_pos,y_pos,"Buildings",checkBuilding);
				blding.Team = team;
				thisTeam.Credits -= blding.BuildingCost;
				var credit = thisTeam.Credits;
			
				buffer_seek(buffer, buffer_seek_start, 0);
				buffer_write(bufferSend, buffer_u8, networkEvents.building);
				buffer_write(bufferSend, buffer_u8, building); //Building type (building.Generic)
				buffer_write(bufferSend, buffer_u16, x_pos);
				buffer_write(bufferSend, buffer_u16, y_pos);
				buffer_write(bufferSend, buffer_u16, blding);
				buffer_write(bufferSend, buffer_s8, team);
				buffer_write(bufferSend, buffer_u16, credit);
				
				with(objClient){
					network_send_packet(self.socket_id, objServer.bufferSend, buffer_tell(objServer.bufferSend));
				}
			}
		}
		instance_destroy(Test);
	
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

	// disconnect 
	case networkEvents.disconnect: 

		
		
	break;
	
}