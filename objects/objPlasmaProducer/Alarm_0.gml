/// @description 

cash += mineAmmount

if cash >= MaxCash{
	robot = instance_create_layer(x,y, "Robots",objRobot);
	scrRobot(x,y,Team, targetType, true, robot);
	robot.load = MaxCash;
	robot.Team = Team;
	robot.target = scrBuildingPicker(targetType);
	robot.loadType = loadType;
	cash -= MaxCash;
}

alarm[0] = miningSpeed;