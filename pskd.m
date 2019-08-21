clc
clear all
close all


%----------datos

%datos dfigitales

datos='00110100010'
tb=50;
regla_bit_alto = 0; %posibles opciones: 1 v 0


%datos del carrier

Ac =10;
fc = 1000e3;
phi_c = 0;


%Regla de modulacion ASK :: posibles pociones: 1 v 0
regla_ASK_transmite_carrier=1;

%Regla de modulacion FSK :: posibles pociones: 1 v 0
regla_FSK_transmite_HF=1;
delta_freq= 500e3;

%Regla de modulacion PSK :: posibles pociones: 1 v 0
regla_PSK_transmite_desfase=1;

%----------Procesos


%construccion de los datos digitales

cero = zeros(1,tb);
uno = ones(1,tb);
cadena = [];
cadenaInversa=[];


for m=1:length(datos)
   
      if (datos(m)=='0')
       cadena = [cadena cero];
       cadenaInversa = [cadenaInversa uno];
    
       else
       cadena = [cadena uno];
       cadenaInversa = [cadenaInversa cero];
      end
      
end
      
if(regla_bit_alto ==1)
    bitstream = 5*cadena;
else
    bitstream = 5*cadenaInversa
end
   
%construccion carrier

tc = linspace(0,(2*length(datos))/fc,length(bitstream));
carrier =Ac*sin(2*pi*fc*tc+ phi_c);

%---modulacion ask
if (regla_ASK_transmite_carrier)
    ASK= cadena.*carrier;
else
    ASK=cadenaInversa.*carrier;
end


%---modulacion fsk
fc_delta=fc-delta_freq;
carrier_delta =Ac*sin(2*pi*fc_delta*tc+ phi_c);
if (regla_FSK_transmite_HF==1)
    FSK1=cadena.*carrier;
    FSK2=cadenaInversa.*carrier_delta;
else
    FSK1=cadenaInversa.*carrier;
    FSK2=cadena.*carrier_delta;
end
FSK= FSK1+FSK2;

%---modulacion psk
carrier_pi =Ac*sin(2*pi*fc*tc+ pi);
if (regla_PSK_transmite_desfase==1)
    PSK1=cadena.*carrier;
    PSK2=cadenaInversa.*carrier_pi;
else
    PSK1=cadenaInversa.*carrier;
    PSK2=cadena.*carrier_pi;
end
PSK= PSK1+PSK2;



%----------resultados

figure (1)
subplot(5,1,1)
titulo = cat(2,'Datos DIGITALES ',datos);
plot (bitstream), grid on,title(titulo)
axis ([0 length(bitstream) -1 6 ])
subplot(5,1,2)
plot(tc,carrier),title ('Carrier')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(datos)])
grid on
subplot(5,1,3)
plot(tc,ASK),title('Señal Modulada en ASK')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(datos)])
grid on
subplot(5,1,4)
plot(tc,FSK),title('Señal Modulada en FSK')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(datos)])
grid on
subplot(5,1,5)
plot(tc,PSK),title('Señal Modulada en PSK')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(datos)])
grid on
