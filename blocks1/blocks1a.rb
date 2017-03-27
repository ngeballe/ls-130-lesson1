require 'pry'

def prime?(num)
  return false if num < 2
  (2..(num - 1)).each do |divisor|
    return false if num % divisor == 0
  end
  true
end

def timer
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "#{end_time - start_time} gone by"
end

# timer

timer do
  stop_num = 40_000
  primes = []
  (1..stop_num).each do |n|
    # puts ".#{n}" if prime?(n)
    # puts n
    primes << n if prime?(n)
    # print "." if n.even?
  end
  puts "#{primes.size} primes between 1 and #{stop_num}"
end
