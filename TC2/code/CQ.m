function [predict, acc] = CQ(Xtrain, Ytrain, Xtest, Ytest, numClasses)
    CiTreino = zeros(size(Xtrain,2), size(Xtrain,2), numClasses, 1);
    CiInv = zeros(size(Xtrain,2), size(Xtrain,2), numClasses, 1);
    
    %% Calculo do centroide e da cov por classe treino
    mi = [];

    for ind = 1:numClasses
        arr_Train = Xtrain(Ytrain(:, end) == ind, :);
        mi = [mi; mean(arr_Train)];
        CiTreino(:, :, ind, 1) = cov(arr_Train, 1);
        CiInv(:, :, ind, 1) = pinv(CiTreino(:, :, ind, 1));
    end
    
    predict = [];
    
    for k = 1:(size(Xtest, 1))
        X = Xtest(k, :);
        
        dist = [];
        for ind = 1:numClasses
            centroidTest = mi(ind , :);
            sub = X - centroidTest;
            inversa = CiInv(:, :, ind, 1);
            dist = [dist; (sub)*(inversa)*(sub')];
        end
        
        [dummy, Imin] = min(dist);
        predict = [predict; Imin];
    end
    
    res = size(find(Ytest == predict), 1);
    acc = (res / size(Xtest, 1)) * 100;
end
