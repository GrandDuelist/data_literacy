bayesian.rule <- function(P_A,P_B_A,P_B_nA){
  P_A_B = (P_B_A * P_A)/(P_B_A*P_A+P_B_nA*(1-P_A))
  return(P_A_B)
}