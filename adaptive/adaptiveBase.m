function adaptiveBase(datasetPath)
    dataset = load(datasetPath);
    data = dataset.data;
    spikes = dataset.spike_times{1,1};
    
    showActualSpike(data(1:10000),spikes);
    
end