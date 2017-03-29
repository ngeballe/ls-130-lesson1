def my_method
  yield(2)
end

# turns the symbol into a Proc, then & turns the Proc into a block
p my_method(&:to_s)

# p :to_s.to_proc.call 27.2 # => '27.2'
