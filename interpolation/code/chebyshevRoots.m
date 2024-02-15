% Function returning a vector of n roots of the Chebyshev polynomial

function roots = chebyshevRoots(n)
    k = 0:n-1;
    roots = cos(pi * (2*k + 1) / (2*n));
end