function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    fis = readfis('robot');
    initPlot();   
    robot = initRobot(10, 10, random(-pi/2, pi/2));
    plotRobot(robot);
    obstacles = initObstacles(5);
    plotObstacles(obstacles);
    
    start(robot, obstacles,  fis);
end

function initPlot()
    %Inicializa o grafico
    %Eixo x de 0 a 200
    %Eixo y de 0 a 100
    
    xlim([0 200]);
    ylim([0 100]);
end

function [robot] = initRobot(x, y, angle)
    %Inicializa o robo
    %@param x: posicao inicial do robo no eixo x
    %@param y: posicao inicial do robo no eixo y
    %@param angle: angulo inicial de visao do robo (em radianos)
    %@return o robo
    
    robot.x = x;
    robot.y = y;
    robot.radius = 6;
    robot.angle = angle;
    robot.stepX = 3; %passo dado pelo robo no movimento (x, y)
    robot.stepY = 3; %passo dado pelo robo no movimento (x, y)
end

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

function [r] = random(min, max)
    %Geracao de numero real aleatorio entre @min e @max
    %@param min: valor minimo
    %@param max: valor maximo
    %@return valor aleatorio no intervalo [@min, @max]
    
    r = min + (max - min) .* rand();
end

function start(robot, obstacles, fis)
    %Inicia a simulacao
    %@param robot: o robo
    
    step = 0;
    while ~detectCollision(robot, obstacles) && robot.x < 200
        phi = robot.angle; % angulo atual do robo
        yr = robot.y; % yr do robo
        d = minDistance(robot, getVisibleObstacles(robot, obstacles));
        teta = evalfis([radtodeg(phi), d, yr], fis); % depende da regra fuzzy
        robot = moveRobot(robot, phi + degtorad(teta)); % movimenta o robo
        plotRobot(robot); % plota o robo
        
        pause(0.5); % aguarda por 500ms
        step = step + 1;
    end
end

function [visibleObstacles] = getVisibleObstacles(robot, obstacles) 
    %Separa os obstaculos visiveis pelo robo
    %@param robot: o robo
    %@param obstacles: obstaculos
    %@return obstaculos visiveis
    
    visibleObstacles = [];
    for i = 1 : 1 : size(obstacles, 2)
        if obstacles(i).x >= robot.x
            line1 = [robot.x, robot.y] + robot.radius*[cos(robot.angle + pi/2), sin(robot.angle + pi/2)];
            line2 = [robot.x, robot.y] + robot.radius*[cos(robot.angle - pi/2), sin(robot.angle - pi/2)];
            y1 = tan(robot.angle) * obstacles(i).x - tan(robot.angle) * line1(1) + line1(2);
            y2 = tan(robot.angle) * obstacles(i).x - tan(robot.angle) * line2(1) + line2(2);
            
            % verifica se o obstaculo possui o centro dentro da regiao
            if min(y1, y2) <= obstacles(i).y && obstacles(i).y <= max(y1, y2)
                visibleObstacles = cat(2, visibleObstacles, obstacles(i));
            % verifica se alguma das retas de visao intercepta o obstaculo
            else
                if abs(obstacles(i).y - min(y1, y2)) <= obstacles(i).radius || abs(obstacles(i).y - max(y1, y2)) <= obstacles(i).radius
                    visibleObstacles = cat(2, visibleObstacles, obstacles(i));
                end
            end
        end
    end
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
    x = length(find(distances < 0)) > 1 || robot.y - robot.radius < 0 || robot.y + robot.radius > 100;
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