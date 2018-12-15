function chain(l1, l2)
    @assert l1[1][1] <= l1[1][1]
    @assert l1[1][2] <= l1[1][2]
    
    return (
        q -> vcat(
            hcat(l1[1](q[1:l1[3]]), zeros(l1[2][1], l2[2][2])),
            hcat(zeros(l1[2][1], l2[2][2]), repeat(l1[1](q[1:l1[3]]), 2, 2) * l2[1](q[l1[3]+1:l1[3]+l2[3]]))
        ),
        (l1[2][1] + l2[2][1], l1[2][2] + l2[2][2]),
        l1[3] + l2[3],
        "chain"
    )
end
