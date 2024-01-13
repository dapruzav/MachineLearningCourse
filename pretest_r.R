# Machine Learning Course Pretest

data(heights)
heights

# Question 2
nrow(heights)

# Question 3
heights[777,]$height

# Question 4
heights$sex[777]

heights[777, 1]

# Question 5
max(heights$height)

which.min(heights$height)

# Question 6
summary(heights$height)

# Question 7
sum(heights$sex == 'Male') / nrow(heights)

# Question 8
sum(heights$height > 78)

# Question 9
sum(heights$sex == 'Female' & heights$height > 78)