clc
clear all
close all

%---- DATA IN --

A = 10;
f = 3400;
%----phi = 0;--
%----phi = pi/2; --
%----phi = pi;--
%----phi = 3*pi/2;--

phi_1 = 0 ;
phi_2 = pi/2 ;
phi_3 = pi ;
phi_4 = 3*pi/2 ;
cantper = 1;

%--- PROCESS ---

%--- t = linspace(0,1/f);--
%--- t = linspace(0,cantper*1/f);--
t = linspace(0,cantper*1/f,1000);
%--- xt = A*sin(2*pi*f*t + phi); ---


xt1 =  A*sin(2*pi*f*t + phi_1);
xt2 = A*sin(2*pi*f*t + phi_2);
xt3 = A*sin(2*pi*f*t + phi_3);
xt4 = A*sin(2*pi*f*t + phi_4);
%--- OUTPUT ---

figure(1)
%---plot(t, xt)---
subplot(2,2,1),plot(t,xt1), title('phi = 0'), grid on
subplot(2,2,2),plot(t,xt2), title('phi = pi/2'), grid on
subplot(2,2,3),plot(t,xt3), title('phi = pi'), grid on
subplot(2,2,4),plot(t,xt4), title('phi = 3*pi/2'), grid on