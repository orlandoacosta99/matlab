%limpiamos la consola
clc
clear all
close all

%---- DATA IN --

A = 5; %% Amplitud
f = 3400; %% frecuencia
phi = 0; %% desfase 
cantper = 3; %%periodo

%--- PROCESS ---

%--- t = linspace(0,1/f);
%--- t = linspace(0,cantper*1/f);
t = linspace(0,cantper*1/f,1000);%Aquí se maneja como "T" el Periodo de nuestra señal
xt= A*sin(2*pi*f*t + phi);

%--- OUTPUT ---

%-- Graficacion --
figure(1)
plot(t, xt)