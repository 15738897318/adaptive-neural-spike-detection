function staticEmulation(datasetPath)
    % Static threshold emulation algorithm 
    
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    testSegment = data(1:100000);
    
    visualSpikes = showActualSpike(testSegment,spikes);
    

    segmentSize = 10000;
    
    threshold = [];
    finalSpikes = [];
    
    for segment = 1:segmentSize:length(testSegment)
        tic
        secMean = mean(abs(testSegment(segment:segment+segmentSize-1)));
        secStd = std(abs(testSegment(segment:segment+segmentSize-1)));
        thresh = 3*secStd + 2*secMean;
        threshold = [threshold thresh*ones(1,segmentSize-1)];
        spikes = [];
        for element = segment:segment+segmentSize-1
            if testSegment(element) > thresh
                if testSegment(element-1) < testSegment(element) && testSegment(element+1) < testSegment(element)
                    spikes = [spikes element];
                end
            end
        end
        finalSpikes = [finalSpikes spikes];
        toc
    end
    
    hold on;
    plot(threshold);
    hold on;
    for entry = 1:length(finalSpikes)
        location = finalSpikes(entry);
        tp = ismember(location, visualSpikes);
        
        if any(tp)
            plot(location, testSegment(location), 'g*');
        else
            plot(location, testSegment(location), 'b*');
        end
        hold on;
    end
    
    [TP, FP, FN] = actualSpikeDetection(finalSpikes, visualSpikes);
    [SE, FDR, TOTAL] = detectionStats(TP, FP ,FN)
end