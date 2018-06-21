function spikeLength(datasetPath)
    % Spike length algorithm
    
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    testData = data;
    
    visualSpikes = showActualSpike(testData,spikes);
    
    plusCount = [];
    predictedSpikes = [];
    
    for datapoint = 2:length(testData)
        
        if testData(datapoint) > testData(datapoint-1)
            plusCount = [plusCount datapoint]; 
        else
            if length(plusCount) > 9
                predictedSpikes = [predictedSpikes datapoint-1];
            end
            plusCount = [];
        end
    end
    
    hold on;
    for entry = 1:length(predictedSpikes)
        location = predictedSpikes(entry);
        tp = ismember(location, visualSpikes);
        
        if any(tp)
            plot(location, testData(location), 'g*');
        else
            plot(location, testData(location), 'b*');
        end
        hold on;
    end
    
    [TP, FP, FN] = actualSpikeDetection(predictedSpikes, visualSpikes);
    [SE, FDR, TOTAL] = detectionStats(TP, FP ,FN)
end