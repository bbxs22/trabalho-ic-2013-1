function [visibleObstacles] = getVisibleObstacles(robot, obstacles) 
    %Separa os obstaculos visiveis pelo robo
    %@param robot: o robo
    %@param obstacles: obstaculos
    %@return obstaculos visiveis
    
    visibleObstacles = [];
    for i = 1 : 1 : size(obstacles, 2)
        angle = calculateAngle(robot, obstacles(i));
        if 0 <= angle && angle <= pi/2 % verifica se o obstaculo esta "na frente" do robo
            line1 = [robot.x, robot.y] + (robot.radius+10)*[cos(robot.angle + pi/2), sin(robot.angle + pi/2)];
            line2 = [robot.x, robot.y] + (robot.radius+10)*[cos(robot.angle - pi/2), sin(robot.angle - pi/2)];
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

function [angle] = calculateAngle(robot, obstacle)
    %Calcula o angulo entre o vetor de direcao do robo e o vetor de observacao do obstaculo
    %@param robot: o robo
    %@param obstacles: obstaculos
    %@return angulo em radianos
    
    vectorObstacle = [obstacle.x - robot.x, obstacle.y - robot.y];
    vectorDirection = robot.radius * [cos(robot.angle), sin(robot.angle)]';
    angle = acos((vectorObstacle * vectorDirection) / (norm(vectorObstacle) * norm(vectorDirection)));
end