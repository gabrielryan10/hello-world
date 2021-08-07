#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
class pi_est:
  def __init__(self,n_sim):
    self.n_sim=n_sim
  
  def method(self):
    print('Monte Carlo estimate of Pi')

  def result(self):
    try:
      x_rand=np.random.uniform(low=0,high=1,size=self.n_sim) 
      y_rand=(1-x_rand**2)**0.5
      rand_num=np.random.uniform(low=0,high=1,size=self.n_sim)

      df=pd.DataFrame(x_rand,columns=['x_rand'])
      df['y_rand']=y_rand
      df['rand']=rand_num
      self.pi_est=df.apply(lambda x: 1 if x.rand<=x.y_rand else 0,axis=1).sum()/self.n_sim*4
    
    except Exception as e:
      print("Error occured. Error type is",type(e).__name__)
    
    else:
      print("Estimate value of Pi is",self.pi_est)

