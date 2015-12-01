def memo(v, m)
  @memo ||= {}
  xk = "#{v}:#{m}"
  @memo[xk] = yield if @memo[xk].nil?
  return @memo[xk]
end

def summation_count(value, m)
  return 0 if value < 0 || m <= 0
  return 1 if value == 0

  # Count of two sets: 1- ones which does contain `m` and 2- ones which doesn't contain `m`
  return memo(value - m, m){ summation_count(value - m, m) } + memo(value, m - 1){ summation_count(value, m - 1)}
end

puts summation_count(100, 100 - 1)