clc 
clear all
close all

%data in
textoClaro = 'hola mundo'

%process
ascii = double(textoClaro);

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

%output
fprintf('Texto claro: %s\n', textoClaro);
fprintf('Texto en Criptograma: %s\n', criptograma);