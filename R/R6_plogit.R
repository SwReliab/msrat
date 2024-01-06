
#' @rdname dGLM
dGLM.penalized <- R6::R6Class("dGLM.penalized",
  inherit = dGLM,
  public = list(
    lambda = NULL,
    alpha = 1,
    set_penalized = function(lambda, alpha = 1) {
      self$lambda <- lambda
      self$alpha <- alpha
    },
    em = function(params, data, ...) {
      omega <- params[1]
      coefficients <- params[2L:length(params)]
      family <- binomial(link = private$linkfun)
      eta <- data$metrics %*% coefficients + data$offset
      mu <- family$linkinv(eta)
      residual <- omega * prod(1-mu)
      total <- sum(data$fault) + residual
      rfault <- total - cumsum(data$fault)
      wopt <- getOption("warn")
      options(warn = -1)
      result <- glmnet::glmnet(x=data$metrics[,-1], y=cbind(data$fault, rfault),
                        family=binomial(link=private$linkfun), offset=data$offset,
                        lambda=self$lambda, alpha=self$alpha, ...)
      options(warn = wopt)
      cf <- coef(result)[,1]
      newparams <- c(total, cf)
      names(newparams) <- c("omega", names(cf))
      pdiff <- abs(params - newparams)
      llf <- self$llf(data, omega=omega, mu=mu)
      # llf <- llf - self$lambda * ((1-self$alpha) * sum(cf^2) / 2 + self$alpha * sum(abs(cf)))
      list(param=newparams, pdiff=pdiff, llf=llf, total=total)
    },
    llf = function(data, fault, omega, mu) {
      super$llf(data, fault, omega, mu)
    }
  )
)

#' @rdname dGLM
#' @export
dGLM.penalized.logit <- R6::R6Class("dGLM.penalized.logit",
  inherit = dGLM.penalized,
  private = list(
    linkfun = "logit"
  ),
  public = list(
    name = "dGLM.penalized.logit"
  )
)

#' @rdname dGLM
#' @export
dGLM.penalized.probit <- R6::R6Class("dGLM.penalized.probit",
  inherit = dGLM.penalized,
  private = list(
    linkfun = "probit"
  ),
  public = list(
    name = "dGLM.penalized.probit"
  )
)

#' @rdname dGLM
#' @export
dGLM.penalized.cloglog <- R6::R6Class("dGLM.penalized.cloglog",
  inherit = dGLM.penalized,
  private = list(
    linkfun = "cloglog"
  ),
  public = list(
    name = "dGLM.penalized.cloglog"
  )
)
