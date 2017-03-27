class BlockyTalky
  def jenga
    puts "I'm playing with jenga blocks"
  end

  alias_method :trump, :jenga
end

x = BlockyTalky.new
x.jenga
x.trump
