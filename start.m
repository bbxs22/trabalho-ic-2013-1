function [stats] = start(robot, obstacles, fis)
    %Inicia a simulacao
    %@param robot: o robo
    
    collision = false;
    step = 0;
    while robot.x < 200 && step < 1000
        if (detectCollision(robot, obstacles))
            collision = true;
            break;
        end
        
        phi = robot.angle; % angulo atual do robo
        yr = robot.y; % yr do robo
        d = minDistance(robot, getVisibleObstacles(robot, obstacles));
        teta = evalfis([radtodeg(phi), d, yr], fis); % depende da regra fuzzy
        robot = moveRobot(robot, phi + degtorad(teta)); % movimenta o robo
        %plotRobot(robot);
        step = step + 1;
    end
    
    if (step == 1000)
        collision = true;
    end
        
    stats.collision = collision;
    
    if collision
        stats.steps = 0;
    else    
        stats.steps = step;
    end
    
    %plotRobot(robot);
end

function [degrees] = radtodeg(radians)
    %Converte um angulo em radianos para graus
    %@param radians: angulo em radianos
    %@return angulo em graus
    
    degrees = 180 * radians / pi;
end

function [radians] = degtorad(degrees)
    %Converte um angulo em graus para radianos
    %@param degrees: angulo em graus
    %@return angulo em radianos
    
    radians = degrees * pi / 180;
end

function [minDistance] = minDistance(robot, obstacles)
    %Calcula a distancia para o obstaculo mais proximo
    %@param robot: o robo
    %@param obstacles: obstaculos que estao no campo de visao do robo
    %@return a distancia para o obstaculo mais proximo
    
    if size(obstacles, 1) == 0
        minDistance = 200;
    else
        distances = calculateDistance(robot, obstacles);
        minDistance = min(distances);
    end
end

function [x] = detectCollision(robot, obstacles)
    %Determina se houve colisao entre o robo e um conjunto de obstaculos e
    %entre o robo e a parede
    %@param robot: o robo
    %@param obstacles: obstaculos
    %@return se houve ou nao colisao
    
    distances = calculateDistance(robot, obstacles);   
    distances = distances - ([obstacles(1, :).radius] + robot.radius * ones(1, size(distances, 2)));
    x = length(find(distances < 0)) >= 1 || robot.y - robot.radius < 0 || robot.y + robot.radius > 100 || robot.x - robot.radius < 0;
end

function [distances] = calculateDistance(robot, obstacles)
    %Calcula a distancia entre o robo e cada um dos obstaculos
    %@param robot: o robo
    %@param obstacles: obstaculos
    %@return vetor coluna com a distancia entre o robo e o obstaculo
    
    position = repmat([robot.x robot.y], size(obstacles, 2), 1);
    obst = [obstacles(1, :).x; obstacles(1, :).y]';
    aux = (position - obst) .* (position - obst);
    distances = sqrt(aux(:, 1) + aux(:, 2))';
end