def my_method
  yield(2)
end

a_proc = :to_s.to_proc          # explicitly call to_proc on the symbol
p my_method(&a_proc)              # convert Proc into block, then pass block in. Returns "2"
## equivalent to 
p my_method { |n| n.to_s } # passing it the block

# p (a_proc.call 24) == 24.to_s

