function dx=IntegracionAutomovil(t,x)
%-----Definicion de los parametros-----%
m1=290;   %automovil
b1=1000;  %amortiguador
m2=59;    %rueda
k1=16182; %suspension
f=0;      
k2=19000; %llanta
z=0.05*sin(0.5*pi*t);
%z=0.05*sin(20*pi*t);
%--------------------------------------%
dx = zeros(4,1);
%-----Definicion de las matrices-----%
M=[m1 0; 0 m2];
B=[b1 -b1;-b1 b1];
K=[k1 -k1;-k1 (k1+k2)];
L=[-1 0; 1 -k2];
U=[f; z];
%-----Definicion de la dinamica del sistema-----%
dx(1) = x(3);
dx(2) = x(4);
dx(3:4)=M\(-B*[x(3); x(4)]-(K*[x(1);x(2)])-(L*U));

%--------------------------------------%