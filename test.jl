function chain1(q)
    return (
        rotational([1 0 0]', [0 0 1]')(q[1]), 
        rotational([1 0 0]', [0 0 1]')(q[2]), 
        rotational([1 0 0]', [0 0 1]')(q[3]), 
        rotational([1 0 0]', [0 0 1]')(q[4])
    )
end

function chain1_fk(q)
    return sum(
        map(    
            v -> v * [0 0 0 1]', 
            map(
                u -> foldl(*, u), 
                    map(
                        r -> getindex(
                            chain1(q),
                            r
                        ), 
                        map(i -> 1:i, 1:4)
                    )
            )
        )
    )
end

function chain1_jacobian(q)
    return ForwardDiff.jacobian(
        p -> chain1_fk(p),
        q
    )
end


#ForwardDiff.jacobian(
#    q -> sum(
#        map(    
#            v -> v * [0 0 0 1]', 
#            map(
#                u -> foldl(*, u), 
#                    map(
#                        r -> getindex(
#                            (
#                                rotational([1 0 0]', [0 0 1]')(q[1]), 
#                                rotational([1 0 0]', [0 0 1]')(q[2]), 
#                                rotational([1 0 0]', [0 0 1]')(q[3]), 
#                                rotational([1 0 0]', [0 0 1]')(q[4])
#                            ),
#                            r
#                        ), 
#                        map(i -> 1:i, 1:4)
#                    )
#            )
#        )
#    ),
#    [0 0 0 0]
#)
#
