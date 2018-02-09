/// @description Insert description here

var client = instance_place(x,y,objClient);
if (client != noone){
	/// @description Hit
	if ID != client.client_id {
		client.Health -= 15;

		instance_destroy();
		scrUpdateHealth(client);
		scrDestroyBullet(id);
	}
}

var building = instance_position(x,y, objBuildingParent);
if building != noone{
	building.Health -= 15;
	
	instance_destroy();
	//scrUpdateHealth(client); need to update building health on all the clients
	scrDestroyBullet(id);
	
}