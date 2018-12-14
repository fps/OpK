#function chain1(q)
#    return (
#        rotational([1 0 0]', [0 0 1]')(q[1]), 
#        rotational([1 0 0]', [0 0 1]')(q[2]), 
#        rotational([1 0 0]', [0 0 1]')(q[3]), 
#        rotational([1 0 0]', [0 0 1]')(q[4])
#    )
#end

function chain1(q)
    return [
        rotational([1 0 0]', [0 0 1]')(q[1]), 
        rotational([1 0 0]', [0 0 1]')(q[2]), 
        rotational([1 0 0]', [0 0 1]')(q[3]), 
        rotational([1 0 0]', [0 0 1]')(q[4])
    ]
end

function tree1()
    return [
        rotational([1 0 0]', [0 0 1]'), 
        rotational([1 0 0]', [0 0 1]'), 
        [
            rotational([1 0 0]', [0 0 1]'), 
            rotational([1 0 0]', [0 0 1]')
        ],
        [
            rotational([1 0 0]', [0 0 1]'), 
            rotational([1 0 0]', [0 0 1]')
        ]
    ]
end

simple_tree1 = (
    rotational([1 0 0]', [0 0 1]'), (
        rotational([1 0 0]', [0 0 1]'), (
            (
                rotational([1 0 0]', [0 0 1]'), (
                    rotational([1 0 0]', [0 0 1]'), ()
                )
            ), 
            (
                rotational([1 0 0]', [0 0 1]'), (
                    rotational([1 0 0]', [0 0 1]') , ()
                )
            )
        )
    )
)

function tree2()
    return (
        rotational([1 0 0]', [0 0 1]'), (
            rotational([1 0 0]', [0 0 1]'), (
                (
                    rotational([1 0 0]', [0 0 1]'), (
                        rotational([1 0 0]', [0 0 1]'),  
                    )
                ), 
                (
                    rotational([1 0 0]', [0 0 1]'), (
                        rotational([1 0 0]', [0 0 1]') , 
                    )
                )
            )
        )
    )
end

function partial_trees(a::Array{AbstractArray})
    println("aa");
end

function partial_trees(a::AbstractArray)
    println("a");
end

function partial_trees(a)
    ret = [];
    for index = 1:length(a)
        
    end
end

function partial_transforms(t, q)
    
end

show(partial_transforms(tree1, [0 0 0 0 0 0]))
println("")

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
        p -> sum(fk(c, p)),
        q
    )
end

