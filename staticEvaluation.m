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
    
    for value = 1:size(data,2)
        if data(value) >= threshold
            if spikes
                if value - spikes(end) > 50 
                    spikes = [spikes; value-50:value];  
                end
            else
                spikes = [spikes; value-50:value];
            end
        end
    end
    
    spikeTimes = dataset.spike_times{1,1};
    
    [TP, FP, FN] = spikeDetection(spikes, spikeTimes);
    [SE, FDR, TOTAL] = detectionStats(TP, FP, FN)
end