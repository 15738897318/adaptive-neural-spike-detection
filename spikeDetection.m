function [TP, FP, FN] = spikeDetection(predicted, actual)
    tpCount = 0;
    for row = 1:size(predicted,1)
        predictedEntry = predicted(row,:);
        tp = ismember(predictedEntry, actual);
        
        if any(tp)
            tpCount = tpCount + 1;
        end
    end
    
    TP = tpCount;
    FN = size(actual,2) - TP;
    FP = size(predicted,1) - TP;
end