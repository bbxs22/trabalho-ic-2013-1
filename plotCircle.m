function plotCircle(x, y, r, color)
    %Plota uma circunferencia
    %@param x: posicao no eixo x
    %@param y: posicao no eixo y
    %@param r: raio
    %@param color: cor da circunferencia
    
    angle = 0 : 0.01 : 2*pi; 
    xPlot = r * cos(angle);
    yPlot = r * sin(angle);
    hold on
    plot(x, y, strcat('x', color));
    hold on
    plot(x + xPlot, y + yPlot, color);
end