% Simscape(TM) Multibody(TM) version: 7.3

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [55.000000000000007 0 30];  % mm
smiData.RigidTransform(1).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [1 0 0];
smiData.RigidTransform(1).ID = 'B[Base_xy_inicial-1:-:Eslabón_1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 -1.7763568394002505e-15 10];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [1 0 0];
smiData.RigidTransform(2).ID = 'F[Base_xy_inicial-1:-:Eslabón_1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [120 0 20.000000000000004];  % mm
smiData.RigidTransform(3).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = 'B[Eslabón_1-1:-:Eslabón_2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [0 3.5527136788005009e-15 10];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [1 0 0];
smiData.RigidTransform(4).ID = 'F[Eslabón_1-1:-:Eslabón_2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [120 0 19.999999999999989];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [1 0 0];
smiData.RigidTransform(5).ID = 'B[Eslabón_2-1:-:Eslabón_3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [0 8.8817841970012523e-16 10];  % mm
smiData.RigidTransform(6).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(6).axis = [1 0 0];
smiData.RigidTransform(6).ID = 'F[Eslabón_2-1:-:Eslabón_3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [-7.6406680656788337 -6.3721044797163415 95];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = 'RootGround[Base_xy_inicial-1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.025569955139988582;  % kg
smiData.Solid(1).CoM = [32.706910081185278 0 5.4511516801975493];  % mm
smiData.Solid(1).MoI = [2.1057977649631927 15.292397068520959 16.751719256806481];  % kg*mm^2
smiData.Solid(1).PoI = [0 -0.31485112631412743 0];  % kg*mm^2
smiData.Solid(1).color = [0.54509803921568623 0.61568627450980395 0.85882352941176465];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'Eslabón_3*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.043929955139988597;  % kg
smiData.Solid(2).CoM = [63.15117869450701 0 5.2625982245422538];  % mm
smiData.Solid(2).MoI = [3.6379729040940179 75.975590153163651 78.656737202318325];  % kg*mm^2
smiData.Solid(2).PoI = [0 -0.65580392219813366 0];  % kg*mm^2
smiData.Solid(2).color = [0.93333333333333335 0.6588235294117647 0.6588235294117647];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'Eslabón_1*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.07867359282239815;  % kg
smiData.Solid(3).CoM = [13.512127349156133 0 8.9234493477979981];  % mm
smiData.Solid(3).MoI = [21.268374344016475 64.657958011662075 80.402348338448761];  % kg*mm^2
smiData.Solid(3).PoI = [0 -7.0941386712126677 0];  % kg*mm^2
smiData.Solid(3).color = [0.86274509803921573 0.5490196078431373 0.54509803921568623];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'Base_xy_inicial*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.043929955139988597;  % kg
smiData.Solid(4).CoM = [63.15117869450701 0 5.2625982245422538];  % mm
smiData.Solid(4).MoI = [3.6379729040940183 75.975590153163637 78.656737202318311];  % kg*mm^2
smiData.Solid(4).PoI = [0 -0.6558039221981331 0];  % kg*mm^2
smiData.Solid(4).color = [0.69019607843137254 0.8901960784313725 0.58823529411764708];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'Eslabón_2*:*Predeterminado';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(3).Rz.Pos = 0.0;
smiData.RevoluteJoint(3).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(1).ID = '[Base_xy_inicial-1:-:Eslabón_1-1]';

smiData.RevoluteJoint(2).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(2).ID = '[Eslabón_1-1:-:Eslabón_2-1]';

smiData.RevoluteJoint(3).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(3).ID = '[Eslabón_2-1:-:Eslabón_3-1]';

