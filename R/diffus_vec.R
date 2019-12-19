diffus_vec=function(t_score,snet,beta=0.75,iter=10,difference=1e-6){
  p=as.matrix(t_score$score)
  p1=p
  j=1
  repeat{
    p=p1
    p1<-beta*mat.mult(snet,p)+(1-beta)*(t_score$score)
    p_diff=sum(abs((p1-p)))
    j=j+1
    pp=data.frame(gene=t_score$gene,score=p1)
    pp=pp[order(pp$score,decreasing = T),]
    if(j>iter){return(pp)}
    if (p_diff<1e-6) {return(pp)}
  }
}
