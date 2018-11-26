function simple_robot1(q::Number)
    p = [0 0 0 1]'
    p2 = translation44([1 0 0]) * p
    p3 = rot_y44(q) * p2
    return 
end

function diff_test(q::Number)
    return q+1.0
end

f(q::Number) = 1+q

function two_armed_robot(q)
    arm1 = rot_y44(q[1]) * translation44([1.0 0 0]')
    arm2 = rot_y44(q[2]) * translation44([1.0 0 0]')
    return vcat(arm1, arm2)
end

function end_effector_positions(f,q)
    return f(q) * [0 0 0 1]'
end
