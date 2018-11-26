function refl(x)
    return [
        1 0 0 0
        0 1 0 0
        0 0 1 0
        0 0 0 1
    ] - 2 * x * x'
end
