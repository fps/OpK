function rot_x33!(m, phi)
    c = cos(phi)
    s = sin(phi)
    
    m[1,1] = 1
    m[1,2] = 0
    m[1,3] = 0
    
    m[2,1] = 0
    m[2,2] = c
    m[2,3] = -s
    
    m[3,1] = 0
    m[3,2] = s
    m[3,3] = c
end

function rot_x44!(m, phi)
    rot_x33!(m, phi)
    
    m[4,1] = 0
    m[4,2] = 0
    m[4,3] = 0
    m[4,4] = 1
end

function rot_y33!(m, phi)
    c = cos(phi)
    s = sin(phi)
    
    m[1,1] = c
    m[1,2] = 0
    m[1,3] = s
    
    m[2,1] = 0
    m[2,2] = 1
    m[2,3] = 0
    
    m[3,1] = -s
    m[3,2] = 0
    m[3,3] = c
end

function rot_y44!(m, phi)
    rot_y33!(m, phi)
    
    m[4,1] = 0
    m[4,2] = 0
    m[4,3] = 0
    m[4,4] = 1
end

function rot_z33!(m, phi)
    c = cos(phi)
    s = sin(phi)
    
    m[1,1] = c
    m[1,2] = -s
    m[1,3] = 0
    
    m[2,1] = s
    m[2,2] = c
    m[2,3] = 0
    
    m[3,1] = 0
    m[3,2] = 0
    m[3,3] = 1
end

function rot_z44!(m, phi)
    rot_z33!(m, phi)
    
    m[4,1] = 0
    m[4,2] = 0
    m[4,3] = 0
    m[4,4] = 1
end

function rot_x33(phi)
    m = zeros(3,3)
    rot_x33!(m, phi)
    return m
end

function rot_y33(phi)
    m = zeros(3,3)
    rot_y33!(m, phi)
    return m
end

function rot_z33(phi)
    m = zeros(3,3)
    rot_z33!(m, phi)
    return m
end

function rot_x44(phi)
    m = zeros(4,4)
    rot_x44!(m, phi)
    return m
end

function rot_y44(phi)
    m = zeros(4,4)
    rot_y44!(m, phi)
    return m
end

function rot_z44(phi)
    m = zeros(4,4)
    rot_z44!(m, phi)
    return m
end
