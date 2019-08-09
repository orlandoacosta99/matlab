clc
clear all
close all

%-------------------DATA IN

Ac = 10;
fc = 1000e3;
cpc = 18;

%datos digitales
datos= '00110100010';


%--------------------PROCESS
%construccion carrier
tc = linspace(0,cpc/fc,500);
carrier = Ac*sin(2*pi*fc*tc);


%construccion datos digitales
long_datos = length(datos);
tb = 50;
uno = ones(1,tb);
cero = zeros(1,tb);
bits = [];
for n=1:long_datos
    if(datos(n)=='1')
        bits =[bits uno];
    else
        bits =[bits cero];
    end
end

bits = 5*bits;

%--------------------OUTPUT

figure(1)
subplot(2,1,1),plot(tc,carrier),title('Carrier'),grid on
subplot(2,1,2),plot(bits),title('Datos Digitales'),grid on