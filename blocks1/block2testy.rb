# method implementation
def test
  yield(1)
end

test { |num1, num2| p "#{num1} #{num2}" }
