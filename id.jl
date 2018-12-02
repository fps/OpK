id4 = 
    [
        1 0 0 0;
        0 1 0 0;
        0 0 1 0;
        0 0 0 1
    ]

id3 =
    [
        1 0 0;
        0 1 0;
        0 0 1
    ]

function id(n)
    m = zeros(n,n)
    for n = 1:n
        m[n,n] = 1
    end
    
    return m
end
