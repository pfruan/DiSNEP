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
diffus_vec(t_score, snet, beta=0.75, iter=10, difference=1e-6)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{t_score}{
A matrix of original gene signals, with one colomn's name is gene and the other column's name is score.
}
  \item{snet}{
A gene network.
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
}
\value{
The prioritized candidate genes with signal scores from large to small.
}
\references{
DiSNEP: a Disease-Specific gene Network Enhancement to improve Prioritizing candidate disease genes (2019), Peifeng Ruan, Shuang Wang.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{

#GE=diffus_vec(t_score,snet)

}
