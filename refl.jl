# expects a column vector x (the normal vector 
# of the reflection plane) with the 
# fourth component being 0
function refl(x)
    return [
        1 0 0 0
        0 1 0 0
        0 0 1 0
        0 0 0 1
    ] - 2 * x * x'
end
