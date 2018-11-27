# Return a function that performs a forward
# kinematics pass on the function m that 
# describes the mechanism.
# p is a column vector of positions expressed
# in the frames of all the elements of m.
function fk(m, p)
    return q -> m(q) * p
end
