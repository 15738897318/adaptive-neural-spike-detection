function plotSpikeLocations()
    % Plot raw spike locations on recording
    
    plot1 = load('datasets/simulation_1.mat');
    plot1_data = plot1.data(1:10000);
    plot(plot1_data);
    hold on;
    spikeTimes = plot1.spike_times{1,1};
    % Loop through each spike and plot as red stars
    for entry = 1:length(spikeTimes)
       location = spikeTimes(entry);
       plot(location, plot1_data(location), 'r*');
       hold on;
    end
end