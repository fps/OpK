function rx(phi)
    return [
        1 0 0 0;
        0 cos(phi[1]) -sin(phi[1]) 0
        0 sin(phi[1]) cos(phi[1]) 0
        0 0 0 1
    ]
end

function ry(phi)
    return [
        cos(phi[1]) 0 sin(phi[1]) 0
        0 1 0 0;
        -sin(phi[1]) 0 cos(phi[1]) 0
        0 0 0 1
    ]
end

function rz(phi)
    return [
        cos(phi[1]) -sin(phi[1]) 0 0
        sin(phi[1]) cos(phi[1]) 0 0
        0 0 1 0;
        0 0 0 1
    ]
end

