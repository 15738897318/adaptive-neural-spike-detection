function [SE, FDR, TOTAL] = detectionStats(TP, FP, FN)
    SE = TP/(TP + FN);
    FDR = TP/(TP + FP);
    TOTAL = SE + FDR;
end