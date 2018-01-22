/// @description Insert description here

var client = instance_place(x,y,objClient);
if (client != noone){
	/// @description Hit
	if ID != client.client_id {
		client.Health -= 15;

		instance_destroy();
		scrUpdateHealth(client);
	}
}