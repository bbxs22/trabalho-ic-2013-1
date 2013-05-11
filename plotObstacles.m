function plotObstacles(obstacles)
    %Plota uma circunferencia (obstaculo) para cada obstaculo
    %@param obstacles conjunto de obstaculos
    
    for i = 1 : size(obstacles, 2)
        plotObstacle(obstacles(i));
    end
end

function plotObstacle(obstacle)
    %Plota uma circunferencia (obstaculo)
    
    plotCircle(obstacle.x, obstacle.y, obstacle.radius, 'k');
end