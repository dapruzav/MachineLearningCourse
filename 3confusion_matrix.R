table(predicted = y_hat, actual = test_set$sex)

test_set %>%
  mutate(y_hat = y_hat) %>%
  group_by(sex) %>%
  summarize(accuracy = mean(y_hat == sex))

prev <- mean(y == "Female")
prev

cm <- confusionMatrix(data = y_hat, reference = test_set$sex)
cm

cm$overall["Accuracy"]

cm$byClass[c("Sensitivity", "Specificity", "Prevalence")]