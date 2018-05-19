function [sensitivity, falseDetectionRate, performance, bestThreshold] = staticEvaluation(datasetPath, tuningPercent, staticAlgo, thresholdConstants)
    dataset = load(datasetPath);
    data = dataset.data;
    
    delta = 4;
    % Preprocessing for NEO algorithm
    if isequal(staticAlgo, @setNEOThreshold)
        for n = 1+delta:size(data,2)-delta
            y(n) = data(n)^2 - (data(n-delta)*data(n+delta));
        end
        data = y;
    end
    
    tuningNumber = round(size(data,2)*(tuningPercent/100));
    tuningData = data(1:tuningNumber);
    
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