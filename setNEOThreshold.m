function threshold = setNEOThreshold(dataset, thresholdConstant)
    % Set threshold based on NEO static algorithm
    % Returns the threshold (float)
    % Inputs are the dataset matrix and the threshold tuning
    % constant
    
    % Sum variable that is incremented through each for loop
    y = 0;
    for n = 1:size(dataset,2)
        y = y + dataset(n);
    end
    threshold = (thresholdConstant * (1/size(dataset,2))) * y;
end