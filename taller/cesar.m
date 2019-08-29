%limpiamos la consola
clc
clear all
close all

%---- DATA IN --

%%text=input('ingrese la palabra que requiere cifrar: ', 's');
text= lower('hola HOLA XYZ xyz lmnño LMNÑO');

lista = ['a','b','c','d','e','f','g','h','i','j','k','m','n','ñ','o','p','q','r','s','t','u','v','x','y','z',''];

for n=1:length(lista)
    lista(n)=x(n)+3;  
end

fprintf(lista)
fprintf(text)
%--- OUTPUT ---
