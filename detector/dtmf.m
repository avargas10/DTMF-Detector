function dtmf(x) 
[y,fs,nbits]=wavread(x); 
% sound(y,fs); 
disp(' Presione cualquier tecla para deteccion de tonos '); 
pause; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Etapa de filtrado en dos bandas ,para frecuencias bajas de 697Hz a 941 Hz 
% y para frecuencias altas de 1209 Hz a 1477 Hz 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
F1=[587 687 951 1051]; 
delta1=0.000576; % rizado 0.01 db en banda de paso; 
delta2=0.00001; %atenuacion de 100db 
dev=[delta2 delta1 delta2]; 
fs=8000; 
A=[0 1 0]; 
[n,Fo,Ao,w]=remezord(F1,A,dev,fs); 
h1=remez(n,Fo,Ao,w); 
F2=[1099 1199 1487 1587]; 
delta1=0.000576; % rizado 0.01 db en banda de paso; 
delta2=0.00001; %atenuacion de 100db 
dev=[delta2 delta1 delta2]; 
fs=8000; 
A=[0 1 0]; 
[n,Fo,Ao,w]=remezord(F2,A,dev,fs); 
h2=remez(n,Fo,Ao,w); 
h=h1+h2; 
yf=filter(h,1,y); 
Y=yf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Deteccion de frecuencias y calculo de energia en tonos dtmf 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
F697=0; 
F852=0; 
F1209=0; 
F1477=0; 
F770=0; 
F941=0; 
F1336=0; 
FT697=0; 
FT852=0; 
FT1209=0; 
FT1477=0; 
FT770=0; 
FT941=0; 
FT1336=0; 
FBAJA=0; 
FALTA=0; 
n1=length(y); 
ntoma80=floor(n1/80); 
k=0; 
% Algoritmo de Goertzel 
for j=1:ntoma80 ; 
for i=1:80 ; % Fijo 
prue(i)=Y(i+k); 
i=i+1; 
end 
E=Goer(prue) ; 
% banco de filtros 
k=k+80 ; 
for l=1:7; 
% pasa a la matriz de datos previos 
EE(j,l)=E(l); % procesado de energia de tonos 
end 
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Busqueda de presencia de tono , con nivel de energia permitido 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
max=4*floor(ntoma80/4) ; % numero maximo de m tonos posibles 
k=0;m=0;
mm=0; % Para time slot minimo de 40ms 
while (m<=max) 
while (FBAJA==0 |FALTA==0 ) 
F697=0; 
F770=0 ; 
F852=0; 
F941=0 ; 
F1209=0 ; 
F1336=0; 
F1477=0 ; 
FT697=0;
FT770=0; 
FT852=0; 
FT941=0; 
FT1209=0; 
FT1336=0; 
FT1477=0; 
FBAJA=0; 
FALTA=0; 
for j=1:4 % Evaluando nivel de energia valido en time slot1 para cumplir minima duracion 
if(m+j>=max) 
FALTA=1; 
FBAJA=1; 
break ; 
end 
comparacion; 
j=j+1; 
end 
% Fin de For , Presencia de energia en frecuenias dtmf frecuencias 
% validacion de duracion minima de tono 
m=m+4; 
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Tabla de codificacion 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
if (m>max|FALTA==1|FBAJA==1) 
FALTA=0;
FBAJA=0; 
end 
tabla 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Busqueda de pause ,en señal , o fin de tono marcado 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

FT697=0; 
FT770=0; 
FT852=0; 
FT941=0; 
FT1209=0;
FT1336=0;
FT1477=0; 
mm=m ; 
while(FBAJA>0|FALTA>0) % espera que llegue pause , todavia sigue el valor anterior 
for j=1:2 % Ahora cada 20ms se chequea el nivel de cero 
if EE(j+mm,1)<15 ; % Las frecuencias que todavia tienen el valor seran unos y no ceros, cuando cambien 
F697=0 ; % todos seran ceros 
end 
if EE(j+mm,2)<15 ; 
F770=0 ; 
end 
if EE(j+mm,3)<15; F852=0 ; 
end 
if EE(j+mm,4)<15; F941=0 ; 
end 
if EE(j+mm,5)<15 ; F1209=0 ; 
end 
if EE(j+mm,6)<15; F1336=0 ; 
end 
if EE(j+mm,7)<15 ; 
F1477=0 ; 
end 
j=j+1; 
end % fin de for 
mm=mm+2; 
if(F697+F770+F852+F941+F1209+F1336+F1477==0 | mm>=max ) % Si todas las respuestas anteriores fueron cero 
FBAJA=0;
FALTA=0; 
end 
end % Fin de while _espera 
pause 
m=mm; 
mm=0; % Fin de primer tono ,empieza busqueda de siguiente tono end % Fin General
end