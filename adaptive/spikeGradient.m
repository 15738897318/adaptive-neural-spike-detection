function [posGrad, negGrad] = spikeGradient(data, visibleSpikes)
    posGrad = [];
    negGrad = [];
    for entry = 1:length(visibleSpikes)
        location = visibleSpikes(entry);
        spike = data(location);
        
        posGrad = [posGrad (spike-data(location-5))];
        negGrad = [negGrad spike-data(location+5)];
    end
end