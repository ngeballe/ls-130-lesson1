require 'pry'

def reduce_with_operator(array, operator)
  accumulator = array[0]
  # set counter to 1
  counter = 1
  while counter < array.size
    # set next element = array[counter]
    next_element = array[counter]
    # set accumulator = accumulator.send(operator next_element)
    accumulator = accumulator.send(operator, next_element)
    counter += 1
  end
  accumulator
end

def reduce(array, accumulator_or_operator = nil)
  if accumulator_or_operator.class == Symbol
    return reduce_with_operator(array, accumulator_or_operator)
  end

  accumulator = accumulator_or_operator
  counter = 0
  if accumulator_or_operator.nil?
    # set accumulator to 0th element
    accumulator = array[0]
    # set counter to 1
    counter = 1
  end
  while counter < array.size
    next_element = array[counter]
    accumulator = yield(accumulator, next_element)
    counter += 1
  end
  accumulator
end

nums = [1, 2, 3, 4, 5]

p reduce(nums) { |sum, n| sum + n } == 15
p reduce(nums, 10) { |product, n| product * n } == 1200
p reduce(nums, :-) == -13

names = ["Alexander", "Catherine", "Frederick"]

p reduce(names) { |concatenated, name| "#{concatenated} and #{name}" } \
  == "Alexander and Catherine and Frederick"
string = reduce(names, "My dear friend,") do |concatenated, name|
  "#{concatenated} #{name}"
end
p string == "My dear friend, Alexander Catherine Frederick"
