# -*- coding: utf-8 -*-
"""
Created on Wed Sep 20 12:11:19 2017

@author: ji758507
"""
import math
import pandas as pd
import numpy as np
import scipy.stats

from scipy.stats import norm

#Problem 1 ###
def discrete_random_variable(n):
    k=0
    x_list=[]
    while k < n :
        u=np.random.uniform(0,1,1)
        if u<=0.3:
            x=0
        elif u<=0.5:
            x=1
        else:
            x=3
        x_list.append(x)
        k=k+1
    return x_list

print(discrete_random_variable(10))

#Problem 2 ###
def standard_random_normal(n): 
    x1_list=[]
    x2_list=[]
    k=0
    while k < n :
        u=np.random.uniform(0,1,1)
        v=np.random.uniform(0,1,1)
        r=np.sqrt(-2*np.log(v))
        theta=2*np.pi*u
        x1=r*np.cos(theta)
        x2=r*np.sin(theta)
        x1_list.append(x1)
        x2_list.append(x2)
        k=k+1
    return x1_list, x2_list

print(standard_random_normal(10))

#Problem 3（1） ###
def MC_poisson(n): 
    xbar0=np.mean([4,4,5,3,1,4,3,6,5,2])
    deta0=np.exp(10*xbar0-2*10)*(xbar0/2)**(-10*xbar0)
    count=0
    k=0
    while k < n :
        x=np.random.poisson(2,10)
        xbar=np.mean(x)
        deta=np.exp(10*xbar-2*10)*(xbar/2)**(-10*xbar)
        if deta<deta0:
            count=count+1
        k=k+1
    p=count/n
    return(p)

print(MC_poisson(10000))

#Problem 3（2） ###
def IS_poisson(n): 
    xbar0=np.mean([4,4,5,3,1,4,3,6,5,2])
    deta0=np.exp(10*xbar0-2*10)*(xbar0/2)**(-10*xbar0)
    count=0
    k=0
    while k < n :
        x=np.random.poisson(2.4653,10)
        mu=0
        for j in x:
            ir=(np.exp(-2)*2**j)/(np.exp(-2.4653)*2.4653**j)
            mu=mu+j*ir
        xbar=mu/10
        deta=np.exp(10*xbar-2*10)*(xbar/2)**(-10*xbar)
        if deta<deta0:
            count=count+1
        k=k+1
    p=count/n
    return(p)

print(IS_poisson(100000))


#Problem 4 ###
def random_normal(n): 
    k=0
    y_list=[]
    while k < n :
        u=np.random.uniform(0,1,1)
        x=np.random.laplace(0,1,1)
        if np.exp(-0.5*x**2+np.abs(x)-0.5)>u:
            y=x
            k=k+1
        y_list.append(y)
    return y_list

print(random_normal(10))

#Problem 6 ###
def exponential_gamma(n): 
    k=0
    y_list=[]
    while k < n :  
        lamda=np.random.gamma(4,2,1)
        y=np.random.exponential(lamda,1)
        k=k+1
        y_list.append(y)
    return y_list 

print(exponential_gamma(10))

