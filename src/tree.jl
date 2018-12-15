
function traverse(p, t) 
    # println(p)
    return p * t; 
end

function traverse(p, t::Tuple) 
    # println(p)
    if length(t) == 0
        return ()
    end
    if t[1] isa Tuple 
        return map(t -> traverse(p, t), t) 
    else 
        return (p * t[1], traverse(p * t[1], t[2]))
    end 
end
