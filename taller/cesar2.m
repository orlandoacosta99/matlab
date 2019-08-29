%limpiamos la consola
clc
clear all
close all

%---- DATA IN --


texto_claro = 'hola HOLA XYZ xyz lmnño LMNÑO';
%--- PROCESS ---

assi = double(texto_claro);
tk_cesar = assi + 3;
criptograma = char(tk_cesar);

%--- OUTPUT ---

fprintf('texto claro: %s\n', texto_claro)
fprintf('Criptograma: %s\n', criptograma)
