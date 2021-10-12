%Programa para programar las transformaciones de un robot serial 3R en el
%espacio, mediante transformaciones homogeneas
%Para ello s

syms Tij(xij,yij,zij,gij,bij,aij)

%Tij(x_ij,y_ij,z_ij,gamma_ij,beta_ij,alpha_ij) = [cos(alpha_ij)*beta_ij cos(alpha_ij)*sin(beta_ij)*sin(gamma_ij)-sin(alpha_ij)*cos(gamma_ij) sin(alpha_ij)*sin(gamma_ij)+cos(alpha_ij)*sin(beta_ij)*cos(gamma_ij) x_ij;sin(alpha_ij)*cos(beta_ij) cos(alpha_ij)*cos(gamma_ij)+sin(alpha_ij)*sin(beta_ij)*sin(gamma_ij) sin(alpha_ij)*sin(beta_ij)*cos(gamma_ij)-cos(alpha_ij)*sin(gamma_ij) y_ij;-sin(beta_ij) cos(beta_ij)*sin(gamma_ij) cos(beta_ij)*sin(gamma_ij) z_ij;0 0 0 1];

Tij(xij,yij,zij,gij,bij,aij) = [cos(aij)*cos(bij) cos(aij)*sin(bij)*sin(gij)-sin(aij)*cos(gij) sin(aij)*sin(gij)+cos(aij)*sin(bij)*cos(gij) xij; sin(aij)*cos(bij) cos(aij)*cos(gij)+sin(aij)*sin(bij)*sin(gij) sin(aij)*sin(bij)*cos(gij)-cos(aij)*sin(gij) yij; -sin(bij) cos(bij)*sin(gij) cos(bij)*cos(gij) zij; 0 0 0 1];

%%%%%%%%%%%%%%%%%%%%%%
%syms x1 y1 z1 a1 b1 g1

%a = Tij(x1,y1,z1,g1,b1,a1)

syms z01 theta01 theta12 z23 theta23 x34 theta34 x4P theta4P

T01 = Tij(0,0,z01,0,0,theta01);
T12 = Tij(0,0,0,0,theta12,0);
T23 = Tij(0,0,z23,0,0,theta23);
T34 = Tij(x34,0,0,0,theta34,0);
T4P = Tij(x4P,0,0,theta4P,0,0);

T0P = simplify(T01*T12*T23*T34*T4P)

T04 = simplify(T01*T12*T23*T34)

%Transformaciones auxiliares para la simulación

% T01
% T02 = T01*T12
% T03 = T01*T12*T23
% T0P

%Cálculo de la matriz Jacobiana

% syms theta01 theta12 theta23 theta01v theta12v theta23v
% 
% E0P = [cos(theta01)*(L3*sin(theta12 + theta23) + L2*sin(theta12));sin(theta01)*(L3*sin(theta12 + theta23) + L2*sin(theta12));h0 + L3*cos(theta12 + theta23) + L2*cos(theta12);cos(theta12 + theta23)*cos(theta01);cos(theta01);cos(theta12 + theta23)]
% 
% p0P = [cos(theta01)*(L3*sin(theta12 + theta23) + L2*sin(theta12));sin(theta01)*(L3*sin(theta12 + theta23) + L2*sin(theta12));h0 + L3*cos(theta12 + theta23) + L2*cos(theta12)]
% 
% Ev0P = simplify(diff(E0P,theta01)*theta01v+diff(E0P,theta12)*theta12v+diff(E0P,theta23)*theta23v)
% 
% %Jq = jacobian([cos(theta01)*(L3*sin(theta12 + theta23) + L2*sin(theta12)),sin(theta01)*(L3*sin(theta12 + theta23) + L2*sin(theta12)),h0 + L3*cos(theta12 + theta23) + L2*cos(theta12)],[theta01,theta12,theta23])
% 
% Jq = jacobian(E0P,[theta01,theta12,theta23])
% 
% qv = [theta01v;theta12v;theta23v]
% 
% w = sqrt(Jq*transpose(Jq))
% 
% Jqpso = jacobian(p0P,[theta01,theta12,theta23]);
% 
% wpos = simplify(det(Jqpso))
