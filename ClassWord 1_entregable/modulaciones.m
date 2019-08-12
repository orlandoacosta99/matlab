clc
clear all
close all

%---- DATA IN --
% -- carrier
Ac = 10;
fc = 1000e3;
cpc= 18;
%datos analogos
Ax = 2;
fx = 3400;
cpx = 2;
%-- Indice de modulacion AM
m = 0.4;
%-- Indice de modulacion FM
Nfm = 2;
%-- Indice de modulacion PM
Npm = 2;

%--- PROCESS ---
% --- construccion carrier
tc= linspace(0,cpc/fc,500);
carrier = Ac*sin(2*pi*fc*tc);

%contruccion datos analogos
tx = linspace(0,cpx/fx,500);
xt = Ax*sin(2*pi*fx*tx);

%modulacion Am
Xam = (1+ m*xt).*carrier;

%modulacion Fm
Xfm = Ac*sin(2*pi*fc*tc + Nfm*xt);

%modulacion Pm
xt_diff = Ax*cos(2*pi*fx*tx);
Xpm = Ac * sin(2*pi*fc*tc + Npm*xt_diff);

%--- OUTPUT ---

figure(1)
subplot(5,1,1),plot(tc,carrier), title('carrier'),grid on
subplot(5,1,2),plot(tx,xt), title('Datos Análogos'),grid on
subplot(5,1,3),plot(tc,Xam), title('Modulacion Am'),grid on
subplot(5,1,4),plot(tc,Xfm), title('Modulacion Fm '),grid on
subplot(5,1,5),plot(tc,Xpm), title('Modulacion Pm '),grid on