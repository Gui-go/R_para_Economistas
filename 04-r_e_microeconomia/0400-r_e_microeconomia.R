# R e microeconomia

# https://www.r-bloggers.com/interactive-cobb-douglas-web-app-with-r/

# Cobb-Douglas Production Function - App
# https://stablemarkets.shinyapps.io/Rshiny/

# https://rpubs.com/hiltonmbr/55051
# https://mbounthavong.com/blog/2019/2/19/cobb-douglas-production-function-and-total-costs





# micEcon -----------------------------------------------------------------
install.packages("micEcon")
library(micEcon)
data( germanFarms )
# output quantity:
germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
# quantity of variable inputs
germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
# a time trend to account for technical progress:
germanFarms$time <- c(1:20)

# estimate a Cobb-Douglas production function
estResult <- translogEst( "qOutput", c( "qLabor", "qVarInput", "land", "time" ),
                          germanFarms, linear = TRUE )

# compute the marginal products of the inputs (with "fitted" Output)
margProducts <- cobbDouglasDeriv( c( "qLabor", "qVarInput", "land", "time" ),
                                  data = germanFarms, coef = coef( estResult )[1:5],
                                  coefCov = vcov( estResult )[1:5,1:5] )
margProducts$deriv
# t-values
margProducts$deriv / margProducts$variance^0.5

# compute the marginal products of the inputs (with observed Output)
margProductsObs <- cobbDouglasDeriv( c( "qLabor", "qVarInput", "land", "time" ),
                                     data = germanFarms, coef = coef( estResult )[1:5], yName = "qOutput",
                                     coefCov = vcov( estResult )[1:5,1:5] )
margProductsObs$deriv
# t-values
margProductsObs$deriv / margProductsObs$variance^0.5

# try2 --------------------------------------------------------------------

data( germanFarms )
# output quantity:
germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
# quantity of variable inputs
germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
# a time trend to account for technical progress:
germanFarms$time <- c(1:20)

# estimate a Cobb-Douglas production function
estResult <- translogEst( yName = "qOutput",
                          xNames = c( "qLabor", "qVarInput", "land", "time" ),
                          data = germanFarms, linear = TRUE )

# calculate optimal quantities of variable inputs
xCoef <- coef( estResult )[ 1:3 ]
zCoef <- coef( estResult )[ 4:5 ]
names( zCoef ) <- c( "d_1", "d_2" )
optInput <- cobbDouglasOpt( pyName = "pOutput",
                            pxNames = c( "pLabor", "pVarInput" ), coef = xCoef,
                            data = germanFarms, xNames = c( "qLabor", "qVarInput" ),
                            zNames = c( "land", "time" ), zCoef = zCoef )

# compare observed with optimal input quantities
plot( germanFarms$qLabor, optInput$qLabor )
plot( germanFarms$qVarInput, optInput$qVarInput )
