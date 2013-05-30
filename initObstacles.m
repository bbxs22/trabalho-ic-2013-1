function [obstacles] = initObstacles()
    %Inicializa obstaculos
    %@param total: quantidade de obstaculos a serem gerados
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