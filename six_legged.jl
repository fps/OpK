include("rot.jl")
include("tr.jl")
include("refl.jl")

function leg(femur_length, tibia_length)
    femur(q) = rz(q[1]) * ry(q[2]) * tr([femur_length 0 0])
    tibia(q) = ry(q[3]) * tr([tibia_length 0 0])
    return q -> vcat(
        hcat(femur(q),   zeros(4,4)),
        hcat(zeros(4,4), femur(q) * tibia(q))
    )
end

function leg_pair(femur_length, tibia_length)
    l = leg(femur_length, tibia_length)
    return q -> vcat(
        hcat(
            vcat(
                refl([1 0 0]') * l(q[1:3])[1:4,:], 
                refl([1 0 0]') * l(q[1:3])[5:8,:]
            ),
            zeros(8,8)
        ),
        hcat(zeros(8,8), l(q[4:6]))
    )
end

function six_legged(body_segment_lenght, femur_length, tibia_length)
    
end
