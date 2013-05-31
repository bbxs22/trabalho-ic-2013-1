function [x, fval] = geneticAlgoritm()
    clear all; close all; clc;
    options = gaoptimset('EliteCount', 2, 'FitnessLimit', 0.3, 'Generations', 30, 'PopulationSize', 20, 'SelectionFcn', @selectionroulette);
    [x, fval] = ga(@fitness, 37, [], [], [], [], [], [], [], options);
    x = setVariables(x);
end

function y = fitness(x)
    fis = readfis('robot');
    
    x = setVariables(x);
    for i = 1 : 37
        fis.rule(i).consequent = floor(x(i));
    end

    [s c] = initSimulation(fis);
    
    y = c;
    %disp(x)
    %sprintf('Fitness: %.4f', y)
end

function y = setVariables(x)
    y = mod(round(x * 1000), 7) + 1;
end

