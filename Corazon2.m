clear;
clc;
%% inicio
tSpan = 2;  
Muestras = 1000;  
%% Señales
function [sano,t]=Sano(duracion, r)
    t=linspace(0, duracion, duracion * r);
    sano= sin(2*pi*1*t);          %Onda P 
    sano= sano+0.5*sin(2*pi*5*t);  %Complejo QRS 
    sano= sano+0.1*sin(2*pi*10*t);  % Onda T
end

function [problema, t] = Problema(duracion, r)
    t = linspace(0, duracion, duracion * r);
    problema= sin(2*pi*1 * t);  % Onda P 
    problema= problema+0.5*sin(2*pi*5*t);  %Complejo QRS 
    problema= problema+0.1*sin(2*pi*10*t);  % Onda T 
    problema= problema+0.2*randn(size(t));  
end
%% se mete lo que se va a graficar en una variable
[san, t] = Sano(tSpan, Muestras);
[Pro, t] = Problema(tSpan, Muestras);
%% se grafican 
subplot(2,1,1);
plot(t, san); % corazon sano
xlabel("Tiempo ");
ylabel("Voltaje");
title("Simulación de Corazón Sano");
legend("Corazon sano");
grid on;
hold off;

subplot(2,1,2);
plot(t, Pro); % con problemas
xlabel("tiempo");
ylabel("Voltaje");
title('Simulación de Corazón con Problemas Cardiacos');
legend('Corazon con problemas');
grid on;
hold off;
