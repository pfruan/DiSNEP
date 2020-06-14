The aim of this package is to present an improved analytical tool for prioritizing genes associated with diseases using gene network information. Here we present the Disease-Specific Network Enhancement Prioritization (DiSNEP) package. DiSNEP first enhances a comprehensive gene network specifically for a disease through a diffusion process on a gene-gene similarity matrix derived from a type of disease omics data. The enhanced disease-specific gene network thus better reflects true gene interactions for the disease and may improve prioritizing disease-associated genes subsequently.
  
- The package can be installed through:  
*if (!requireNamespace("devtools", quietly = TRUE))*  
    *install.packages("devtools")*  
*library("devtools")*    
*install_github("pfruan/DiSNEP")*    
or  
*directly download the DiSNEP_1.0.2.tar.gz file and install it locally.*  
  
# **Here is an example for how to use the package:** 
  
*library(DiSNEP)*   
  
## **Load example datasets.**
  
*data("s0")*   
*data("adjacency")*   
*data("signals")*   

- s0 is a n * n general network. In this example, we randomly selected 1000 genes from a general gene network STRING [1] and kept the edges of these 100 genes selected from the STRING network.  
- adjacency is a n * n similarity matrix. In this example, we generated the similarity network using the TCGA kidney renal papillary cell carcinoma (KIRP) gene expression data with the same 1000 genes in s0.  
- signals is a n * 2 matrix with gene association signals. Column one has  gene names. Column two has gene association pvalues. In this example, we calculated the association p values using the TCGA KIRP ene expression data with the same 1000 genes in s0.
    
## **Enhance a general network s0 into a disease specific network by diffusion on a similarity network generated from a type of disease omics data.**  
    
*se=diffus_matrix(s0,adjacency,alpha=0.75,iter=10, difference=1e-6)*  

- s0 is the original general gene network.  
- adjacency	is a gene-gene similarity matrix derived from a type of omics data of a disease.  
- alpha is a regularization parameter representing weights for signal sources where α = 0 means no disease-specific enhancement. The default value is 0.75.   
- iter is the number of iterations. The default value is 10.  
- difference	is a parameter for converenge defining when the iteration stops.The default value is 1e-6.  
- the returned value a enhanced gene network.  
  
  
## **Denoise the enhanced network and make it binary and symmetric.**
  
*se_post=post_process(se,percent=0.9)*  
  
- se is the enhanced disease specific network. 
- percent is what percentage of edges to be considered as noise. The default value is 0.9.  
- the returned value is a denoised, binary and symmetric gene network.  
  
  
## **Prioritize the disease association signals by diffusion process on a gene network**
    
*res=diffus_vec(signals,se_post,type="pvalue", beta=0.75, iter=10, difference=1e-6, top=100)*  
  
- t_score is a matrix of original gene signals, with the first colomn is the gene names and the second column is the association signals.  
- snet is a gene network.  
- type indicates the type of input assocaitaion signals, "pvalue" or "zscore". 
- beta is a regularization parameter representing weights for signal sources where beta = 0 means no priotitization. The default value is 0.75.   
- iter is the number of iterations. The default value is 10.    
- difference	is a parameter for converenge defining when the iteration stops.The default value is 1e-6.   
- top is a parameter for how many genes will be selected. The default value is 100.
- the returned value is prioritized genes ranked from high to low.  
  
  
1.	Szklarczyk D, Gable AL, Lyon D, et al. STRING v11: protein–protein association networks with increased coverage, supporting functional discovery in genome-wide experimental datasets. Nucleic Acids Research 2018;47:D607-D613.
