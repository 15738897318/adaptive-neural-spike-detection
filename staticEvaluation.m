function [sensitivity, falseDetectionRate, performance, bestThreshold] = staticEvaluation(datasetPath, tuningPercent, staticAlgo, thresholdConstants)
    dataset = load(datasetPath);
    data = dataset.data;
    tuningNumber = round(size(data,2)*(tuningPercent/100));
    tuningData = data(1:tuningNumber);
    delta = 1;
    
    sensitivity = 0;
    falseDetectionRate = 0;
    performance = 0;
    bestThreshold = 0;
    
    for thresh = 1:length(thresholdConstants)
        threshold = staticAlgo(tuningData, delta, thresholdConstants(thresh));
        plot(tuningData);
        hold on;
        plot(threshold.*ones(1,tuningNumber));

        spikes = [];

        spikeRange = 50;

        for value = 1:size(data,2)
            if data(value) >= threshold
                if ~isempty(spikes)
                    if (value - spikes(end)) > spikeRange 
                        spikes = [spikes; value-spikeRange:value];  
                    end
                else
                    spikes = [spikes; value-spikeRange:value];
                end
            end
        end

        spikeTimes = dataset.spike_times{1,1};

        [TP, FP, FN] = spikeDetection(spikes, spikeTimes);
        [SE, FDR, TOTAL] = detectionStats(TP, FP, FN);
        
        if TOTAL > performance
            sensitivity = SE;
            falseDetectionRate = FDR;
            performance = TOTAL;
            bestThreshold = [thresholdConstants(thresh) threshold];
        end
        
    end
end