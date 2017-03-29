def each(array)
  idx = 0
  while idx < array.size
    yield(array[idx])
    idx += 1
  end

  array
end

result = [1, 2, 3].each { |num| puts num * 2 } 


p result == [1, 2, 3]

p [2, 4, 7].each { |num| p num**3 }.select { |n| n.odd? } == [7]

# "Do we increment every value by one? Do we output the element? None of that matters, because our each method is solely focused on iterating and not on anything beyond that. Writing a generic iterating method allows method callers to add additional implementation details at method invocation time by passing in a block."
