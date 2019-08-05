clc
clear all
close all

%---- DATA IN --

A = 1;
f = 3000;
phi = 0;
cantper=2;
comp_freq = 6;

%--- PROCESS ---

t = linspace(0,cantper/f,500);
sinusoidal= A*sin(2*pi*f*t + phi);

%señal cuadrada
cuadrada=0;
for n=1:2:(2*comp_freq-1)
    cuadrada = cuadrada + (A/n)*sin(2*pi*n*f*t);
end

%señal triangular
triangular=0;
for n=1:2:(2*comp_freq-1)
    triangular = triangular + (A/n^2)*cos(2*pi*n*f*t);
end

%señal diente sierra
dsierra=0;
for n=1:comp_freq
    if(mod(n,2)==0)
        signo=-1;
    else
        signo=1;
    end
    dsierra = dsierra + signo*(A/n)*sin(2*pi*n*f*t);
end

%--- OUTPUT ---

figure(1)
subplot(3,2,1),plot(t,sinusoidal),title('sinusoidal'),grid on
subplot(3,2,2),plot(t,cuadrada),title('cuadrada'),grid on
subplot(3,2,3),plot(t,triangular),title('triangular'),grid on
subplot(3,2,4),plot(t,dsierra),title('diente sierra'),grid on
