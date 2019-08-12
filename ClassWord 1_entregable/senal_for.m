clc
clear all
close all
%-- DATA IN--%
A=1;
f=3400;
cantper=2;
comp_freq=6;
phi=0;

%-- PROCESS--%
t=linspace(0,cantper/f,500);

%señal sinusoidal basica
sinusoidal = A*sin(2*pi*f*t + phi);

%Señal cuadrada
cuadrada =0;
for n=1:2:(2*comp_freq-1) %comience en n=1 con pasos de :2: 
    cuadrada = cuadrada +(A/n)*sin(2*pi*f*n*t);
end

%Señal triangular
triangular =0;
for n=1:2:(2*comp_freq-1) %comience en n=1 con pasos de :2: 
    triangular = triangular +(A/n^2)*cos(2*pi*f*n*t);
end

%Señal diente sierra
dsierra =0;
for n=1:comp_freq %comience en n=1 con pasos de :1:
    if(mod(n,2) ==0)
        signo=-1;
    else
        signo=1;
    end
    dsierra = dsierra + signo*(A/n)*sin(2*pi*f*n*t);
end


%-- OUTPUT--%
figure(1);
subplot(2,2,1)
plot(t,sinusoidal),title('Sinusoidal'),grid on
subplot(2,2,2)
plot(t,cuadrada),title('Cuadrada'),grid on
subplot(2,2,3)
plot(t,triangular),title('Triangular'),grid on
subplot(2,2,4)
plot(t,dsierra),title('Diente Sierra'),grid on