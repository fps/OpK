function chain1(q)
    return (
        rotational([1 0 0]', [0 0 1]')(q[1]), 
        rotational([1 0 0]', [0 0 1]')(q[2]), 
        rotational([1 0 0]', [0 0 1]')(q[3]), 
        rotational([1 0 0]', [0 0 1]')(q[4])
    )
end

function partial_ranges(r)
    return map(i -> 1:i, r)
end

function partial_chains(c, q)
    return map(
        u -> foldl(*, u), 
        map(
            r -> getindex(
                c(q),
                r
            ), 
            partial_ranges(1:4)
        )
    )
end

function fk(c, q)
    return map(    
        v -> v * [0 0 0 1]', 
        partial_chains(c,q)
    )
end

function positional_task(c, q)
    return sum(
        map(    
            v -> v * [0 0 0 1]', 
            partial_chains(c,q)
        )
    )
end

function jacobian(c, q)
    return ForwardDiff.jacobian(
        p -> fk(c, p),
        q
    )
end

