clc
clear all
close all
%-- DATA IN--%
A=1;
f=3400;
cantper=1;

%-- PROCESS--%
t=linspace(0,cantper/f,500);
xt_1cf =(A/1)*sin(2*pi*1*f*t);
xt_2cf = xt_1cf+(A/3)*sin(2*pi*3*f*t);
xt_3cf = xt_2cf+(A/5)*sin(2*pi*5*f*t);
xt_4cf = xt_3cf+(A/7)*sin(2*pi*7*f*t);
xt_5cf = xt_4cf+(A/9)*sin(2*pi*9*f*t);
xt_6cf = xt_5cf+(A/11)*sin(2*pi*11*f*t);

tf_1cf = abs(fft(xt_1cf));
tf_2cf = abs(fft(xt_2cf));
tf_3cf = abs(fft(xt_3cf));
tf_4cf = abs(fft(xt_4cf));
tf_5cf = abs(fft(xt_5cf));
tf_6cf = abs(fft(xt_6cf));

%-- OUTPUT--%
figure(1);
subplot(3,2,1)
plot(t,xt_1cf),title('componentes de frecuencia: 1'),grid on
subplot(3,2,2)
plot(t,xt_2cf),title('componentes de frecuencia: 2'),grid on
subplot(3,2,3)
plot(t,xt_3cf),title('componentes de frecuencia: 3'),grid on
subplot(3,2,4)
plot(t,xt_4cf),title('componentes de frecuencia: 4'),grid on
subplot(3,2,5)
plot(t,xt_4cf),title('componentes de frecuencia: 5'),grid on
subplot(3,2,6)
plot(t,xt_4cf),title('componentes de frecuencia: 6'),grid on

figure(2);
subplot(3,2,1)
plot(tf_1cf(1:15)),title('Transformada Fourier con 1 componentes de frecuencia'),grid on
subplot(3,2,2)
plot(tf_2cf(1:15)),title('Transformada Fourier: con 2 componentes de frecuencia'),grid on
subplot(3,2,3)
plot(tf_3cf(1:15)),title('Transformada Fourier: con 3 componentes de frecuencia'),grid on
subplot(3,2,4)
plot(tf_4cf(1:15)),title('Transformada Fourier: con 4 componentes de frecuencia'),grid on
subplot(3,2,5)
plot(tf_5cf(1:15)),title('Transformada Fourier: con 5 componentes de frecuencia'),grid on
subplot(3,2,6)
plot(tf_6cf(1:15)),title('Transformada Fourier: con 6 componentes de frecuencia'),grid on

