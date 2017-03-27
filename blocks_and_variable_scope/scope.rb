level_1 = "outer-most variable"

[1, 2, 3].each do |n|               # block creates a new scope
  level_2 = "inner variable"

  # puts level_1
  # puts level_2

  ['a', 'b', 'c'].each do |n2|      # nested block creates a nested scope
    level_3 = "inner-most variable"

    # puts level_1
    # puts level_2
    # puts level_3

    # all three level_X variables are accessible here
  end

  # level_1 is accessible here
  # level_2 is accessible here
  # level_3 is not accessible here

  puts "back to middle"
  puts level_1
  puts level_2

end

puts "#{level_1} is "

# level_1 is accessible here
# level_2 is not accessible here
# level_3 is not accessible here

