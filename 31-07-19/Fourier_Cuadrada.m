clc
clear all
close all

%---DATA IN---
A=10;
f=3000;
cantper=1;

%---PROCESS---
t =linspace(0,cantper/f,500);
xt_lcf= A*sin(2*pi*f*t);
xt_2cf= xt_lcf + (A/3)*sin(2*pi*3*f*t);
xt_3cf= xt_2cf + (A/5)*sin(2*pi*5*f*t);
xt_4cf= xt_3cf + (A/7)*sin(2*pi*7*f*t);
xt_5cf= xt_4cf + (A/9)*sin(2*pi*9*f*t);
xt_6cf= xt_5cf + (A/11)*sin(2*pi*11*f*t);

%---OUTPUT---
figure(1)
subplot(3,2,1)
plot(t,xt_lcf),title('xt con 1 Componente Frecuencia'), grid on
subplot(3,2,2)
plot(t,xt_2cf),title('xt con 2 Componente Frecuencia'), grid on
subplot(3,2,3)
plot(t,xt_3cf),title('xt con 3 Componente Frecuencia'), grid on
subplot(3,2,4)
plot(t,xt_4cf),title('xt con 4 Componente Frecuencia'), grid on
subplot(3,2,5)
plot(t,xt_5cf),title('xt con 5 Componente Frecuencia'), grid on
subplot(3,2,6)
plot(t,xt_6cf),title('xt con 6 Componente Frecuencia'), grid on