%{
%funkcja Rungego - dla 8,12,20 węzłów równoodległych
fRungego = @(x) 1./(1 + 12*(x.^2));
%xRungego = linspace(-1,1,8); %węzły równoodległe
%xRungego = ((2).*rand(20, 1) + -1)'; %węzły roznoodlegle
xRungego = chebyshevRoots(20); %węzły - pierwiastki wiel. Czebyszewa
yRungego=fRungego(xRungego);
coefs=coefsNewtonsPolynomial(xRungego,yRungego);
p=generateNewtonsPolynomial(coefs,xRungego);
drawNewtonsPolynomial(p,fRungego,xRungego);
generateNumericErrorMatrix(p,xRungego,fRungego);
max_error = calculateMaxInterpolationError(p, fRungego, min(xRungego),max(xRungego));
%}


%{
%funkcja Heavisidea
fHeaviside = @(x) double(x >= 0);
%xHeaviside = ((2).*rand(8, 1) + -1)'; %węzły roznoodlegle
%xHeaviside = linspace(-1,1,14);
xHeaviside = chebyshevRoots(10); %czebyszewa przeskalowane na [0,1]
yHeaviside = fHeaviside(xHeaviside);
coefsHeaviside = coefsNewtonsPolynomial(xHeaviside,yHeaviside);
pHeaviside = generateNewtonsPolynomial(coefsHeaviside,xHeaviside);
drawNewtonsPolynomial(pHeaviside,fHeaviside,xHeaviside);
max_error = calculateMaxInterpolationError(pHeaviside, fHeaviside, min(xHeaviside),max(xHeaviside));
%}

%{
fIrregular = @(x) sin(4*x) + 0.3*cos(12*x) + 0.5*sin(7*x);
xIrregular = 10.*chebyshevRoots(17);
yIrregular = fIrregular(xIrregular);
coefsIrregular = coefsNewtonsPolynomial(xIrregular, yIrregular);
pIrregular = generateNewtonsPolynomial(coefsIrregular, xIrregular);
drawNewtonsPolynomial(pIrregular,fIrregular, xIrregular);
max_error = calculateMaxInterpolationError(pIrregular, fIrregular,min(xIrregular),max(xIrregular))
generateNumericErrorMatrix(pIrregular,xIrregular,fIrregular)
%}


%{
fIrregular = @(x) (x < 0) .* sin(5* x) + (x >= 0) .* exp(-2 * x);
xIrregular = chebyshevRoots(48);
yIrregular = fIrregular(xIrregular);
coefsIrregular = coefsNewtonsPolynomial(xIrregular, yIrregular);
pIrregular = generateNewtonsPolynomial(coefsIrregular, xIrregular);
drawNewtonsPolynomial(pIrregular,fIrregular, xIrregular);
max_error = calculateMaxInterpolationError(pIrregular, fIrregular,min(xIrregular),max(xIrregular))
%}

%{
fIrregular = @(x)(1./(x));
xIrregular = chebyshevRoots(18);
yIrregular = fIrregular(xIrregular);
coefsIrregular = coefsNewtonsPolynomial(xIrregular, yIrregular);
pIrregular = generateNewtonsPolynomial(coefsIrregular, xIrregular);
drawNewtonsPolynomial(pIrregular,fIrregular, xIrregular);
max_error = calculateMaxInterpolationError(pIrregular, fIrregular,min(xIrregular),max(xIrregular))
generateNumericErrorMatrix(pIrregular,xIrregular,fIrregular)
%}

%{
f = @(x) 3*x.^8 - 5*x.^7 + 2*x.^6 + 4*x.^5 - 6*x.^4 + 2*x.^3 + 3*x.^2 - x + 5;
xPol = chebyshevRoots(14);
y = f(xPol);
coefs = coefsNewtonsPolynomial(xPol, y);
p = generateNewtonsPolynomial(coefs, xPol);
drawNewtonsPolynomial(p, f,xPol);
max_error=calculateMaxInterpolationError(p,f,min(xPol),max(xPol))
%}



