class Item
  attr_accessor :title, :reading, :meaning, :explain1, :explain2, :explain3, :explain4, :explain5, :explain6, :explain7

  def initialize(*args)
  end
  #
  # def initialize(title, reading, meaning, explain1, explain2, explain3, explain4, explain5, explain6, explain7)
  #   @title    = title
  #   @reading  = reading
  #   @meaning  = meaning
  #   @explain1 =explain1
  #   @explain2 =explain2
  #   @explain3 =explain3
  #   @explain4 =explain4
  #   @explain5 =explain5
  #   @explain6 =explain6
  #   @explain7 = explain7
  #
  # end
end


item       = Item.new()
item.title = "abc"

puts item
