function len(x)
    @assert size(x,2) == 1
    return sqrt(x' * x)
end
