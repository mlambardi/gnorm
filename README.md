# gnorm

The generalized normal distribution is ruled by a parameter "beta" and comprises famous distributions, such as normal (beta=2) and Laplace (beta=1). The uniform distribution is also included, as beta diverges. See https://en.wikipedia.org/wiki/Generalized_normal_distribution#Version_1.

Current implementation in R is provided by package gnorm (https://cran.r-project.org/web/packages/gnorm/index.html). The random number generator (rgnorm) exploits relations with gamma distribution. This implementation is proner to break down as beta diverges.

For beta >= 1, the generalized normal distribution is log-concave, so I propose a random number generator based on Devroye's method (http://luc.devroye.org/handbooksimulation1.pdf). This alternative implementation does not break down as beta diverges. It is also provides an educational example of application for Devroye's elegant and general method.
