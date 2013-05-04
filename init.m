function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    initPlot();
    robot = initRobot(10, 10, pi/3);
    plotRobot(robot);
end

function initPlot()
    %Inicializa o grafico
    %Eixo x de 0 a 200
    %Eixo y de -50 a 50
    
    xlim([0 50]);
    ylim([-20 20]);
end

function [robot] = initRobot(x, y, angle)
    %Inicializa o robo
    %@param x: posicao inicial do robo no eixo x
    %@param y: posicao inicial do robo no eixo y
    %@param angle: angulo inicial de visao do robo (em radianos)
    
    step = [12 12]; %passo dado pelo robo no movimento (x, y)
    robot = [[x, y]; [angle 0]; step];
end