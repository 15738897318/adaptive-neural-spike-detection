function maxAmpSegments(datasetPath)
    % Max amplitude segment algorithm 
    
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    visualSpikes = showActualSpike(data(1:10000),spikes);
    
    testSegment = data(1:10000);
    segmentSize = 1000;
    
    threshold = [];
    finalSpikes = [];
    
    for segment = 1:segmentSize:length(testSegment)
        tic;
        secMax = max(testSegment(segment:segment+segmentSize-1));
        thresh = 0.7*secMax;
        threshold = [threshold thresh*ones(1,segmentSize-1)];
        spikes = [];
        for element = segment:segment+segmentSize-1
            if testSegment(element) > thresh
                if testSegment(element-1) < testSegment(element) && testSegment(element+1) < testSegment(element)
                    spikes = [spikes element];
                end
            end
        end
        if length(spikes) < 3
            finalSpikes = [finalSpikes spikes];
        end
        toc;
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