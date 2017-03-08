using Distributions
using Turing

x = Float64[1 2]

@model gauss(x) begin
  s ~ InverseGamma(2,3)
  m ~ Normal(0,sqrt(s))
  for i in 1:length(x)
    x[i] ~ Normal(m, sqrt(s))
  end
  s, m
end

chain = @sample(gauss(x), PG(10, 10))
chain = @sample(gauss(x), SMC(10))