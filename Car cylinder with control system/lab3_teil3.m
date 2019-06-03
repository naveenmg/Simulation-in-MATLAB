clear all;
m = 1; % Masse in kg
rho = 850; % Dichte Fluid (Hydraulikoel) in kg/m^3
zeta = 0.5; % Widerstandsbeiwert einer Bohrung
FR = 5; % Gleitreibungskraft zw. Kolben & Zylinder in N
dK = 2e-2; % Kolbendurchmesser in m
AK = pi/4 * dK^2; % Kolbenquerschnittsfl√§che in m^2
dB = 2.8e-3; % Bohrungsdurchmesser in m
n = 7; % Anzahl Bohrungen insgesamt insgesamt
AB = n * pi/4 * dB^2; % Querschnittsfl‰che alle Bohrungen offen
% Tabellenfunktion
table = [ 0 7;
0.0065 7;
0.0093 6;
0.0165 6;
0.0193 5;
0.0250 5;
0.0278 4;
0.0330 4;
0.0358 3;
0.0380 3;
0.0408 2;
0.0420 2;
0.0434 1;
0.0500 1 ];
xB = table(:,1); % als Variable im Simulink Block Lookup Table verwendet
nB = table(:,2); % als Variable im Simulink Block Lookup Table verwendet
% Anfangswerte
v0 = 3; % Geschwindigkeit der auftreffenden Masse in m/s
x0 = 0; % Anfangsauslenkung des Kolben in m