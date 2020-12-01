library(keras)

# 0.1 Load and obsrve the data
#-------------------------------------------------------------------------------

fashion_mnist <- dataset_fashion_mnist()

str(fashion_mnist)

train_x <- fashion_mnist$train$x
train_y <- fashion_mnist$train$y

test_x <- fashion_mnist$test$x
test_y <- fashion_mnist$test$y

dim(train_x)
train_x[1, , ]

class_names <- c(
    "T-shirt/top",
    "Trouser",
    "Pullover",
    "Dress",
    "Coat", 
    "Sandal",
    "Shirt",
    "Sneaker",
    "Bag",
    "Ankle boot"
)

sort(unique(train_y))

class_names[train_y[1] + 1]

class_names[train_y[1:4] + 1]

plot(as.raster(train_x[1, , ], max = 255))

par(mfrow = c(2, 2))
for(i in 1:4)
    plot(as.raster(train_x[i, , ], max = 255))
par(mfrow = c(1, 1))

# 0.2 Scale the data
#-------------------------------------------------------------------------------

train_x <- train_x / 255
test_x <- test_x / 255

# 1. Define the model
#-------------------------------------------------------------------------------

model <- keras_model_sequential() %>%
    layer_flatten(input_shape = c(28, 28)) %>%
    layer_dense(units = 300, activation = "relu") %>% 
    layer_dense(units = 100, activation = "relu") %>% 
    layer_dense(units = 10, activation = "softmax")

summary(model)

# 2. Compile the model
#-------------------------------------------------------------------------------

model %>% compile(
    optimizer = "rmsprop",
    loss = "sparse_categorical_crossentropy",
    metrics = "accuracy"
)


# 3. Fit the model
#-------------------------------------------------------------------------------

history <- model %>% fit(
    x = train_x,
    y = train_y, 
    batch_size = 128,
    epochs = 30
)


# 4. Evaluate
#-------------------------------------------------------------------------------

model %>% evaluate(test_x, test_y)


# 4.1 Predict
#-------------------------------------------------------------------------------

model %>% predict_proba(test_x[1, , , drop = FALSE])
model %>% predict_proba(test_x[1, , , drop = FALSE]) %>% which.max() - 1
model %>% predict_classes(test_x[1, , , drop = FALSE])

test_y[1]
class_names[9 + 1]

plot(as.raster(test_x[1, , ]))

par(mfrow = c(2, 2))
for (i in 1:4) plot(as.raster(test_x[i, , ]))

predicted <- model %>% predict_classes(test_x[1:4, , , drop = FALSE])
class_names[predicted + 1]
