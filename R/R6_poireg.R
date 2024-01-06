#' Class for software reliability model with s-metrics
#'
#' @docType class
#' @name sGLM
#' @return Object of \code{\link{R6Class}} with methods for software reliability model with s-metrics.
#' @format \code{\link{R6Class}} object.
#' @field srms A list for srms.
#' @field coef A numeric vector for the regression coefficients.
#' @field faults A numeric vector of the number of total faults.
#' @field df An integer for the degrees of freedom of the model (total).
#' @field data Data to esimate parameters.
#'
#' @section Methods:
#' \describe{
#'   \item{\code{print()}}{This method prints model parameters.}
#'   \item{\code{omega()}}{This method returns a vector of the number of total faults.}
#'   \item{\code{coefficients()}}{This method returns a vector of the coefficients for s-metrics.}
#'   \item{\code{init_params(data)}}{This method changes the model parameters based on a given data.
#'          This is used to set the initial value for the fitting algorithm.}
#'   \item{\code{set_params(params)}}{This method sets the model parameters.}
#'   \item{\code{set_data(data)}}{This method sets data.}
#'   \item{\code{em(params, data)}}{This method returns a list with an updated parameter vector (param),
#'          absolute difference of parameter vector (pdiff),
#'          log-likelihood function for a given parameter vector (llf),
#'          the number of total faults (total) via EM algorithm for a given data.}
#'   \item{\code{llf(data)}}{This method returns the log-likelihood function for a given data.}
#' }
#' @seealso \code{\link{fit.srm.poireg}}
NULL

#' @rdname sGLM
sGLM <- R6::R6Class("sGLM",
  private = list(
    linkfun = NA
  ),
  public = list(
    name = NA,
    names = NULL,
    srms = NULL,
    params = NA,
    df = NULL,
    data = NULL,
    print = function(digits = max(3, getOption("digits") - 3), ...) {
      print(self$data)
      cat(gettextf("\nLink function: %s\n", private$linkfun))
      print(self$coefficients())
      for (nm in self$names) {
        cat(gettextf("\n%s\n", nm))
        print(self$srms[[nm]])
      }
    },
    omega = function() {
      result <- sapply(self$names, function(nm) self$srms[[nm]]$omega())
      names(result) <- self$names
      result
    },
    coefficients = function() {
      stopifnot(any(names(self$params) == "coef"))
      result <- self$params[["coef"]]
      names(result) <- colnames(self$data$metrics)
      result
    },
    initialize = function(srms, names = NULL, coefficients = c()) {
      if (is.null(names)) {
        if (is.null(names(srms))) {
          stop("names or names of srms list should be needed.")
        }
        else {
          self$names <- names(srms)
          self$srms <- srms
        }
      }
      else {
        if (is.null(names(srms))) {
          m <- length(names)
          if (length(srms) < m) {
            stop("length of srms should be greater than or equal to m.")
          }
          else {
            self$names <- names
            self$srms <- lapply(1:m, function(i) srms[[i]])
            names(self$srms) <- self$names
          }
        }
        else {
          stopifnot(all(names %in% names(srms)))
          self$names <- names
          self$srms <- lapply(self$names, function(nm) srms[[nm]])
          names(self$srms) <- self$names
        }
      }

      self$params <- lapply(self$names, function(nm) self$srms[[nm]]$params)
      names(self$params) <- self$names
      self$params[["coef"]] <- coefficients
      self$df <- sum(sapply(srms, function(m) m$df-1L))  + length(self$params[["coef"]])
    },
    init_params = function(data) {
      stopifnot(all(self$names %in% data$names))
      self$params <- lapply(self$names,
                            function(nm) self$srms[[nm]]$init_params(self$srms[[nm]]$data))
      names(self$params) <- self$names
      self$params[["coef"]] <- numeric(data$nmetrics)
      self$df <- sum(sapply(self$srms, function(m) m$df-1L))  + length(self$params[["coef"]])

      res <- self$em(self$params, data)
      self$set_params(res$param)
    },
    set_params = function(params) {
      for (nm in self$names) {
        self$srms[[nm]]$set_params(params[[nm]])
      }
      self$params <- params
    },
    set_data = function(data) { self$data <- data },
    em = function(params, data, ...) {
      srmresult <- lapply(self$names,
                       function(nm) self$srms[[nm]]$em(params[[nm]], self$srms[[nm]]$data, ...))
      names(srmresult) <- self$names

      llf <- sum(sapply(srmresult, function(r) r$llf))
      total <- sapply(srmresult, function(r) r$total)

      wopt <- getOption("warn")
      options(warn = -1)
      regresult <- glm.fit(x=data$metrics, y=total, family=poisson(link=private$linkfun), ...)
      options(warn = wopt)
      newparams <- list()
      for (nm in self$names) {
        omega <- regresult$fitted.values[nm]
        pp <- srmresult[[nm]]$param
        newparams[[nm]] <- self$srms[[nm]]$set_omega(pp, omega)
      }
      newparams[["coef"]] <- regresult$coefficients

      pdiff <- abs(newparams[["coef"]] - params[["coef"]]) # should be changed
      list(param=newparams, pdiff=pdiff, llf=llf, total=NULL)
    },
    llf = function(data) {
      sum(sapply(self$names, function(nm) self$srms[[nm]]$llf(self$srms[[nm]]$data)))
    },
    comp_error = function(res0, res1) {
      sdiff <- res1$llf - res0$llf
      aerror <- abs(res1$llf - res0$llf)
      rerror <- aerror / abs(res0$llf)
      c(aerror, rerror, sdiff)
    }
  )
)

#' @rdname sGLM
#' @export
sGLM.log <- R6::R6Class("sGLM.log",
  inherit = sGLM,
  private = list(
    linkfun = "log"
  ),
  public = list(
    name = "sGLM.log"
  )
)

#' @rdname sGLM
#' @export
sGLM.identity <- R6::R6Class("sGLM.identity",
  inherit = sGLM,
  private = list(
    linkfun = "identity"
  ),
  public = list(
    name = "sGLM.identity"
  )
)
