require 'pry'

def double_file(filename)
  File.open(filename, "r+") do |file|
    current_contents = file.read
    file.write("\n#{current_contents}")
  end
end

double_file("new_file.txt")
