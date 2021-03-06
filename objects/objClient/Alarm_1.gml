/// @description Shooting

if shooting{
	if reloadRate <= 0 {
		reloadRate = 21;
		var move_speed_this_frame = bulletSpeed*global.seconds_passed;
		var slug = instance_create_layer(x+(sprite_width/2), y+(sprite_height/2), "Bullets",objBullet);	
		slug.Team = Team;
		with slug{
			ID = other.client_id;
			image_angle = point_direction(x, y, other.pointx, other.pointy);
			move_towards_point(other.pointx,other.pointy,move_speed_this_frame)
			}
			
		buffer_seek(objServer.bufferSend, buffer_seek_start, 0);
		buffer_write(objServer.bufferSend, buffer_u8, networkEvents.shoot);
		buffer_write(objServer.bufferSend, buffer_u16, client_id);
		buffer_write(objServer.bufferSend, buffer_u16, x+(sprite_width/2));
		buffer_write(objServer.bufferSend, buffer_u16, y+(sprite_height/2));
		buffer_write(objServer.bufferSend, buffer_u16, pointx);
		buffer_write(objServer.bufferSend, buffer_u16, pointy);
		buffer_write(objServer.bufferSend, buffer_u16, slug);
		
		with(objClient){
			network_send_packet(self.socket_id, objServer.bufferSend, buffer_tell(objServer.bufferSend));
		}
			
	}
}

reloadRate = reloadRate - 3;
alarm[1] = 3;