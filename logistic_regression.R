library(tidyverse)
library(mlr)

# Load the tibble of the binary data
delaneyBinary <- read_csv("data/delaney-binary.csv")

# Select columns with predictors and target
train <- delaneyBinary %>%
  select(Molecular.Weight, 
         Number.of.Rotatable.Bonds, 
         Polar.Surface.Area,  # Uncomment to fit using Polar.Surface.Area
         solubility.above.or.below.median) %>%
  mutate_at(.vars = "solubility.above.or.below.median", .funs = factor)

# Create the task
delaneyTask <- makeClassifTask(data = train, 
                               target = "solubility.above.or.below.median")

# Create the learner
learner <- makeLearner("classif.logreg", predict.type = "prob")

# Create k-fold cross validation
kFold <- makeResampleDesc(method = "RepCV", folds = 10, reps = 50, stratify = TRUE)

# Now run the cross validation
result <- resample(learner = learner, 
                   task = delaneyTask, 
                   resampling = kFold,
                   measures = list(acc, fpr, fnr),
                   models = TRUE)

# Print a confusion matrix across all iterations
confusion <- calculateConfusionMatrix(result$pred, relative = TRUE, set = "test")
print(confusion)

# Now make an ROC plot of the first model from the resampling
firstModel <- result$models[[1]]
pred <- predict(firstModel, delaneyTask)
df = generateThreshVsPerfData(pred, measures = list(fpr, tpr, mmce))
print(plotROCCurves(df))
# print(plotThreshVsPerf(df))
