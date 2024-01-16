library(tidyverse)
library(caret)

library(dslabs)
data(heights)

y <- heights$sex
x <- heights$height

set.seed(2007)
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)

test_set <- heights[test_index, ]
training_set <- heights[-test_index, ]

# random guess between male or female
y_hat <- sample(c("Male", "Female"), length(test_index), replace=TRUE) %>%
  factor(levels = levels(test_set$sex))

mean(y_hat == test_set$sex)

heights %>%
  group_by(sex) %>%
  summarize(mean(height), sd(height))

# if height within two sd's of male mean (69.3, cutoff is 62), guess male
y_hat <- ifelse(x > 62, "Male", "Female") %>%
  factor(levels = levels(test_set$sex))

mean(y_hat == y)

# find best cutoff point from 61 to 70, the best cutoff is 64
cutoff <- seq(61,70)

accuracy <- map_dbl(cutoff, function(x) {
  y_hat <- ifelse(training_set$height > x, "Male", "Female") %>%
    factor(levels = levels(test_set$sex))
  mean(y_hat == training_set$sex)
})

max(accuracy)

best_cutoff <- cutoff[which.max(accuracy)]
best_cutoff

y_hat <- ifelse(test_set$height > best_cutoff, "Male", "Female") %>%
  factor(levels = levels(test_set$sex))

y_hat <- factor(y_hat)

mean(y_hat == test_set$sex)