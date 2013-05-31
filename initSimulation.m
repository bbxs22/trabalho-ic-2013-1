function [steps collisions] = initSimulation(fis)
    [steps collisions] = collisionsFixedObstacles(fis);
end

function [meanS, meanC] = collisionsFixedObstacles(fis)
    obstacles = initObstacles();
    %initPlot();
    %plotObstacles(obstacles);
    
    totalC = 0;
    collisions = 0;
    totalS = 0;
    steps = 0;
    for x = 10 : 10 : 50
        for y = 10 : 10 : 90
            for angle = -pi/2 : pi/3 : pi/2
                robot = initRobot(x, y, angle, 1);
                %plota o robo no inicio da simulacao
                %plotRobot(robot);
                stats = start(robot, obstacles, fis);
                collisions = collisions + stats.collision;
                totalC = totalC + 1;
                if ~stats.collision
                    steps = steps + stats.steps;
                    totalS = totalS + 1;
                end
            end
        end
    end
    
    meanS = steps / totalS;
    meanC = collisions / totalC;
end