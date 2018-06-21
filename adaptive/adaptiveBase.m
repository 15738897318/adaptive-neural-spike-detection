function adaptiveBase(datasetPath)
    % The base function for running the preprocessing adaptive algorithm
    % attempt
    
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    visualSpikes = showActualSpike(data,spikes);
    
    [posGrad, negGrad, predictedSpikes] = generalGradient(data);
    [pos, neg] = spikeGradient(data, visualSpikes);
    
    [TP, FP, FN] = spikeDetection(predictedSpikes, spikes);
    [SE, FDR, TOTAL] = detectionStats(TP, FP ,FN)
    
    figure;
    pos1 = histogram(posGrad);
    hold on;
    pos2 = histogram(pos);
    title("Positve gradient of spikes");
    xlabel("Gradient");
    ylabel("Number");
    
    figure;
    neg1 = histogram(negGrad);
    hold on;
    neg2 = histogram(neg);
    title("Negative gradient of spikes");
    xlabel("Gradient");
    ylabel("Number");
end