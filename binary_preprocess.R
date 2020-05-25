library(tidyverse)
library(dplyr)

# Reading as a standard dataframe first reads the columns
# with vaid R names.

original <- read.csv("data/delaney-original.csv")
originalTib <- as_tibble(original)

# Drop the ESOL calculated column, be

mutated <- originalTib %>%
  select(-ESOL.predicted.log.solubility.in.mols.per.litre) %>%
  select(-smiles) %>%
  mutate(solubility.above.or.below.median = 
           ifelse(measured.log.solubility.in.mols.per.litre <= medianSolubility, 0, 1))

# Write the transformed tibble as a .csv
write_csv(mutated, "data/delaney-binary.csv")
