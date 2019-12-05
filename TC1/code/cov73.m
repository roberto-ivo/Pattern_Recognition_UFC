function [Cx_73, time] = cov73(X, N, p)
    tic
    
    for n = 0:N
        if n == 0
            % C�lculo do vetor m�dio de modo recursivo
            m_ant = zeros(1, p);

            % C�lculo da matriz de correla��o de modo recursivo
            rx_ant = ones(p);
        else
            alpha = (n - 1) / n;
            x = X(n, :);

            % C�lculo do vetor m�dio de modo recursivo
            m = alpha*m_ant + (1-alpha)*x;
            m_ant = m;

            % C�lculo da matriz de correla��o de modo recursivo
            Rx = alpha*rx_ant + (1-alpha)*(x' * x);
            rx_ant = Rx;
        end
    end
    
    Cx_73 = Rx - (m' * m);
    
    time = toc;
end