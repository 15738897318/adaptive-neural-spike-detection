function [TP, FP, FN] = spikeDetection(predicted, actual)
    % Calculate true positive, false negative and false positive detection
    % rates
    % Returns all of the above
    % Inputs are predicted predicted spike locations (matrix) and actual
    % locations of the spikes (vector)

    % True positive counter
    tpCount = 0;
    
    % For each row in matrix check if contains actual spike location
    % if true then increment true positive count
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