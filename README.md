# gnorm
The generalized normal distribution is ruled by a parameter "beta" and comprises famous distributions, such as normal (beta=2) and Laplace (beta=1). The uniform distribution is also included, as beta diverges. Current implementation in R package gnorm exploits relation with gamma distribution to simulate random draws. This implementation is proner to break down as beta diverges. For beta >= 1, the GN density is log-concave, so I propose a rng based on Devroye's method. This alternative implementation does not break down as beta diverges. It is also provides an educational example of application for Devroye's elegant and general method.