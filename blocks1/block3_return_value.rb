def compare(string)
  puts "Before: #{string}"
  string_after = yield(string)
  puts "After: #{string_after}"
end

compare('hi') { |word| word.upcase }

# Output:
# Before: hi
# After: HI

compare('hello') { |word| word.slice(1..2) }
compare('hello') { |word| word[1..2] }
compare('my dog Spot') { |word| "Ron, begone!" }
compare("a totally unrelated issue") { |word| "the sex worker policy" }
