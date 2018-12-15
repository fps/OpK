function unit(x)
    @assert size(x,2) == 1
    return x ./ len(x)
end
