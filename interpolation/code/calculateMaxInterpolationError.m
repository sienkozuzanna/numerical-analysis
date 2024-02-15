% Function to find the maximum interpolation error value
% f - the function being interpolated, p - the interpolating function,
% a, b - the limits of the interval over which we are looking for the maximum error

function maxError = calculateMaxInterpolationError(f, p, a, b)
    xDense = linspace(a, b, 10000);
    errorValues = abs(f(xDense) - p(xDense));
    maxError = max(errorValues);
end
