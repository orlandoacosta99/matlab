%limpiamos la consola
clc
clear all
close all

%---- DATA IN --
%datos digitales
datos = '00110100010';
%datos = '10101100101';
%--- PROCESS
%construcion de los datos digitales
tb=90;
regla_bit_alto = 0; %posibles opciones: 1 v 0
%regla_bit_bajo = 1; %posibles opciones: 1 v 0

% datos NRZ UP Unipolar positiva
regla_NRZ_UP_alto=1;
A=10;
% datos NRZ Unipolar positiva
regla_NRZ_UN_alto=1;
% datos polar
regla_NRZ_Polar_alto=1;

cero = zeros(1,tb);
uno = ones(1,tb);
cadena = [];
cadenaInversa=[];
cadenaPolar=[];
cadenaPolarInversa=[];


for m=1:length(datos)
   
      if (datos(m)=='0')
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
% codificacion unipolar positiva
if (regla_NRZ_UP_alto==1)
    NRZ_UP= A*cadena;
else
    NRZ_UP= A*cadenaInversa;
end
% codificacion unipolar negativa
if (regla_NRZ_UP_alto==1)
    NRZ_UN= -A*cadena;
else
    NRZ_UN= -A*cadenaInversa;
end
%  codificacion polar 
if (regla_NRZ_Polar_alto==1)
    NRZ_Pol= A*cadenaPolar;
else
    NRZ_Pol= A*cadenaPolarInversa;
end


%--- OUTPUT ---
figure (1)
subplot(4,1,1), plot (bitstream), title('bit'), grid on 

subplot(4,1,2), plot (NRZ_UP), title('unipolar positiva'), grid on

subplot(4,1,3), plot (NRZ_UN), title('unipolar negativa'), grid on

subplot(4,1,4), plot (NRZ_Pol), title('polar'), grid on
