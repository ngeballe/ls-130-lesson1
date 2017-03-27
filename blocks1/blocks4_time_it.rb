def time_it
  time_before = Time.now
  yield
  time_after = Time.now
  puts "It took #{time_after - time_before} seconds."
end

def count_to(number)
  (1..number).each do |n|
    # print n, " "
    print "."
  end
end

# time_it { sleep(3) }

# count_to(100)

time_it { count_to(1_000_000) }
