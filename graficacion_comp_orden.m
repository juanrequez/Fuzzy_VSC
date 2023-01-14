%graficación
%% inicio
clc
clear
close all
%% parametros comparación de orden y PI
KdL2=1;
LambdaL2=5;
KuL2=1;

KdX2=2;
LambdaX2=2;
KuX2=1;

KdP2=18;
LambdaP2=1;
KuP2=1;
%% simulación
sim('proyecto4_vss_orden1');
sim('proyecto4_vss_orden2');
sim('proyecto4_vss_orden3');
%% descomposición de los vectores
%obtener el vector de tiempo
timeo1=closeloop_X2_orden1.time;
timeo2=closeloop_X2_orden2.time;
timeo3=closeloop_X2_orden3.time;

%extraer los valores de las estructuras
L2o1=closeloop_L2_orden1.signals(1,:).values;
X2o1=closeloop_X2_orden1.signals(1,:).values;
P2o1=closeloop_P2_orden1.signals(1,:).values;

L2o2=closeloop_L2_orden2.signals(1,:).values;
X2o2=closeloop_X2_orden2.signals(1,:).values;
P2o2=closeloop_P2_orden2.signals(1,:).values;

L2o3=closeloop_L2_orden3.signals(1,:).values;
X2o3=closeloop_X2_orden3.signals(1,:).values;
P2o3=closeloop_P2_orden3.signals(1,:).values;

%% comparación entre ordenes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

figure
plot(timeo1,L2o1(:,1),'k',timeo2,L2o2(:,1),'k--.',timeo3,L2o3(:,1),'k--o');
%title('L2');
xlabel('tiempo, min');
ylabel('nivel normalizado');
grid
legend('VSC primer orden','VSC segundo orden','VSC tercer orden','location','best');

figure
plot(timeo1,X2o1(:,1),'k',timeo2,X2o2(:,1),'k--.',timeo3,X2o3(:,1),'k--o');
%title('L2');
xlabel('tiempo, min');
ylabel('concentración normalizada');
grid
legend('VSC primer orden','VSC segundo orden','VSC tercer orden','location','best');

figure
plot(timeo1,P2o1(:,1),'k',timeo2,P2o2(:,1),'k--.',timeo3,P2o3(:,1),'k--o');
%title('L2');
xlabel('tiempo, min');
ylabel('Presión normalizada');
grid
legend('VSC primer orden','VSC segundo orden','VSC tercer orden','location','best');
