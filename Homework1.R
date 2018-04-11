
#Problem 1 ###
discrete.random.variable<-function(n){
  k<-0
  x<-numeric(n)
  for (k in 1:n){
    u<-runif(1)
    if (u<=0.3){
      x[k]<-0
    }
    if (u>0.3 & u<=0.5){
      x[k]<-1
    }
    if (u>0.5 & u<=1){
      x[k]<-3
    }
    k<-k+1   
  }
  return(x)
}
discrete.random.variable(10)

#Problem 2 ###
standard.random.normal<-function(n){
  k<-0
  x1<-numeric(n)
  x2<-numeric(n)
  for (k in 1:n){
    u<-runif(1)
    v<-runif(1)
    r<-sqrt(-2*log(v))
    theta<-2*pi*u
    x1[k]<-r*cos(theta)
    x2[k]<-r*sin(theta)
    k<-k+1
  }
return(list(x1,x2))
}  
standard.random.normal(10)


#Problem 3(1)###
MC_poisson<-function(n){  
  xbar<-mean(4,4,5,3,1,4,3,6,5,2)
  deta0<-exp(10*xbar-2*10)*(xbar/2)^(-10*xbar)
  count<-0
  for (i in 1:n){
    x<-rpois(10,2)
    lambda<-mean(x)
    deta<-exp(10*lambda-2*10)*(lambda/2)^(-10*lambda)
    if (deta < deta0){
      count<-count+1
    }
    i<-i+1
  }
  p<-count/n
  return(p)
}
MC_poisson(100000)


#Problem 3(2) ###
IS_poisson<-function(n){  
  xbar<-mean(4,4,5,3,1,4,3,6,5,2)
  deta0<-exp(10*xbar-2*10)*(xbar/2)^(-10*xbar)
  count<-0
  for (i in 1:n){
    x<-rpois(10,2.4653)
    mu<-0
    for (j in x){
      ir<-(exp(-2)*2^j)/(exp(-2.4653)*2.4653^j)
      mu<-mu+j*ir
    }
    mubar<-mu/10
    deta<-exp(10*mubar-2*10)*(mubar/2)^(-10*mubar)
    if (deta < deta0){
      count<-count+1
    }
    i<-i+1
  }
  p<-count/n
  return(p)
}
MC_poisson(10000)



#Problem 3(3) ###






#Problem 4 ###
library(smoothmest)   #load the library of smoothmest#
random.normal<-function(n){
    k<-0
    y<-numeric(n)
    for(k in 1:n){
      u<-runif(1)
      x<-rdoublex(1,mu=0,lambda=1) #random variable from standard double exponential distribution#
      if (exp(-0.5*x^2+abs(x)-0.5)>u){
        k<-k+1
        y[k]<-x
      }
    }
    return(y)
  }
  
random.normal(10)
  
#Problem 6 ###
exponential.gamma<-function(n){
  k<-0
  y<-numeric(n)
  for(k in 1:n){
    lamda<-rgamma(n=1,shape=4,rate=2) #generate random gamma distribution#
    y[k]<-rexp(1,rate=lamda)          #generate random exponential distribution#
    k<k+1
  }
  return(y)
}
exponential.gamma(10)