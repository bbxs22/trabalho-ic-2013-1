function [stats] = initTrialStatistics()
    %Inicializa as estatisticas da rodada
    %@return estrutura de estatistica inicializada
    
    stats.collision.total = 0;
    stats.collision.mean = 0;
    
    stats.steps.total = 0;
    stats.steps.mean = 0;
end