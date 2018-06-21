function threshold = setABSThreshold(dataset, thresholdConstant)
    % Set threshold according to absolute value algorithm
    % Returns threshold value as float
    % Inputs are the dataset matrix and the threshold tuning
    % constant
    
    standardDev = abs(median(dataset/0.6745));
    threshold = thresholdConstant * standardDev;
end