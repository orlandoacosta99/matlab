%limpiamos la consola
clc
clear all
close all

%---- DATA IN --

text=input('ingrese la palabra que requiere cifrar: ', 's');
x=double(text);

%--- PROCESS ---
for i=1:length(x)
    y(i)=x(i)+3;
end

cesar= char(y);
fprintf('Codigo Cesar');
display(cesar);


g=double(cesar);


for i=1:length(g)
    y(i)=g(i)-3;
end

cesar= char(y);
fprintf('Codigo Cesar desifrado');
display(cesar);



