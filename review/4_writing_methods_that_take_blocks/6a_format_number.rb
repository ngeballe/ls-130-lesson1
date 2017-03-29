# deferring implementation code to method invocation decision

def products(array1, array2)
  result = array1.map.with_index { |num, idx| num * array2[idx] }
  if block_given?
    result.map { |product| yield(product) }
  else
    result
  end
end

p products([2, 4], [1, 9]) == [2, 36]
p products([7.99, 12.49, 8], [2, 3, 7]) { |total| format('$%.2f', total) } == ['$15.98', '$37.47', '$56.00']
