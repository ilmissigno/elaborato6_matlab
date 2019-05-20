%% Funzione per la risoluzione con ode45 e ode15s del Modello OREGONATOR
function [tempo45,y45,tempo15s,y15s] = Risolve_Oregonator()
%Impostazione coefficienti
q = 9*10^-5;
e = 10^-2;
g = 2.5*10^-5;
f = 0.8;
%Impostazione condizioni iniziali
t = [0 50];
y0 = [0.2 0.2 0.2];

%Impostazione valori di tolleranza 
opz = odeset('RelTol',10e-6,'AbsTol',10e-7);
%Risoluzione con ode45
profile on
tic
[tempo45,y45] = ode45(@Oregonator_ODE,t,y0,opz,q,e,g,f);
time = toc;
fprintf('[ODE45],Tempo: %d , Numero di punti: %d\n',time,length(y45));

pause(2)
tic
%Risoluzione con ode15s
[tempo15s,y15s] = ode15s(@Oregonator_ODE,t,y0,opz,q,e,g,f);
time = toc;
%Stampa dei risultati
fprintf('[ODE15s],Tempo: %d , Numero di punti: %d\n',time,length(y15s));
profile viewer
end