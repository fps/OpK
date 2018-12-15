function branch(l1, l2, ql1_size, ql2_size)
    br1_size = size(l1(zeros(ql1_size)))
    br2_size = size(l2(zeros(ql2_size)))
    
    return q -> vcat(
        hcat(l1(q[1:ql1_size]), zeros(br1_size)),
        hcat(zeros(br2_size), l2(q[ql1_size + 1:ql1_size + ql2_size]))
    )
end
