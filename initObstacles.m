function [obstacles] = initObstacles()
    %Inicializa obstaculos
    %@return matriz de obstaculos (1 x total)
    
    obstacles = [initFixedObstacles(); initFixedObstacles2(); initFixedObstacles3()];
    %obstacles = initRandomObstacles(5);
end

function [obstacles] = initFixedObstacles()
    %Inicializa 5 obstaculos em posicoes predefinidas
    %@return matriz de obstaculos (1 x total)
    
    obstacles(1).x = 60;
    obstacles(1).y = 40;
    obstacles(1).radius = 3;
    obstacles(2).x = 100;
    obstacles(2).y = 30;
    obstacles(2).radius = 3;
    obstacles(3).x = 80;
    obstacles(3).y = 80;
    obstacles(3).radius = 3;
    obstacles(4).x = 120;
    obstacles(4).y = 60;
    obstacles(4).radius = 3;
    obstacles(5).x = 160;
    obstacles(5).y = 20;
    obstacles(5).radius = 3;
end

function [obstacles] = initFixedObstacles2()
    %Inicializa 5 obstaculos em posicoes predefinidas
    %@return matriz de obstaculos (1 x total)
    
    obstacles(1).x = 140;
    obstacles(1).y = 10;
    obstacles(1).radius = 3;
    obstacles(2).x = 100;
    obstacles(2).y = 30;
    obstacles(2).radius = 3;
    obstacles(3).x = 60;
    obstacles(3).y = 50;
    obstacles(3).radius = 3;
    obstacles(4).x = 100;
    obstacles(4).y = 70;
    obstacles(4).radius = 3;
    obstacles(5).x = 140;
    obstacles(5).y = 90;
    obstacles(5).radius = 3;
end

function [obstacles] = initFixedObstacles3()
    %Inicializa 5 obstaculos em posicoes predefinidas
    %@return matriz de obstaculos (1 x total)
    
    obstacles(1).x = 60;
    obstacles(1).y = 60;
    obstacles(1).radius = 3;
    obstacles(2).x = 80;
    obstacles(2).y = 30;
    obstacles(2).radius = 3;
    obstacles(3).x = 80;
    obstacles(3).y = 80;
    obstacles(3).radius = 3;
    obstacles(4).x = 120;
    obstacles(4).y = 40;
    obstacles(4).radius = 3;
    obstacles(5).x = 160;
    obstacles(5).y = 60;
    obstacles(5).radius = 3;
end

function [obstacles] = initRandomObstacles(total)
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
