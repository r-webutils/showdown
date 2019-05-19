showdown
================

Show file contents in RMarkdown documents with syntax highlighting

## Installation

``` r
devtools::install_github("GregorDeCillia/showdown")
```

## Usage

``` r
library(showdown)
show_file("R/show_file.R")
```

```` r
#' show contents of a file with syntax highlighting
#'
#' @param file a path to a file to show
#' @param lang the language used for syntax higlighing
#'
#' @export
show_file <- function(file, lang = tools::file_ext(file)) {
  content <- paste(readLines(file), collapse = "\n")
  knitr::asis_output(
    paste0(
      "```", lang, "\n",
      content, "\n",
      "```"
    )
  )
}
````

``` r
show_file("DESCRIPTION")
```

    Package: showdown
    Type: Package
    Title: Show file contents in RMarkdown documents
    Version: 0.1.0
    Author: Gregor de Cillia
    Maintainer: Gregor de Cillia <de.cillia.gregor@gmail.com>
    Description: This package allows you to list file contents in RMarkdown
        documents. Syntax highlighting is applied according to the file extension.
    License: MIT + file LICENSE
    Encoding: UTF-8
    LazyData: true
    RoxygenNote: 6.1.1
    Imports: 
        tools,
        knitr
    Roxygen: list(markdown = TRUE)

``` r
show_file_github("statistikat/surveysd", "src/compute_linear.cpp")
```

``` cpp
#include <Rcpp.h>
using namespace Rcpp;

//' @rdname computeFrac
//' @export
// [[Rcpp::export]]
NumericVector computeLinear(double curValue,
                            double target,
                            const NumericVector& x,
                            const NumericVector& w,
                            double boundLinear = 10) {
  double h = 0.0;
  double j = 0.0;
  double N = 0.0;

  for(int i = 0; i < x.size(); i++){
    h += w[i]*x[i];
    j += w[i]*x[i]*x[i];
    N += w[i];
  }

  double b = (target-N*j/h)/(h-N*j/h);
  double a = (N-b*N)/h;

  NumericVector f(x.size());
  for(int i = 0; i < x.size(); i++)
    f[i] = a*x[i] + b;

  //apply bounds
  for(int i = 0; i < x.size(); i++){
    if (f[i] < 1.0/boundLinear)
      f[i] = 1.0/boundLinear;
    if (f[i] > boundLinear)
      f[i] = boundLinear;
  }

  return f;
}

//' @rdname computeFrac
//' @export
// [[Rcpp::export]]
NumericVector computeLinearG1(double curValue,
                              double target,
                              const NumericVector& x,
                              const NumericVector& w,
                              double boundLinear = 10) {
  NumericVector f(x.size());
  f=computeLinear(curValue,target,x,w,boundLinear);
  for(int i = 0; i < x.size(); i++){
    if (f[i]*w[i] < 1.0){
      f[i]=1/w[i];
    }
  }
  return f;
}
```
