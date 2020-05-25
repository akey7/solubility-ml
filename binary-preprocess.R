library(tidyverse)
library(dplyr)

# Reading as a standard dataframe first reads the columns
# with vaid R names.

original <- read.csv("data/delaney-original.csv")
originalTib <- as_tibble(original)

mutated <- originalTib %>%
  mutate(solubility.above.or.below.median = 
           ifelse(measured.log.solubility.in.mols.per.litre <= medianSolubility, 0, 1))
