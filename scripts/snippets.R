# data <- data.frame(
#     shoe = c(39, 43, 41), 
#     height = c(150, 180, 170),
#     weight = c(40, 80, 70)
# )
# 
# lm(shoe ~ height + weight, data = data)

#-------------------------------------------------------------------------------
# LM

alpha <- -13
beta <- c(0.4, -0.2)

iegor <- c(180, 80)
alpha + sum(iegor * beta)


jane <- c(150, 40)
alpha + sum(jane * beta)

#-------------------------------------------------------------------------------
# TLU

# data <- data.frame(
#     gender = c(-10, 10, 10), 
#     height = c(150, 180, 170),
#     weight = c(40, 80, 70)
# )
# 
# lm(gender ~ height + weight, data = data)

weights <- c(210, -2, 2)

iegor <- c(1, 180, 80)
ifelse(sum(weights * iegor) > 0, "male", "female")

jane <- c(1, 150, 40)
ifelse(sum(weights * jane) > 0, "male", "female")

#-------------------------------------------------------------------------------
# MSE

observed <- c(39, 43, 41)
predicted <- c(35.5, 45, 41)

mean((observed - predicted) ^ 2)
