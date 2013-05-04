function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    initPlot();
    plotCircle(10, 10, 3, 'b');
end

function initPlot()
    %Inicializa o grafico
    %Eixo x de 0 a 200
    %Eixo y de -50 a 50
    
    xlim([0 50]);
    ylim([-20 20]);
end