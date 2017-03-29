# 2.rb

# test method

def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

# this method doesn't work as well--it fails to replicate Array#reduce's behavior for other operations in the block--e.g., subtraction, multiplication

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } == 15                # => 15
p reduce(array, 10) { |acc, num| acc + num } == 25               # => 25

# new tests
p reduce(array) { |acc, num| acc * num } #== 120

p reduce(array) { |acc, num| acc - num } #== -13

# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
