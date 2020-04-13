\name{signals}
\alias{signals}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
An example of an association signals.
}
\description{
An example of an association signals for 1000 genes randomly generated from TCGA KIRP gene expression data.
}


\references{
DiSNEP: a Disease-Specific gene Network Enhancement to improve Prioritizing candidate disease genes (2020), Peifeng Ruan, Shuang Wang.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{

#enhance the general network s0 into a disease specific network by diffusion on similarity network generated from disease omics data.
se=diffus_matrix(s0,adjacency)

#denoise the enhanced network and make it symmetric.
se_post=post_process(se)

#prioritize the disease association signals.
res=diffus_vec(signals,se_post,"pvalue")

}
