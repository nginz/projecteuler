class Array
  # Ascending binary search
  def bsearch_index(key)
    from, to = 0, self.length - 1
    while to >= from
      index = (to + from) / 2
      cmb = key <=> self[index]
      if cmb == 0
        return index
      elsif cmb < 0
        to = index - 1
      else
        from = index + 1
      end
    end
    return -1
  end

  # Ascending insertion sort
  def insert_sorted(obj)
    self.each_with_index do |e, i|
      self.insert(i, obj) and return if (obj <=> e) <= 0
    end
    self << obj
  end
end

@redundant = []
@unique = []
def check_uniqueness(sum)
  # Check redundancy
  return if @redundant.bsearch_index(sum) >= 0

  # Check if new redundant (past unique)
  in_unique = @unique.bsearch_index(sum)
  if in_unique >= 0
    @unique.delete_at(in_unique)
    @redundant.insert_sorted(sum)
  else
    # Unique sum
    @unique.insert_sorted(sum)
  end
end

def combination_sum(set, r, subset = [], start = 0, index = 0, &block)
  n = set.length
  if index == r
    # Combination complete
    subset_sum = subset.inject(:+)
    yield(subset_sum)
    return
  end

  i = start
  while(n - i >= r - index ) do
    subset[index] = set[i]
    combination_sum(set, r, subset, i + 1, index + 1, &block)
    i += 1
  end
end

@set = [1,3,6,8,10,11]
combination_sum(@set, 3) do |subset_sum|
  check_uniqueness(subset_sum)
end
puts @unique.inject(:+)