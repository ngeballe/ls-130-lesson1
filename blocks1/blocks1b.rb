require 'pry'

def prime?(num)
  return false unless num >= 2
  (2..(num - 1)).each do |divisor|
    return false if num % divisor == 0
  end
  true
end

# p prime?(91) == false
# p prime?(1) == false
# p prime?(2) == true
# p prime?(3) == true
# p prime?(53) == true
# p prime?(37) == true
# p prime?(65) == false
# p prime?(10) == false


def time_block(num)
  start_time = Time.now
  yield(num)
  end_time = Time.now
  puts "Lapsed Time: #{end_time - start_time}"
end

# time_block(80 * 10 ** 20) do |n|
#   puts n
# end

time_block(4700) do |num|
  (1..num).each do |n|
    prime?(n)
  end
end
