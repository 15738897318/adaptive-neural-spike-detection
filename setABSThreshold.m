function threshold = setABSThreshold(dataset, ~, thresholdConstant)
    standardDev = abs(median(dataset/0.6745));
    threshold = thresholdConstant * standardDev;
end