/// Draw server information
if(!global.debug) {exit;}

draw_text_ext_transformed_color(5, 35, "FPS = " + string(fps_real), 3, 300, 1, 1, 0, c_white, c_white, c_gray, c_gray, 1);
draw_text( 5, 5, "Server Status: "+ string( server >= 0 ) );
draw_text( 5, 20, "Total Clients: "+ string( ds_list_size(socketlist) ) );


var credits = objTeam1.Credits;	
	
draw_text( 5, 15+50, "Team1 Credits: "+ string( credits ) );

var credits = objTeam2.Credits;	
	
draw_text( 5, 30+50, "Team2 Credits: "+ string( credits ) );