/// @description 

move_speed = 600;

movement_inputs[0] = 0;
movement_inputs[1] = 0;
movement_inputs[2] = 0;
movement_inputs[3] = 0;

alarm[0] = 1;
alarm[1] = 3;

client_id = -1;
socket_id = -1;

shooting = false;
canShoot = true;
reloadRate = 21;
bulletSpeed = 4000;

Health = 100;

pointx = noone;
pointy = noone;

while !place_empty(x,y){
x++;
y++;
}