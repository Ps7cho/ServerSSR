/// @description 

if Health <= 0{
	instance_destroy();
	scrDestroyBuilding(id);
}
var base = noone;
if target{
	with (target){
		if 	self.Team = other.Team {
			var base = id;	
		}
	}
}
if (base != noone){
	move_towards_point(base.x,base.y, Speed);
}else{
	move_towards_point(x,y,0);
}

if collision_point(x,y,target,false,true){
	var team = scrObjTeam(Team);
	if loadType = loadTypes.credits{
		team.Credits += load;
		scrCredit(Team,team.Credits);
	}else{
		target.load += load;
		//update any buidling information shown
	}
	scrRobot(0,0,Team,0, -1, id);
	instance_destroy();
}