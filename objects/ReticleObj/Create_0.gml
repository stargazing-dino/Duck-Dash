//I made a change!

chSpeed = 1/10
shooting = false;
cooldown = 60


function moveReticle() {
        if duckObj.x != x {x += (duckObj.x-x) * chSpeed}
        if duckObj.y != y {y += (duckObj.y-y) * chSpeed}
}

function targetPlayer() {
        chSpeed = 1/20
        image_index = 0

        if duckObj.x-x < 15 and duckObj.x-x > -15 and duckObj.y-y < 15 and duckObj.y-y > -15 {shooting = true; cooldown = 60}
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