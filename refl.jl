# https://en.wikipedia.org/wiki/Householder_transformation#Householder_matrix
# expects a column vector x (the normal vector 
# of the reflection plane)
function refl(x)
    @assert size(x) == (3,1)
    return vcat(
        hcat(id3 - 2 * x * x', [0 0 0]'),
        [0 0 0 1]
    )
end
