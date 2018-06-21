function variableWindow(datasetPath)
    % Sliding window based design
    
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
    runningSegment = zeros(1,200);
    
    max100 = 0;
    max200 = 0;
    max500 = 0;
    
    for datapoint = 2:length(testData)-1
        %if rem(datapoint, 100) == 0
        max100 = max(runningSegment(1:100));
        %end
        
        %if rem(datapoint, 200) == 0
        max200 = max(runningSegment(1:200));
        %end
        if rem(datapoint, 500) == 0
            max500 = max(runningSegment);
            runningSegment = runningSegment(1:200);
        end
        
        current = testData(datapoint);
        
        if current > testData(datapoint-1) && current > testData(datapoint+1)
            runningSegment = [current runningSegment];
            if current > 1.5*max100 && current > 0.8*max200 && current > 0.5*max500
                predictedSpikes = [predictedSpikes datapoint];
            end
        else
           runningSegment = [0 runningSegment];
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