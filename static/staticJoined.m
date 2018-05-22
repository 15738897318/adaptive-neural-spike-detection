function staticJoined()
    dataset1 = load("../datasets/simulation_3");
    data1 = dataset1.data;
    dataset2 = load("../datasets/simulation_4");
    data2 = dataset2.data;
    
    totalData = [data1 data2];
    
    data1Threshold = 27.2931;
    data2Threshold = 28.1648;
    
    percentage = 10;
    
    spikes = [];
    
    spikeRange = 50;
    
    for value = 1:size(totalData,2)
        if totalData(value) >= data1Threshold
            if ~isempty(spikes)
                if (value - spikes(end)) > spikeRange 
                    spikes = [spikes; value-spikeRange:value];  
                end
            else
                spikes = [spikes; value-spikeRange:value];
            end
        end
    end
    
    dataset1Times = dataset1.spike_times{1,1};
    dataset2Times = dataset2.spike_times{1,1};
    
    dataset2Times = dataset2Times + size(data1,2);
    totalSpikeTimes = [dataset1Times dataset2Times];
    
    [TP, FP, FN] = spikeDetection(spikes, totalSpikeTimes);
    [SE, FDR, TOTAL] = detectionStats(TP, FP, FN)
    
    plot(totalData);
    hold on;
    plot(data1Threshold.*ones(1,size(totalData,2)));
    
    
end