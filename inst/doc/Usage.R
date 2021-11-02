## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  
#  library(BayesianFROC);
#  
#  library(tpfp);
#  
#  
#  #Suppose that object dataList is a return value of the function convertFromJafroc(), which can be used as follows.
#  
#       dataList <- convertFromJafroc(
#                                    No.of.Modalities =5,
#                                    No.of.readers    =4,
#                                    No.of.confidence.levels = 5
#                                     )
#  
#  
#  f <- BayesianFROC::fit_Bayesian_FROC(dataList = dataList, ite  = 111, summary = FALSE,  cha = 1 )

