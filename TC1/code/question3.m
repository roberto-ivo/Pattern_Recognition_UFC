function [CxB, rankB, rcondB, CxG, rankG, rcondG] = question3(data)
    % classe 'g' = 1; classe 'b' = 0;
    XB = data(data(:, end) == 0, 1:end-1);
    XG = data(data(:, end) == 1, 1:end-1);
    
    % Matriz de Covariancia utilizando a Equacao 69
    % Cov - Classe b
    NB = size(XB, 1);
    RxB = (XB' * XB) / NB;
    MB = mean(XB);
    CxB = RxB - (MB' * MB);
    rankB = rank(CxB);
    rcondB = rcond(CxB);
    
    % Cov - Classe g
    NG = size(XG, 1);
    RxG = (XG' * XG) / NG;
    MG = mean(XG);
    CxG = RxG - (MG' * MG);
    rankG = rank(CxG);
    rcondG = rcond(CxG);
end