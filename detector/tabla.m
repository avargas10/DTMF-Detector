%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Tabla 
% Muestra el numero correspondiente a las frecuencias de tonos almacenados 
% en FBAJA ( frecuencia baja ) y FALTA ( frecuencias altas ) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
switch FBAJA ; 
case 697 ; 
switch FALTA ; 
case 1209 disp('1'); 
case 1336 disp('2'); 
case 1477 disp('3'); 
end 
case 770 ; 
switch FALTA ; 
case 1209 disp('4'); 
case 1336 disp('5'); 
case 1477 disp('6'); 
end 
case 852 ; 
switch FALTA ; 
case 1209 disp('7'); 
case 1336 disp('8'); 
case 1477 disp('9'); 
end 
case 941 ; 
switch FALTA ; 
case 1336 disp('0'); 
end 
end