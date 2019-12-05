function [Cx_69, time] = cov69(X, N)
    tic
    
    Rx = (X' * X) / N;
    M = mean(X);
    Cx_69 = Rx - (M' * M);
    
    time = toc;
end