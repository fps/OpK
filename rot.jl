# https://en.wikipedia.org/wiki/Rotation_matrix
function rx(phi)
    return [
        1 0 0 0;
        0 cos(phi[1]) -sin(phi[1]) 0;
        0 sin(phi[1]) cos(phi[1]) 0;
        0 0 0 1
    ]
end

function ry(phi)
    return [
        cos(phi[1]) 0 sin(phi[1]) 0;
        0 1 0 0;
        -sin(phi[1]) 0 cos(phi[1]) 0;
        0 0 0 1
    ]
end

function rz(phi)
    return [
        cos(phi[1]) -sin(phi[1]) 0 0;
        sin(phi[1]) cos(phi[1]) 0 0;
        0 0 1 0;
        0 0 0 1
    ]
end

# rotation around column vector axis
# https://en.wikipedia.org/wiki/Rotation_matrix#Conversion_from_and_to_axis%E2%80%93angle
function r(axis)
    @assert size(axis) == (3,1)
    a = unit(axis)
    return q -> vcat(
        hcat(
            cos(q) * id3 + sin(q) * cross(a) + (1 - cos(q)) * (a * a'), 
            [0 0 0]'
        ),
        [0 0 0 1]
    )
end
