function visualSpikes = showActualSpike(data, spikes)
    % Plot actual location of spikes and return the visual spike locations
    % Inputs are: data - the datapoints of a simulation
    % spikes - The spike locations provided by a dataset
    
    visualSpikes = [];
    for spike = 1:size(spikes,2) 
       location = spikes(spike);
       if location < size(data,2)
           segment = data(location:location+50);
           largestSpike = 0;
           largestSpikeLocation = 0;
           for element = 2:size(segment,2)-1
               currentSegment = segment(element);
               if segment(element-1) < currentSegment && segment(element+1) < currentSegment
                   if currentSegment > largestSpike
                       largestSpike = currentSegment;
                       largestSpikeLocation = location+element-1;
                   end
               end
           end
           visualSpikes = [visualSpikes largestSpikeLocation];
       end
    end
    
    plot(data);
    hold on;
    for entry = 1:length(visualSpikes)
       location = visualSpikes(entry);
       plot(location, data(location), 'r*');
       hold on;
    end
end