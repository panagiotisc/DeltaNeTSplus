% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deltanetsPlus.R
\name{deltanetsPlus}
\alias{deltanetsPlus}
\title{DeltaNeTS+ function}
\usage{
deltanetsPlus(
  data,
  slope = NULL,
  grn = NULL,
  perturbation = c("group", "individual"),
  group = NULL,
  cv.method = c("cv", "loo"),
  kfolds = 10,
  lambda = NULL,
  cv.opt = c("lambda.min", "lambda.1se"),
  gset = NULL,
  A.return = FALSE,
  par = FALSE,
  numClusters = 4
)
}
\arguments{
\item{data}{a deltanetsPlus object or a numeric matrix/data.frame of log2FC data. For log2FC data, each row represents a gene and each column represents a sample.}

\item{slope}{The slope matrix from time-series log2FC data. The number of rows should be the same as the number of rows in the log2FC data. If a deltanetsPlus object is used or the log2FC data only include steady-state samples, no need to provide the \code{slope} input.}

\item{grn}{an nX2 matrix or data.frame of TF-gene interactions (optional). The 1st column is TFs and the 2nd column is the corresponding targets. The symbol in \code{grn} should be the same format of the rowanames of log2FC data. If grn is not provided, Lasso regression will be used to infer a DeltaNeTS+ model. Otherwise, ridge regression is used.}

\item{perturbation}{"group"(default) or "individual". "group" means predicting over all perturbation for each group. "individual" means predicting sample-by-sample perturbations. If \code{perturbation} is null, no need to provde \code{group}.}

\item{group}{A factor of group indication. The length of group should be equal to the number of samples. If \code{group} is null but \code{perturbation}="group", the group information will be obatined from the deltanetsPlus object provided.}

\item{cv.method}{"cv"(cross-validation, default) or "loo"(leave-one-out). If "loo" is selected, the input of \code{kfolds} will be ignored.}

\item{kfolds}{The number of folds for k-fold cross validation. Default==10.}

\item{lambda}{A sequence of lambda values for glmnet regression. We recommend the default value = 10^seq(-2,5,length.out=100).}

\item{cv.opt}{"lambda.min"(default) or "lambda.1se". For \code{perturbation}=="group", "lambda.1se" may perform better.}

\item{gset}{A subset of genes when you want to calculate perturbation for only those genes.}

\item{A.return}{A logical value. If it's ture, A matrix (network) will be returned. The default is FALSE, due to a large dimension of A in typical.}

\item{par}{A logical value. If TRUE, multipe cores are used for parallel computing. The default is FALSE (no parallel computation).}

\item{numClusters}{The number of cores for parallel computing. The default is 4.}
}
\value{
a list of two matrices
\item{P}{The matrix of gene perturbations. Each row corresponds to a gene following the same order as the one in the log2FC data, while each column corresponds to the levels of \code{group}.}
\item{A}{The n*n matrix of the inferred gene regulatory network. The (i,j)-th element of the matrix corresponds to the regulatory impact of gene j on gene i. The rwos and columns of the matrix correspond to genes following the same order as the one in the log2FC data.}
}
\description{
The main function for DeltaNeTS+ for inferring gene perturbations for each sample.
}
