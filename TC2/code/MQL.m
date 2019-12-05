function [predict, acc] = MQL(Xtrain, Ytrain, Xtest, Ytest, numClasses)
    
    Ytr = [];
    
    for k = 1:size(Ytrain, 1)
        mat = zeros(numClasses, 1);
        mat(Ytrain(k), 1) = 1;
        Ytr = [Ytr mat];
    end
    
    W = Ytr*pinv(Xtrain');
    Ypred = W * Xtest';
    
    predict = [];
    for n = 1:size(Ypred, 2)
        [dummy, Imax] = max(Ypred(:, n));
        predict = [predict; Imax];
    end
    
    res = size(find(Ytest == predict), 1);
    acc = (res / size(Xtest, 1)) * 100;
end