function [stats] = addTrialStatistics(stats, data)
    %Calcula a soma das amostras e o numero de amostras contabilizadas 
    %para o numero de colisoes e numero. Esses dados serao utilizados para 
    %o calculo da media na rodada
    %@param stats: estatistica anterior. Deve ser inicializada com
    %initTrialStatistics()
    %@param data: dados obtidos da amostra atual.
    %@return valores para o calculo da media da rodada atualizados com 
    %os valores da nova amostra
    
    stats.collision.total = stats.collision.total + 1;
    stats.collision.mean = stats.collision.mean + data.collision;
    
    % contabiliza passos apenas se nao houve colisao
    if ~data.collision
        stats.steps.total = stats.steps.total + 1;
    end
    stats.steps.mean = stats.steps.mean + data.steps;
end