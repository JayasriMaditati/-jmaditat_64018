#Solving the primal
library(lpSolveAPI)
Weigelt.lp.primal <- read.lp("Weigelt.lp")

Weigelt.lp.primal
solve(Weigelt.lp.primal)
get.variables(Weigelt.lp.primal)
get.objective(Weigelt.lp.primal)
get.constraints(Weigelt.lp.primal)

#get shadow prices and dual solution 

get.sensitivity.rhs(Weigelt.lp.primal)

#get reduced costs

get.sensitivity.obj(Weigelt.lp.primal)

#get dual solution

get.dual.solution(Weigelt.lp.primal)

#Sensitivity Analysis

sensitivity_shadowprice<-data.frame(get.sensitivity.rhs(Weigelt.lp.primal)$duals[1:20],
                  get.sensitivity.rhs(Weigelt.lp.primal)$dualsfrom[1:20],
                  get.sensitivity.rhs(Weigelt.lp.primal)$dualstill[1:20])
names(sensitivity_shadowprice)<-c("Shadow price","Allowable decrease","Allowable increase ")
row.names(sensitivity_shadowprice)<-c("Square foot1","Square Foot2","Square Foot3","Excess Capacity1","Excess Capacity2","Excess Capacity3","Sales1","Sales2","Sales3","Percent_P1_P2","Percent_P1_P3","P1L","P1M","P1S","P2L","P2M","P2S","P3L","P3M","P3S")
sensitivity_shadowprice


sensitivity_ReducedCost<-data.frame( get.sensitivity.obj(Weigelt.lp.primal)$objfrom[1:9],
                                    get.sensitivity.obj(Weigelt.lp.primal)$objtill[1:9])
names(sensitivity_ReducedCost)<-c("Reduced_Cost From","Reduced_Cost To ")
row.names(sensitivity_ReducedCost)<-c("P1L","P1M","P1S","P2L","P2M","P2S","P3L","P3M","P3S")

sensitivity_ReducedCost

