%limpiamos la consola
clc
clear all
close all

%---- DATA IN --
%datos digitales

datos='10101100101';
tb=100;
tb_RZ = tb/2;

regla_bit_alto = 1; %posibles opciones: 1 v 0

% datos NRZ UP positiva
regla_NRZ_UP_alto=1;
A=12;
% datos NRZ UP positiva
regla_NRZ_UN_alto=1;
% datos polar
regla_NRZ_Polar_alto=1;

% datos unipolar RZ
regla_unipolar_RZ_alto=1;

%--- PROCESS ---


%construccion de los datos digitales

cero = zeros(1,tb);
uno = ones(1,tb);

uno_RZ = [ones(1,tb_RZ) zeros(1,tb_RZ)];



cadena = [];
cadenaInversa=[];


cadenaPolar=[];
cadenaPolarInversa=[];

cadena_RZ=[];
cadenaInversa_RZ=[];


for m=1:length(datos)
   
      if (datos(m)=='1')
       cadena = [cadena uno];
       cadenaInversa = [cadenaInversa cero];
       
       cadenaPolar = [cadenaPolar uno];
       cadenaPolarInversa = [cadenaPolarInversa -uno];
       
       cadena_RZ = [cadena_RZ uno_RZ];
       cadenaInversa_RZ = [cadenaInversa_RZ cero];
       
    
       else
       cadena = [cadena cero];
       cadenaInversa = [cadenaInversa uno];
       
       cadenaPolar = [cadenaPolar -uno];
       cadenaPolarInversa = [cadenaPolarInversa uno];
       
       cadena_RZ = [cadena_RZ cero];
       cadenaInversa_RZ = [cadenaInversa_RZ uno_RZ];
       
       
       
      end
      
end


if(regla_bit_alto == 1)
    bitstream = 5*cadena;
else
    bitstream = 5*cadenaInversa;
end
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

% polar 
if (regla_NRZ_Polar_alto==1)
    NRZ_PO= A*cadenaPolar;
else
    NRZ_PO= A*cadenaPolarInversa;
end


% unipolar RZ
if (regla_unipolar_RZ_alto==1)
    unipolar_RZ = A*cadena_RZ;
else
    unipolar_RZ = A*cadenaInversa_RZ;
end


%--- OUTPUT ---
figure (1)
subplot(5,1,1),plot(bitstream),title('Bits de Entrada'), grid on 

subplot(5,1,2),plot(NRZ_UP),title('Unipolar Positiva'), grid on

subplot(5,1,3),plot(NRZ_UN),title('Unipolar Negativa'), grid on

subplot(5,1,4),plot(NRZ_PO), title('Polar NRZ'),grid on

subplot(5,1,5),plot(unipolar_RZ), title('Unipolar RZ'),grid on