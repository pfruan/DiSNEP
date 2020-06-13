A Disease-Specific Network Enhancement Prioritization (DiSNEP) framework that enhances a comprehensive gene network for a disease using a gene-gene similarity network derived from a type of omics data of the disease that reflects correlations/interactions between genes for the disease, through a diffusion process.  
  
The package can be installed through:  
library("devtools")  
install_github("pfruan/DiSNEP")  
or  
directly download the abSNF_1.0.2.tar.gz file and install it locally.

Here is an example for how to use the package:

library(DiSNEP)

#load example dataset
#s0 is a general network, which contains 1000 genes.
#adjacency is a similarity matrix,which contains 1000 genes.
#signals is a gene association signals matrix with one column of genes' name and one column of genes' association p values.
data("s0")
data("adjacency")
data("signals")

#enhance the general network s0 into a disease specific network by diffusion on similarity network generated from disease omics data.    
#s0 is the original general gene network.
#adjacency	is a gene-gene similarity network derived from a type of omics data of a disease.
#alpha is a regularization parameter representing weights for signal sources where α = 0 means no disease-specific enhancement. The default value is 0.75. 
#iter is the number of iterations. The default value is 10.
#difference	is a parameter for converenge defining when the iteration stops.The default value is 1e-6.
#the returned se a enhanced gene network.
se=diffus_matrix(s0,adjacency,alpha=0.75,iter=10, difference=1e-6)

#denoise the enhanced network and make it binary and symmetric.    
#se is the enhanced disease specific network.
#percent is what percentage of edges to be considered as noise. The default value is 0.9.
#The returned value is a denoised, binary and symmetric gene network.
se_post=post_process(se,percent=0.9)

#prioritize the disease association signals by diffusion process on a gene network.  
#t_score is a matrix of original gene signals, with the first colomn is the gene names and the second column is the association signals.
#snet is a gene network.
#type indicates the type of input assocaitaion signals, "pvalue" or "zscore"
#beta is a regularization parameter representing weights for signal sources where beta = 0 means no priotitization. The default value is 0.75. 
#iter is the number of iterations. The default value is 10.
#difference	is a parameter for converenge defining when the iteration stops.The default value is 1e-6.
#The returned value is a list of prioritized genes ranked from high to low.
res=diffus_vec(signals,se_post,type="pvalue", beta=0.75, iter=10, difference=1e-6)
