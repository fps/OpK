module OpK
    # elementary linear algebra stuff
    export rx
    export ry
    export rz
    export r
    export tr
    export refl
    export traverse
    export unit
    export id
    export cross
    
    # composite structures
    export rotational

    include("id.jl")
    include("len.jl")
    include("unit.jl")
    include("cross.jl")
    include("rot.jl")
    include("tr.jl")
    include("fk.jl")
    include("refl.jl")
    include("tree.jl")
    include("link.jl")
    include("chain.jl")
    
end
