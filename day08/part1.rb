require_relative '../helpers/map'

class Part < BasePart
  def run
    @map = Map.new(input)

    visible_count = 0
    @map.each do |cell, x, y|
      if x == 0 || y == 0 || x == @map.width - 1 || y == @map.height - 1
        visible_count += 1
      elsif visible?(cell, x, y)
        visible_count += 1
      end
    end

    visible_count
  end

  def visible?(cell, x, y)
    return false if cell == 0

    cell > @map.all_top_of(x, y).max ||
      cell > @map.all_bottom_of(x, y).max ||
      cell > @map.all_left_of(x, y).max ||
      cell > @map.all_right_of(x, y).max
  end

  def input_parser(input)
    input.map do |line|
      line.chars.map(&:to_i)
    end
  end
end

# -------- Day: 08, Part: 1 --------
# | Duration	| 138.7 ms	|
# | Allocated	| 129219		|
# | Result	| 1801	|
# ---------------------------------
