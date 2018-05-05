function threshold = setNEOThreshold(dataset, delta, thresholdConstant)
    y = 0;
    for n = 1:size(dataset)
        y = y + dataset(n)^2 - (dataset(n-delta)*dataset(n+delta));
    end
    threshold = thresholdConstant * (1/size(dataset)) * y;
end