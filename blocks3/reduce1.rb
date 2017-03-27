require 'pry'

def reduce(array, accumulator = nil)
  # if no accumulator given, accumulator = first element of the array
  counter = 0
  if accumulator.nil?
    accumulator = array[0]
    counter = 1
  end
  # go through array
  while counter < array.size
    # find the result of yielding the accumulator and the current element to the block
    # make that result the new accumulator
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]


p reduce(array) { |acc, num| acc + num } == 15                  # => 15
p reduce(array, 10) { |acc, num| acc + num } == 25              # => 25
p reduce(array) { |acc, num| acc * num } == 120
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

