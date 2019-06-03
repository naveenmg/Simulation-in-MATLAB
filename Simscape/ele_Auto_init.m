 clear all;
 clc;

% angeleht an Tesla-Daten
%out.v=[0 0];
cw = 0.2;           % Luftwiderstandsbeiwert
A = 1.964*1.445;    % effektive Stirnflaeche
rho = 1.204;        % Dichte in kg/m^3
%F_Luft = 1/2 * cw * A * rho *v^2;
m=2000;             %kg


wheel_radius=28*2.54;   %28" Raeder
K=0.01;             % Constant of proportionality K 
VFC=1;              % Viscous friction coefficient

V_max=650; %V