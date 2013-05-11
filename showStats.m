function showStats(robot, obstacles, collision, step)
    fprintf('-- Robo --------------\n')
    fprintf('[X, Y]: %f, %f\n', robot.start.x, robot.start.y)
    fprintf('Phi: %f\n', robot.start.angle)
    %fprintf('[stepX, stepY]: %f\n', robot.start.stepX, robot.start.stepY)
    fprintf('-- Obstaculos --------\n')
    for i = 1 : 1 : size(obstacles, 2)
        fprintf('[X, Y]: %f, %f\n', obstacles(i).x, obstacles(i).y)
    end
    
    fprintf('\n\n')
    
    fprintf('-- Robo --------------\n')
    fprintf('[X, Y]: %f, %f\n', robot.x, robot.y)
    fprintf('Phi: %f\n', robot.angle)
    %fprintf('[stepX, stepY]: %f\n', robot.stepX, robot.stepY)
    fprintf('Total de passos %d\n', step)
    fprintf('Colidiu? %d\n', collision)
end