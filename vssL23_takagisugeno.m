function z=vssL23_takagisugeno(x,y)
%esta función usa sugeno
%deben modificarse los tipos de función y las reglas para establecer la
%lógica
%x entrada del universo de discurso
%y entrada del universo de discurso
%z salida, universo de discurso de salida, centro de area
%este programa usa producto como intersección y maximo como union


%% subconjuntos difusos (seccion modificable)
%conjunto A
%compuesto por cinco funciones de pertenencia
A=100;
funcionA={@pertTRAP @pertTRAP @pertTRAP @pertTRAP @pertTRAP};
parametrosA={A*[-1000 -3 -2 -1] A*[-2 -1 -1 -0] A*[-1 0 0 1] A*[0 1 1 2] A*[1 2 3 1000]};
%conjunto B
%compuesto por cinco funciones de pertenencia
B=10*A;
funcionB={@pertTRAP @pertTRAP @pertTRAP @pertTRAP @pertTRAP};
parametrosB={B*[-1000 -3 -2 -1] B*[-2 -1 -1 -0] B*[-1 0 0 1] B*[0 1 1 2] B*[1 2 3 1000]};


%% reglas (sección modificable
%si x pertenece a subconjuntoA y Y pertenece a subconjuntoB entonces
%Subconjunto C se traduce como
%regla(i)=[numero_subconjuntoA numero_subconjuntoB numero_subconjuntoC]
D=1;%10
PG= 3*D;PM=2*D;PP=1*D;C=0*D;NP=-1*D;NM=-2*D; NG=-3*D;
regla=[];
regla(1,:)=[1 5 C];
regla(2,:)=[1 4 PP];
regla(3,:)=[1 3 PM];
regla(4,:)=[1 2 PG];
regla(5,:)=[1 1 PG];
regla(6,:)=[2 5 NP];
regla(7,:)=[2 4 C];
regla(8,:)=[2 3 PP];
regla(9,:)=[2 2 PM];
regla(10,:)=[2 1 PG];
regla(11,:)=[3 5 NM];
regla(12,:)=[3 4 NP];
regla(13,:)=[3 3 C];
regla(14,:)=[3 2 PP];
regla(15,:)=[3 1 PM];
regla(16,:)=[4 5 NG];
regla(17,:)=[4 4 NM];
regla(18,:)=[4 3 NP];
regla(19,:)=[4 2 C];
regla(20,:)=[4 1 PP];
regla(21,:)=[5 5 NG];
regla(22,:)=[5 4 NG];
regla(23,:)=[5 3 NM];
regla(24,:)=[5 2 NP];
regla(25,:)=[5 1 C];

%% PARAMETROS A partir de aqui, nada es modificable
na=length(funcionA);%numero de subconjuntos de A
nb=length(funcionB);%numero de subconjuntos de B
nr=size(regla,1); %numero de reglas

%% PASO 1: Calcular las pertenencias de X y Y a A y B (no modificar)

%calcular la pertenencia de X a cada subconjunto de A
for i=1:na
    miuA(i)=feval(funcionA{i},x,parametrosA{i}(1),parametrosA{i}(2),parametrosA{i}(3),parametrosA{i}(4));
end
%calcular la pertenencia de Y a cada subconjunto de B
for i=1:nb
    miuB(i)=feval(funcionB{i},y,parametrosB{i}(1),parametrosB{i}(2),parametrosB{i}(3),parametrosB{i}(4));
end

%% PASO 2 Aplicar las reglas difusas (no modificar)

%prod intersección
for i=1:nr
    subconjA=regla(i,1);
    subconjB=regla(i,2);
    w(i)=(miuA(subconjA)*miuB(subconjB)); %antecedente
    Z(i)=regla(i,3); %consecuente
end

%% calcular la salida (no modificar)
if sum(w)==0
    z=0;
else
    z=(w*Z')/sum(w);
end

    
