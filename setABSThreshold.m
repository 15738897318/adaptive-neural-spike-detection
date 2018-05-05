function threshold = setABSThreshold(dataset, thresholdConstant)
    standardDev = median(dataset./0.6745);
    threshold = thresholdConstant * standardDev;
end