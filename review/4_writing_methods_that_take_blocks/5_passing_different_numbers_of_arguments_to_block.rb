# passing too many
def test
  yield(1, 2)
end

test { |num| puts num }

# passing too few
def test2
  yield(1)
end

test2 { |num1, num2| p [num1, num2] }
