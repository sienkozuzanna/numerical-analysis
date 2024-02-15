% Function that transforms a matrix representing the diagonals of a pentadiagonal matrix
% into the corresponding pentadiagonal matrix

function B = convertToFiveDiagonal(A)
    if size(A,1) ~= 5
        error('Matrix A must have 5 rows representing the diagonals.')
    end
    n = size(A, 2);
    B = zeros(n, n);

    B = B + diag(A(3, :), 0); 
    B = B + diag(A(2, 1:n-1), 1);
    B = B + diag(A(4, 1:n-1), -1); 
    if n > 2
        B = B + diag(A(1, 1:n-2), 2);
        B = B + diag(A(5, 1:n-2), -2);
    end
end
