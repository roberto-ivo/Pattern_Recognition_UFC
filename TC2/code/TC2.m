% Trabalho 2 - Reconhecimento de Padroes
% Aluno: Roberto Fernandes Ivo - 04/12/2019

%% Limpar variaveis do workspace
clear all; close all; clc;

tic

%% Carregar dataset
load('data/dataset-15x16.mat');
% load('data/dataset-30x32.mat');
% load('data/dataset-60x64.mat');
% load('data/dataset-120x128.mat');

[sizeInputs, sizeAtri] = size(data);

%% Parâmetros
ptrn = 0.8;
iteracoes = 10;
numClasses = 20;

% variaveis para armazenar resultados
all_acc = [];
all_pred = [];

all_acc_NN = [];    
all_acc_DMC = [];   
all_acc_CQ = [];    
all_acc_MQL = [];
all_pred_NN = [];
all_pred_DMC = [];
all_pred_CQ = [];
all_pred_MQL = [];

fprintf('Starting Training...\n');
for i = 1:iteracoes
    Xtrain = [];  Ytrain = [];
    Xtest = []; Ytest = [];
    
    % hold out
    dados = data(randperm(sizeInputs), :);
    
    for ind = 1:numClasses
        % quantidade de amostras por classe
        X_Class = dados(dados(:, end) == ind, 1:end-1);

        % quantidade de amostras para treino
        sizeTr = floor(size(X_Class, 1)*ptrn);
        
        Xtrn = X_Class(1:sizeTr, :);
        Ytrn = ind.* ones(size(Xtrn, 1),1);
        Xts = X_Class(sizeTr+1:size(X_Class, 1), :);
        Yts = ind.* ones(size(Xts, 1),1);
        
        Xtrain = [Xtrain; Xtrn];
        Ytrain = [Ytrain; Ytrn];
        Xtest = [Xtest; Xts];
        Ytest = [Ytest; Yts];
    end
    
    % Classificador NN
    [predict_NN, acc_NN] = NN(Xtrain, Ytrain, Xtest, Ytest);
    all_pred_NN = [all_pred_NN predict_NN];
    all_acc_NN = [all_acc_NN; acc_NN];
    
    % Classificador DMC
    [predict_DMC, acc_DMC] = DMC(Xtrain, Ytrain, Xtest, Ytest, numClasses);
    all_pred_DMC = [all_pred_DMC predict_DMC];
    all_acc_DMC = [all_acc_DMC; acc_DMC];
    
    % Classificador Quadrático
    [predict_CQ, acc_CQ] = CQ(Xtrain, Ytrain, Xtest, Ytest, numClasses);
    all_pred_CQ = [all_pred_CQ predict_CQ];
    all_acc_CQ = [all_acc_CQ; acc_CQ];
    
    % Classificador MQL
    [predict_MQL, acc_MQL] = MQL(Xtrain, Ytrain, Xtest, Ytest, numClasses);
    all_pred_MQL = [all_pred_MQL predict_MQL];
    all_acc_MQL = [all_acc_MQL; acc_MQL];
end

fprintf('\nFinished!\n');
all_acc = [all_acc_NN all_acc_DMC all_acc_CQ all_acc_MQL];
save_result(all_acc, all_pred);


