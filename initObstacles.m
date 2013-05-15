function [obstacles] = initObstacles(total)
    %Inicializa obstaculos em posicoes aleatorias (definidas por xlim para
    %eixo x e ylim para eixo y)
    %@param total: quantidade de obstaculos a serem gerados
    %@return matriz de obstaculos (1 x total)
    
    rangeX = [50, 197];
    rangeY = [3, 97];
    
    %Inicializando a estrutura
    obstacles(total).x = 0;
    obstacles(total).y = 0;
    obstacles(total).radius = 0;
    
    %Criando o primeiro par de posicoes
    obstacles(1).x = randi(rangeX, 1);
    obstacles(1).y = randi(rangeY, 1);
    obstacles(1).radius = 3;
    
    %Gerando novos x,y sem que colidam com os anteriores
    for i = 2 : 1 : total
       collision = true;
       x = randi([50, 197], 1);
       y = randi([3, 97], 1);
       
       while collision
           for j = 1 : 1 : i - 1
               xj = obstacles(j).x;
               yj = obstacles(j).y;
               if (xj - 3 <= x) && (x <= xj + 3) && (yj - 3 <= y) && (y <= yj + 3)
                   x = randi(rangeX, 1);
                   y = randi(rangeY, 1);
                   break
               else
                  collision = false; 
               end
           end
       end
       
       obstacles(i).x = x;
       obstacles(i).y = y;
       obstacles(i).radius = 3;
    end
end