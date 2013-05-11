function plotRobot(robot)
    %Plota uma circunferencia (robo) com a direcao de observacao
    %@param robot o robo
    
    plotCircle(robot.x, robot.y, robot.radius, 'b');
    plotDirection(robot.x, robot.y, robot.angle);
end

function plotDirection(x, y, angle)
    %Plota a direcao de observacao em vermelho
    %@param x posicao no eixo x do inicio do segmento
    %@param y posicao no eixo y do inicio do segmento
    %@param angle inclinacao do segmento (em radianos)
    
    direction = [x, y] + 4*[cos(angle), sin(angle)];
    hold on
    plot([x direction(1)], [y, direction(2)], 'r');
    
    if angle < 0
        angle = angle : 0.01 : 0;
    else
        angle = 0 : 0.01 : angle;
    end
    
    xPlot = 2 * cos(angle);
    yPlot = 2 * sin(angle);
    hold on
    plot(x + xPlot, y + yPlot, 'r');
end