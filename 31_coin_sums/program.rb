@coins = [1, 2, 5, 10, 20, 50, 100, 200]

def coin_sums(value, m)
  return 0 if value < 0 || m < 0
  return 1 if value == 0
  return coin_sums(value - @coins[m], m) + coin_sums(value, m - 1)
end

puts coin_sums(200, @coins.length - 1)