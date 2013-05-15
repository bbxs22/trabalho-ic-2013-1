function init()
    %Inicializa o programa
    
    clear all; close all; clc;
    fis = readfis('robot');
    
    %collisionsFixedObstacles(fis);
    %fprintf('\n');
    %collisionsAndSteps(fis);
    %fprintf('\n');
    %collisionsPerNumObstaclesAndSteps(fis);
    collisionsPerNumObstaclesAndStepsRandomObstacles(fis)
end

function collisionsFixedObstacles(fis)
    fprintf('Collisions with Fixed Obstacles\n');
    
    initPlot();
    
    obstacles = initObstacles(5);
    obstacles(1).x = 140;
    obstacles(1).y = 10;
    obstacles(2).x = 100;
    obstacles(2).y = 30;
    obstacles(3).x = 60;
    obstacles(3).y = 50;
    obstacles(4).x = 100;
    obstacles(4).y = 70;
    obstacles(5).x = 140;
    obstacles(5).y = 90;
    plotObstacles(obstacles);

    robot = initRobot(randi([10 30]), randi([10 90]), random(-pi/2, pi/2), 1);
    plotRobot(robot);
    
    start(robot, obstacles, fis);
end

function collisionsAndSteps(fis)
    fprintf('Collisions and Steps\n');
    
    trials = 10; %numero maximo de simulacoes a serem rodadas
    samples = 100; %numero de amostras a serem coletadas por simulacao
    
    stats = initStatistics();
    for i = 1 : trials
        trialStats = initTrialStatistics();
        for j = 1 : samples
            obstacles = initObstacles(5);
            robot = initRobot(randi([10 90], 1), randi([10 40], 1), random(-pi/2, pi/2), 1);
            trialStats = addTrialStatistics(trialStats, start(robot, obstacles, fis));
        end
        trialStats = closeTrialStatistics(trialStats); % calcula a media de colisoes e passos das "samples" amostras
        stats = addStatistics(stats, trialStats); % calcula a soma dos x^2 e dos x
        
        temp = closeStatistics(stats); % calcula o dp e a media ate o momento
        if ((2 * 1.96 * temp.collision.standardDeviation) / sqrt(stats.collision.trials) < 0.1 * temp.collision.mean)
            if ((2 * 1.96 * temp.steps.standardDeviation) / sqrt(stats.steps.trials) < 0.1 * temp.steps.mean)
                break
            end
        end
    end
    stats = closeStatistics(stats);
    fprintf('Collision: %.4f %.4f   Steps: %.4f %.4f\n', stats.collision.mean, stats.collision.standardDeviation, stats.steps.mean, stats.steps.standardDeviation);
end

function collisionsPerNumObstaclesAndSteps(fis)
    fprintf('Collisions Per NumObstacles And Steps\n');
    
    trials = 10; %numero maximo de simulacoes a serem rodadas
    samples = 100; %numero de amostras a serem coletadas por simulacao
    
    for numObstacles = 5 : 1 : 8
        
        % gera os obstaculos em posicoes aleatorias
        allObstacles = [];
        for i = 1 : (trials*samples)
            obstacles = initObstacles(numObstacles);
            allObstacles = [allObstacles, obstacles];
        end

        for v = [0.5 1 2 3]
            stats = initStatistics();
            for i = 1 : trials
                trialStats = initTrialStatistics();
                for j = 1 : samples
                    obstacles = allObstacles((numObstacles * (i*j - 1) + 1) : numObstacles * i*j);
                    robot = initRobot(50, 10, 0, v);
                    trialStats = addTrialStatistics(trialStats, start(robot, obstacles, fis));
                end
                trialStats = closeTrialStatistics(trialStats); % calcula a media de colisoes e passos das "samples" amostras
                stats = addStatistics(stats, trialStats); % calcula a soma dos x^2 e dos x
                temp = closeStatistics(stats); % calcula o dp e a media ate o momento
                
                if ((2 * 1.96 * temp.collision.standardDeviation) / sqrt(stats.collision.trials) < 0.1 * temp.collision.mean)
                    if ((2 * 1.96 * temp.steps.standardDeviation) / sqrt(stats.steps.trials) < 0.1 * temp.steps.mean)
                        break
                    end
                end
            end
            stats = closeStatistics(stats);
            fprintf('NumObst.: %d   Veloc.: %.1f   Collision: %.4f %.4f   Steps: %.4f %.4f\n', numObstacles, v, stats.collision.mean, stats.collision.standardDeviation, stats.steps.mean, stats.steps.standardDeviation);
        end
    end    
end

function collisionsPerNumObstaclesAndStepsRandomObstacles(fis)
    fprintf('Collisions Per NumObstacles And Steps - Random Obstacles\n');
    
    trials = 30; %numero maximo de simulacoes a serem rodadas
    samples = 100; %numero de amostras a serem coletadas por simulacao
    
    for numObstacles = 5 : 1 : 8

        for delta = [1 2 3]
            stats = initStatistics();
            for i = 1 : trials
                trialStats = initTrialStatistics();
                for j = 1 : samples
                    obstacles = initObstacles(numObstacles);
                    robot = initRobot(50, 10, 0, delta);
                    trialStats = addTrialStatistics(trialStats, start(robot, obstacles, fis));
                end
                trialStats = closeTrialStatistics(trialStats); % calcula a media de colisoes e passos das "samples" amostras
                stats = addStatistics(stats, trialStats); % calcula a soma dos x^2 e dos x
                temp = closeStatistics(stats); % calcula o dp e a media ate o momento
                
                if ((2 * 1.96 * temp.collision.standardDeviation) / sqrt(stats.collision.trials) < 0.1 * temp.collision.mean)
                    if ((2 * 1.96 * temp.steps.standardDeviation) / sqrt(stats.steps.trials) < 0.1 * temp.steps.mean)
                        break
                    end
                end
            end
            stats = closeStatistics(stats);
            fprintf('NumObst.: %d   Delta.: %.1f   Collision: %.4f %.4f   Steps: %.4f %.4f\n', numObstacles, delta, stats.collision.mean, stats.collision.standardDeviation, stats.steps.mean, stats.steps.standardDeviation);
        end
    end    
end