%% Control 2 EL4005 Principios de Comunicaciones
% Simulacion modulacion FM

clear; tic; kill; clc;

%% PARAMETROS
FRECUENCIA     =500;
FRECUENCIAPOR  =10e3;
PERIODO        =1/FRECUENCIA;
PERIODOPOR     =1/FRECUENCIAPOR;
SAMPLING       =10*FRECUENCIAPOR;
CICLOS         =15;
TIEMPO         =0:1/SAMPLING:CICLOS*PERIODO;
L              =length(TIEMPO);
VPP_MODULADORA =1.5;
VPP_PORTADORA  =3;
FDEV1          =75;
FDEV2          =100;
SNR1           =15; %dB
SNR2           =30; %dB
%% Generamos la senal moduladora
% y ploteamos la senal
moduladora  =VPP_MODULADORA/2*square(2*pi*FRECUENCIA*TIEMPO);

figure; subplot(311);
plot(TIEMPO, moduladora);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');
title(['Senal Moduladora, Fs= ', num2str(SAMPLING/1e3), 'kHz']);
axis([0 10*PERIODO -VPP_MODULADORA VPP_MODULADORA]);

%% Generamos su FFT 
%
[fftsingleside n] =fftsinglesideband(moduladora);
frecuencias       =SAMPLING*(0:(n/2))/n;

subplot(312);
plot(frecuencias, fftsingleside);
set(gca,'yscale','log');
xlabel('Frecuencia [Hz]'); ylabel('|A(f) |[V^2]');
title(['Espectro Senal Moduladora']);
axis([0 16*FRECUENCIA 0 1]); ylim auto;

%% Generamos la Senal Portadora
%
portadora=VPP_PORTADORA/2*cos(2*pi*FRECUENCIAPOR*TIEMPO);

subplot(313);
plot(TIEMPO, portadora);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');
title(['Senal Portadora, Fs= ', num2str(SAMPLING/1e3), 'kHz']);
axis([0 10*PERIODOPOR -VPP_PORTADORA VPP_PORTADORA]);

%% Indices de moculacion
% Generamos la senal modulada
% sin ocupar fmmod()
% recordando que
% fm=A cos ( fase(t) )
% y que fase instantanea en en fm es
% fase(t)= 2pi*fc*t+2pi*fdev*int(m(t), 0, t)
% https://www.st-andrews.ac.uk/~www_pa/Scots_Guide/RadCom/part12/page1.html
im1 =FDEV1/FRECUENCIA; 
im2 =FDEV2/FRECUENCIA;
salida=['Indice Modulacion 1: ', num2str(im1)]; disp(salida); 
salida=['Indice Modulacion 2: ', num2str(im2)]; disp(salida); 

fm1=zeros(length(TIEMPO), 1);
for i=1:length(TIEMPO)
   delta=TIEMPO(2)-TIEMPO(1);
   integral=delta*trapz(moduladora(1:i));
   fase=2*pi*FRECUENCIAPOR*TIEMPO(i)+2*pi*FDEV1*integral;
   fm1(i)=VPP_PORTADORA/2*cos(fase);
end

fm2=zeros(length(TIEMPO), 1);
for i=1:length(TIEMPO)
   delta=TIEMPO(2)-TIEMPO(1);
   integral=delta*trapz(moduladora(1:i));
   fase=2*pi*FRECUENCIAPOR*TIEMPO(i)+2*pi*FDEV2*integral;
   fm2(i)=VPP_PORTADORA/2*cos(fase);
end

%% Verificamos
fm1demod = fmdemod(fm1,FRECUENCIAPOR,SAMPLING,FDEV1);
fm2demod = fmdemod(fm2,FRECUENCIAPOR,SAMPLING,FDEV2);

figure; subplot(211);
plot(TIEMPO,moduladora,'b',TIEMPO,fm1demod,'r--');
axis([0 10*PERIODO -VPP_MODULADORA VPP_MODULADORA]);
title(['Demodulacion Sin Ruido, Fdev: ', num2str(FDEV1)]);

subplot(212);
plot(TIEMPO,moduladora,'b',TIEMPO,fm2demod,'r--');
axis([0 10*PERIODO -VPP_MODULADORA VPP_MODULADORA]);
title(['Demodulacion Sin Ruido, Fdev: ', num2str(FDEV2)]);

%% Graficos de Senal Moduladora y FFT
figure; subplot(311);
plot(TIEMPO, fm1);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');
title(['Senal Modulada, Fc= ', num2str(FRECUENCIAPOR/1e3), ...
       'kHz, ', 'Desvio: ', num2str(FDEV1), 'Hz']);
axis([0 2*PERIODO -VPP_PORTADORA VPP_PORTADORA]);

subplot(312);
plot(TIEMPO, fm2);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');
title(['Senal Modulada, Fc= ', num2str(FRECUENCIAPOR/1e3), ...
       'kHz, ', 'Desvio: ', num2str(FDEV2), 'Hz']);
axis([0 2*PERIODO -VPP_PORTADORA VPP_PORTADORA]);

% Generamos FFT para FM1
fftsinglesideFM1 =fftsinglesideband(fm1);

subplot(313);
plot(frecuencias, fftsinglesideFM1);
set(gca,'yscale','log');
xlabel('Frecuencia [Hz]'); ylabel('|A(f) |[V^2]');
title(['Espectro Senal Modulada, Fdev: ', num2str(FDEV1), 'Hz']);
axis([FRECUENCIAPOR*(1-0.3) FRECUENCIAPOR*(1+0.3) 0 1]); ylim auto;

%% Agregaremos Ruido Blanco a FM1
% Para luego tratar de demodular la senal

fm1_noise1=awgn(fm1, SNR1);
fm1_noise2=awgn(fm1, SNR2);

figure; subplot(311);
plot(TIEMPO, fm1_noise1);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');
title(['Senal Modulada con AWGN, SNR= ', num2str(SNR1), ...
       'dB, ']);
axis([0 10*PERIODOPOR -VPP_PORTADORA VPP_PORTADORA]);

subplot(312);
plot(TIEMPO, fm1_noise2);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');
title(['Senal Modulada con AWGN, SNR= ', num2str(SNR2), ...
       'dB, ']);
axis([0 10*PERIODOPOR -VPP_PORTADORA VPP_PORTADORA]);

%% DEMODULAMOS
%
fm1demod_noise1 = fmdemod(fm1_noise1,FRECUENCIAPOR,SAMPLING,FDEV1);
fm1demod_noise2 = fmdemod(fm1_noise2,FRECUENCIAPOR,SAMPLING,FDEV1);
fft_fm1_noise1  = fftsinglesideband(fm1_noise1);

%% Ploteamos la senal con mejor SNR
% Se apreciara la necesidad de un filtro
subplot(313);
plot(TIEMPO,moduladora,'b',TIEMPO,fm1demod_noise2,'r--');
title(['Demodulacion AWGN, SNR: ', num2str(SNR2), 'dB']);
xlabel('Tiempo [s]'); ylabel('Amplitud [V]');

figure; subplot(311);
plot(frecuencias, fft_fm1_noise1);
set(gca,'yscale','log');
xlabel('Frecuencia [Hz]'); ylabel('|A(f) |[V^2]');
title(['Espectro Senal Modulada con Ruido']);
axis([FRECUENCIAPOR*(1-0.3) FRECUENCIAPOR*(1+0.3) 0 1]); ylim auto;

%% Disenamos un filtro
% buttworth
ancho_banda=2*(FDEV1+FRECUENCIA);
w_corte1=2*(FRECUENCIAPOR - ancho_banda/2)/(SAMPLING); % valores
w_corte2=2*(FRECUENCIAPOR + ancho_banda/2)/(SAMPLING); % normalizados

[b,a] = butter(3, [w_corte1 w_corte2],'bandpass');
%% Tenemos la respuesta del filtro
subplot(312); 
[h w]=freqz(b,a,'whole', SAMPLING);
plot(w/pi*SAMPLING, 20*log10(abs(h)) );
xlim([0 SAMPLING/2]); ylim([-100 20]);
title('Respuesta Filtro Butterworth');
xlabel('Frecuencia [Hz]'); ylabel('Magnitude (dB)'); 

%% Aplicamos el filtro disenado
% revisamos la respuesta en tiempo y frec
% 
fm1_noise1_filtered     = filter(b, a, fm1_noise1);
fm1_noise2_filtered     = filter(b, a, fm1_noise2);
fm1_noise1_filtered_fft = fftsinglesideband(fm1_noise1_filtered);
fm1_noise2_filtered_fft = fftsinglesideband(fm1_noise2_filtered);

subplot(313);
plot(frecuencias, fm1_noise1_filtered_fft);
set(gca,'yscale','log');
xlabel('Frecuencia [Hz]'); ylabel('|A(f) |[V^2]');
title(['Espectro FM1 + AWGN + Filtro']);
axis([FRECUENCIAPOR*(1-0.3) FRECUENCIAPOR*(1+0.3) 0 1]); ylim auto;

%% Demodulamos las senales
% y calculamos el FFT

fm1_noise1_filtered_demod     =fmdemod(fm1_noise1_filtered,FRECUENCIAPOR,SAMPLING,FDEV1);
fm1_noise2_filtered_demod     =fmdemod(fm1_noise2_filtered,FRECUENCIAPOR,SAMPLING,FDEV1);
fm1_noise1_filtered_demodFFT  =fftsinglesideband(fm1_noise1_filtered_demod);
fm1_noise2_filtered_demodFFT  =fftsinglesideband(fm1_noise2_filtered_demod);

figure; subplot(221);
plot(TIEMPO,moduladora,'b',TIEMPO,fm1_noise1_filtered_demod,'r--');
axis([0 10*PERIODO -VPP_MODULADORA VPP_MODULADORA]);
title(['Demodulacion, SNR: ', num2str(SNR1), 'dB, AWGN + FILTRO']);

subplot(222);
plot(TIEMPO,moduladora,'b',TIEMPO,fm1_noise2_filtered_demod,'r--');
axis([0 10*PERIODO -VPP_MODULADORA VPP_MODULADORA]);
title(['Demodulacion, SNR: ', num2str(SNR2), 'dB, AWGN + FILTRO']);

subplot(223);
plot(frecuencias, fm1_noise1_filtered_demodFFT);
set(gca,'yscale','log');
xlabel('Frecuencia [Hz]'); ylabel('|A(f) |[V^2]');
title(['Espectro Demod FM1 + AWGN + Filtro, SNR: ', num2str(SNR1), 'dB']);
axis([0 16*FRECUENCIA 0 1]); ylim auto;

subplot(224);
plot(frecuencias, fm1_noise2_filtered_demodFFT);
set(gca,'yscale','log');
xlabel('Frecuencia [Hz]'); ylabel('|A(f) |[V^2]');
title(['Espectro Demod FM1 + AWGN + Filtro, SNR: ', num2str(SNR2), 'dB']);
axis([0 16*FRECUENCIA 0 1]); ylim auto;

toc;