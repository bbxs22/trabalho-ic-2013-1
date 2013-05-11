function plotRobot(robot)
    %Plota uma circunferencia (robo) com a direcao de observacao
    %@param robot o robo
    
    plotCircle(robot.x, robot.y, robot.radius, 'b');
    plotDirection(robot.x, robot.y, robot.angle);
    %plotVision(robot);
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

function plotVision(robot)
    line1 = [robot.x, robot.y] + robot.radius*[cos(robot.angle + pi/2), sin(robot.angle + pi/2)];
    line2 = [robot.x, robot.y] + robot.radius*[cos(robot.angle - pi/2), sin(robot.angle - pi/2)];
    
    x = 0 : 1 : 200;
    y1 = tan(robot.angle) * x - tan(robot.angle) * line1(1) + line1(2);
    y2 = tan(robot.angle) * x - tan(robot.angle) * line2(1) + line2(2);
    
    hold on
    plot(x, y1, 'g');
    plot(x, y2, 'g');
end