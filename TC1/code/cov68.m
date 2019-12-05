function [Cx_68, time] = cov68(X, N, p)
    tic
    
    M = mean(X);
    soma = zeros(p, p);

    for i = 1:N
        soma = soma + (X(i, :) - M)' * (X(i, :)-M);
    end

    Cx_68 = soma / N;
    
    time = toc;
end