# [1, 2, 3].map do |num|
#   num + 1
# end
# => [2, 3, 4]

def my_map(array, &block)
  result = []
  
  idx = 0

  while idx < array.size do
    result << yield(array[idx])
    idx += 1
  end

  result
end

names = my_map(%w[al sue kate jim]) do |name|
  name.capitalize.swapcase
end

p names == %w[aL sUE kATE jIM]
