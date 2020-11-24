##########################################################################
#####                        EASY SCORE                              #####
##########################################################################

setwd("/Users/jamesorton/Documents/Projects/R")

library(daimojo)
library(data.table)

#DAI License
Sys.setenv(DRIVERLESS_AI_LICENSE_KEY = paste0("NYSquXDxZ9gwA9pMKbLct30tRqPOY4oD889odNhmMf9oFDx3z9bnBA1g7Zcsw5x8u9_ei-8iDmNFIeHRHA0G4OxKVMy3I7f8zx_gIN4Z5CAd0lDRfZeUt0L8oBMMWcPnJ9j0t9XadLBcovvNvNxIXtt-tJ3WdaJALPDxEEYlmlMI6u75gpXat-LuM2ChsvzLA2IxxBCx9WrkUGpGNgvr_HHL5imKFLieZUHKJ0UyvU_nmFcyAxjEO_5fK0nB4IlNR8vTiWdNjroshwUg8vVd795HzbZ2ubWdDTPlSWsd60i2EUSxvn0SbEOR73_fEBUuHv5XOy2zx-UxMszQP-N7QGxpY2Vuc2VfdmVyc2lvbjoxCnNlcmlhbF9udW1iZXI6MzcKbGljZW5zZWVfb3JnYW5pemF0aW9uOkgyTy5haQpsaWNlbnNlZV9lbWFpbDpvcHNAaDJvLmFpCmxpY2Vuc2VlX3VzZXJfaWQ6MzcKaXNfaDJvX2ludGVybmFsX3VzZTp0cnVlCmNyZWF0ZWRfYnlfZW1haWw6b3BzQGgyby5haQpjcmVhdGlvbl9kYXRlOjIwMTkvMTIvMjMKcHJvZHVjdDpEcml2ZXJsZXNzQUkKbGljZW5zZV90eXBlOmRldmVsb3BlcgpleHBpcmF0aW9uX2RhdGU6MjAyMC8xMi8zMAo="))

# Load the MOJO
# m <- daimojo::load.mojo("mojo-pipeline/pipeline.mojo")
m <- load.mojo("./mojo-pipeline/pipeline.mojo")

# Load data
col_class <- setNames(feature.types(m), feature.names(m))  # column names and types

d <- fread("./mojo-pipeline/example.csv", colClasses=col_class, header=TRUE, sep=",")

# Example Data
head(d)

# predict in R Studio
predict(m, d)


