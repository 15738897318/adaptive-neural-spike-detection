function staticEvaluationScript()
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_1', 1, @setABSThreshold, 300:10:700)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_1', 5, @setABSThreshold, 200:10:700)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_1', 10, @setABSThreshold, 350:10:700)

    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_2', 1, @setABSThreshold, 26000:1000:38000)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_2', 5, @setABSThreshold, 300:10:500)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_2', 10, @setABSThreshold, 9000:1000:13000)

    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_3', 1, @setABSThreshold, 200:10:350)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_3', 5, @setABSThreshold, 250:10:500)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_3', 10, @setABSThreshold, 200:10:500)

    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_4', 1, @setABSThreshold, 70:1:90)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_4', 5, @setABSThreshold, 350:10:700)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_4', 10, @setABSThreshold, 400:10:700)
    
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_1', 1, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_1', 5, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_1', 10, @setNEOThreshold, 10:1:20)
     
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_2', 1, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_2', 5, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_2', 10, @setNEOThreshold, 10:1:20)
    
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_3', 1, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_3', 5, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_3', 10, @setNEOThreshold, 10:1:20)
    
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_4', 1, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_4', 5, @setNEOThreshold, 10:1:20)
    %[SE, FDR, TOTAL, THRESH] = staticEvaluation('datasets/simulation_4', 10, @setNEOThreshold, 10:1:20)
end