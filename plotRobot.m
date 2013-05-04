function plotRobot(robot)
    %Plota uma circunferencia (robo) de raio 6
    %@param robot o robo
    
    x = robot(1, 1);
    y = robot(1, 2);
    plotCircle(x, y, 6, 'b');
end