def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

result = each([1, 2, 3, 4, 5]) do |num|
  puts num
end

p result

odds = each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }
p odds == [1, 3, 5]
