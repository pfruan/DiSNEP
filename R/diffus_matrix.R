diffus_matrix=function(s0,adjacency,alpha=0.75,iter=10,difference=1e-6){
  snet_1=s0
  snet=snet_1
  for(kk in 1:iter){
    snet_1<-alpha*mat.mult(adjacency,snet)+(1-alpha)*(s0)
    diff=max(abs(snet_1-snet))
    print(c("iteration:",kk,"difference:",diff))
    if(diff<difference){return(snet_1)}
    snet=snet_1
  }
  return(snet_1)
}
