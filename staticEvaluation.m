function staticEvaluation(datasetPath, tuningPercent, staticAlgo, thresholdConstant)
    dataset = load(datasetPath);
    data = dataset.data;
    tuningNumber = round(size(data,2)*(tuningPercent/100));
    tuningData = data(1:tuningNumber);
    delta = 1;
    size(tuningData);
    threshold = staticAlgo(tuningData, delta, thresholdConstant);
    plot(tuningData);
    hold on;
    plot(threshold.*ones(1,tuningNumber));
    
    spikes = [];
    
    for value = 1:tuningNumber
        if tuningData(value) >= threshold
            spikes = [spikes; value-15:value];            
        end
    end
    
    x = spikes
end