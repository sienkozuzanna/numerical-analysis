% Function generating an error matrix
% x - interpolation nodes, p - interpolating function, f - interpolated function

function [table] = generateNumericErrorMatrix(p,x,f)
    table=zeros(length(x),5);
    table(:,1)=x;
    table(:,2)=p(x);
    table(:,3)=f(x);
    table(:,4)=abs(p(x)-f(x));
    y_interp1 = interp1(x, f(x), x, 'linear');
    table(:, 5) = abs(y_interp1 - f(x));
    variableNames = {'x', 'p(x)', 'f(x)', 'Error','Error interp1'};
    table = array2table(table, 'VariableNames', variableNames);
end