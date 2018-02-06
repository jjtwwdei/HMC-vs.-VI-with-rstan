# HMC-vs.-VI-with-rstan
Comparison between Hamiltonian Monte Carlo (HMC) and mean field Variational Inference (VI)
I use a very small Bayesian normal mixture model to compare HMC with VI. The model is decribed as follows:

PI ~ Dirchlet(1/K)

mu_k ~ normal(0, 1), for k=1, ..., K

precision ~ gamma(1, 1)

for each observation i = 1,..., n
we have z_i ~ Category(PI)

x_i ~ normal(mu_{z_i}, precision_{z_i}
