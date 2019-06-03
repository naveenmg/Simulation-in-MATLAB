close all;clear all;
m=30;cR=150000;cA=30000;dA1=600; %dA1=6000; % Systemparameter
x= [0; 0];           % Anfangszustand y(t0),ydot(t0)
t= 0; tfinal=10; h=0.001;% h=0.01;%h=0.1; %Simulationsparameter
tout= [t]; xout= [x'];
c=cR+cA;n= 1;
while t < tfinal
  if t+h > tfinal,
     h = tfinal-t; end % letzten Schritt auf tfinal  
 if t<=5
     yS(n+1)=0;
    end
    if t>5
      yS(n+1)=0.25;
    end
    u(n+1) =cR .* yS(n+1);    % input values u(t)
  xdot= [x(2);
         (u(n+1)-dA1*x(2)-c*x(1))/m]; % Aenderungsraten(t)
  x = x + xdot .* h;         % Euler-Schritt => x(t+h)
  t = t + h;                 % Zeitfortschaltung
  n=n+1;
  tout = [tout; t];          % Ergebnisaufzeichnung
  xout = [xout; x'];    
end
  a= -(c/m)*xout(:,1)-(dA1/m)*xout(:,2)+(1/m)*u(:); % output value x2dot(t)
figure
subplot(3,1,1), plot(tout,yS)
title('Feder-Daempfer-Masse-System')
xlabel('t'), ylabel('ys(t)'), grid
subplot(3,1,2), plot(tout,xout(:,1))
xlabel('t'), ylabel('s(t)'), grid
subplot(3,1,3), plot(tout,xout(:,2))
xlabel('t'), ylabel('v(t)'), grid
figure(2)
FcR=cR*xout(:,1);FcA=cA*xout(:,1);FdA=dA1*xout(:,2);
subplot(3,1,1), plot(tout,FcR)
title('Feder-Daempfer-Masse-System')
xlabel('t'), ylabel('FcR(t)'), grid
subplot(3,1,2), plot(tout,FcA)
xlabel('t'), ylabel('FcA'), grid
subplot(3,1,3), plot(tout,FdA)
xlabel('t'), ylabel('FdA'), grid

