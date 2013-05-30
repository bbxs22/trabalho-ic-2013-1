function [collisions] = initSimulation(fis)
    collisions = collisionsFixedObstacles(fis);
end

function [mean] = collisionsFixedObstacles(fis)
    fprintf('Collisions with Fixed Obstacles\n');
    
    obstacles = initObstacles(5);
    obstacles(1).x = 140;
    obstacles(1).y = 10;
    obstacles(2).x = 100;
    obstacles(2).y = 30;
    obstacles(3).x = 60;
    obstacles(3).y = 50;
    obstacles(4).x = 100;
    obstacles(4).y = 70;
    obstacles(5).x = 140;
    obstacles(5).y = 90;
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
                %plota o robo no final da simulacao
                %plotRobot(robot);
                collisions = collisions + stats.collision;
                total = total + 1;
            end
        end
    end
    
    mean = collisions / total;
end