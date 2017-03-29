def times(num_times)
  counter = 0
  while counter < num_times do
    yield(counter)
    counter += 1
  end
  num_times
end

result = times(5) do |num|
  puts num
end

p result == 5
