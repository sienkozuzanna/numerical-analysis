% Function takes the coefficients of the interpolating polynomial and interpolation nodes
% returns the interpolating function p

function [p] = generateNewtonsPolynomial(coefs,nodes)
    p = @(x) evaluatePolynomial(x, coefs, nodes);
end

function y = evaluatePolynomial(x, coefs, nodes)
    n = length(coefs);
    y = coefs(1);
    for i = 2:n
        term = coefs(i);
        for j = 1:(i-1)
            term = term.*(x - nodes(j));
        end
        y = y + term;
    end
end