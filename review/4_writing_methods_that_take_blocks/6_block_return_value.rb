def compare(string)
  puts "Before: #{string}"
  after = yield(string)
  puts "After: #{after}"
end

compare('hi') { |word| word.upcase }

# Output:
# Before: hi
# After: HI

compare('hello') { |word| word.slice(1..2) }

compare('hello') { |word| "nothing to do with anything" }

puts

compare('hello') { |word| puts 'hi' }
