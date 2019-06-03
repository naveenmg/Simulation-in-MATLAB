close all;clear all;
M = 7.35e22; % Mondmasse in kg 
rm = 1738e3; % Mondradius in m
G = 6.67e-11; % Gravitationskonstante Mond in m^3/(kg*s^2)
h_thrust_change = 10500.0 ;% H�he in m �ber Mondoberfl�che f�r Umschaltung

% Phase1 (Hauptantrieb): hoehe(t) > h_thrust_change;
% Phase2 (Feinjustierantrieb: hoehe(t) ? h_thrust_change
Fschub1 = 36350.0; % Schubkraft Phase1 in N
Fschub2 = 1308.0; % Schubkraft Phase2 in N
c1 = 0.000277; % Brennstoffeffizienz Phase1
c2 = 0.00277; % Brennstoffeffizienz Phase2
% Anfangszust�nde zu t=0
x1 = 59404.0; % H�he der Mondf�hre �ber Mondoberfl�che in m
x2 = -2003.0; % Geschwindigkeit der Mondf�hre in m/s

x3 = 1038.358; % Masse der Mondf�hre in kg
% Simulationsparameter
h = 0.1; % vorgegebene Zeitschrittweite in s 