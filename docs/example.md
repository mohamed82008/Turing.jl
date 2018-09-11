# Literate

```julia
using Turing
using Turing: @~, @model
using MCMCChain, Plots, Distributions
```

Define a simple Normal model with unknown mean and variance.

```julia
@model gdemo(x) = begin
  s ~ InverseGamma(2,3)
  m ~ Normal(0,sqrt(s))
  x[1] ~ Normal(m, sqrt(s))
  x[2] ~ Normal(m, sqrt(s))
  return s, m
end
```

 Run sampler, collect results

```julia
c1 = sample(gdemo([1.5, 2]), SMC(1000))
```

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

