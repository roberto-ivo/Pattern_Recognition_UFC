function [] = save_result(all_acc, all_pred, Ytest, times)
    
    filename = 'results/results.txt';
    file = fopen(filename, 'wt');
    
    fprintf(file, '------------------------------------------------------------------------- \n');
    fprintf(file, 'Classificador\tMedia \tMediana\t   [Min, Max]  \tDesvio-padrão\t tempo(s)\n');
    fprintf(file, '------------------------------------------------------------------------- \n\n');
    names = {'NN', 'DMC', 'CQ ', 'MQL'};
    
%     s = '\n%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d';
%     str = repmat(s,1,20);
%     fileName1 = horzcat('---- Melhor matriz de confusão: ---- \n' , str);
%     fileName2 = horzcat('\n\n----Pior matriz de confusão: ---- \n' , str);
    
    for classif = 1:size(all_acc, 2)
        res = all_acc(:, classif);
        
        media = mean(res);
        mediana = median(res);
        [val_min, index_min] = min(res);
        [val_max, index_max] = max(res);
        val_std = std(res);
        
        Ypred_min = all_pred(:, index_min, classif);
        Ypred_max = all_pred(:, index_max, classif);
        
        MC_min = confusionmat(Ytest, Ypred_min);
        MC_max = confusionmat(Ytest, Ypred_max);
        
        dir1 = 'results/confusion_matrix/mat_confusion_%s_Best.png';
        dir2 = 'results/confusion_matrix/mat_confusion_%s_Worse.png';
        
        fileName1 = sprintf(dir1, names{classif});
        fileName2 = sprintf(dir2, names{classif});

        plotConfusion(fileName1, MC_max)
        plotConfusion(fileName2, MC_min)
        
%         fid = fopen(file_confusion,'wt');
        
%         fprintf(fid, fileName1, MC_max');
%         fprintf(fid, fileName2, MC_min');
        
        fprintf(file, '      %s\t%.2f  \t%.2f\t [%.2f, %.2f] \t%.3f\t%.3f+/-%.3f\n\n', names{classif}, media, mediana, val_min, val_max, val_std, mean(times(:, classif)), std(times(:, classif)));
    end
    fprintf(file, '------------------------------------------------------------------------- \n');
    fclose(file);

end