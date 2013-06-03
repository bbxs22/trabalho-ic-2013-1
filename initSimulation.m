function [steps collisions] = initSimulation(fis)
    [steps collisions] = collisionsFixedObstacles(fis);
end

function [meanS, meanC] = collisionsFixedObstacles(fis)
    obstacles = initObstacles();
    %initPlot();
    %plotObstacles(obstacles);
    
    meanS = ones(1, 3);
    meanC = ones(1, 3);
    
    for i = 1 : 3
        totalC = 0;
        collisions = 0;
        totalS = 0;
        steps = 0;
    
        for x = 10 : 10 : 50
            for y = 10 : 10 : 90
                for angle = -pi : pi/4 : pi
                    robot = initRobot(x, y, angle, 1);
                    %plota o robo no inicio da simulacao
                    %plotRobot(robot);
                    stats = start(robot, obstacles(i, :), fis);
                    collisions = collisions + stats.collision;
                    totalC = totalC + 1;
                    if ~stats.collision
                        steps = steps + stats.steps;
                        totalS = totalS + 1;
                    end
                end
            end
        end
        meanS(1, i) = steps / totalS;
        meanC(1, i) = collisions / totalC;
    end
    
    meanS = sum(meanS) / 3;
    meanC = sum(meanC) / 3;
    
    %meanS = steps / totalS;
    %meanC = collisions / totalC;
end