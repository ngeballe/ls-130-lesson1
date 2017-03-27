# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

# method invocation
increment(5) do |num|
  puts num
end

x = increment(7)
puts x

increment(36) do |num|
  puts "Scottiva #{num}!"
end

