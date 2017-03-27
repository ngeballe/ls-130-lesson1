class String
  def double
    self + self
  end
end

[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

p [1, 2, 3, 4, 5].map(&:to_s) == ["1", "2", "3", "4", "5"]

p [1, 2, 3, 4, 5].map(&:to_s).map(&:to_i) == [1, 2, 3, 4, 5]
p [1, 2, 3, 4, 5].map(&:to_s).map(&:to_i).map(&:to_f) == [1.0, 2.0, 3.0, 4.0, 5.0]

p [1, 2, 3].map(&:to_s).map(&:double) == ["11", "22", "33"]

p ["hello", "world"].each(&:upcase!) == ["HELLO", "WORLD"]
p [1, 2, 3, 4, 5].select(&:odd?) == [1, 3, 5]
p [1, 2, 3, 4, 5].select(&:odd?).any?(&:even?) == false
