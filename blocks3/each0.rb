def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

x = each([3, 8, 4, 7]) { |n| puts n**2 }
# Output:
# 9
# 64
# 16
# 49
# => [3, 8, 4, 7]
p x == [3, 8, 4, 7]

# x = [1, 2, 9, 18].each do |n|
#   puts n
# end
# p x

result = each(%w(Adam Carol Corie Nick Zack)) do |name|
  puts "#{name}'s here today! etc."
end

p result == ['Adam', 'Carol', 'Corie', 'Nick', 'Zack']
