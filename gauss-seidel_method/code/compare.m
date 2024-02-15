% Function comparing results of the method for solving systems of equations Bx=b
% using Gauss-Seidel for pentadiagonal matrices,
% we take A - computer representation of the diagonals of matrix B,
% B - transformed computer representation of A into matrix B,
% b - vector of constants, x0 - initial approximation of the result,
% tolerance - the error for which the calculation is terminated,
% maxIterations - a constant that will ensure loop termination if 
% the result cannot be achieved within the given tolerance

function results = compare(A,B,b,x0,tolerance, maxIterations)
  
    tic;
    x_gaussSeidel = gaussSeidel(A, b, x0, tolerance, maxIterations);
    time_gaussSeidel = toc;
    error_gaussSeidel = norm(B*x_gaussSeidel' - b');

    tic;
    x_builtin = B \ b';
    time_builtin = toc;
    error_builtin = norm(B*x_builtin - b');

    result_error=norm(x_builtin-x_gaussSeidel);

    results = table([time_gaussSeidel; time_builtin], [error_gaussSeidel; error_builtin], [result_error; result_error], ...
                    'VariableNames', {'TimeInSeconds', 'Error', 'ComparisonError'}, ...
                    'RowNames', {'Gauss-Seidel', 'Built-in'});
end
