See [Wikipedai](https://en.wikipedia.org/wiki/Bonferroni_correction)

The problem is that if we test hundreds of things against a significance level $\alpha$ of just 5% or so, then we will reject some true null hypothesis, giving us an inflated false positive rate.
Therefore we simply divide by the number $m$ of (null) hypotheses. if $m_0$ is the number of true null hypotheses then
$$
P\left\{\bigcup _{i=1}^{m_{0}}\left(p_{i}\leq {\frac {\alpha }{m}}\right)\right\}\leq \sum _{i=1}^{m_{0}}\left\{P\left(p_{i}\leq {\frac {\alpha }{m}}\right)\right\}=m_{0}{\frac {\alpha }{m}}\leq m{\frac {\alpha }{m}}=\alpha
$$
Therefore by doing the correction the probability of rejecting at least one true null hypothesis is less than $\alpha$.

I find this a bit weird as a concept. From a philosophical point of view, no coefficient is ever zero. So NOT rejecting a null hypothesis is just a sign of not having enough datapoints. (I think I got this rough idea from [Andrew Gelman](https://statmodeling.stat.columbia.edu/) but I can't find the specific post at the moment).
