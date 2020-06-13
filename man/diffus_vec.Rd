\name{diffus_vec}
\alias{diffus_vec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Prioritizing signal genes by diffusion process
}
\description{
Prioritizing signal genes by diffusion process with a gene network.
}
\usage{
diffus_vec(t_score, snet, type, beta=0.75, iter=10, difference=1e-6, top=100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{t_score}{
A matrix of original gene signals, with the first colomn is the gene names and the second column is the association signals.
}
  \item{snet}{
A gene network.
}
  \item{type}{
The type of input association signals, p value or z score.
}
  \item{beta}{
A regularization parameter representing weights for signal sources where beta = 0 means no priotitization.
}
  \item{iter}{
Number of iterations.
}
  \item{difference}{
A parameter for converenge.
}
\item{top}{
A parameter for how many candidate genes will be selected.
}
}
\value{
The prioritized candidate genes with signal scores from large to small.
}
\references{
DiSNEP: a Disease-Specific gene Network Enhancement to improve Prioritizing candidate disease genes (2020), Peifeng Ruan, Shuang Wang.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{

#enhance the general network s0 into a disease specific network by diffusion on similarity network generated from disease omics data.
se=diffus_matrix(s0,adjacency)

#denoise the enhanced network and make it binary and symmetric.
se_post=post_process(se)

#prioritize the disease association signals.
res=diffus_vec(signals,se_post,"pvalue")


}
