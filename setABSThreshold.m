function threshold = setABSThreshold(dataset, ~, thresholdConstant)
    % Set threshold according to absolute value algorithm
    
    standardDev = abs(median(dataset/0.6745));
    threshold = thresholdConstant * standardDev;
end