function [r] = random(min, max)
    %Geracao de numero real aleatorio entre @min e @max
    %@param min: valor minimo
    %@param max: valor maximo
    %@return valor aleatorio no intervalo [@min, @max]
    
    r = min + (max - min) .* rand();
end