def hello
  "hello"
end

# def hello(&block)
#   yield if block_given?
#   "hello"
# end

# p hello
# p hello { puts 'hi' }

def echo(str)
  p str
end


# echo
# echo("hello")
# echo("hello", "world")

# echo { puts "world" }
# echo("hello") { puts "world" }
# echo('hello', 'world') { puts 'world' }
