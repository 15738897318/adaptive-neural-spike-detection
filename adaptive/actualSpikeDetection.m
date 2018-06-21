function [TP, FP, FN] = actualSpikeDetection(predicted, actual)
% Calculate true positive, false negative and false positive detection
% rates. Variation of ../static/spikeDetection
%
% predicted = predicted spike locations matrix after using static threshold
% actual = the actual locations of the spikes

    tpCount = 0;
    % For each row in matrix check if contains actual spike location
    % if true then increment true positive count
    for entry = 1:size(predicted,2)
        predictedEntry = predicted(entry);
        tp = ismember(predictedEntry, actual);
        
        if any(tp)
            tpCount = tpCount + 1;
        end
    end
    
    TP = tpCount;
    FN = size(actual,2) - TP;
    FP = size(predicted,2) - TP;
end