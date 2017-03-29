def select(array)
  result = []
  
  idx = 0
  while idx < array.size
    element = array[idx]
    result << element if yield(element)
    idx += 1
  end

  result
end


# array = [1, 2, 3, 4, 5]

# p array.select { |num| num.odd? } == [1, 3, 5]
# p array.select { |num| puts num } == []
# p array.select { |num| num + 1 } == [1, 2, 3, 4, 5]

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? } == [1, 3, 5]
p select(array) { |num| puts num } == []
p select(array) { |num| num + 1 } == [1, 2, 3, 4, 5]
