class Backpack
  PRIORITY_INDEX = (('a'..'z').to_a + ('A'..'Z').to_a).freeze
  def initialize(items)
    size = items.size
    @left = items[0..(size / 2 - 1)]
    @right = items[(size / 2)..]
  end

  def in_both_backpacks
    @left & @right
  end

  def priority
    PRIORITY_INDEX.index(in_both_backpacks.first) + 1
  end
end

class Part < BasePart
  def run
    input.sum(&:priority)
  end

  def input_parser(input)
    input.map { |line| Backpack.new(line.chars) }
  end
end

# -------- Day: 03, Part: 1 --------
# | Duration	| 3.1 ms	|
# | Allocated	| 12830		|
# | Result	| 8039	|
# ---------------------------------
