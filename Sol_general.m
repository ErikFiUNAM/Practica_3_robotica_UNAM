
waprox = [pi/2 -pi/2]; %Vector de proximación de la cofiguración

for i=1:length(t_sim)
    
  q_cal(i,:) = fsolve(@(q) postura(q,x3(i),y3(i)),waprox); %planteamiento del cálculo de la solución de la postura
    
   theta1_cal(i) =  q_cal(i,1); %Solición el ángulo Theta 1
   theta2_cal(i) =  q_cal(i,2); %Solición el ángulo Theta 2
   
   waprox = [theta1_cal(i) theta2_cal(i)]; %Vector de aproximación
    
end


%Cálculo del ángulo theta3

for i=1:length(t_sim)

theta3_cal(i) = thetap(i)-theta1_cal(i)-theta2_cal(i);%Cálculo del ángulo theta 3
    
end


%Parámetros del tiempo

t_total = 10; %s Tiempo total de la simulación
t_muestreo = 0.1; %s Incremento del tiempo para la simulación
t_sim = 0:t_muestreo:t_total; %arreglo del tiempo

%creación de la señal de salida para la simualción 
%de la planeación en el espacio de trabajo del robot
t = transpose(t_sim);

theta1_t = transpose(-theta1_cal); 
theta2_t = transpose(-theta2_cal);
theta3_t = transpose(-theta3_cal);

signal_theta1c = [t theta1_t];
signal_theta2c = [t theta2_t];
signal_theta3c = [t theta3_t];

%Fin del programa