
#' @rdname sGLM
sGLM.penalized <- R6::R6Class("sGLM.penalized",
  inherit = sGLM,
  public = list(
    lambda = NULL,
    alpha = 1,
    set_penalized = function(lambda, alpha = 1) {
      self$lambda <- lambda
      self$alpha <- alpha
    },
    em = function(params, data, ...) {
      srmresult <- lapply(self$names,
                       function(nm) self$srms[[nm]]$em(params[[nm]], self$srms[[nm]]$data, ...))
      names(srmresult) <- self$names
      
      llf <- sum(sapply(srmresult, function(r) r$llf))
      total <- sapply(srmresult, function(r) r$total)
      
      wopt <- getOption("warn")
      options(warn = -1)
      regresult <- glmnet::glmnet(x=data$metrics[,-1], y=total, family=poisson(link=private$linkfun), lambda=self$lambda, alpha=self$alpha, ...)
      options(warn = wopt)
      newparams <- list()
      for (nm in self$names) {
        omega <- predict(regresult, newx=data$metrics[,-1], type="response")[nm,1]
        params <- srmresult[[nm]]$param
        newparams[[nm]] <- self$srms[[nm]]$set_omega(params, omega)
      }
      newparams[["coef"]] <- coef(regresult)[,1]

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
sGLM.penalized.log <- R6::R6Class("sGLM.penalized.log",
  inherit = sGLM.penalized,
  private = list(
    linkfun = "log"
  ),
  public = list(
    name = "sGLM.penalized.log"
  )
)

#' @rdname sGLM
#' @export
sGLM.penalized.identity <- R6::R6Class("sGLM.penalized.identity",
  inherit = sGLM.penalized,
  private = list(
    linkfun = "identity"
  ),
  public = list(
    name = "sGLM.penalized.identity"
  )
)
