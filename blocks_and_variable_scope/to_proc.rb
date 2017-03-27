def my_method
  yield(2)
end

# turns the symbol into a Proc, then & turns the Proc into a block
p my_method(&:to_f)

p my_method(&:to_s)               # => "2"

a_proc = :to_s.to_proc

p a_proc

my_method(&a_proc)
