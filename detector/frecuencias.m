%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Validacion para un tono de duracion minimo de 40ms 
% Se considera 3 muestras de 10ms para tomarlo valido y posible interrupcion 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
if F697>=3 FT697=1 ; 
FBAJA=697; 
end 
if F770>=3 FT770=1 ; 
FBAJA=770; 
end 
if F852>=3 FT852=1 ; 
FBAJA=852; 
end 
if F941>=3 FT941=1 ; 
FBAJA=941; 
end 
if F1209>=3 FT1209=1 ; 
FALTA=1209; 
end 
if F1336>=3 FT1336=1 ; 
FALTA=1336; 
end 
if F1477>=3 FT1477=1 ; 
FALTA=1477; 
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%