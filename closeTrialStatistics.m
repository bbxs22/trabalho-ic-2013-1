function [stats] = closeTrialStatistics(stats)
    %Calcula a media do numero de colisoes e numero de passos da rodada
    %@param stats: estatistica. Deve ser inicializada com
    %initTrialStatistics()
    %@return dados estatisticos (media) da rodada
    
    stats.collision.mean = stats.collision.mean / stats.collision.total;
    stats.steps.mean = stats.steps.mean / stats.steps.total;
end
