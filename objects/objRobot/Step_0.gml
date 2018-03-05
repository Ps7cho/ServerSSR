/// @description 

if Health <= 0{
	instance_destroy();
	scrDestroyBuilding(id);
}
var base = noone;

with (target){
	if 	self.Team = other.Team {
		var base = id;	
	}
}
if (base != noone){
	move_towards_point(base.x,base.y, Speed);
}else{
	move_towards_point(x,y,0);
}

if collision_point(x,y,objBase0,false,true){
	var team = scrObjTeam(Team);
	team.Credits += load;
	scrCredit(Team,team.Credits);
	scrRobot(0,0,Team,0, -1, id);
	instance_destroy();
}