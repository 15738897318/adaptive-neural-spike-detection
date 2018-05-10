function plotDatasets()
    plot1 = load('datasets/simulation_1.mat');
    plot1 = plot1.data;
    plot2 = load('datasets/simulation_2.mat');
    plot2 = plot2.data;
    plot3 = load('datasets/simulation_3.mat');
    plot3 = plot3.data;
    plot4 = load('datasets/simulation_4.mat');
    plot4 = plot4.data;
    plot5 = load('datasets/simulation_5.mat');
    plot5 = plot5.data;
    
    subplot(5,1,1);
    plot(plot1(1:50000));
    
    subplot(5,1,2);
    plot(plot2(1:50000));
    
    subplot(5,1,3);
    plot(plot3(1:50000));
    
    subplot(5,1,4);
    plot(plot4(1:50000));
    
    subplot(5,1,5);
    plot(plot5(1:50000));
    
end