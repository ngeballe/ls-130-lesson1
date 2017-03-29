require 'pry'

def my_times(num_times, &block)
  count = 0
  block_argument = 0

  loop do
    yield(block_argument)
    block_argument += 1
    count += 1
    break if count == num_times
  end
  num_times
end


y = my_times(4) do |num|
  puts num + 27
end
# => puts:
# 27
# 28
# 29
# 30

puts y == 4
