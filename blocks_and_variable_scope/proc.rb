require 'pry'

def call_me(some_code)
  some_code.call
end

def double(string)
  string + string
end

TEMPERATURE = 42

name = "Susie"

chunk_of_code = Proc.new { puts "hi, #{name}" }
name = "Griffin III"          # re-assign name after Proc initialization

call_me(chunk_of_code) # print "hi, Griffin III"

# with variable & method

chunk_with_method = Proc.new { puts "hi, #{double(name)}" }

call_me(chunk_with_method) # print "hi, Griffin IIIGriffin III"

# with method & constant

chunk3 = Proc.new { puts "hi, #{double(name)}, it's #{TEMPERATURE} degrees outside."}

call_me(chunk3) # rpint "hi, Griffin IIIGriffin III, it's 42 degrees outside."
