function staticEvaluationScript()
    [SE, FDR, TOTAL] = staticEvaluation('datasets/simulation_1', 10, @setABSThreshold, 400:100:500)
end