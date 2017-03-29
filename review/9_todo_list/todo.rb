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

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.class == Todo
    
    @todos << todo
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    "---- #{title} ----\n" + @todos.join("\n")
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add
# todo4 = Todo.new("Solve Israeli-Palestinian conflict")
# list << todo4
# list << 47.2 # =>  raises TypeError, "Can only add Todo objects"

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

p list.size == 3

# # first
p list.first == todo1                      # returns todo1, which is the first item in the list

# # last
p list.last == todo3                       # returns todo3, which is the last item in the list

# # ---- Retrieving an item in the list ----

# # item_at
# list.item_at                    # raises ArgumentError
p list.item_at(1) == todo2                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# p list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
p todo2.done? == true

# p list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
p todo2.done? == false
# list.mark_undone_at(100)        # raises IndexError

# # ---- Deleting from the the list -----

# # shift
# first = list.shift                      # removes and returns the first item in list
# p first == todo1
# p list.size == 2
# p list.item_at(0) == todo2

# # pop
# last = list.pop                        # removes and returns the last item in list
# p last == todo3
# p list.size == 2
# p list.item_at(-1) == todo2

# # remove_at
# list.remove_at                  # raises ArgumentError
# p list.size
# second = list.remove_at(1)               # removes and returns the 2nd item
# p second == todo2
# p list.size == 2
# p list.item_at(1) == todo3
# p list.item_at(0) == todo1

# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
puts list                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# # or, if any todos are done

list.mark_done_at(1)
puts list

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

p list.size

list << Todo.new("Wash car")
puts list
list << Todo.new("Clean room")
puts list

list.remove_at(-1)

puts list
