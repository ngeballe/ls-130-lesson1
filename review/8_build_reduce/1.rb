def reduce(array, accumulator = nil)
  if accumulator.nil?
    accumulator = array.first
    index = 1
  else
    index = 0
  end

  while index < array.size
    current_element = array[index]
    accumulator = yield(accumulator, current_element)
    index += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } == 15                # => 15

p reduce(array, 10) { |acc, num| acc + num } == 25               # => 25

p reduce(array) { |acc, num| acc * num } == 120
p reduce(array) { |acc, num| acc - num } == -13

# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
