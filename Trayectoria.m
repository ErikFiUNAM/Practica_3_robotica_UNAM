%Definición de trayectoria

%Posición y orientación inical

xp_inicial = 0.1;  %m
yp_inicial = 0.1;  %m
thetap_inicial = pi/2; %rad

%Posición y orientación final
xp_final =0.32;  %m
yp_final = -0.05;  %m
thetap_final = 0; %rad

%%Parametro
L3 = 0.06;  %m

%Trayectoria

t_total = 10; %s
t_muestreo = 0.1; %s
t_sim = 0:t_muestreo:t_total; %arreglo del tiempo

%Puntos de la trayectoria
xp = xp_inicial+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(xp_final-xp_inicial);
yp = yp_inicial+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(yp_final-yp_inicial);
thetap = thetap_inicial+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetap_final-thetap_inicial);

plot(xp,yp)
title('Trayectoria')
xlabel('x')
ylabel('y')

figure
plot(t_sim,thetap)

title('Orientación thetap')
xlabel('seg')
ylabel('rad')

%%%%%Cálculo de las xy del sistema 3

x3 = xp-L3*cos(thetap);
y3 = yp-L3*sin(thetap);

figure
plot(x3,y3)

title('Trayectoria del sistema {v}')
xlabel('x')
ylabel('y')

%%%Fin del diseño de trayectorias



