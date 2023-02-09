#3.Weigelt Corporation

library(lpSolveAPI)

Weigelt_linear.lp <- make.lp(11,9)

#obj fn -max

set.objfn(Weigelt_linear.lp, c(420,360,300,420,360,300,420,360,300))
lp.control(Weigelt_linear.lp,sense='max')

# storage
set.row(Weigelt_linear.lp, 1, c(20, 15, 12), indices = c(1, 2, 3))
set.row(Weigelt_linear.lp, 2, c(20, 15, 12), indices = c(4, 5, 6))
set.row(Weigelt_linear.lp, 3, c(20, 15, 12), indices = c(7, 8, 9))


# excess caapcity
set.row(Weigelt_linear.lp, 4, c(1, 1, 1), indices = c(1, 2, 3))
set.row(Weigelt_linear.lp, 5, c(1, 1, 1), indices = c(4, 5, 6))
set.row(Weigelt_linear.lp, 6, c(1, 1, 1), indices = c(7, 8, 9))

#sales
set.row(Weigelt_linear.lp, 7, c(1, 1, 1), indices = c(1, 4, 7))
set.row(Weigelt_linear.lp, 8, c(1, 1, 1), indices = c(2, 5, 8))
set.row(Weigelt_linear.lp, 9, c(1, 1, 1), indices = c(3, 6, 9))

#Percent

set.row(Weigelt_linear.lp,10, c(0.0013,0.0013,0.0013,-0.0011,-0.0011,-0.0011),indices = c(1,2,3,4,5,6))
set.row(Weigelt_linear.lp,11, c(0.0013,0.0013,0.0013,-0.0022,-0.0022,-0.0022),indices = c(1,2,3,7,8,9))

# rhs and signs
rhs <- c(13000, 12000, 5000, 750, 900, 450, 900, 1200, 750,0,0)
set.rhs(Weigelt_linear.lp, rhs)
set.constr.type(Weigelt_linear.lp, c("<=","<=","<=","<=","<=","<=","<=","<=","<=","=","="))


# names
varname <- c("P1L", "P1M", "P1S", "P2L", "P2M", "P2S","P3L", "P3M","P3S")
constrname <- c("Storage1","Storage2","Storage3","EC1", "EC2", "EC3", "Sales1", "Sales2","Sales3","Percent1","Percent2")

Weigelt_linear.lp 

solve(Weigelt_linear.lp)
get.objective(Weigelt_linear.lp)
solution <- data.frame(varname, get.variables(Weigelt_linear.lp))
colnames(solution) <- c("variable", "value")
solution

# Alternatively (Method 2 using LP file)
Weigelt.lp.alt <- read.lp("Weigelt.lp")
Weigelt.lp.alt
solve(Weigelt.lp.alt)
get.variables(Weigelt.lp.alt)
get.objective(Weigelt.lp.alt)
get.constraints(Weigelt.lp.alt)
