function [collisions] = initSimulation(fis)
    collisions = collisionsFixedObstacles(fis);
end

function [mean] = collisionsFixedObstacles(fis)
    obstacles = initObstacles();
    %initPlot();
    %plotObstacles(obstacles);
    
    total = 0;
    collisions = 0;
    for x = 10 : 10 : 50
        for y = 10 : 10 : 90
            for angle = -pi/2 : pi/3 : pi/2
                robot = initRobot(x, y, angle, 1);
                %plota o robo no inicio da simulacao
                %plotRobot(robot);
                stats = start(robot, obstacles, fis);
                collisions = collisions + stats.collision;
                total = total + 1;
            end
        end
    end
    
    mean = collisions / total;
end