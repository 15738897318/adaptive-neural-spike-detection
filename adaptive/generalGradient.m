function [posGrad, negGrad, spikes] = generalGradient(data)
    % Get gradient of all spikes (i.e. including noise), not just actual spikes

    posGrad = [];
    negGrad = [];
    spikes = [];
    for entry = 5:length(data)-5
        if data(entry) > data(entry-4) && data(entry) > data(entry+4)
            spike = data(entry);
            positive = (spike-data(entry-5));
            if positive > 35
                if ~isempty(spikes)
                    if (entry - spikes(end)) > 50 
                        spikes = [spikes; entry-50:entry];  
                    end
                else
                    spikes = [spikes; entry-50:entry];
                end
                
            end
            posGrad = [posGrad spike-data(entry-5)];
            negGrad = [negGrad spike-data(entry+5)];
        end    
    end
end