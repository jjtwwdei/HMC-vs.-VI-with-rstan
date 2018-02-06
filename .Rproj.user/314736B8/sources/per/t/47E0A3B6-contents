library(rstan)

rstan_options(auto_write = TRUE)
numCores <- parallel::detectCores() - 1 # Find the number of cores on your machine
options(mc.cores = numCores)            # Then use one less than that for MCMC sampling

# build the model
mixnormal <- stan_model(file = 'mixnormal.stan')
standata <- list(n = length(ds), K = 3, x = ds)


# mcmc
set.seed(100)
ptm_hmc <- proc.time()
hmcfit<- sampling(mixnormal, data = standata, iter = 2000,
                          #chains = numCores,
                          chains = 1,
                          control = list(adapt_delta = 0.99))
(ptm_hmc <- proc.time() - ptm_hmc)

# vi
ptm_vi <- proc.time()
vifit <- vb(mixnormal, data = standata, algorithm='meanfield')
(ptm_vi <- proc.time() - ptm_vi)
