function [stats] = addStatistics(stats, data)
    %Calcula a soma das medias das rodadas; a soma do quadrado das médias
    %das rodadas e o numero de rodadas para o numero de colisoes e numero
    %de passos. Esses dados serao utilizados para o calculo do estimador da
    %media e da variancia atualizados com os valores da nova rodada.
    %@param stats: estatistica anterior. Deve ser inicializada com
    %initStatistics()
    %@param data: estatistica da rodada atual. Deve ser inicializada com
    %initTrialStatistics()
    %@return valores para o calculo do estimador da media e da variancia 
    %atualizados com os valores da nova rodada 
    
    stats.collision.trials = stats.collision.trials + 1;
    stats.collision.sumX2 = stats.collision.sumX2 + (data.collision.mean^2);
    stats.collision.sumX = stats.collision.sumX + data.collision.mean;
        
    stats.steps.trials = stats.steps.trials + 1;
    stats.steps.sumX2 = stats.steps.sumX2 + (data.steps.mean^2);
    stats.steps.sumX = stats.steps.sumX + data.steps.mean;
end