//I made a change!

chSpeed = 1/10
shooting = false;
cooldown = 60


function moveReticle() {
        if mouse_x != x {x += (mouse_x-x) * chSpeed}
        if mouse_y != y {y += (mouse_y-y) * chSpeed}
}

function targetPlayer() {
        chSpeed = 1/20
        image_index = 0

        if mouse_x-x < 10 and mouse_x-x > -10 and mouse_y-y < 10 and mouse_y-y > -10 {shooting = true; cooldown = 60}
}

function fire() {
    chSpeed = 1/40
    image_index = 1
    cooldown -= 1
    if cooldown == 0 {cooldown = -60}
    else if cooldown == 1 instance_create_layer(x, y, "Instances", bangEffectObj)
}

function reload() {
    chSpeed = 0;
    if cooldown == 0 shooting = false
    else cooldown += 1
}