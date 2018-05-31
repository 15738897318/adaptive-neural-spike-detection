function attempt2(datasetPath)
    % Classify spikes based on the length of each "spike"
    
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    testData = data(1:10000);
    
    visualSpikes = showActualSpike(testData,spikes);
    
    plusCount = [];
    predictedSpikes = [];
    
    for datapoint = 2:length(testData)
        
        if testData(datapoint) > testData(datapoint-1)
            plusCount = [plusCount datapoint]; 
        else
            if length(plusCount) > 5
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