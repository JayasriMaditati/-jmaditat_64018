#Solving the dual for Weigelt problem
library(lpSolveAPI)
Weigelt_dual.lp <- read.lp("Weigelt_dual.lp")
set.bounds(Weigelt_dual.lp, lower=c(-Inf, -Inf), columns = c(10,11))
Weigelt_dual.lp
solve(Weigelt_dual.lp)
get.variables(Weigelt_dual.lp)
get.objective(Weigelt_dual.lp)
get.constraints(Weigelt_dual.lp)
