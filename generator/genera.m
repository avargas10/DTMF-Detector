%GENERA UN TONO DTMF 
%Este programa es parte del programa principal GDTMF 
%se puede usar para otros propósitos 
%pero en caso de usarse para generación de múltiples tonos DTMF 
%debe estar en el mismo directorio que el programa principal. 
%yy=genera(F1,F2,Fs,yn,td,deltat,t) 
%F1 y F2 son las frecuencias que definen el tono DTMF 
%Fs es la frecuencia de muestreo 
%yn es la señal en la cual se generará el archivo con tdos los tonos DTMF 
%td es el tiempo que dura el silencio entre tono y tono 
%deltat es el delta de tiempo (incremento de t entre muestra y muestra) 
%t vector de tiempo % 
%El tono generado se guarda en la variable yy 

function yy=genera(F1,F2,Fs,yn,td,deltat,t) 
    y1=0.15*sin(2*pi*F1*t);
    y2=0.15*sin(2*pi*F2*t); 
    y=y1+y2; %se inserta silencio de tiempo predeterminado 
    yy=[yn y zeros(1,td/deltat)];%se agrega silencio de td segundos al final 
endfunction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Diseñado para el proyecto "Detección de tonos DTMF usando el algoritmo de Goertzel" del 
%curso de Procesamiento Digital de Señales % 
%Integrantes del grupo: % % - Miguel Rosadio Rojas % - Julio Manco Vasquez % - Jaime Castro Amaro % 
%Copyrigth Diciembre del 2003 %Todos los derechos reservados 
%Se permite el uso del código siempre y cuando se mencione la fuente de donde lo obtuvo. 
%http://dsp_peru.tripod.com % %	Pontificica Universidad Católica del Perú %	Facultad de Ciencias e Ingeniería 
%	Sección Electricidad y Electrónica	
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%