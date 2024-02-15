% Function that plots the interpolating function with marked interpolation nodes
% x - interpolation nodes, p - interpolating function, f - interpolated function

function []=drawNewtonsPolynomial(p,f,x)
    xPlot = linspace(min(x), max(x), 100);
    yPlot = arrayfun(p, xPlot);

    figure;
    plot(xPlot, yPlot,'Color','#cc0000','LineWidth', 3);
    hold on;
    plot(xPlot, f(xPlot), 'Color', '#4fa0e4', 'LineWidth', 3);
    scatter(x, f(x), 'filled','MarkerFaceColor','#0072BD');
    yLim = ylim;
    plot([0 0], yLim, 'k--');
    xLim = xlim;
    plot(xLim, [0 0], 'k--');
    hold off;
    xlabel('x'); 
    ylabel('y');
    %title('Newtons Polynomial Interpolation');
    legend('Interpolating Function - p','Interpolated Function - f', 'Data Points','FontSize', 8, 'Location', 'southeast');
    grid on;
end