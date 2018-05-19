function threshold = setNEOThreshold(dataset, delta, thresholdConstant)
    y = 0;
    for n = 1:size(dataset,2)
        y = y + dataset(n);
    end
    threshold = (thresholdConstant * (1/size(dataset,2))) * y;
end