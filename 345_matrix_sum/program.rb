@m = []

# Memoization function
def memo(x_rows, x_cols)
  @memo ||= {}
  xk = x_rows.sort.join(',') + '|' + x_cols.sort.join(',')
  @memo[xk] = yield if @memo[xk].nil?
  return @memo[xk]
end

# Maximum matrix sum with excluded rows and columns params
def max_sum(x_rows = [], x_cols = [])
  row = ((0...@m.length).to_a - x_rows).first
  return 0 if row.nil?

  sums = []
  ((0...@m.length).to_a - x_cols).each do |col|
    sub_x_rows = x_rows.dup.push(row)
    sub_x_cols = x_cols.dup.push(col)
    max_subsum = memo(sub_x_rows, sub_x_cols){ max_sum(sub_x_rows, sub_x_cols) }
    sums << @m[row][col] + max_subsum
  end

  return sums.max
end

File.foreach('matrix.txt') do |line|
  @m << line.strip.split(/ +/).map(&:to_i)
end

puts max_sum

