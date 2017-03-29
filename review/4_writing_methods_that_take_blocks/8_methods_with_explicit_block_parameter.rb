def test(&block)
  block.call
  # yield
  puts "What's &block? #{block}"
end

test { sleep 1 }
