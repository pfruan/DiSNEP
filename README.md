A Disease-Specific Network Enhancement Prioritization (DiSNEP) framework that enhances a comprehensive gene network for a disease using a gene-gene similarity network derived from a type of omics data of the disease that reflects correlations/interactions between genes for the disease, through a diffusion process.  
  
The package can be installed through:  
library("devtools")  
install_github("pfruan/DiSNEP")  
or  
directly download the abSNF_1.0.0.tar.gz file and install it locally.

Here is an example for how to use the package:

#An example of an association signals.        
load("signals")

#An example of an adjacency matrix.    
load("adjacency")  

#An example of a general gene network.    
load("s0")

#enhance the general network s0 into a disease specific network by diffusion on similarity network generated from disease omics data.    
se=diffus_matrix(s0,adjacency)

#denoise the enhanced network and make it symmetric.    
se_post=post_process(se)

#prioritize the disease association signals.    
res=diffus_vec(signals,se_post,"pvalue")


