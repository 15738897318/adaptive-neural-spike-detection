function [SE, FDR, TOTAL] = detectionStats(TP, FP, FN)
    % Calculated sensitivity, false detection ratio and total performance
    % of algoriths
    % Inputs are true positive rate, false positive rate and false 
    % negative rate
    
    SE = TP/(TP + FN);
    FDR = TP/(TP + FP);
    TOTAL = SE + FDR;
end