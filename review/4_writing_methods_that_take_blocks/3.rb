def say(words)
  yield if block_given?
  puts "> " + words
end

say("Hello, Hello!") do
  system 'clear'
end
