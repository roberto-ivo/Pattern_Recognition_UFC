function [] = save_result(all_acc, all_pred)
    
    filename = 'results/results.txt';
    file = fopen(filename, 'wt');
    
    fprintf(file, '-------------------------------------------------------------- \n');
    fprintf(file, 'Classificador\tMedia \tMediana\t   [Min, Max]  \tDesvio-padrão \n');
    fprintf(file, '-------------------------------------------------------------- \n\n');
    names = {'NN', 'DMC', 'CQ ', 'MQL'};
    
    for classif = 1:size(all_acc, 2)
        res = all_acc(:, classif);
        
        media = mean(res);
        mediana = median(res);
        val_min = min(res);
        val_max = max(res);
        val_std = std(res);
        
        fprintf(file, '      %s\t%.2f  \t%.2f\t [%.2f, %.2f] \t%.3f\n\n', names{classif}, media, mediana, val_min, val_max, val_std);
    end
    fprintf(file, '-------------------------------------------------------------- \n');
    fclose(file);

end