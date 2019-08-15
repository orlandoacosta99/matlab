clc
clc 
clear all
close all

%----- DATA IN
Ac = 10;
fc = 1000e3;
%datos digitales
datos = '00110100010';
% regla BIT
regla_bit_alto = 1;  % posibles valores: 1 v 0
% regla ASK
regla_ASK_carrier = 1; % posibles valores: 1 v 0

%--- PROCESS
%construcion de los datos digitales
long_datos = length(datos);
tb=50;

%tb-duracion del bit cantidad de puntos
uno = ones(1,tb);
%crear una matris * tb posocione

cero = zeros(1,tb);
cadena =[];
cadena_inversa=[];
for n=1:long_datos
    if(datos(n)=='1')
    cadena = [cadena uno];
    cadena_inversa = [cadena_inversa cero];
    else
    cadena = [cadena cero];
    cadena_inversa = [cadena_inversa uno];
    end
end


if(regla_bit_alto == 1)
bits = 5*cadena;
else
bits = 5*cadena_inversa;
end

%construcción carrier

tc = linspace(0, 2*long_datos/fc, length(bits));
carrier = Ac*sin(2*pi*fc*tc);

%modulacion

if(regla_ASK_carrier == 1)
        ASK = cadena.*carrier;
else
    ASK =cadena_inversa.*carrier;
end

%-----output

titulo = cat(2,'Datos IN: ', datos);
figure(1)
subplot(3,1,1),plot(carrier),title('Carrier'), grid on
axis([0 length(bits) -Ac Ac])


subplot(3,1,2),plot(bits),title(titulo), grid on
%axis([Xmin Xmax Ymin Ymax])
axis([0 length(bits) -1 6])

subplot(3,1,3),plot(ASK),title(titulo), grid on
%axis([Xmin Xmax Ymin Ymax])
axis([0 length(bits) -Ac Ac])


subplot(3,1,2),plot(bits),title(titulo), grid on
%axis([Xmin Xmax Ymin Ymax])
axis([0 length(bits) -1 6])

subplot(3,1,3),plot(ASK),title(titulo), grid on
%axis([Xmin Xmax Ymin Ymax])
axis([0 length(bits) -Ac Ac])