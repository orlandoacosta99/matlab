clc
clear all
close all

%---- DATA IN --

A = 10;
f = 3400;
phi = 0;
cantper = 10;

%--- PROCESS ---

%--- t = linspace(0,1/f);
%--- t = linspace(0,cantper*1/f);
t = linspace(0,cantper*1/f,1000);
xt= A*sin(2*pi*f*t + phi);

%--- OUTPUT ---

figure(1)
plot(t, xt)