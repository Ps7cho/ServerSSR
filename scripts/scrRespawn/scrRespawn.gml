///respawn();

x = room_width/2;
y = room_height/2;


Health = 100;

scrUpdateHealth(self);

while !place_empty(x,y){
x++;
y++;
}