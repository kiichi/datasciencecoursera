# This is an example to run knitr programmatically
library(knitr)
setwd("~/work/r/class/datasciencecoursera/notes/class5_repdata/week2")
knit2html("Rmarkdown_exerciese.Rmd")
browseURL("Rmarkdown_exerciese.html")
