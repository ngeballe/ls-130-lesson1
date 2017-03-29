def echo_with_yield(str)
  yield if block_given?
  str
end

# echo_with_yield { puts "World" }
# echo_with_yield('hello') { puts 'world' }
#  echo_with_yield('hello', 'world')
# p echo_with_yield("Tom") { puts "I hath yielded!" }

puts echo_with_yield('hello') { puts "Yao!" }
