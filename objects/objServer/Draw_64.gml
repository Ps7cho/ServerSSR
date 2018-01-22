/// Draw server information
if(!global.debug) {exit;}

draw_text_ext_transformed_color(5, 35, "FPS = " + string(fps_real), 3, 300, 1, 1, 0, c_white, c_white, c_gray, c_gray, 1);
draw_text( 5, 5, "Server Status: "+ string( server >= 0 ) );
draw_text( 5, 20, "Total Clients: "+ string( ds_list_size(socketlist) ) );