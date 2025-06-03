/// movement

//check for ground
if (place_meeting(x, y+1, Obj_Solid))
    {
    vspd = 0;
    //jumping
    if (keyboard_check(vk_up))
        {
        vspd = -jspd;
        }
    }
else
{
//gravity
if (vspd < 10)
    {
    vspd += grav;
    }
}
// moving right
if (keyboard_check(vk_right))
    {
    hspd = spd;
    }
// moving left
if (keyboard_check(vk_left))
    {
    hspd = -spd;
    }
// check if not moving
if ((!keyboard_check(vk_right) && !keyboard_check(vk_left)) || (keyboard_check(vk_right) && keyboard_check(vk_left)))
    {
    hspd = 0;
    }
// Horizontal collision
if (place_meeting(x+hspd, y, Obj_Solid))
    {
    while (!place_meeting(x+sign(hspd), y, Obj_Solid))
    x += sign(hspd);
    }
//move horizontally
x += hspd;
// vertical collision
if (place_meeting(x, y+vspd, Obj_Solid))
    {
    while (!place_meeting(x, y+sign(vspd), Obj_Solid))
    y += sign(vspd);
    }
//move vertically
y += vspd;

attack_cooldown +=1;
if(attack_cooldown >=20 && mouse_check_button(mb_left)){
    bullet = instance_create_layer(x+8,y-16, "Inst_Projectile", Obj_bullet);
    bullet.speed = 13;
	bullet.image_xscale = .5;
	bullet.image_yscale = .5;
    bullet.direction= point_direction(x+33,y+8, mouse_x, mouse_y);
    bullet.image_angle = bullet.direction;
    attack_cooldown =0;
}