function [robot] = moveRobot(robot, newAngle)
    %Movimenta o robo
    %@param robot o robo
    %@param newAngle angulo no qual o robo se encontra apos o movimento
    %@return o robo com dados atualizados
    
    newPosition = robot(1, :) + robot(3, :) .* [cos(newAngle) sin(newAngle)];
    robot(1, :) = newPosition;
    robot(2, :) = [newAngle 0];
end