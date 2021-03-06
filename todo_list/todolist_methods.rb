require 'pry'

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'.freeze
  UNDONE_MARKER = ' '.freeze

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
    @todos << todo
    self # not sure about this
  end
  alias_method :<<, :add

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    results = TodoList.new(title)
    each do |todo|
      results << todo if yield(todo)
    end
    results
  end

  def find_by_title(title)
    each do |todo|
      return todo if todo.title == title
    end
    nil

    # select { |todo| todo.title == title }.first
  end

  def all_done
    # select { |todo| todo.done? }
    select(&:done?)
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_undone(title)
    find_by_title(title) && find_by_title(title).undone!
  end

  def mark_all_done
    # each { |todo| todo.done! }
    each(&:done!)
  end

  def mark_all_undone
    # each { |todo| todo.undone! }
    each(&:undone!)
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Clean room")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

# find_by_title

todo = list.find_by_title("Clean room")
puts todo == todo2
puts todo != todo4

puts list.find_by_title("Cure cancer").nil?

# all_done, # all_not_done

todo3.done!

puts list.all_done # should be "Go to gym"

puts list.all_not_done # should be "Buy milk", "Clean room", "Clean room"

# mark_done

list.mark_done("Clean room")
puts todo2.done?
puts todo4.done? == false

list.mark_done("Task that's not on list")

# mark_all_done

list.mark_all_done

puts todo1.done? && todo2.done? && todo3.done? && todo4.done?

# mark_all_undone

list.mark_all_undone

puts !todo1.done? && !todo2.done? && !todo3.done? && !todo4.done?

# mark_undone

list.mark_done("Go to gym")
p todo3.done? == true

list.mark_undone("Go to gym")
p todo3.done? == false
