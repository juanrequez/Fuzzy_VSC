close all

A=1;%0.7
funcionA={['pertTRAP'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRAP']};
parametrosA={A*[-1000 -3 -2 -1] A*[-2 -1 -0] A*[-1 0 1] A*[0 1 2] A*[1 2 3 1000]};
%conjunto B
%compuesto por cinco funciones de pertenencia
B=A;
funcionB={['pertTRAP'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRAP']};
parametrosB={B*[-1000 -3 -2 -1] B*[-2 -1 -0] B*[-1 0 1] B*[0 1 2] B*[1 2 3 1000]};

na=length(funcionA);%numero de subconjuntos de A
nb=length(funcionB);%numero de subconjuntos de B

figure
hold
for i=1:na
    graficador(funcionA{i},parametrosA{i},[-3*A,3*A])
end
axis([-3*A 3*A 0 1.2]);
text(-2*A,1.1,'MN');
text(-1*A,1.1,'N');
text(0*A,1.1,'C');
text(1*A,1.1,'P');
text(2*A,1.1,'MP');
grid
xlabel('error')
ylabel('pertenencia')

figure
hold
for i=1:nb
    graficador(funcionB{i},parametrosB{i},[-3*B,3*B])
end
axis([-3*B 3*B 0 1.2]);
text(-2*B,1.1,'MN');
text(-1*B,1.1,'N');
text(0*B,1.1,'C');
text(1*B,1.1,'P');
text(2*B,1.1,'MP');
grid
xlabel('cambio del error')
ylabel('pertenencia')


x=linspace(-3*A,3*A,30);
y=linspace(-3*B,3*B,30);


zs=[];
for i=1:length(x);
    for j=1:length(y);
        %superficie sugeno 
        zs(i,j)=vssX2_takagisugeno(x(i),y(j));
    end
end

figure
mesh(x,y,zs)
axis([-3*A 3*A -3*B 3*B min(min(zs)) max(max(zs))]);
colormap(gray.^2/2)
xlabel('error')
ylabel('cambio del error')
zlabel('salida del controlador VSC')
title('controlador VSC para X2')

lambda=5;
xgraph=lambda*x+y;

for i=1:length(x)
    ygraph(i)=vssL2_takagisugeno(x(i),y(i));
end
figure
plot(xgraph,ygraph,'k')
xlabel('E+R')
ylabel('S')
title('Reglas VSC para X2')
grid