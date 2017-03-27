def pasatiempo(num)
  time_started = yield
  puts "Couting to #{num}, by 0.0001..."
  (0.step(num, 0.0001)).each do |n|
    counter = n
  end
  print "\n"
  time_done = yield
  puts "#{time_done - time_started} gone by"
end

# pasatiempo(10000) { Time.now }

def say_hi(name)
  yield if block_given?
  puts "Hi, #{name}!"
end

say_hi("Ron") { puts "This function says hi to a person whose name is given" }


