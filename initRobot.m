function [robot] = initRobot(x, y, angle, v)
    %Inicializa o robo
    %@param x: posicao inicial do robo no eixo x
    %@param y: posicao inicial do robo no eixo y
    %@param angle: angulo inicial de visao do robo (em radianos)
    %@return o robo
    
    robot.start.x = x;
    robot.start.y = y;
    robot.start.angle = angle;
    robot.start.stepX = v;
    robot.start.stepY = v;
    
    robot.x = robot.start.x;
    robot.y = robot.start.y;
    robot.radius = 6;
    robot.angle = robot.start.angle;
    robot.stepX = robot.start.stepX; %passo dado pelo robo no movimento (x, y)
    robot.stepY = robot.start.stepY; %passo dado pelo robo no movimento (x, y)
end