% Function takes horizontal vectors x and y - values of the interpolated function
% such that for i, j, i!=j, xi!=xj
% using Newton's interpolation method, it will return a vector of coefficients
% of the interpolating polynomial p

function [coefs] = coefsNewtonsPolynomial(x,fi)
    if ~isrow(x)
        error('x must be a row vector');
    end
    if ~isrow(fi)
       error('f(x) must return a row vector');
    end
    if length(x) ~= length(fi)
       error('The length of f(x) must be equal to the length of x');
    end
    n = length(x);
    A = zeros(n);
    A(:,1) = fi;

    for j = 2:n
        for i = 1:(n-j+1)
           A(i+j-1,j)=(A(i+j-1,j-1)-A(i+j-2,j-1))./(x(i+j-1) - x(i));
        end
    end
    coefs=diag(A);
end