function [posGrad, negGrad] = spikeGradient(data, visibleSpikes)
    % Preprocessing attempt based on spike gradients
    % Inputs are the datapoints and actual spike locations
    % Returns matrices containing positive and negative gradients of each
    % spike

    posGrad = [];
    negGrad = [];
    for entry = 1:length(visibleSpikes)
        location = visibleSpikes(entry);
        spike = data(location);
        
        % location-5 to get gradient over 5 datapoints
        posGrad = [posGrad (spike-data(location-5))];
        negGrad = [negGrad spike-data(location+5)];
    end
end