function [predict, acc] = NN(Xtrain, Ytrain, Xtest, Ytest)

    predict = [];
    for test = 1:size(Xtest, 1)
        
        dist_NN = [];
        
        for trn = 1:size(Xtrain, 1)      
            dist_NN = [dist_NN; pdist2(Xtest(test, :), Xtrain(trn, :),'euclidean')];
        end
        
        [dummy, Imin] = min(dist_NN);
        predict = [predict; Ytrain(Imin)];
    end
    
    res = size(find(Ytest == predict), 1);
    acc = (res / size(Xtest, 1)) * 100;
end