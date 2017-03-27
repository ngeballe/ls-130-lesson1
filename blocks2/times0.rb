5.times do |num|
  puts num
end

def my_times(num)
  count = 0
  (0..(num -1 )).each do |count|
    yield(count)
  end
  count
end

x = my_times(5) do |n|
  puts n
end
puts x

# 0
# 1
# 2
# 3
# 4
