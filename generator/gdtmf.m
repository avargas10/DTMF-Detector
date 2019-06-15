%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%FUNCION GENERADORA DE VARIOS TONOS DTMF 
%La función es de la forma: gdtmf(nummarc,ti,td) 
%nummarc es un vector que contiene al numero a generarse 
%ti	es el tiempo de duración de cada tono en segundos 
%	todos los tonos tienen la misma duración de ti segundos 
%td	es la duración en segundos del silencio que existe entre tono y tono 
%	todos los silencios tienen la misma duración 
%EJEMPLO: Si se desa generar tonos para el numero 5223277 
%con una duración de tonos de 100ms y tiempo de silencio entre 
%tono y tono de 50ms se debe ingresar el siguiente comando: 
%gdtmf([5 2 2 3 2 7 7],0.1,0.05) %Se escucharan los tonos generados 
%y estos seran grabados en un archivo llamado dtmf2.wav 
%IMPORTANTE: Se requiere además del programa genera.m 
%ver ayuda de dicho archivo para mayor detalle 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function gdtmf(nummarc,ti,td); 
    yy=0; fs=8000;%frecuencia de muestreo 
    deltat=0.000125;%delta de tiempo 
    t=[0:deltat:ti]; 
    digitos=[1 2 3 'A' 4 5 6 'B' 7 8 9 'C' '*' 0 '#' 'D']; 
    frecuencias=[697 697 697 697 770 770 770 770 852 852 852 852 941 941 941 941; 1209 1336 1477 1633 1209 1336 1477 1633 1209 1336 1477 1633 1209 1336 1477 1633]; 
    for I=1:length(nummarc),%se anliza elemento por elemento vector que contiene el numero marcado 
        for J=1:length(digitos), 
            if digitos(J)==nummarc(I)%se compara con tabla predeterminada 
            f1=frecuencias(1,J);%se detecta frecuencia DTMF de acuerdo a tabla 
            f2=frecuencias(2,J); 
            yy=genera(f1,f2,fs,yy,td,deltat,t);%se genera tono DTMF 
            J=1; 
            endif 
        endfor 
    endfor 
    yy=yy; 
    #sound(yy,fs); 
    wavwrite(yy,'dtmf2.wav');%se graba archivo con el nombre dtmf2.wav 
endfunction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Diseñado para el proyecto "Detección de tonos DTMF usando el algoritmo de Goertzel" del 
%curso de Procesamiento Digital de Señales % %Integrantes del grupo: 
% % - Miguel Rosadio Rojas % - Julio Manco Vasquez % - Jaime Castro Amaro 
% %Copyrigth Diciembre del 2003 %Todos los derechos reservados 
%Se permite el uso del código siempre y cuando se mencione la fuente de donde lo obtuvo. 
%http://dsp_peru.tripod.com %%	Pontificica Universidad Católica del Perú 
%	Facultad de Ciencias e Ingeniería %	Sección Electricidad y Electrónica	
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%