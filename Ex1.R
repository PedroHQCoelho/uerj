#Amostragem de distribui��o binomial

#Dados
n<-10 
p<-0.5
x<-10 
a<-0
t<-0
v<-0
h<-1:n
#Gerar amostras aleat�rias entre 0 e 1
discrete<-sample(0:1,n,replace=TRUE)

#Distribui��o uniforme
continuous<-runif(n, min=0, max=1)
#Aproximar para 0 ou 1

for(i in 1:n){
  if(continuous[i]>p){
    v[i]<-1}
    else
      v[i]<-0
    
  }


for(i in 1:n){
  if(continuous[i]<=p){
    a[i]<-t}
 
    
  else{
    t<-t+1
   a[i]<-t}  

}

plot(h,a)
lines(h,a) 


#Gerar histogramas
hist(discrete)
hist(continuous)
hist(v)


#Distribui��o binomial 
bin<-dbinom(1:x, size=n, prob=p)