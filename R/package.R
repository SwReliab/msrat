#' msrat: Metrics-Based Software Reliability Assessment Tool
#'
#' This package provides estimation programs for metrics-based software
#' reliability growth models with logistic regression for dynamic metrics
#' and Poisson regression for static metrics.
#'
#' @docType package
#' @name msrat
#' @import R6 Rsrat Rphsrm
#' @importFrom stats nobs model.frame model.response model.matrix gaussian
#' @importFrom Matrix Matrix
#' @importFrom Rcpp sourceCpp
#' @import glmnet
#' @useDynLib msrat
NULL
