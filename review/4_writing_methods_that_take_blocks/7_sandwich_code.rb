def time_it
  start_time = Time.new
  yield
  end_time = Time.new
  p "Running that code took #{end_time - start_time} seconds"
end

# time_it do
#   x = 0
#   while x < 10_000_000
#     x += 1
#   end
# end

# time_it { sleep 3 }

time_it { 'hello world' }
