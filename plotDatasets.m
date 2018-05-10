function plotDatasets()
    plot1 = load('datasets/simulation_1.mat');
    plot1 = plot1.data;
    plot2 = load('datasets/simulation_2.mat');
    plot2 = plot2.data;
    plot3 = load('datasets/simulation_3.mat');
    plot3 = plot3.data;
    plot4 = load('datasets/simulation_4.mat');
    plot4 = plot4.data;
    
    subplot(4,1,1);
    plot(plot1(1:1440000));
    
    subplot(4,1,2);
    plot(plot2(1:1440000));
    
    subplot(4,1,3);
    plot(plot3(1:1440000));
    
    subplot(4,1,4);
    plot(plot4(1:1440000));
    
end