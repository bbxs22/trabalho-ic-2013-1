function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    initPlot();   
    robot = initRobot(10, 10, random(-pi/2, pi/2));
    plotRobot(robot);
    
    start(robot);
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

function start(robot)
    %Inicia a simulacao
    %@param robot: o robo
    
    step = 0;
    while step < 10
        phi = robot(2, 1); % angulo atual do robo
        teta = random(-pi/6, pi/6); % depende da regra fuzzy
        robot = moveRobot(robot, phi + teta); % movimenta o robo
        plotRobot(robot); % plota o robo
        
        pause(0.5); % aguarda por 500ms
        step = step + 1;
    end
end