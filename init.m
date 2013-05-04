function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    initPlot();   
    robot = initRobot(10, 10, random(-pi/2, pi/2));
    plotRobot(robot);
end

function initPlot()
    %Inicializa o grafico
    %Eixo x de 0 a 200
    %Eixo y de 0 a 100
    
    xlim([0 200]);
    ylim([0 100]);
end

function [robot] = initRobot(x, y, angle)
    %Inicializa o robo
    %@param x: posicao inicial do robo no eixo x
    %@param y: posicao inicial do robo no eixo y
    %@param angle: angulo inicial de visao do robo (em radianos)
    %@return o robo
    
    step = [12 12]; %passo dado pelo robo no movimento (x, y)
    robot = [[x, y]; [angle 0]; step];
end

function [r] = random(min, max)
    %Geracao de numero real aleatorio entre @min e @max
    %@param min: valor minimo
    %@param max: valor maximo
    %@return valor aleatorio no intervalo [@min, @max]
    
    r = min + (max-(min)) .* rand();
end