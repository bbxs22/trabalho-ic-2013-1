function [final] = closeStatistics(stats)
    %Calcula o estimador da media e do desvio padrao, baseado nos dados
    %coletados das rodadas, da simulacao
    %@param stats: estatistica. Deve ser inicializada com
    %initStatistics()
    %@return dados estatisticos da simulacao
    
    final.collision.mean = stats.collision.sumX / stats.collision.trials;
    final.steps.mean = stats.steps.sumX / stats.steps.trials;
    
    final.collision.standardDeviation = stats.collision.trials * (final.collision.mean ^ 2);
    final.collision.standardDeviation = final.collision.standardDeviation + stats.collision.sumX2;
    final.collision.standardDeviation = final.collision.standardDeviation - 2 * final.collision.mean * stats.collision.sumX;
    final.collision.standardDeviation = sqrt(final.collision.standardDeviation / (stats.collision.trials - 1));
    
    final.steps.standardDeviation = stats.steps.trials * (final.steps.mean ^ 2);
    final.steps.standardDeviation = final.steps.standardDeviation + stats.steps.sumX2;
    final.steps.standardDeviation = final.steps.standardDeviation - 2 * final.steps.mean * stats.steps.sumX;
    final.steps.standardDeviation = sqrt(final.steps.standardDeviation / (stats.steps.trials - 1));
end