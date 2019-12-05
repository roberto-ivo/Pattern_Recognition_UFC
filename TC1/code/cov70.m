function [Cx_70, time] = cov70(X, N)
    tic
    
    m = mean(X);
    M = repmat(m', 1, N)';
    Cx_70 = ((X - M)' * (X - M)) / N;
    
    time = toc;
end