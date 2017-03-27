def my_times(num_times)
  (0..(num_times - 1)).each do |count|
    yield(count)
  end  
end

my_times(3) { puts "Knock (on ceiling)" }

# output:
# "Knock (on ceiling)"
# "Knock (on ceiling)"
# "Knock (on ceiling)"

my_times(4) { puts "Froduls" }
# Output:
#
# Froduls
# Froduls
# Froduls
# Froduls

my_times(5) { |n| puts "Donald Trump is ##{n}!"}
# Output:
#
# Donald Trump is #0!
# Donald Trump is #1!
# Donald Trump is #2!
# Donald Trump is #3!
# Donald Trump is #4!