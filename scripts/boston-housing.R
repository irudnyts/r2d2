library(keras)

# 0. Load the data
#-------------------------------------------------------------------------------
houses <- dataset_boston_housing()

str(houses$train$x)
str(houses$test$x)

train_x <- houses$train$x
train_y <- houses$train$y

test_x <- houses$test$x
test_y <- houses$test$y

# 1. Define the model
#-------------------------------------------------------------------------------

model <- keras_model_sequential() %>% 
    layer_dense(units = 64, activation = "relu", input_shape = 13) %>% 
    layer_dense(units = 64, activation = "relu") %>% 
    layer_dense(units = 1)

# 2. Compile the model
#-------------------------------------------------------------------------------
model %>% compile(
    optimizer = "rmsprop",
    loss = "mse",
    metrics = "mae"
)

# 3. Fit the model
#-------------------------------------------------------------------------------
history <- model %>% fit(
    x = train_x,
    y = train_y, 
    batch_size = 2,
    epochs = 50
)

# 4. Evaluate
#-------------------------------------------------------------------------------

model %>% evaluate(test_x, test_y)
