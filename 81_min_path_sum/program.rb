@m = []

# Memoization function
def memo(i, j)
  return @m[0][0] if i == 0 && j == 0
  return Float::INFINITY if i < 0 || j < 0

  @memo ||= []
  l = @m.length
  xi = j + l * i
  @memo[xi] = yield if @memo[xi].nil?
  return @memo[xi]
end

# Min Path Cost from 0,0 to i,j
def mpc_to(i, j)
  mp1 = memo(i - 1, j){ mpc_to(i - 1, j) }
  mp2 = memo(i, j - 1){ mpc_to(i, j - 1) }
  return @m[i][j] + [mp1, mp2].min
end

File.foreach('matrix.txt') do |line|
  @m << line.split(/,/).map(&:to_i)
end

e = @m.length - 1
puts mpc_to(e, e)