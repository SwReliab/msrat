
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
      newparams <- params
      result <- lapply(self$names, function(nm) self$srms[[nm]]$em(private$get.params(params, nm), self$srms[[nm]]$data, ...))
      names(result) <- self$names
      
      llf <- sum(sapply(result, function(r) r$llf))
      cf <- params[self$params.position$coefficients]
      llf <- llf - length(result) * self$lambda * ((1-self$alpha) * sum(cf^2) / 2 + self$alpha * sum(abs(cf)))
      total <- sapply(result, function(r) r$total)
      
      for (nm in self$names) {
        newparams[self$params.position[[nm]]] <- result[[nm]]$param
      }
      
      wopt <- getOption("warn")
      options(warn = -1)
      result <- glmnet::glmnet(x=data$metrics[,-1], y=total, family=poisson(link=private$linkfun), lambda=self$lambda, alpha=self$alpha, ...)
      options(warn = wopt)
      for (nm in self$names) {
        newparams[self$params.position[[nm]]][1L] <- predict(result, newx=data$metrics[,-1], type="response")[nm,1] # result$fitted.values[nm]
      }
      newparams[self$params.position$coefficients] <- coef(result)[,1]
      
      pdiff <- abs(newparams - params)
      list(param=newparams, pdiff=pdiff, llf=llf, total=NULL)
    },
    # em = function(params, data, ...) {
    #   newparams <- params
    # 
    #   result <- lapply(self$names, function(nm) self$srms[[nm]]$em(private$get.params(params, nm), self$srms[[nm]]$data, ...))
    #   names(result) <- self$names
    # 
    #   llf <- sum(sapply(result, function(r) r$llf))
    #   total <- sapply(result, function(r) r$total)
    #   for (nm in self$names) {
    #     newparams[self$params.position[[nm]]] <- result[[nm]]$param
    #   }
    # 
    #   result <- pnglm.fit(x=data$metrics, y=total, family=poisson(link=private$linkfun),
    #     lambda=self$lambda, K=self$K)
    #   for (nm in self$names) {
    #     newparams[self$params.position[[nm]]][1L] <- result$fitted.values[nm]
    #   }
    #   newparams[self$params.position$coefficients] <- result$coefficients
    # 
    #   pdiff <- newparams - params
    #   list(param=newparams, pdiff=pdiff, llf=llf, total=NULL)
    # },
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
