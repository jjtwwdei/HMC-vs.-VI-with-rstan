data {
  int < lower=1> n; // number of data point
  int < lower=1> K; // number of mixture components
  vector[n] x ; // observations
}

transformed data{
  vector< lower = 0 >[K] alpha0;
  
  for(k in 1:K){
    alpha0[k] = 1.0/K;
  }
  
  
}

parameters{
  simplex[K] theta;
  vector[K] mu;
  vector<lower = 0>[K] precision;
}

model {
vector[K] ps;
  
// priors
theta ~ dirichlet(alpha0);
mu ~ normal(0, 1);
precision ~ gamma(1.0, 1.0);

// likelihood

for(i in 1:n){
  for(k in 1:K){
    ps[k] = log(theta[k]) + normal_lpdf(x[i] | mu[k], 1.0/sqrt(precision[k]));
  }
  target += log_sum_exp(ps);
}

}

