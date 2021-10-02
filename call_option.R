euro_call=function(s0,k,vol,rfr,t,delta_unit,n_sim){
  euro_price=function(s,k,vol,rfr,t,n_sim){
  #generate std normal variable
    norm_inv_sim=rnorm(n_sim,mean=0,sd=1)
  
  #simulate asset price at maturity t
    sim_return=exp((rfr-0.5*vol^2)*t+sqrt(t)*vol*norm_inv_sim)
     st=s*sim_return
     
  #simulate Euro call average payoff max(ST-K,0)
     avg_payoff=mean(ifelse(st-k<=0,0,st-k))
  
  #find present value, discount to time 0
     pv_call=exp(-rfr*t)*avg_payoff
     return(pv_call)
  }
  
  price=euro_price(s0,k,vol,rfr,t,n_sim)
  delta=(abs(euro_price(s0+delta_unit,k,vol,rfr,t,n_sim)-price)+
           abs(euro_price(s0-delta_unit,k,vol,rfr,t,n_sim)-price))/2

    price_list=list(callprice=price,delta=delta)
  return(price_list)
}
