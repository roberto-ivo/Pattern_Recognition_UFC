clc; clear all;
data = load('ionosphere.txt');

format long
% dataset sem o label
X = data(:, 1:end-1);

% tamanho da matriz de dados
[N, p] = size(X);

% ---------------- QUESTÃO 1 e 2 ---------------- 
fprintf('xxxxxxxxxxxxxxxxxx QUESTÃO 1 e 2 xxxxxxxxxxxxxxxxxx\n\n')

% Matriz de Covariancia - MATLAB
tic;
Cx_mat = cov(X, 1);
timeMAT = toc;
rank_global = rank(Cx_mat);
rcond_global = rcond(Cx_mat);

disp('MATLAB'); Cx_mat(1:4, 1:4)
fprintf('Time: %.6f\n\n', timeMAT);

% Matriz de Covariancia - Equacao 68
[Cx_68, time_68] = cov68(X, N, p);
disp('Equacao 68'); Cx_68(1:4, 1:4)
fprintf('Time: %.6f\n\n', time_68);

% Matriz de Covariancia - Equacao 69
[Cx_69, time_69] = cov69(X, N);
disp('Equacao 69'); Cx_69(1:4, 1:4)
fprintf('Time: %.6f\n\n', time_69);

% Matriz de Covariancia - Equacao 70
[Cx_70, time_70] = cov70(X, N);
disp('Equacao 70'); Cx_70(1:4, 1:4)
fprintf('Time: %.6f\n\n', time_70);

% Matriz de Covariancia - Equacao 73
[Cx_73, time_73] = cov73(X, N, p);
disp('Equacao 73'); Cx_73(1:4, 1:4)
fprintf('Time: %.6f\n\n', time_73);

% ------------------ QUESTÃO 3 ------------------ 
fprintf('xxxxxxxxxxxxxxxxxx QUESTÃO 3 xxxxxxxxxxxxxxxxxx\n\n')

[CxB, rankB, rcondB, CxG, rankG, rcondG] = question3(data);
disp('Matriz COV - Classe B'); CxB(1:4, 1:4)
disp('Matriz COV - Classe G'); CxG(1:4, 1:4)


% ------------------ QUESTÃO 4 ------------------ 
fprintf('xxxxxxxxxxxxxxxxxx QUESTÃO 4 xxxxxxxxxxxxxxxxxx\n')

fprintf('\n------ Posto da Matriz ------ \n\n')
fprintf('rank_global: %.2f\n', rank_global)
fprintf('rank_B: %.2f\n', rankB)
fprintf('rank_G: %.2f\n', rankG)

fprintf('\n------ Numero de Condicionamento ------ \n\n')
fprintf('rcond_global: %.2f\n', rcond_global)
fprintf('rcond_B: %.2f\n', rcondB)
fprintf('rcond_G: %.2f\n', rcondG)





