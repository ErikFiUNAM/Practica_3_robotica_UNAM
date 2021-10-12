% Programa para la el cálculo de modelo
%dinámico del robot

%DEFINICION DE VARIABLES DE LA FUNCION
syms Tij(xij,yij,zij,gij,bij,aij)

%Tij(x_ij,y_ij,z_ij,gamma_ij,beta_ij,alpha_ij) = [cos(alpha_ij)*beta_ij cos(alpha_ij)*sin(beta_ij)*sin(gamma_ij)-sin(alpha_ij)*cos(gamma_ij) sin(alpha_ij)*sin(gamma_ij)+cos(alpha_ij)*sin(beta_ij)*cos(gamma_ij) x_ij;sin(alpha_ij)*cos(beta_ij) cos(alpha_ij)*cos(gamma_ij)+sin(alpha_ij)*sin(beta_ij)*sin(gamma_ij) sin(alpha_ij)*sin(beta_ij)*cos(gamma_ij)-cos(alpha_ij)*sin(gamma_ij) y_ij;-sin(beta_ij) cos(beta_ij)*sin(gamma_ij) cos(beta_ij)*sin(gamma_ij) z_ij;0 0 0 1];

Tij(xij,yij,zij,gij,bij,aij) = [cos(aij)*cos(bij) cos(aij)*sin(bij)*sin(gij)-sin(aij)*cos(gij) sin(aij)*sin(gij)+cos(aij)*sin(bij)*cos(gij) xij; sin(aij)*cos(bij) cos(aij)*cos(gij)+sin(aij)*sin(bij)*sin(gij) sin(aij)*sin(bij)*cos(gij)-cos(aij)*sin(gij) yij; -sin(bij) cos(bij)*sin(gij) cos(bij)*cos(gij) zij; 0 0 0 1];

Rij(gij,bij,aij) = [cos(aij)*cos(bij) cos(aij)*sin(bij)*sin(gij)-sin(aij)*cos(gij) sin(aij)*sin(gij)+cos(aij)*sin(bij)*cos(gij); sin(aij)*cos(bij) cos(aij)*cos(gij)+sin(aij)*sin(bij)*sin(gij) sin(aij)*sin(bij)*cos(gij)-cos(aij)*sin(gij); -sin(bij) cos(bij)*sin(gij) cos(bij)*cos(gij)];

%%%%%%Progagación de velocidades
%j=i+1

%Propagación de velocidades angulares
% syms wjj(Rji,wii,ejj,vthetaj)
% wjj(Rji,wii,ejj,vthetaj)= Rji*wii+ejj*vthetaj;

%Propagación de velocidades lineales
% syms vjj(Rji,vii,wii,pij)
% vjj(Rji,vii,wii,pij) = Rji*(vii+cross(wii,pij));

%%%%Cálculo de la energía cinética
syms ki(mi,vci,wi,Ici)

ki(mi,vci,wi,Ici)=(mi/2)*dot(vci,vci)+(1/2)*wi*Ici*wi;

%%Calculo de la energía potencia 
syms ui(mi,gvec,poci)
ui(mi,gvec,poci)= -mi*dot(gvec,poci);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cálculo del vector de las transformaciones

syms X01 y01 theta01 L1 theta12 L2 theta23 L3

T01 = Tij(X01,y01,0,0,0,theta01);
T12 = Tij(L1,0,0,0,0,theta12);
T23 = Tij(L2,0,0,0,0,theta23);
T3P = Tij(L3,0,0,0,0,0);

T0P = simplify(T01*T12*T23*T3P);

%Matrices de rotación 

R01 = Rij(0,0,theta01);
R12 = Rij(0,0,theta12);
R23 = Rij(0,0,theta23);
R3P = Rij(0,0,0);

%Matrices de rotación inversas
R10 = simplify(inv(R01));
R21 = simplify(inv(R12));
R32 = simplify(inv(R23));
Rp3 = simplify(inv(R3P));

%Cálculo de la propagación de velocidades

%%Del sisteama {0} al sistema {1}
syms vtheta01 x01 y01

w00 =[0;0;0]; %Vector de velocidad angular del sistema {0}
v00 =[0;0;0]; %Vector de velocidad lineal del sistema {0}
z11 =[0;0;1]; %vector asociado a la acción del actuador
p01 =[x01;y01;0];

w11 = R10*w00+z11*vtheta01;
v11= R10*(v00+cross(w00,p01));

%%Del sisteama {1} al sistema {2}
syms vtheta12 L1

z22 =[0;0;1]; %vector asociado a la acción del actuador
p12 =[L1;0;0];

w22 = R21*w11+z22*vtheta12;
v22 = R21*(v11+cross(w11,p12));


%%Del sisteama {2} al sistema {3}
syms vtheta23 L2

z33 =[0;0;1]; %vector asociado a la acción del actuador
p23 =[L2;0;0];

w33 = simplify(R32*w22+z33*vtheta23);
v33 = simplify(R32*(v22+cross(w22,p23)));


%%Del sisteama {3} al sistema {P}
syms vtheta23 L2

zpp =[0;0;1]; %vector asociado a la acción del actuador
p3P =[L3;0;0];

wpp = simplify(Rp3*w33+zpp*0);
vpp = simplify(Rp3*(v33+cross(w33,p3P)));


%%%%%%%%%%Cálculo de las energia potencia y energía cinética
%Velocidad lineal del centro de masa

%%%%%%Primer eslabón %%%%%%%%%% 
Rc11 = [1 0 0;0 1 0;0 0 1];
p1c1 = [L1/2;0;0];
v11 = [0;0;0];

vc1 = Rc11*(v11+cross(w11,p1c1));

%%%Matriz de inercia 
syms m1 h1 b1 L1 gravedad x01 y01 theta01

gvec =[0;-gravedad;0];
vc1 = [0;L1*vtheta01/2;0];
p0c1 = [x01+(L1/2)*cos(theta01);y01+(L1/2)*sin(theta01);0];

Ic1 = (m1/12)*[h1^2+b1^2 0 0;0 L1^2+b1^2 0;0 0 L1^2+h1^2];

k1 = simplify((m1/2)*dot(vc1,vc1)+(1/2)*dot(w11,Ic1*w11));

u1 = simplify(-m1*dot(gvec,p0c1));


%%%%%%Segundo eslabón%%%%%%%%%% 
Rc22 = [1 0 0;0 1 0;0 0 1];
p2c2 = [L2/2;0;0];

vc2 = Rc22*(v22+cross(w22,p2c2));

%%%Matriz de inercia 
syms m2 h2 b2 L2 

p0c2 = [x01+L1*cos(theta01)+(L2/2)*cos(theta01+theta12);y01+L1*sin(theta01)+(L2/2)*sin(theta01+theta12);0];

Ic2 = (m2/12)*[h2^2+b2^2 0 0;0 L2^2+b2^2 0;0 0 L2^2+h2^2];

k2 = simplify((m2/2)*dot(vc2,vc2)+(1/2)*dot(w22,Ic2*w22));

u2 = simplify(-m2*dot(gvec,p0c2));


%%%%%%Tercer eslabón%%%%%%%%%% 
Rc33 = [1 0 0;0 1 0;0 0 1];
p3c3 = [L3/2;0;0];

vc3 = Rc33*(v33+cross(w33,p3c3));

%%%Matriz de inercia 
syms m3 h3 b3 L3 

p0c3 = [x01+L1*cos(theta01)+L2*cos(theta01+theta12)+(L3/2)*cos(theta01+theta12+theta23);y01+L1*sin(theta01)+L2*sin(theta01+theta12)+(L3/2)*sin(theta01+theta12+theta23);0];

Ic3 = (m3/12)*[h3^2+b3^2 0 0;0 L3^3+b3^2 0;0 0 L3^2+h3^2];

k3 = simplify((m3/2)*dot(vc3,vc3)+(1/2)*dot(w33,Ic3*w33));

u3 = simplify(-m3*dot(gvec,p0c3));


%%%%%%%%%%%%%%%%%%%%
%%%%%Cálculo del Lagrangeno%%%%%%%%%%%

syms Lagrangeno

Lagrangeno = (k1+k2+k3)-(u1+u2+u3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%Cáculo de los pares del robot%%%%%%

syms atheta01 atheta12 atheta23

%%%%Primera junta
Dvtheta01 = diff(Lagrangeno,vtheta01);

Partheta01 = diff(Dvtheta01,theta01)*vtheta01+diff(Dvtheta01,theta12)*vtheta12+diff(Dvtheta01,theta23)*vtheta23+diff(Dvtheta01,vtheta01)*atheta01+diff(Dvtheta01,vtheta12)*atheta12+diff(Dvtheta01,vtheta23)*atheta23

%%%%Segunda junta
Dvtheta12 = diff(Lagrangeno,vtheta12);

Partheta12 = diff(Dvtheta12,theta01)*vtheta01+diff(Dvtheta12,theta12)*vtheta12+diff(Dvtheta12,theta23)*vtheta23+diff(Dvtheta12,vtheta01)*atheta01+diff(Dvtheta12,vtheta12)*atheta12+diff(Dvtheta12,vtheta23)*atheta23

%%%%Tercer junta
Dvtheta23 = diff(Lagrangeno,vtheta23);

Partheta23 = diff(Dvtheta23,theta01)*vtheta01+diff(Dvtheta23,theta12)*vtheta12+diff(Dvtheta23,theta23)*vtheta23+diff(Dvtheta23,vtheta01)*atheta01+diff(Dvtheta23,vtheta12)*atheta12+diff(Dvtheta23,vtheta23)*atheta23

