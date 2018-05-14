/// create the server

//Networking
	var 
	type = network_socket_tcp,
	port = 6112,
	maxClients = 32;
	server = 0;

	server = network_create_server(type, port, maxClients);
	client_id_counter = 0;

	var 
	size = 256,
	type = buffer_fixed,
	alignment = 1;
	bufferSend = buffer_create(size, type, alignment);
	bufferLarge = buffer_create(1024, type, alignment);

//Backend 
	socketlist = ds_list_create();
	clientMap = ds_map_create();

//Globals
global.debug = true;

//Game Variables
turn = true;

enum networkEvents {
	ping,
	input,
	shoot,
	hit,
	bullet,
	position,
	building,
	buildingDestroy,
	robot,
	credits,
	connect,
	disconnect
}

enum loadTypes {
	credits,
	plasma
	
}

enum buildings {
	objBase0,
	objMiner,
	objPlasmaProducer,
	objPlasmaSupply
	
	
		
}
