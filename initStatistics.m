function [stats] = initStatistics()
    %Inicializa as estatisticas da simulacao
    %@return estrutura de estatistica inicializada
    
    stats.collision.trials = 0;
    stats.collision.sumX2 = 0;
    stats.collision.sumX = 0;
    
    stats.steps.trials = 0;
    stats.steps.sumX2 = 0;
    stats.steps.sumX = 0;
end