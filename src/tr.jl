function tr(x)
    @assert size(x) == (3,1)
    return [
        1 0 0 x[1]
        0 1 0 x[2]
        0 0 1 x[3]
        0 0 0 1
    ]
end
