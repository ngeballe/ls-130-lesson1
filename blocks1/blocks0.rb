def hello
  "hello!"
end

p hello
# p hello("hi")
p hello { puts "hi" }

def echo_with_yield(str)
  yield
  str
end

puts echo_with_yield("bob") { puts "Hi, there!" }

def echo_with_yield(str)
  yield if block_given?
  puts str
end

echo_with_yield("Roger") { puts "Roger, over!" }
echo_with_yield("Jane") { puts "I yield the floor" }

# echo_with_yield { puts "world!" }
echo_with_yield("hello") { puts "world" }

echo_with_yield("look, no block!")
