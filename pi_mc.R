pi_mc=function(n){
  x_sim=runif(n,min=0,max=1)
  y_sim=(1-x_sim^2)^0.5
  y_test=runif(n,min=0,max=1)
  
     mc_array=ifelse(y_test<=y_sim,1,0)
     area_uc=sum(mc_array)/n*4
     
     return(area_uc)
     
}
