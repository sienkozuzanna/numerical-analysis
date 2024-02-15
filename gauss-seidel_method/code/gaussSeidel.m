% Function calculating the solution of the system of equations Bx=b, where B is a
% pentadiagonal matrix
% we take A - computer representation of the diagonals of matrix B,
% b - vector of constants, x0 - initial approximation of the result,
% tolerance - the error for which the calculation is terminated,
% maxIterations - a constant that will ensure loop termination if 
% the result cannot be achieved within the given tolerance

function x = gaussSeidel(A, b, x0, tolerance, maxIterations)
    if size(A,1) ~= 5
        error('Matrix A must have 5 rows representing the diagonals.');
    end
    if length(b) ~= size(A,2)
        error('The length of vector b must match the number of columns in A.');
    end
    if length(x0) ~= size(A,2)
        error('Initial guess x0 must be the same size as the number of columns in A.');
    end
    if tolerance <= 0
        error('Tolerance must be a positive number.');
    end
    if maxIterations <= 0
        error('maxIterations must be a positive number.');
    end

    n = length(b);
    x = x0;
    for k = 1:maxIterations
        x_old = x;
        for i = 1:n
            sum1 = 0;
            sum2 = 0;

            %dla j<i używamy aktualnego x
            if i > 1
                sum1 = sum1 + A(4, i - 1) * x(i - 1);
            end
            if i > 2
                sum1 = sum1 + A(5, i - 2) * x(i - 2);
            end
            
            %dla j>i używamy x z poprzedniej iteracji x_old
            if i < n
                sum2 = sum2 + A(2, i) * x_old(i + 1);
            end
            if i < n - 1
                sum2 = sum2 + A(1, i) * x_old(i + 2);
            end
            x(i) = (b(i) - sum1 - sum2) / A(3, i);
        end

        if norm(x - x_old) < tolerance
            break;
        end
    end
end
