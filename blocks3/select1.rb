def select(array)
  result = []

  counter = 0
  while counter < array.size
    element = array[counter]
    result << element if yield(element)
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? } == [1, 3, 5]      # => [1, 3, 5]
p select(array) { |num| puts num } == []      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 } == [1, 2, 3, 4, 5]      # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

p array == [1, 2, 3, 4, 5] # leave array alone
