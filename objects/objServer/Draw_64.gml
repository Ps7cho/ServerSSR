/// Draw server information
draw_text( 5, 5, "Server Status: "+ string( server >= 0 ) );
draw_text( 5, 20, "Total Clients: "+ string( ds_list_size(socketlist) ) );