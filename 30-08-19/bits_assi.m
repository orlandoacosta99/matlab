clc
clear all
close all

%-----data in-----
textoClaro = 'hola';
cadenaPolar=[];
cadenaPolarInversa=[];
tb=50;
regla_bit_alto = 0; %posibles opciones: 1 v 0

%construccion de los datos digitales
cero = zeros(1,tb);
uno = ones(1,tb);
cadena = [];
cadenaInversa=[];

%datos del carrier
Ac =10;
fc = 1000e3;
phi_c = 0;


%Regla de modulacion ASK : posibles pociones: 1 v 0
regla_ASK_transmite_carrier=1;

%Regla de modulacion FSK : posibles pociones: 1 v 0
regla_FSK_transmite_HF=1;
delta_freq= 500e3;

%Regla de modulacion PSK : posibles pociones: 1 v 0
regla_PSK_transmite_desfase=1;

% datos NRZ UP positiva
regla_NRZ_UP_alto=1;
A=10;
% datos NRZ UP positiva
regla_NRZ_UN_alto=1;
% datos polar
regla_NRZ_Polar_alto=1;

%----process----

%cifrado cesar
ascii = double(textoClaro);
bits = dec2bin (ascii);
cadena_bits = reshape(bits', 1, []);

for n = 1: length(ascii)
    if(ascii(n) == 32)
        ascii(n) = 32 - 3;
        
    elseif(ascii(n) == 120)
        ascii(n) = 97 - 3;
        
        elseif(ascii(n) == 121)
        ascii(n) = 98 - 3;
        
        elseif(ascii(n) == 122)
        ascii(n) = 99 - 3;
        
        elseif(ascii(n) == 88)
        ascii(n) = 65 - 3;
        
        elseif(ascii(n) == 89)
        ascii(n) = 66 - 3;
        
        elseif(ascii(n) == 90)
        ascii(n) = 67 - 3;
        
        elseif(ascii(n) == 108)
        ascii(n) = 241 - 3;
        
        elseif(ascii(n) == 109)
        ascii(n) = 111 - 3;
        
        elseif(ascii(n) == 110)
        ascii(n) = 112 - 3;
        
        elseif(ascii(n) == 241)
        ascii(n) = 113 - 3;
        
        elseif(ascii(n) == 76)
        ascii(n) = 209 - 3;
        
        elseif(ascii(n) == 77)
        ascii(n) =79 - 3;
        
        elseif(ascii(n) == 78)
        ascii(n) = 80 - 3;
        
        elseif(ascii(n) == 209)
        ascii(n) = 81 - 3;
    
    end
end
        
tk_cesar = ascii + 3;
criptograma = char(tk_cesar);

%creacion cadena bits
ascii_cifrado = double (textoClaro);
bits_cifrados = dec2bin(ascii_cifrado);
cadena_bits_cifrada = reshape(bits_cifrados.', 1, []);


      
for m=1:length(cadena_bits)
    
    if (cadena_bits(m)=='0')
        cadena = [cadena cero];
       cadenaInversa = [cadenaInversa uno];
       cadenaPolar = [cadenaPolar -uno];
       cadenaPolarInversa = [cadenaPolarInversa -uno];      
    
    else
       cadena = [cadena uno];
       cadenaInversa = [cadenaInversa cero];
       cadenaPolar = [cadenaPolar uno];
       cadenaPolarInversa = [cadenaPolarInversa -uno];
    end  
end

if(regla_bit_alto ==1)
    bitstream = 5*cadena;
else
    bitstream = 5*cadenaInversa;
end

%construccion carrier

tc = linspace(0,(2*length(cadena_bits))/fc,length(bitstream));
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
% unipolar positiva
if (regla_NRZ_UP_alto==1)
    NRZ_UP= A*cadena;
else
    NRZ_UP= A*cadenaInversa;
end
% unipolar negativa
if (regla_NRZ_UP_alto==1)
    NRZ_UN= -A*cadena;
else
    NRZ_UN= -A*cadenaInversa;
end
% codificacion polar 
if (regla_NRZ_Polar_alto==1)
    NRZ_POL= A*cadenaPolar;
else
    NRZ_POL= A*cadenaPolarInversa;
end


%output
fprintf('Texto claro: %s\n', textoClaro);
fprintf('Texto en Criptograma: %s\n', criptograma);
fprintf('Cadena Bits: %s\n', cadena_bits_cifrada);

subplot(5,2,1)
titulo = cat (2, 'Datos digitales cifrados:',cadena_bits_cifrada);
plot (bitstream), grid on,title(titulo)
axis ([0 length(bitstream) -1 6 ])

subplot(5,2,3)
plot(tc,carrier),title ('Carrier')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(cadena_bits)])
grid on
subplot(5,2,5)
plot(tc,ASK),title('Señal Modulada en ASK')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(cadena_bits)])
grid on
subplot(5,2,7)
plot(tc,FSK),title('Señal Modulada en FSK')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(cadena_bits)])
grid on
subplot(5,2,9)
plot(tc,PSK),title('Señal Modulada en PSK')
axis([0 max(tc) -Ac Ac]),
set(gca,'XTick',[0:(1/fc):(1/fc)*length(cadena_bits)])
grid on
subplot(5,2,4)
titulo=cat(2,'Datos unipolar positiva ',cadena_bits);
plot (NRZ_UP), grid on,title(titulo)

subplot(5,2,6)
titulo=cat(2,'Datos unipolar negativa ',cadena_bits);
plot (NRZ_UN), grid on,title(titulo)

subplot(5,2,8)
titulo=cat(2,'Datos polar ',cadena_bits);
plot (NRZ_POL), grid on,title(titulo)