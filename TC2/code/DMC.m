function [predict, acc] = DMC(Xtrain, Ytrain, Xtest, Ytest, numClasses)
    mi = [];

    for ind = 1:numClasses
        arr_Train = Xtrain(Ytrain(:, end) == ind, :);
        mi = [mi; mean(arr_Train)];
    end
    
    
    predict = [];
    
    for tst = 1:size(Xtest, 1)
        
        dist_DMC = [];
        for ind = 1:numClasses
            dist_DMC = [dist_DMC; pdist2(Xtest(tst, :), mi(ind, :),'euclidean')];
        end
        
        [dummy, Imin] = min(dist_DMC);
        predict = [predict; Imin];
    end
    
    res = size(find(Ytest == predict), 1);
    acc = (res / size(Xtest, 1)) * 100;
end