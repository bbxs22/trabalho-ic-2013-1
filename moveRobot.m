function [robot] = moveRobot(robot, newAngle)
    %Movimenta o robo
    %@param robot o robo
    %@param newAngle angulo no qual o robo se encontra apos o movimento
    %@return o robo com dados atualizados
    
    newPosition = [robot.x robot.y] + [robot.stepX robot.stepY] .* [cos(newAngle) sin(newAngle)];
    robot.x = newPosition(1);
    robot.y = newPosition(2);
    robot.angle = newAngle;
    
    if (robot.angle < -pi)
        robot.angle = 2 * pi + robot.angle;
    elseif (robot.angle > pi)
        robot.angle = 2 * pi - robot.angle;
    end
end