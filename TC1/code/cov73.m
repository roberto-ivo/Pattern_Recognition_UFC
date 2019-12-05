function [Cx_73, time] = cov73(X, N, p)
    tic
    
    for n = 0:N
        if n == 0
            % Cálculo do vetor médio de modo recursivo
            m_ant = zeros(1, p);

            % Cálculo da matriz de correlação de modo recursivo
            rx_ant = ones(p);
        else
            alpha = (n - 1) / n;
            x = X(n, :);

            % Cálculo do vetor médio de modo recursivo
            m = alpha*m_ant + (1-alpha)*x;
            m_ant = m;

            % Cálculo da matriz de correlação de modo recursivo
            Rx = alpha*rx_ant + (1-alpha)*(x' * x);
            rx_ant = Rx;
        end
    end
    
    Cx_73 = Rx - (m' * m);
    
    time = toc;
end