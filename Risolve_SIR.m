%% Script di Risoluzione del Modello SIR
function Risolve_SIR(a)
%Impostazione condizioni iniziali
t = [0 20];
s0 = 199;
i0 = 1;
r0 = 0;
%Impostazione valori di tolleranza 
opzione = odeset('RelTol',10^-6,'AbsTol',10^-7);
%Calcolo del modello attraverso ode45
[time,result] = ode45(@ODE_SIR_Model,t,[s0 i0 r0],opzione,a);
%Calcolo Picco degli Infetti
peak = max(result(:,2));
time_peak = time(result(:,2)==peak)
%Grafico del Modello
subplot(2,1,1);
p = plot(time,result(:,1),'r',time,result(:,2),'g',time,result(:,3),'b',time_peak,peak,'x','MarkerSize',10,'LineWidth',2);
title('Modello SIR di diffusione di un''epidemia');
xlabel('Tempo');
ylabel('Misurazioni');
legend('Persone Suscettibili','Infetti','Immuni','Picco degli Infetti');
%Grafico della Percentuale di infetti
%La percentuale degli infetti si calcola come:
%(infetti/(suscettibili+guariti))*100
subplot(2,1,2);
plot(time,(result(:,2)/(result(:,1)+result(:,3)))*100,'m--');
title('Percentuale degli Individui infetti');
xlabel('Tempo');
ylabel('Percentuale');
%definisco dei limiti per gli assi
axis([0 20 0 100]);
end