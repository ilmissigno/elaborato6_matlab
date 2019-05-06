%% Funzione per la risoluzione con ode45 e ode15s del Modello OREGONATOR
function [tempo45,y45,tempo15s,y15s] = Risolve_Oregonator()
%Impostazione coefficienti
q = 9*10^-5;
e = 10^-2;
g = 2.5*10^-5;
f = 0.8;
%Impostazione condizioni iniziali
t = [0 50];
y1_0 = 0.2;
y2_0 = 0.2;
y3_0 = 0.2;
%Impostazione valori di tolleranza dell'errore
opz = odeset('RelTol',10^-6,'AbsTol',10^-7);
%Risoluzione con ode45
[tempo45,y45] = ode45(@Oregonator_ODE,t,[y1_0 y2_0 y3_0],opz,q,e,g,f);
%Risoluzione con ode15s
[tempo15s,y15s] = ode15s(@Oregonator_ODE,t,[y1_0 y2_0 y3_0],opz,q,e,g,f);
%Stampa dei risultati
fprintf('[ODE45],Tempo: %d , Numero di punti: %d\n',sum(tempo45),length(y45));
fprintf('[ODE15s],Tempo: %d , Numero di punti: %d\n',sum(tempo15s),length(y15s));
end