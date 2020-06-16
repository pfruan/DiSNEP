This package presents an improved analytical tool for prioritizing genes associated with diseases using gene network information. The DiSNEP package implemented the Disease-Specific Network Enhancement Prioritization (DiSNEP) framework. The DiSNEP framework first enhances a comprehensive gene network specifically for a disease through a diffusion process on a gene-gene similarity matrix derived from a disease omics data. The enhanced disease-specific gene network thus better reflects true gene interactions for the disease and may improve prioritizing disease-associated genes subsequently.[1]
  
- The package can be installed through:  
*if (!requireNamespace("devtools", quietly = TRUE))*  
    *install.packages("devtools")*  
*library("devtools")*    
*install_github("pfruan/DiSNEP")*    
  
- The package DiSNEP depends on: R (>= 3.5.0), SMUT (>= 1.1), Rcpp (>= 0.12.3)  
  
# **A brief tutorial:** 
  
*library(DiSNEP)*   
  
## **Load example datasets.**
  
*data("s0")*   
*data("adjacency")*   
*data("signals")*   

- ‘s0’ is a n * n matrix representing a general network, where we randomly selected 1,000 genes from a general gene network STRING [2] and kept the edges of these 1,000 genes selected from the STRING network.  
- ‘adjacency’ is a n * n gene-gene similarity matrix derived from a disease omics data.  
- ‘signals’ is a n * 2 matrix with gene association signals, where column one has gene names and column two has gene association p-values obtained from paired t-tests comparing TCGA KIRP gene expression levels between tumor samples and adjacent normal samples on the same 1,000 genes in ‘s0’.
    
## **Enhance a general network s0 into a disease specific network by diffusion on a similarity matrix generated from a disease omics data.**  
    
*se=diffus_matrix(s0,adjacency,alpha=0.75,iter=10, difference=1e-6)*  

- 's0’ is the original general gene network. 
- ‘adjacency’	is a gene-gene similarity matrix derived from a type of omics data of a disease.  
- ‘alpha’ is a regularization parameter representing weights for signal sources where α = 0 means no disease-specific enhancement. The default value is 0.75.
- ‘iter’ is number of iterations. The default value is 10. 
- ‘difference’ is a parameter defining convergence when iterations stop. The default value is 1e-6.
- the returned value an enhanced gene network.  
  
  
## **Denoise the enhanced network and make it binary and symmetric.**
  
*se_post=post_process(se,percent=0.9)*  
  
- ‘se’ is the enhanced disease specific network. 
- ‘percent’ is what percentage of edges to be considered as noise. The default value is 0.9.  
- the returned value is a denoised, binary and symmetric gene network.  
  
  
## **Prioritize the disease association signals by diffusion process on a gene network**
    
*res=diffus_vec(signals,se_post,type="pvalue", beta=0.75, iter=10, difference=1e-6, top=100)*  
  
- ‘signals’ is a n * 2 matrix with gene association signals, where column one has gene names and column two has association signals.  
- 'se_post' is the disease-specific gene network.  
- ‘type’ indicates the type of input association signals, "pvalue" or "zscore". 
- ‘beta’ is a regularization parameter representing weights for signal sources where beta = 0 means no prioritization. The default value is 0.75.   
- ‘iter’ is number of iterations. The default value is 10.    
- ‘difference’ is a parameter defining convergence when iterations stop. The default value is 1e-6.   
- ‘top’ is a parameter indicating number of top ranked genes selected. The default value is 100.
- the returned value is selected prioritized genes.  
  
## Reference  
1. Ruan P, Wang S DiSNEP: a Disease-Specific gene Network Enhancement to improve Prioritizing candidate disease genes. Briefings in Bioinformatics, submitted
2. Szklarczyk D, Gable AL, Lyon D, et al. STRING v11: protein–protein association networks with increased coverage, supporting functional discovery in genome-wide experimental datasets. Nucleic Acids Research 2018;47:D607-D613.
 
