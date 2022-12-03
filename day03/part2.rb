class Backpack
  PRIORITY_INDEX = (('a'..'z').to_a + ('A'..'Z').to_a).freeze

  def self.in_all_backpacks(b1, b2, b3)
    (b1 & b2 & b3).first
  end

  def self.priority(letter)
    PRIORITY_INDEX.index(letter) + 1
  end
end

class Part < BasePart
  def run
    badges = input.each_slice(3).map do |b1, b2, b3|
      Backpack.in_all_backpacks(b1, b2, b3)
    end
    badges.sum { |badge| Backpack.priority(badge) }
  end

  def input_parser(input)
    input.map(&:chars)
  end
end

# -------- Day: 03, Part: 2 --------
# | Duration	| 3.17 ms	|
# | Allocated	| 10987		|
# | Result	| 2510	|
# ---------------------------------
