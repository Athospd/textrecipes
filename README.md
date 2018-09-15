
<!-- README.md is generated from README.Rmd. Please edit that file -->

# textrecipes

[![Travis build
status](https://travis-ci.org/EmilHvitfeldt/textrecipes.svg?branch=master)](https://travis-ci.org/EmilHvitfeldt/textrecipes)
[![Coverage
status](https://codecov.io/gh/EmilHvitfeldt/textrecipes/branch/master/graph/badge.svg)](https://codecov.io/github/EmilHvitfeldt/textrecipes?branch=master)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/textrecipes)](http://cran.r-project.org/web/packages/textrecipes)
[![Downloads](http://cranlogs.r-pkg.org/badges/textrecipes)](http://cran.rstudio.com/package=textrecipes)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

**textrecipes** contains extra steps for the
[`recipes`](http://cran.rstudio.com/package=recipes) package for
preprocessing text data.

## Installation

textrecipes is not avaliable from [CRAN](https://CRAN.R-project.org)
yet. But the development version can be downloaded with:

``` r
require("devtools")
install_github("emilhvitfeldt/textrecipes")
```

## Example

## Type chart

**textrecipes** includes a little departure in design from **recipes**
in the sense that it allows some input and output to be in the form of
list columns. To avoind confusion here is a table of steps with their
expected input and output respectively. Notice how you need to end with
numeric for future analysis to work.

| Step               | Input       | Output      | Status  |
| ------------------ | ----------- | ----------- | ------- |
| `step_tokenize`    | character   | list-column | Working |
| `step_untokenize`  | list-column | character   | TODO    |
| `step_stem`        | list-column | list-column | TODO    |
| `step_stopwords`   | list-column | list-column | TODO    |
| `step_topwords`    | list-column | list-column | TODO    |
| `step_tfidf`       | list-column | numeric     | TODO    |
| `step_tf`          | list-column | numeric     | TODO    |
| `step_featurehash` | list-column | numeric     | TODO    |
| `step_word2vec`    | character   | numeric     | TODO    |

This means that valid sequences includes

``` r
recipe(~ ., data = data) %>%
  step_tokenize(text) %>%
  step_stem(text) %>%
  step_stopwords(text) %>%
  step_topwords(text) %>%
  step_tfidf(text)

# or

recipe(~ ., data = data) %>%
  step_tokenize(text) %>%
  step_stem(text) %>%
  step_tfidf(text)

# or

recipe(~ ., data = data) %>%
  step_word2vec(text)
```
