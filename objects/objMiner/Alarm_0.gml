/// @description 

cash += mineAmmount

cristal = instance_place(x,y,objCristal);
with (cristal){
	resourceAmmount -= other.mineAmmount;
}
if cristal{
	if cash >= MaxCash{
		robot = instance_create_layer(x,y, "Robots",objRobot);
		scrRobot(x,y,Team, 2, true, robot);
		robot.load = MaxCash;
		robot.Team = Team;
		robot.target = instance_nearest(robot.x,robot.y,scrBuildingPicker(2));
		robot.image_index = floor(point_direction(x,y,robot.target.x,robot.target.y)/22.5); 
		robot.loadType = loadType;
		cash -= MaxCash;
	}
	alarm_set(0,miningSpeed);
}