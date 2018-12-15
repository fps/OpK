#function rotational(axis, x)
#    return (
#        q -> r(axis)(q[1]) * tr(x),
#        (4,4),
#        1,
#        "rotational joint with link"
#    )
#end
#
#function prismatic(axis)
#    return (
#        q -> q[1] * tr(axis),
#        (4,4),
#        1,
#        "prismatic joint with link"
#    )
#end

function rotational(axis, x)
    return q -> r(axis)(q[1]) * tr(x)
end
