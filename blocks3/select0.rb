def select(array)
  result = []
  # loop through array, adding to result if yield(element) returns true
  # array.each do |element|
  #   if yie
  # end
  counter = 0
  while counter < array.size
    element = array[counter]
    result << element if yield(element)
    counter += 1
  end
  result
end

names = ["Ron Cohen", "Jonathan Cohen", "Susie Rosen", \
         "Frank Jones", "Melanie Cohen"]

# cohens = names.select do |name|
#   name.split[1] == "Cohen"
# end

cohens = select(names) { |name| name.split[1] == 'Cohen' }

p cohens == ["Ron Cohen", "Jonathan Cohen", "Melanie Cohen"]

nums = (1..100).to_a
multiples_of13 = select(nums) { |num| (num % 13).zero? }
p multiples_of13 == [13, 26, 39, 52, 65, 78, 91]
