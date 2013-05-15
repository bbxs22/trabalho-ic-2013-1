function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    fis = readfis('robot');
    initPlot();   
    robot = initRobot(10, 10, random(-pi/2, pi/2), 3);
    plotRobot(robot);
    obstacles = initObstacles(5);
    plotObstacles(obstacles);
    
    start(robot, obstacles,  fis);
end