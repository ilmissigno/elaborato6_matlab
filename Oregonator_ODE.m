%% Funzione del modello ODE Oregonator per la descrizione di reazioni tra 3 sostanze chimiche
function y_primo = Oregonator_ODE(t,y)

%% MODELLO ODE
%%
%{
y1'(t) = (qy2 - y1y2 + y1(1-y1))/e
y2'(t) = (-qy2 - y1y2 + fy3)/g
y3'(t) = y1 - y3
con t ? [0,50] , y1(0) = y2(0) = y3(0) = 0.2
q = 9x10^-5 , e = 10^-2 , g = 2.5x10^-5 , f=0.8

Nella seguente notazione, il matlab specifica che
per una variabile la notazione (i,j) indica la i
equazione nella j incognita.
Di conseguenza
y1'(prima equaz,prima incog) = q*y(sec incog) - y(prima incog)*y(sec incog)
ecc.. variando la i per indicare il numero di equazioni
%}

q = 9*10^(-5) ;
e = 10^(-2) ;
g = 2.5*10^(-5) ;
f = 0.8;


y_primo1 = (q*y(2)-y(1)*y(2)+y(1)*(1-y(1)))/e;
y_primo2 = (-q*y(2)-y(1)*y(2)+f*y(3))/g;
y_primo3 = y(1)-y(3);

y_primo = [y_primo1; y_primo2; y_primo3];
end
