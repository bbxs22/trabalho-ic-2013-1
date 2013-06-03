function [x, fval] = geneticAlgoritm()
    clear all; close all; clc;
    options = gaoptimset('EliteCount', 2, 'FitnessLimit', 0.2, 'Generations', 100, 'PopulationSize', 10, 'SelectionFcn', @selectionroulette, 'UseParallel', 'always');
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
    fileID = fopen('output.txt', 'a');
    for i = 1 : 37
        fprintf(fileID, '%d ', x(i));   
    end
    fprintf(fileID, '\nFitness: %.4f\n', y);
    fclose(fileID);
    
    sprintf('\nFitness: %.4f\n', y)
end

function y = setVariables(x)
    y = mod(round(x * 1000), 7) + 1;
end

