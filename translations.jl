function translation44!(m, p)
    m[1,1] = m[2,2] = m[3,3] = m[4,4] = 1
    m[1,2] = m[1,3] = 0
    m[1,4] = p[1]
    m[2,1] = m[2,3] = 0
    m[2,4] = p[2]
    m[3,1] = m[3,2] = 0
    m[3,4] = p[3]
    m[4,1] = m[4,2] = m[4,3] = 0
end

function translation44(p)
    m = zeros(4,4)
    translation44!(m, p)
    return m
end
