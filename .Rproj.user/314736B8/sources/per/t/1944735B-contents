# model setting
K <- 3
mu <- c(-3, 0, 3)
precision <- c(2, 1, 2)
PI <- c(0.3, 0.4, 0.3)
n_obs <- 1000
seed <- 100

# generate data
set.seed(seed)
ds <- sapply(1:n_obs, function(d) {
  k <- sample.int(K, size = 1, prob = PI);
  x <- rnorm(1, mean = mu[k], sd = 1/sqrt(precision[k]));
  x
})
plot(density(ds))
