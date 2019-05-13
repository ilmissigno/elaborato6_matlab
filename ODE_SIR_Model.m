%% Funzione del modello ODE SIR di diffusione di un Epidemia
function y_primo = ODE_SIR_Model(t,y_iniziale,a)

%% MODELLO ODE

%{
S'(t) = -aS(t)I(t)
I'(t) = aS(t)I(t) - bI(t)
R'(t) = bI(t)
con t ? [0,20] , S(0) = 199 , I(0) = 1 , R(0) = 0
b costante = 0.1

Nella seguente notazione, il matlab specifica che
per una variabile la notazione (i,j) indica la i
equazione nella j incognita.
Di conseguenza
y'(prima equaz,prima incog) = -a*y(prima incog)*y(sec incog)
ecc.. variando la i per indicare il numero di equazioni
%}
b=0.1;
y_primo(1,1) = -a*y_iniziale(1)*y_iniziale(2);
y_primo(2,1) = a*y_iniziale(1)*y_iniziale(2) - b*y_iniziale(2);
y_primo(3,1) = b*y_iniziale(2);

end
