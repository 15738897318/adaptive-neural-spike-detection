function variableWindowSpikes(datasetPath)
    %Sliding window based design for last x spikes
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    testData = data;
    
    visualSpikes = showActualSpike(testData,spikes);
    
    plusCount = [];
    maxLength = 0;
    peak = 0;
    predictedSpikes = [];
    previousSpike = 1;
    currentSpike = 1;
    runningMax = 0;
    runningSegment = zeros(1,20);
    
    max100 = 0;
    max200 = 0;
    max500 = 0;
    
    for datapoint = 2:length(testData)-1
        max100 = max(runningSegment(1:5));
        
        max200 = max(runningSegment(1:10));
        
        max500 = max(runningSegment);
        runningSegment = runningSegment(1:20);
        
        current = testData(datapoint);
        
        if current > testData(datapoint-1) && current > testData(datapoint+1)
            runningSegment = [current runningSegment];
            if current > 1*max100 && current > 0.8*max200 && current > 1.2*max500
                predictedSpikes = [predictedSpikes datapoint];
            end
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