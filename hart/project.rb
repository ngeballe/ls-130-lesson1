class Project
  include Comparable

  attr_accessor :number, :title

  def initialize(number, title)
    @number = number
    @title = title
  end

  def <=>(other)
    number.to_i <=> other.number.to_i
  end

  def <<(group)
  end
end

project1 = Project.new('8346', 'Jones Foundation')
p project1.number == '8346'
p project1.title == 'Jones Foundation'

project2 = Project.new('7999', 'TN Gov')
p project2.number == '7999'
p project2.title == 'TN Gov'

p project1 > project2 == true
p project2 < project1 == true

group1 = Group.new('Chicago Men', 'Chicago, IL', Date.new()
