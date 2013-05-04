function plotObstacles(obstacles)
    %Plota uma circunferencia (obstaculo) de raio 3 para cada obstaculo
    %@param obstacles conjunto de obstaculos
    
    for i = 1 : size(obstacles, 1)
        plotObstacle(obstacles(i,:));
    end
end

function plotObstacle(obstacle)
    %Plota uma circunferencia (obstaculo) de raio 3
    
    plotCircle(obstacle(1), obstacle(2), 3, 'k');
end