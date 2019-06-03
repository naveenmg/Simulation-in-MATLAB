close all;clear all;
M = 7.35e22; % Mondmasse in kg 
rm = 1738e3; % Mondradius in m
G = 6.67e-11; % Gravitationskonstante Mond in m^3/(kg*s^2)
h_thrust_change = 10500.0 ;% Höhe in m über Mondoberfläche für Umschaltung

% Phase1 (Hauptantrieb): hoehe(t) > h_thrust_change;
% Phase2 (Feinjustierantrieb: hoehe(t) ? h_thrust_change
Fschub1 = 36350.0; % Schubkraft Phase1 in N
Fschub2 = 1308.0; % Schubkraft Phase2 in N
c1 = 0.000277; % Brennstoffeffizienz Phase1
c2 = 0.00277; % Brennstoffeffizienz Phase2
% Anfangszustände zu t=0
x1 = 59404.0; % Höhe der Mondfähre über Mondoberfläche in m
x2 = -2003.0; % Geschwindigkeit der Mondfähre in m/s

x3 = 1038.358; % Masse der Mondfähre in kg
% Simulationsparameter
h = 0.1; % vorgegebene Zeitschrittweite in s 

x=[x1;x2];
t=0; tfinal=100;
tout=[t]; xout=[x'];
n= 1;
Fschub=Fschub1;
c=c1;
% Simulationsschleife
while ( t < tfinal )
% Zeitanpassung bei letztem Schritt
if t+h > tfinal, h=tfinal-t; end

xdot =[x(2); (Fschub/x3)-(G*(M/(x(1)+rm)^2)) ]; % xdot(t)
x = x + xdot*h; % Integ. t ? t+h
% Ereigniserkennung (Diskontinuität)
if x(1)-h_thrust_change< 0
% Ereignislokalisierung (lin. Interpolation)
talt= t; x1alt= xout(end,1);
tneu= t+h; x1neu= x(1);
tEvent = talt-((tneu-talt)/(x1neu-x1alt))*x1alt;
% Neue Integration nur über t? tEvent
hEvent = tEvent - t;
x = xout(end,:)';
xEvent = x + xdot * hEvent;
% Ereignisaktionen ausführen
Fschub=Fschub2;
c=c2;
tout = [tout; tEvent];
xout = [xout; xEvent'];
% Integration Restschritt tEvent? t+h
hRest= h - hEvent;
xdot= [xEvent(2); (Fschub/x3)-(G*(M/(x(1)+rm)^2))];
x =xEvent + xdot * hRest;
% elseif x(1)<= 0
%    
%  % Ereignislokalisierung (lin. Interpolation)
% talt= t; x1alt= xout(end,1);
% tneu= t+h; x1neu= x(1);
% tEvent = talt-((tneu-talt)/...
% (x1neu-x1alt))*x1alt;
% % Neue Integration nur über t? tEvent
% hEvent = tEvent - t;
% x = xout(end,:)';
% xEvent = x + xdot * hEvent;
% % Ereignisaktionen ausführen
% xEvent(1)=0;
% tout = [tout; tEvent];
% xout = [xout; xEvent'];
% % Integration Restschritt tEvent? t+h
% hRest= h - hEvent;
% xdot= [xEvent(2); (Fschub/x3)-(G*(M/(x(1)+rm)^2))];
% x =xEvent + xdot * hRest;
end
% Zeitfortschaltung
t =t + h;
% Ergebnisaufzeichnung
n=n+1;
tout= [tout; t];
xout= [xout; x'];
end % Ende Simulationsschleife
figure
 subplot(3,1,1)%,plot(tout,Fschub)
title('Feder-Daempfer-Masse-System')
xlabel('t'), ylabel('Fschub(t)'), grid
subplot(3,1,2), plot(tout,xout(:,1))
xlabel('t'), ylabel('hoehe(t)'), grid
subplot(3,1,3), plot(tout,xout(:,2))
xlabel('t'), ylabel('v(t)'), grid
