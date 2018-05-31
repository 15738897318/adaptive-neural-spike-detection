function attempt2(datasetPath)
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    testData = data(1:10000);
    
    visualSpikes = showActualSpike(testData,spikes);
    
    plusCount = [];
    maxLength = 0;
    peak = 0;
    predictedSpikes = [];
    previousSpike = 1;
    currentSpike = 1;
    runningMax = 0;
    runningSegment = [];
    
    for datapoint = 2:length(testData)
        if rem(800, datapoint) == 0
            runningMax = max(runningSegment);
            runningSegment = [];
        end
        
        runningSegment = [runningSegment testData(datapoint)];
        
        if testData(datapoint) > testData(datapoint-1)
            plusCount = [plusCount datapoint]; 
        else
            if length(plusCount) > 2
                currentSpike = testData(datapoint-1);
                if currentSpike > previousSpike*2.5 && currentSpike > runningMax
                    predictedSpikes = [predictedSpikes datapoint-1];
                end
                previousSpike = currentSpike;
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