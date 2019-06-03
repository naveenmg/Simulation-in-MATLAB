clear all;
% Datenfile fuer Prozess & Regler
% Systemparameter
m = 1; % Masse in kg
rho = 850; % Dichte Fluid (Hydraulikoel) in kg/m^3
zeta = 0.5; % Widerstandsbeiwert einer Bohrung
FR = 5; % Gleitreibungskraft zw. Kolben & Zylinder in N
dK = 2e-2; % Kolbendurchmesser in m
AK = pi/4 * dK^2; % Kolbenquerschnittsfläche in m^2
dB = 2.8e-3; % Bohrungsdurchmesser in m
n = 7; % Anzahl Bohrungen insgesamt
AB = n * pi/4 * dB^2; % Querschnittsflaeche aller Bohrungen
KI = 0.0005; % KI-Wert des I-Reglers
xdotdot_soll = -100; % Sollgroesse in m/s^2 (Abbremsbeschleunigung)
% Anfangswerte
v0 = 3; % Geschwindigkeit der auftreffenden Masse in m/s
x0 = 0; % Anfangsauslenkung des Kolben in m