A=[1,5,2,0,0;3,1,6,5,0;87,22,38,11,7;4,6,13,2,0;1,2,7,0,0];
a=[234,80,190,301,107];
x0=[0,0,0,0,0];
x0Rand=randn(1,5);
xA=gaussSeidel(A,a,x0,10^-20,100)';
compare(A,convertToFiveDiagonal(A),a,x0,10^-16,1000)
compare(A,convertToFiveDiagonal(A),a,x0Rand,10^-16,1000)

%{
A=[1,1,1,0,0;2,2,2,2,0;11,12,13,14,15;2,2,2,2,0;1,1,1,0,0];
a=[1,1,1,1,1];
xA=gaussSeidel(A,a,[0,0,0,0,0],10^-20,100)';
compare(A,convertToFiveDiagonal(A),a,[0,0,0,0,0],10^-16,1000);
%}

%{
B=[1,1,1,1,1,1,1,1,1,0,0;1,1,1,1,1,1,1,1,1,1,0;10,10,10,10,10,10,10,10,10,10,10;1,1,1,1,1,1,1,1,1,1,0;1,1,1,1,1,1,1,1,1,0,0];
b=100*ones(11,1);
xB=gaussSeidel(B,b,zeros(11,1),10^-13,100)';
compare(B,convertToFiveDiagonal(B),b',ones(11,1)',10^-13,100)
%}

%{
C=[1,2,3,4,0,0;1,2,3,4,5,0;1,2,3,4,5,6;1,2,3,4,5,0;1,2,3,4,0,0];
c=[1,2,3,4,5,6];
xC=gaussSeidel(C,c',[0,0,0,0,0,0],10^-16,100)';
compare(C,convertToFiveDiagonal(C),c,[0,0,0,0,0,0],10^-16,100)
%}

%{
n = 100;
v = zeros(1, n);
v(2:2:end-2) = 1;
v(3:2:end-1) = -2;
v(end-1:end) = 0;
D(1,:)=v;
v = zeros(1, n);
v(1:2:end-2) = -3;
v(2:2:end-1) = 4;
v(end-1:end) = 0;
D(5,:)=v;
v = zeros(1, n);
v(1:2:end-2) = -5;
v(2:2:end-1) = 2;
v(end) = 0;
D(2,:)=v;
v = zeros(1, n);
v(1:2:end-2) = 4;
v(2:2:end-1) = -1;
v(end) = 0;
D(4,:)=v;
D(3,:)=100*ones(100,1);
d=zeros(100,1);
xD=gaussSeidel(D,d,ones(100,1),10^-16,100)';
compare(D,convertToFiveDiagonal(D),d',ones(100,1)',10^-20,100)
%}

%{
v1 = ones(1, 1000);
v2 = ones(1, 1000);
v1(end-1:end) = [0, 0]; 
v2(end) = 0;  
v3 = 5*ones(1,1000);
E=[v1;v2;v3;v2;v1];
e=ones(1000,1);
xE=gaussSeidel(E,e,zeros(1000,1),10^-16,1000)';
compare(E,convertToFiveDiagonal(E),e',ones(1000,1)',10^-22,1000)
%}












