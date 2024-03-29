% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/R6_poireg.R, R/R6_ppoireg.R
\docType{class}
\name{sGLM}
\alias{sGLM}
\alias{sGLM.log}
\alias{sGLM.identity}
\alias{sGLM.penalized}
\alias{sGLM.penalized.log}
\alias{sGLM.penalized.identity}
\title{Class for software reliability model with s-metrics}
\format{
\code{\link{R6Class}} object.
}
\value{
Object of \code{\link{R6Class}} with methods for software reliability model with s-metrics.
}
\description{
Class for software reliability model with s-metrics
}
\section{Fields}{

\describe{
\item{\code{srms}}{A list for srms.}

\item{\code{coef}}{A numeric vector for the regression coefficients.}

\item{\code{faults}}{A numeric vector of the number of total faults.}

\item{\code{df}}{An integer for the degrees of freedom of the model (total).}

\item{\code{data}}{Data to esimate parameters.}
}}

\section{Methods}{

\describe{
  \item{\code{print()}}{This method prints model parameters.}
  \item{\code{omega()}}{This method returns a vector of the number of total faults.}
  \item{\code{coefficients()}}{This method returns a vector of the coefficients for s-metrics.}
  \item{\code{init_params(data)}}{This method changes the model parameters based on a given data.
         This is used to set the initial value for the fitting algorithm.}
  \item{\code{set_params(params)}}{This method sets the model parameters.}
  \item{\code{set_data(data)}}{This method sets data.}
  \item{\code{em(params, data)}}{This method returns a list with an updated parameter vector (param),
         absolute difference of parameter vector (pdiff),
         log-likelihood function for a given parameter vector (llf),
         the number of total faults (total) via EM algorithm for a given data.}
  \item{\code{llf(data)}}{This method returns the log-likelihood function for a given data.}
}
}

\seealso{
\code{\link{fit.srm.poireg}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-print}{\code{sGLM$print()}}
\item \href{#method-omega}{\code{sGLM$omega()}}
\item \href{#method-coefficients}{\code{sGLM$coefficients()}}
\item \href{#method-new}{\code{sGLM$new()}}
\item \href{#method-init_params}{\code{sGLM$init_params()}}
\item \href{#method-set_params}{\code{sGLM$set_params()}}
\item \href{#method-set_data}{\code{sGLM$set_data()}}
\item \href{#method-em}{\code{sGLM$em()}}
\item \href{#method-llf}{\code{sGLM$llf()}}
\item \href{#method-comp_error}{\code{sGLM$comp_error()}}
\item \href{#method-clone}{\code{sGLM$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\if{latex}{\out{\hypertarget{method-print}{}}}
\subsection{Method \code{print()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$print(digits = max(3, getOption("digits") - 3), ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-omega"></a>}}
\if{latex}{\out{\hypertarget{method-omega}{}}}
\subsection{Method \code{omega()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$omega()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-coefficients"></a>}}
\if{latex}{\out{\hypertarget{method-coefficients}{}}}
\subsection{Method \code{coefficients()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$coefficients()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$new(srms, names = NULL, coefficients = c())}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-init_params"></a>}}
\if{latex}{\out{\hypertarget{method-init_params}{}}}
\subsection{Method \code{init_params()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$init_params(data)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-set_params"></a>}}
\if{latex}{\out{\hypertarget{method-set_params}{}}}
\subsection{Method \code{set_params()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$set_params(params)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-set_data"></a>}}
\if{latex}{\out{\hypertarget{method-set_data}{}}}
\subsection{Method \code{set_data()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$set_data(data)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-em"></a>}}
\if{latex}{\out{\hypertarget{method-em}{}}}
\subsection{Method \code{em()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$em(params, data, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-llf"></a>}}
\if{latex}{\out{\hypertarget{method-llf}{}}}
\subsection{Method \code{llf()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$llf(data)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-comp_error"></a>}}
\if{latex}{\out{\hypertarget{method-comp_error}{}}}
\subsection{Method \code{comp_error()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$comp_error(res0, res1)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
\section{Super class}{
\code{\link[msrat:sGLM]{msrat::sGLM}} -> \code{sGLM.log}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-clone}{\code{sGLM.log$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="coefficients">}\href{../../msrat/html/sGLM.html#method-coefficients}{\code{msrat::sGLM$coefficients()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="comp_error">}\href{../../msrat/html/sGLM.html#method-comp_error}{\code{msrat::sGLM$comp_error()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="em">}\href{../../msrat/html/sGLM.html#method-em}{\code{msrat::sGLM$em()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="init_params">}\href{../../msrat/html/sGLM.html#method-init_params}{\code{msrat::sGLM$init_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="initialize">}\href{../../msrat/html/sGLM.html#method-initialize}{\code{msrat::sGLM$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="llf">}\href{../../msrat/html/sGLM.html#method-llf}{\code{msrat::sGLM$llf()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="omega">}\href{../../msrat/html/sGLM.html#method-omega}{\code{msrat::sGLM$omega()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="print">}\href{../../msrat/html/sGLM.html#method-print}{\code{msrat::sGLM$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_data">}\href{../../msrat/html/sGLM.html#method-set_data}{\code{msrat::sGLM$set_data()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_params">}\href{../../msrat/html/sGLM.html#method-set_params}{\code{msrat::sGLM$set_params()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.log$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
\section{Super class}{
\code{\link[msrat:sGLM]{msrat::sGLM}} -> \code{sGLM.identity}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-clone}{\code{sGLM.identity$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="coefficients">}\href{../../msrat/html/sGLM.html#method-coefficients}{\code{msrat::sGLM$coefficients()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="comp_error">}\href{../../msrat/html/sGLM.html#method-comp_error}{\code{msrat::sGLM$comp_error()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="em">}\href{../../msrat/html/sGLM.html#method-em}{\code{msrat::sGLM$em()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="init_params">}\href{../../msrat/html/sGLM.html#method-init_params}{\code{msrat::sGLM$init_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="initialize">}\href{../../msrat/html/sGLM.html#method-initialize}{\code{msrat::sGLM$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="llf">}\href{../../msrat/html/sGLM.html#method-llf}{\code{msrat::sGLM$llf()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="omega">}\href{../../msrat/html/sGLM.html#method-omega}{\code{msrat::sGLM$omega()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="print">}\href{../../msrat/html/sGLM.html#method-print}{\code{msrat::sGLM$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_data">}\href{../../msrat/html/sGLM.html#method-set_data}{\code{msrat::sGLM$set_data()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_params">}\href{../../msrat/html/sGLM.html#method-set_params}{\code{msrat::sGLM$set_params()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.identity$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
\section{Super class}{
\code{\link[msrat:sGLM]{msrat::sGLM}} -> \code{sGLM.penalized}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-set_penalized}{\code{sGLM.penalized$set_penalized()}}
\item \href{#method-em}{\code{sGLM.penalized$em()}}
\item \href{#method-llf}{\code{sGLM.penalized$llf()}}
\item \href{#method-comp_error}{\code{sGLM.penalized$comp_error()}}
\item \href{#method-clone}{\code{sGLM.penalized$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="coefficients">}\href{../../msrat/html/sGLM.html#method-coefficients}{\code{msrat::sGLM$coefficients()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="init_params">}\href{../../msrat/html/sGLM.html#method-init_params}{\code{msrat::sGLM$init_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="initialize">}\href{../../msrat/html/sGLM.html#method-initialize}{\code{msrat::sGLM$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="omega">}\href{../../msrat/html/sGLM.html#method-omega}{\code{msrat::sGLM$omega()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="print">}\href{../../msrat/html/sGLM.html#method-print}{\code{msrat::sGLM$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_data">}\href{../../msrat/html/sGLM.html#method-set_data}{\code{msrat::sGLM$set_data()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_params">}\href{../../msrat/html/sGLM.html#method-set_params}{\code{msrat::sGLM$set_params()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-set_penalized"></a>}}
\if{latex}{\out{\hypertarget{method-set_penalized}{}}}
\subsection{Method \code{set_penalized()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized$set_penalized(lambda, alpha = 1)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-em"></a>}}
\if{latex}{\out{\hypertarget{method-em}{}}}
\subsection{Method \code{em()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized$em(params, data, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-llf"></a>}}
\if{latex}{\out{\hypertarget{method-llf}{}}}
\subsection{Method \code{llf()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized$llf(data)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-comp_error"></a>}}
\if{latex}{\out{\hypertarget{method-comp_error}{}}}
\subsection{Method \code{comp_error()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized$comp_error(res0, res1)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
\section{Super classes}{
\code{\link[msrat:sGLM]{msrat::sGLM}} -> \code{\link[msrat:sGLM.penalized]{msrat::sGLM.penalized}} -> \code{sGLM.penalized.log}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-clone}{\code{sGLM.penalized.log$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="coefficients">}\href{../../msrat/html/sGLM.html#method-coefficients}{\code{msrat::sGLM$coefficients()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="init_params">}\href{../../msrat/html/sGLM.html#method-init_params}{\code{msrat::sGLM$init_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="initialize">}\href{../../msrat/html/sGLM.html#method-initialize}{\code{msrat::sGLM$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="omega">}\href{../../msrat/html/sGLM.html#method-omega}{\code{msrat::sGLM$omega()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="print">}\href{../../msrat/html/sGLM.html#method-print}{\code{msrat::sGLM$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_data">}\href{../../msrat/html/sGLM.html#method-set_data}{\code{msrat::sGLM$set_data()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_params">}\href{../../msrat/html/sGLM.html#method-set_params}{\code{msrat::sGLM$set_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="comp_error">}\href{../../msrat/html/sGLM.penalized.html#method-comp_error}{\code{msrat::sGLM.penalized$comp_error()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="em">}\href{../../msrat/html/sGLM.penalized.html#method-em}{\code{msrat::sGLM.penalized$em()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="llf">}\href{../../msrat/html/sGLM.penalized.html#method-llf}{\code{msrat::sGLM.penalized$llf()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="set_penalized">}\href{../../msrat/html/sGLM.penalized.html#method-set_penalized}{\code{msrat::sGLM.penalized$set_penalized()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized.log$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
\section{Super classes}{
\code{\link[msrat:sGLM]{msrat::sGLM}} -> \code{\link[msrat:sGLM.penalized]{msrat::sGLM.penalized}} -> \code{sGLM.penalized.identity}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-clone}{\code{sGLM.penalized.identity$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="coefficients">}\href{../../msrat/html/sGLM.html#method-coefficients}{\code{msrat::sGLM$coefficients()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="init_params">}\href{../../msrat/html/sGLM.html#method-init_params}{\code{msrat::sGLM$init_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="initialize">}\href{../../msrat/html/sGLM.html#method-initialize}{\code{msrat::sGLM$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="omega">}\href{../../msrat/html/sGLM.html#method-omega}{\code{msrat::sGLM$omega()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="print">}\href{../../msrat/html/sGLM.html#method-print}{\code{msrat::sGLM$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_data">}\href{../../msrat/html/sGLM.html#method-set_data}{\code{msrat::sGLM$set_data()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM" data-id="set_params">}\href{../../msrat/html/sGLM.html#method-set_params}{\code{msrat::sGLM$set_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="comp_error">}\href{../../msrat/html/sGLM.penalized.html#method-comp_error}{\code{msrat::sGLM.penalized$comp_error()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="em">}\href{../../msrat/html/sGLM.penalized.html#method-em}{\code{msrat::sGLM.penalized$em()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="llf">}\href{../../msrat/html/sGLM.penalized.html#method-llf}{\code{msrat::sGLM.penalized$llf()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="msrat" data-topic="sGLM.penalized" data-id="set_penalized">}\href{../../msrat/html/sGLM.penalized.html#method-set_penalized}{\code{msrat::sGLM.penalized$set_penalized()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{sGLM.penalized.identity$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
