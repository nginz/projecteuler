
def digit_sum(n)
  n.to_s.split(//).inject(0) {|sum, x| sum + x.to_i}
end

def digit_power(i)
  series = []
  (2..50).each do |e|
    (2..200).each do |base|
      n = base ** e
      series << n if digit_sum(n) == base
      return series.sort()[i] if series.length > i
    end
  end
end

puts digit_power(29)